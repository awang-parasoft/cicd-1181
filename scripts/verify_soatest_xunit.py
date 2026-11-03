import json
import sys
from pathlib import Path
from xml.etree import ElementTree as ET

EXPECTED = {
    "execution": (14, 10),
    "change-one": (7, 7),
    "change-none": (7, 7),
    "change-all": (7, 7),
    "visual": (526, 1),
}

def require(condition, message):
    if not condition:
        raise AssertionError(message)

case_id, source_name, output_name, evidence_name = sys.argv[1:]
root = ET.parse(output_name).getroot()
source = ET.parse(source_name).getroot()
require(root.tag == "testsuites", "Missing converted testsuites root")
cases = root.findall(".//testcase")
failures = [case for case in cases if case.find("failure") is not None]
require(not root.findall(".//error"), "Unexpected xUnit error nodes")
require((len(cases), len(failures)) == EXPECTED[case_id],
        f"Incorrect totals: {len(cases)} tests, {len(failures)} failures")
for suite in root.findall(".//testsuite"):
    emitted = suite.findall("testcase")
    require(int(suite.get("tests")) == len(emitted), "Incorrect suite test count")
    require(int(suite.get("failures")) == sum(c.find("failure") is not None for c in emitted),
            "Incorrect suite failure count")
require(all(len(case.findall("failure")) <= 1 for case in cases),
        "Multiple violation nodes must be combined into one testcase failure")

by_name = {case.get("name"): case for case in cases}
require(len(by_name) == len(cases) or case_id == "visual", "Unexpected duplicate testcase names")

if case_id == "execution":
    prefix = "Execution violations/"
    for kind in ("FuncViol", "ChangeImpact", "VisualDifference"):
        for name in ("Single " + kind, "Parameterized " + kind + "[Safari]"):
            failure = by_name[prefix + name].find("failure")
            require(failure is not None, "Missing failure for " + name)
            require(failure.get("message") == kind + " failure", "Wrong failure association")
            require(failure.text == kind + " details", "Lost diagnostic details")
        require(by_name[prefix + "Parameterized " + kind + "[Chrome]"].find("failure") is None,
                "Passing browser acquired another browser's failure")
    require(by_name[prefix + "Passing test"].find("failure") is None, "Passing control failed")
    mixed = by_name[prefix + "Mixed violations"].find("failure")
    require(mixed is not None and mixed.get("message") == "Multiple errors reported", "Missing mixed failure")
    text = mixed.text or ""
    require(text.count("==== ERROR ====") == 4, "Incorrect mixed error separators")
    for diagnostic in ("Functional failure", "Change impact details", "Source: screenshot.png",
                       "Mixed details without summary"):
        require(diagnostic in text, "Lost mixed diagnostic: " + diagnostic)
    fallback = by_name[prefix + "Functional without message"].find("failure")
    require(fallback is not None and fallback.get("message") == "FuncViol", "Missing message fallback")
    unknown = by_name[prefix + "Unknown violation"].find("failure")
    require(unknown is not None and unknown.get("message") == "Future violation failure", "Lost unknown violation")

output_failures = root.findall(".//failure")
if case_id == "visual":
    original = source.find("./Exec/ExecViols/VisualDifference")
    require(original is not None, "Missing visual source diagnostic")
    require(output_failures[0].get("message") == original.get("msg"), "Lost visual message")
    details = original.get("violationDetails", "")
    require((output_failures[0].text or "") == details, "Lost visual details")
elif case_id.startswith("change-"):
    combined = "\n".join((f.get("message", "") + "\n" + (f.text or "")) for f in output_failures)
    for violation in source.findall("./Exec/ExecViols/ChangeImpact"):
        for value in (violation.get("msg", ""), violation.get("violationDetails", "")):
            require(not value or value in combined, "Lost native Change Advisor diagnostic")
    if case_id == "change-all":
        require(any("==== ERROR ====" in (f.text or "") for f in output_failures),
                "Combined native failures have no separators")

evidence = {"id": case_id, "tests": len(cases), "failures": len(failures),
            "passed": len(cases) - len(failures)}
Path(evidence_name).write_text(json.dumps(evidence, indent=2), encoding="utf-8")
print(json.dumps(evidence))
