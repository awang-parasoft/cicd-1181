---
parasoftVersion: 2026.2.0
productVersion: 10.7.6
schemaVersion: 03
suite:
  $type: TestSuite
  name: CICD1179_JUnit_Standalone
  hasEnvironmentConfig: true
  lastModifiedBy: anonymous
  notes: Native report reproduction using built-in SOAtest tools; preserve unmodified
    XML output.
  runMode: 1
  tests:
  - $type: ToolTest
    name: JUnit Executor
    testID: 2
    tool:
      $type: CustomTool
      iconName: DefaultTool
      name: JUnit4 standalone all methods
      provider:
        outputProviders:
        - junit
        - $type: NamedToolOutputProvider
          name: JUnit
      config:
        $type: CustomToolConfiguration
        ConfigClassName: com.parasoft.soavirt.tool.junitrunnertool.JUnitRunnerTool
        values:
          customValueMap:
          - class
          - $type: MultiValueCustomValue
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: NativeJUnitCases
          - data
          - $type: MultiValueCustomValue
          - jar
          - $type: MultiValueCustomValue
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-tests/classes
          - method
          - $type: MultiValueCustomValue
        className: com.parasoft.soavirt.tool.junitrunnertool.JUnitRunnerTool
        name: JUnit Executor
