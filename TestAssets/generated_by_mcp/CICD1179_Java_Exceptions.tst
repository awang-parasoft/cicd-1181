---
parasoftVersion: 2026.2.0
productVersion: 10.7.6
schemaVersion: 03
suite:
  $type: TestSuite
  name: CICD1179_Java_Exceptions
  hasEnvironmentConfig: true
  lastModifiedBy: anonymous
  notes: Native report reproduction using built-in SOAtest tools; preserve unmodified
    XML output.
  runMode: 1
  tests:
  - $type: ToolTest
    name: Java assertion
    testID: 1
    tool:
      $type: MethodTool
      iconName: Method
      name: Java assertion
      returnValueMeansSuccess: true
      method:
        hasCode: true
        code:
          $type: ScriptCode
          input:
            useText: true
            textInput:
              $type: ScriptingTextInput
              text: |-
                boolean reproduce() {
                throw new AssertionError("Intentional Java assertion from SOAtest extension");
                }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: ToolTest
    name: Java runtime exception
    testID: 2
    tool:
      $type: MethodTool
      iconName: Method
      name: Java runtime exception
      returnValueMeansSuccess: true
      method:
        hasCode: true
        code:
          $type: ScriptCode
          input:
            useText: true
            textInput:
              $type: ScriptingTextInput
              text: |-
                boolean reproduce() {
                throw new IllegalStateException("Outer exception", new IllegalArgumentException("Inner cause"));
                }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: ToolTest
    name: Failing JUnit invocation
    testID: 3
    tool:
      $type: MethodTool
      iconName: Method
      name: Failing JUnit invocation
      returnValueMeansSuccess: true
      method:
        hasCode: true
        code:
          $type: ScriptCode
          input:
            useText: true
            textInput:
              $type: ScriptingTextInput
              text: |-
                boolean reproduce() {
                  def paths = [
                    'C:/Users/awang/.m2/repository/junit/junit/4.13.2/junit-4.13.2.jar',
                    'C:/Users/awang/.m2/repository/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar'
                  ]
                  def loader = new java.net.URLClassLoader(paths.collect { new File(it).toURI().toURL() } as java.net.URL[], this.class.classLoader)
                  try {
                    def assertion = Class.forName('org.junit.Assert', true, loader)
                    assertion.getMethod('assertEquals', String.class, Object.class, Object.class).invoke(null, 'Intentional JUnit mismatch', Integer.valueOf(1), Integer.valueOf(2))
                    return true
                  } catch (java.lang.reflect.InvocationTargetException error) {
                    throw error.cause
                  } finally {
                    loader.close()
                  }
                }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: ToolTest
    name: Passing Java control
    testID: 4
    tool:
      $type: MethodTool
      iconName: Method
      name: Passing Java control
      returnValueMeansSuccess: true
      method:
        hasCode: true
        code:
          $type: ScriptCode
          input:
            useText: true
            textInput:
              $type: ScriptingTextInput
              text: "boolean reproduce() { return true; }"
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
