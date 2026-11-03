#!/usr/bin/env python3
"""Replay a committed report; no SOAtest tests are executed."""
import argparse
import os
import shutil
import sys
from pathlib import Path

if len(sys.argv) == 3 and sys.argv[1] == "--install":
    install = Path(sys.argv[2])
    install.mkdir(parents=True, exist_ok=True)
    cli = install / "soatestcli"
    shutil.copyfile(__file__, cli)
    cli.chmod(0o755)
    # Match the action's existing bundled-Java discovery contract.
    plugin = install / "plugins/com.parasoft.ptest.jdk.eclipse.core.web.fixture"
    plugin.mkdir(parents=True, exist_ok=True)
    (plugin / "jdk").symlink_to(Path(os.environ["JAVA_HOME"]), target_is_directory=True)
    print("Installed fixture replay CLI; real SOAtest will not run.")
    raise SystemExit(0)

parser = argparse.ArgumentParser()
parser.add_argument("-report", required=True)
options, _ = parser.parse_known_args()
source = Path(os.environ["SOATEST_REPLAY_REPORT"])
target = Path(options.report)
if not source.is_file():
    parser.error("Fixture report does not exist: " + str(source))
if target.exists():
    parser.error("Replay output must be fresh: " + str(target))
target.parent.mkdir(parents=True, exist_ok=True)
shutil.copyfile(source, target)
print("FIXTURE REPLAY ONLY: " + source.name + " -> " + str(target))
