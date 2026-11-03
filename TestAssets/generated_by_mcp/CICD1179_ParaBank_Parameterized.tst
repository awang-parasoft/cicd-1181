---
parasoftVersion: 2026.2.0
productVersion: 10.7.6
schemaVersion: 13
suite:
  $type: TestSuite
  name: CICD1179_ParaBank_Parameterized
  hasEnvironmentConfig: true
  lastModifiedBy: awang
  notes: "Real ParaBank responses: CSV row isolation with one passing and one intentionally\
    \ failing row."
  dataSources:
  - id: ds_1792654840559_1819207675
    impl:
      $type: CSVDataSource
      file: true
      fileObj:
        path: customers.csv
      data: true
      columnNames:
      - CustomerId
      - ExpectedId
      - ExpectedFirstName
    name: Customers
    useAllRows: true
    lastRow: -1
  runMode: 1
  tests:
  - $type: RESTClientToolTest
    name: Customer row assertions
    testID: 1
    tool:
      $type: RESTClient
      dataSourceNames:
      - Customers
      iconName: RESTClient
      name: Customer row assertions
      outputTools:
      - $type: XMLAssertionTool
        dataSourceNames:
        - Customers
        iconName: XMLAssertor
        name: XML Assertor
        errorsOutput:
          name: Errors
        assertions:
        - $type: ValueAssertion
          timestamp: 1792654840767
          name: Customer ID from row
          extractEntireElement: true
          Assertion_XPath: /customer/id/text()
          value:
            name: Value
            value:
              fixedValue:
                $type: StringTestValue
                value: "${ExpectedId}"
        - $type: ValueAssertion
          timestamp: 1792654840767
          name: First name from row
          extractEntireElement: true
          Assertion_XPath: /customer/firstName/text()
          value:
            name: Value
            value:
              fixedValue:
                $type: StringTestValue
                value: "${ExpectedFirstName}"
        message:
          $type: ExpectedXMLMessage
          message: true
      formJson:
        value:
          $type: ElementValue
          writeType: true
          type:
            $type: ElementType
            localName: root
            bodyType:
              $type: ComplexType
              attributes:
              - ns: ""
                name: type
                fixed: object
                contentType:
                  $type: StringType
                required: true
              name: rootType
              compositor: true
              compositorObj:
                $type: AllCompositor
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            attributes:
            - replacedColumn: ""
              value:
                $type: StringValue
                replacedColumn: ""
                value: object
              useValue: true
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
        elementTypeName: root
      jsonBuilder:
        hasValue: true
        value:
          $type: JSONObjectValue
          nameIsNull: true
      xmlBuilder: false
      formInput:
        value:
          $type: ElementValue
          writeType: true
          type:
            $type: ElementType
            bodyType:
              $type: ComplexType
              namespace: ""
              name: anonymous
              compositor: true
              compositorObj:
                $type: SequenceCompositor
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
      jmsMessageOutputProvider:
        $type: JMSMessageOutputProvider
        jmsOutputProviderRequest:
          $type: JMSOutputProvider
          name: Request Object
          menuName: Object
        jmsOutputProviderResponse:
          $type: JMSOutputProvider
          name: Response Message Object
          menuName: Message Object
      router:
        values:
        - $type: ScriptedValue
        fixedValue:
          $type: StringTestValue
          HTTPClient_Endpoint: "http://localhost:18080/parabank/services/bank/customers/${CustomerId}"
      transportProperties:
        manager:
          protocol: 1
          properties:
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              httpHeaders:
                properties:
                - name: Accept
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: application/xml
            keepAlive1_1:
              bool: true
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              httpHeaders:
                properties:
                - name: Accept
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: application/xml
            protocol: 1
            keepAlive1_1:
              bool: true
        messageExchangePattern:
          inverted: true
      outputProviders:
        requestHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Request Transport Header
        responseHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Response Transport Header
        xmlRequestOutput:
          $type: NamedXMLToolOutputProvider
          menuName: Traffic
          name: Request Traffic
        trafficOutput:
          m_name: Traffic Stream
        objectOutput:
          $type: ObjectOutputProvider
          outputTools:
          - $type: TrafficViewer
            iconName: TrafficViewer
            name: Traffic Viewer
          name: Traffic Object
      literal:
        use: 1
        text:
          MessagingClient_LiteralMessage: ""
          type: application/json
      mode: Literal
      literalQuery:
        isPropertiesRef: true
      literalPath:
        pathElements:
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: parabank
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: services
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: bank
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: customers
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
          parameterizedValue:
            column: CustomerId
          selectedIndex: -2
      resourceMethod:
        httpMethod: GET
      baseUrl:
        values:
        - $type: ScriptedValue
        - $type: WadlTestValue
        fixedValue:
          $type: StringTestValue
        selectedIndex: 1
  - $type: RESTClientToolTest
    name: Passing row control
    testID: 2
    tool:
      $type: RESTClient
      dataSourceNames:
      - Customers
      iconName: RESTClient
      name: Passing row control
      formJson:
        value:
          $type: ElementValue
          writeType: true
          hasReference: true
          qnameAsString: :root
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            attributes:
            - replacedColumn: ""
              value:
                $type: StringValue
                replacedColumn: ""
                value: object
              useValue: true
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
        elementTypeName: root
      jsonBuilder:
        hasValue: true
        value:
          $type: JSONObjectValue
          nameIsNull: true
      xmlBuilder: false
      formInput:
        value:
          $type: ElementValue
          writeType: true
          hasReference: true
          qnameAsString: ":"
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
      jmsMessageOutputProvider:
        $type: JMSMessageOutputProvider
        jmsOutputProviderRequest:
          $type: JMSOutputProvider
          name: Request Object
          menuName: Object
        jmsOutputProviderResponse:
          $type: JMSOutputProvider
          name: Response Message Object
          menuName: Message Object
      validResponseRange:
        validResponseRange:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            validResponseRange: 200
      router:
        values:
        - $type: ScriptedValue
        fixedValue:
          $type: StringTestValue
          HTTPClient_Endpoint: http://localhost:18080/parabank/services/bank/customers/12212
      transportProperties:
        manager:
          protocol: 1
          properties:
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              httpHeaders:
                properties:
                - name: Accept
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: application/xml
            keepAlive1_1:
              bool: true
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              httpHeaders:
                properties:
                - name: Accept
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: application/xml
            protocol: 1
            keepAlive1_1:
              bool: true
        messageExchangePattern:
          inverted: true
      outputProviders:
        requestHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Request Transport Header
        responseHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Response Transport Header
        xmlRequestOutput:
          $type: NamedXMLToolOutputProvider
          menuName: Traffic
          name: Request Traffic
        trafficOutput:
          m_name: Traffic Stream
        objectOutput:
          $type: ObjectOutputProvider
          outputTools:
          - $type: TrafficViewer
            iconName: TrafficViewer
            name: Traffic Viewer
          name: Traffic Object
      literal:
        use: 1
        text:
          MessagingClient_LiteralMessage: ""
          type: application/json
      mode: Literal
      literalQuery:
        isPropertiesRef: true
      literalPath:
        pathElements:
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: parabank
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: services
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: bank
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: customers
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: 12212
      resourceMethod:
        httpMethod: GET
      baseUrl:
        values:
        - $type: ScriptedValue
        - $type: WadlTestValue
        fixedValue:
          $type: StringTestValue
        selectedIndex: 1
