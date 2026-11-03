---
parasoftVersion: 2026.2.0
productVersion: 10.7.6
schemaVersion: 03
suite:
  $type: TestSuite
  name: CICD1179_JUnit_Executor
  hasEnvironmentConfig: true
  lastModifiedBy: anonymous
  notes: Native report reproduction using built-in SOAtest tools; preserve unmodified
    XML output.
  runMode: 1
  tests:
  - $type: ToolTest
    name: Inspect installed custom tool descriptors
    testID: 1
    tool:
      $type: MethodTool
      iconName: Method
      name: JUnit4 passing control
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
                boolean reproduce(Object unusedInput, com.parasoft.api.ScriptingContext context) {
                      def manager = new com.parasoft.tool.ToolManager()
                      webtool.soap.CustomToolDescriptorsInitializer.initializeCustomToolDescritpors(manager)
                      def descriptors = manager.getToolDescriptors().toList()
                      new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/loaded-custom-tools.json').setText(groovy.json.JsonOutput.toJson(descriptors.collect { [name:it.toString(), key:it.getToolKeyName()] }), 'UTF-8')
                      def descriptor = descriptors.find { it.toString() == 'JUnit Executor' }
                      if (descriptor == null) throw new IllegalStateException('JUnit Executor is not loaded: ' + descriptors)
                      def tool = descriptor.createTool()
                      descriptor.getToolConfiguration().configure(tool)
                      tool.setParentBranch(context.getMethodTool().getParentBranch())
                      tool.getConfig().setString('jar','D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-tests/classes')
                      tool.getConfig().setString('class','NativeJUnitCases')
                      tool.getConfig().setString('method','passingControl')
                      tool.getConfig().setString('data','')
                      def input = tool.createToolUsable()
                      def trace = new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-native-trace.txt')
                      trace.append('passingControl context=' + context.getClass().getName() + ' valid=' + tool.isValid() + ' input=' + input + '\n', 'UTF-8')
                      // Use the host's real error-output context so the add-on reports directly into this test's native summary.
                      def success = tool.apply(input, context, context)
                      trace.append('result=' + success + ' errors=' + context.getErrors() + '\n','UTF-8')
                      // Native diagnostics already determine the host test's status; avoid adding a second return-value failure.
                      return true
                    }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
          arguments:
          - java.lang.Object
          - com.parasoft.api.ScriptingContext
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: ToolTest
    name: JUnit4 assertion failure
    testID: 2
    tool:
      $type: MethodTool
      iconName: Method
      name: JUnit4 assertion failure
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
                boolean reproduce(Object unusedInput, com.parasoft.api.ScriptingContext context) {
                      def manager = new com.parasoft.tool.ToolManager()
                      webtool.soap.CustomToolDescriptorsInitializer.initializeCustomToolDescritpors(manager)
                      def descriptors = manager.getToolDescriptors().toList()
                      new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/loaded-custom-tools.json').setText(groovy.json.JsonOutput.toJson(descriptors.collect { [name:it.toString(), key:it.getToolKeyName()] }), 'UTF-8')
                      def descriptor = descriptors.find { it.toString() == 'JUnit Executor' }
                      if (descriptor == null) throw new IllegalStateException('JUnit Executor is not loaded: ' + descriptors)
                      def tool = descriptor.createTool()
                      descriptor.getToolConfiguration().configure(tool)
                      tool.setParentBranch(context.getMethodTool().getParentBranch())
                      tool.getConfig().setString('jar','D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-tests/classes')
                      tool.getConfig().setString('class','NativeJUnitCases')
                      tool.getConfig().setString('method','assertionFailure')
                      tool.getConfig().setString('data','')
                      def input = tool.createToolUsable()
                      def trace = new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-native-trace.txt')
                      trace.append('assertionFailure context=' + context.getClass().getName() + ' valid=' + tool.isValid() + ' input=' + input + '\n', 'UTF-8')
                      // Use the host's real error-output context so the add-on reports directly into this test's native summary.
                      def success = tool.apply(input, context, context)
                      trace.append('result=' + success + ' errors=' + context.getErrors() + '\n','UTF-8')
                      // Native diagnostics already determine the host test's status; avoid adding a second return-value failure.
                      return true
                    }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
          arguments:
          - java.lang.Object
          - com.parasoft.api.ScriptingContext
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: ToolTest
    name: JUnit4 nested runtime exception
    testID: 3
    tool:
      $type: MethodTool
      iconName: Method
      name: JUnit4 nested runtime exception
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
                boolean reproduce(Object unusedInput, com.parasoft.api.ScriptingContext context) {
                      def manager = new com.parasoft.tool.ToolManager()
                      webtool.soap.CustomToolDescriptorsInitializer.initializeCustomToolDescritpors(manager)
                      def descriptors = manager.getToolDescriptors().toList()
                      new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/loaded-custom-tools.json').setText(groovy.json.JsonOutput.toJson(descriptors.collect { [name:it.toString(), key:it.getToolKeyName()] }), 'UTF-8')
                      def descriptor = descriptors.find { it.toString() == 'JUnit Executor' }
                      if (descriptor == null) throw new IllegalStateException('JUnit Executor is not loaded: ' + descriptors)
                      def tool = descriptor.createTool()
                      descriptor.getToolConfiguration().configure(tool)
                      tool.setParentBranch(context.getMethodTool().getParentBranch())
                      tool.getConfig().setString('jar','D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-tests/classes')
                      tool.getConfig().setString('class','NativeJUnitCases')
                      tool.getConfig().setString('method','nestedRuntimeFailure')
                      tool.getConfig().setString('data','')
                      def input = tool.createToolUsable()
                      def trace = new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-native-trace.txt')
                      trace.append('nestedRuntimeFailure context=' + context.getClass().getName() + ' valid=' + tool.isValid() + ' input=' + input + '\n', 'UTF-8')
                      // Use the host's real error-output context so the add-on reports directly into this test's native summary.
                      def success = tool.apply(input, context, context)
                      trace.append('result=' + success + ' errors=' + context.getErrors() + '\n','UTF-8')
                      // Native diagnostics already determine the host test's status; avoid adding a second return-value failure.
                      return true
                    }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
          arguments:
          - java.lang.Object
          - com.parasoft.api.ScriptingContext
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: ToolTest
    name: JUnit4 expected exception
    testID: 4
    tool:
      $type: MethodTool
      iconName: Method
      name: JUnit4 expected exception
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
                boolean reproduce(Object unusedInput, com.parasoft.api.ScriptingContext context) {
                      def manager = new com.parasoft.tool.ToolManager()
                      webtool.soap.CustomToolDescriptorsInitializer.initializeCustomToolDescritpors(manager)
                      def descriptors = manager.getToolDescriptors().toList()
                      new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/loaded-custom-tools.json').setText(groovy.json.JsonOutput.toJson(descriptors.collect { [name:it.toString(), key:it.getToolKeyName()] }), 'UTF-8')
                      def descriptor = descriptors.find { it.toString() == 'JUnit Executor' }
                      if (descriptor == null) throw new IllegalStateException('JUnit Executor is not loaded: ' + descriptors)
                      def tool = descriptor.createTool()
                      descriptor.getToolConfiguration().configure(tool)
                      tool.setParentBranch(context.getMethodTool().getParentBranch())
                      tool.getConfig().setString('jar','D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-tests/classes')
                      tool.getConfig().setString('class','NativeJUnitCases')
                      tool.getConfig().setString('method','expectedExceptionPasses')
                      tool.getConfig().setString('data','')
                      def input = tool.createToolUsable()
                      def trace = new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-native-trace.txt')
                      trace.append('expectedExceptionPasses context=' + context.getClass().getName() + ' valid=' + tool.isValid() + ' input=' + input + '\n', 'UTF-8')
                      // Use the host's real error-output context so the add-on reports directly into this test's native summary.
                      def success = tool.apply(input, context, context)
                      trace.append('result=' + success + ' errors=' + context.getErrors() + '\n','UTF-8')
                      // Native diagnostics already determine the host test's status; avoid adding a second return-value failure.
                      return true
                    }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
          arguments:
          - java.lang.Object
          - com.parasoft.api.ScriptingContext
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: ToolTest
    name: JUnit4 all methods
    testID: 5
    tool:
      $type: MethodTool
      iconName: Method
      name: JUnit4 all methods
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
                boolean reproduce(Object unusedInput, com.parasoft.api.ScriptingContext context) {
                      def manager = new com.parasoft.tool.ToolManager()
                      webtool.soap.CustomToolDescriptorsInitializer.initializeCustomToolDescritpors(manager)
                      def descriptors = manager.getToolDescriptors().toList()
                      new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/loaded-custom-tools.json').setText(groovy.json.JsonOutput.toJson(descriptors.collect { [name:it.toString(), key:it.getToolKeyName()] }), 'UTF-8')
                      def descriptor = descriptors.find { it.toString() == 'JUnit Executor' }
                      if (descriptor == null) throw new IllegalStateException('JUnit Executor is not loaded: ' + descriptors)
                      def tool = descriptor.createTool()
                      descriptor.getToolConfiguration().configure(tool)
                      tool.setParentBranch(context.getMethodTool().getParentBranch())
                      tool.getConfig().setString('jar','D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-tests/classes')
                      tool.getConfig().setString('class','NativeJUnitCases')
                      tool.getConfig().setString('method','')
                      tool.getConfig().setString('data','')
                      def input = tool.createToolUsable()
                      def trace = new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-native-trace.txt')
                      trace.append(' context=' + context.getClass().getName() + ' valid=' + tool.isValid() + ' input=' + input + '\n', 'UTF-8')
                      // Use the host's real error-output context so the add-on reports directly into this test's native summary.
                      def success = tool.apply(input, context, context)
                      trace.append('result=' + success + ' errors=' + context.getErrors() + '\n','UTF-8')
                      // Native diagnostics already determine the host test's status; avoid adding a second return-value failure.
                      return true
                    }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
          arguments:
          - java.lang.Object
          - com.parasoft.api.ScriptingContext
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: ToolTest
    name: JUnit3 all methods
    testID: 6
    tool:
      $type: MethodTool
      iconName: Method
      name: JUnit3 all methods
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
                boolean reproduce(Object unusedInput, com.parasoft.api.ScriptingContext context) {
                      def manager = new com.parasoft.tool.ToolManager()
                      webtool.soap.CustomToolDescriptorsInitializer.initializeCustomToolDescritpors(manager)
                      def descriptors = manager.getToolDescriptors().toList()
                      new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/loaded-custom-tools.json').setText(groovy.json.JsonOutput.toJson(descriptors.collect { [name:it.toString(), key:it.getToolKeyName()] }), 'UTF-8')
                      def descriptor = descriptors.find { it.toString() == 'JUnit Executor' }
                      if (descriptor == null) throw new IllegalStateException('JUnit Executor is not loaded: ' + descriptors)
                      def tool = descriptor.createTool()
                      descriptor.getToolConfiguration().configure(tool)
                      tool.setParentBranch(context.getMethodTool().getParentBranch())
                      tool.getConfig().setString('jar','D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-tests/classes')
                      tool.getConfig().setString('class','NativeJUnit3Cases')
                      tool.getConfig().setString('method','')
                      tool.getConfig().setString('data','')
                      def input = tool.createToolUsable()
                      def trace = new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-native-trace.txt')
                      trace.append(' context=' + context.getClass().getName() + ' valid=' + tool.isValid() + ' input=' + input + '\n', 'UTF-8')
                      // Use the host's real error-output context so the add-on reports directly into this test's native summary.
                      def success = tool.apply(input, context, context)
                      trace.append('result=' + success + ' errors=' + context.getErrors() + '\n','UTF-8')
                      // Native diagnostics already determine the host test's status; avoid adding a second return-value failure.
                      return true
                    }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
          arguments:
          - java.lang.Object
          - com.parasoft.api.ScriptingContext
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: ToolTest
    name: JUnit4 missing method
    testID: 7
    tool:
      $type: MethodTool
      iconName: Method
      name: JUnit4 missing method
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
                boolean reproduce(Object unusedInput, com.parasoft.api.ScriptingContext context) {
                      def manager = new com.parasoft.tool.ToolManager()
                      webtool.soap.CustomToolDescriptorsInitializer.initializeCustomToolDescritpors(manager)
                      def descriptors = manager.getToolDescriptors().toList()
                      new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/loaded-custom-tools.json').setText(groovy.json.JsonOutput.toJson(descriptors.collect { [name:it.toString(), key:it.getToolKeyName()] }), 'UTF-8')
                      def descriptor = descriptors.find { it.toString() == 'JUnit Executor' }
                      if (descriptor == null) throw new IllegalStateException('JUnit Executor is not loaded: ' + descriptors)
                      def tool = descriptor.createTool()
                      descriptor.getToolConfiguration().configure(tool)
                      tool.setParentBranch(context.getMethodTool().getParentBranch())
                      tool.getConfig().setString('jar','D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-tests/classes')
                      tool.getConfig().setString('class','NativeJUnitCases')
                      tool.getConfig().setString('method','doesNotExist')
                      tool.getConfig().setString('data','')
                      def input = tool.createToolUsable()
                      def trace = new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-native-trace.txt')
                      trace.append('doesNotExist context=' + context.getClass().getName() + ' valid=' + tool.isValid() + ' input=' + input + '\n', 'UTF-8')
                      // Use the host's real error-output context so the add-on reports directly into this test's native summary.
                      def success = tool.apply(input, context, context)
                      trace.append('result=' + success + ' errors=' + context.getErrors() + '\n','UTF-8')
                      // Native diagnostics already determine the host test's status; avoid adding a second return-value failure.
                      return true
                    }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
          arguments:
          - java.lang.Object
          - com.parasoft.api.ScriptingContext
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: ToolTest
    name: JUnit4 missing class
    testID: 8
    tool:
      $type: MethodTool
      iconName: Method
      name: JUnit4 missing class
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
                boolean reproduce(Object unusedInput, com.parasoft.api.ScriptingContext context) {
                      def manager = new com.parasoft.tool.ToolManager()
                      webtool.soap.CustomToolDescriptorsInitializer.initializeCustomToolDescritpors(manager)
                      def descriptors = manager.getToolDescriptors().toList()
                      new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/loaded-custom-tools.json').setText(groovy.json.JsonOutput.toJson(descriptors.collect { [name:it.toString(), key:it.getToolKeyName()] }), 'UTF-8')
                      def descriptor = descriptors.find { it.toString() == 'JUnit Executor' }
                      if (descriptor == null) throw new IllegalStateException('JUnit Executor is not loaded: ' + descriptors)
                      def tool = descriptor.createTool()
                      descriptor.getToolConfiguration().configure(tool)
                      tool.setParentBranch(context.getMethodTool().getParentBranch())
                      tool.getConfig().setString('jar','D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-tests/classes')
                      tool.getConfig().setString('class','DoesNotExist')
                      tool.getConfig().setString('method','')
                      tool.getConfig().setString('data','')
                      def input = tool.createToolUsable()
                      def trace = new File('D:/Projects/CICD/Jenkins/parasoft-findings-plugin/work/CICD-1179/real-reports/reproductions/addon-native-trace.txt')
                      trace.append(' context=' + context.getClass().getName() + ' valid=' + tool.isValid() + ' input=' + input + '\n', 'UTF-8')
                      // Use the host's real error-output context so the add-on reports directly into this test's native summary.
                      def success = tool.apply(input, context, context)
                      trace.append('result=' + success + ' errors=' + context.getErrors() + '\n','UTF-8')
                      // Native diagnostics already determine the host test's status; avoid adding a second return-value failure.
                      return true
                    }
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: reproduce
          arguments:
          - java.lang.Object
          - com.parasoft.api.ScriptingContext
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
