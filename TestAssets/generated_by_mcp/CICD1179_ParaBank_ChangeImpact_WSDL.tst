---
parasoftVersion: 2026.2.0
productVersion: 10.7.6
schemaVersion: 11
suite:
  $type: TestSuite
  name: Test Suite
  lastModifiedBy: anonymous
  notes: |-
    Created from: http://localhost:18081/current.wsdl
    Timestamp: 2026-10-22 16:23:23
  tests:
  - $type: TestSuite
    name: CartServicePort
    testID: 1
    soapClientOptions:
      wsdlEndpointOptions:
        wsdl:
          useDefault: false
          wsdl: http://localhost:18081/current.wsdl
        endpoint:
          useDefault: false
          endpoint: http://localhost:18080/parabank/services/store-01
      soap:
        soapVersion:
          useDefault: false
    tests:
    - $type: SOAPRPCToolTest
      name: addItemToCart
      testID: 8
      tool:
        $type: SOAPRPCTool
        iconName: SOAPClient
        name: addItemToCart
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://localhost:18081/current.wsdl
        soapResponse:
          $type: SOAPOutputProviderImpl
        notes: Test client for operation "addItemToCart" in "http://localhost:18081/current.wsdl".
        wsdlProperties:
          wsdlURL:
            SOAPClient_WSDLLocation: http://localhost:18081/current.wsdl
        endpointProperties:
          defaultEndpoint:
            $type: DefaultEndpointType
          uddiEndpoint:
            $type: UDDIEndpointType
          customEndpoint:
            $type: CustomEndpointType
            customEndpoint:
              SOAPClient_CustomEndpoint: http://localhost:18080/parabank/services/store-01
          wsdlEndpoint:
            $type: WsdlEndpointType
            wsdlEndpoint:
              value: http://localhost:18080/parabank/services/store-01
        mimeOutputProvider:
          $type: MIMEOutputProvider
          attachmentOutputProvider:
            menuName: Attachment
            name: Response Attachment
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
            menuName: SOAP Envelope
            name: Request SOAP Envelope
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        callContainer:
          transportProperties:
            manager:
              protocol: 1
            messageExchangePattern:
              inverted: true
          soapCall: true
          soapCallObj:
            soapMethod: true
            soapMethodObj:
              soapParameters:
              - value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: addItemToCart
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: addItemToCart
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: cartId
                          bodyType:
                            $type: IntegerType
                            _id: 1
                        - $type: ElementType
                          localName: itemId
                          bodyType:
                            $type: IntegerType
                            _ref: 1
                        - $type: ElementType
                          localName: quantity
                          bodyType:
                            $type: IntegerType
                            _ref: 1
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                          - $type: ElementValue
                            replacedColumn: ""
                            values:
                            - $type: IntegerValue
                              replacedColumn: ""
                              value: 0
                          - $type: ElementValue
                            replacedColumn: ""
                            values:
                            - $type: IntegerValue
                              replacedColumn: ""
                              value: 0
                name: parameters
              beautify: false
              longName: addItemToCart
              faults:
              - Exception
              portTypeNamespace: http://bookstore.parasoft.com/
              outputName: addItemToCartResponse
              styleUseProperties:
                targetObjectURI: http://bookstore.parasoft.com/
                encodingStyleURI: null
              portTypeName: Bookstore
              serviceAddress:
                $type: SOAPServiceAddress
                portName: CartServicePort
                address: http://localhost:18080/parabank/services/store-01
              returnParam: true
              returnParamObj:
                value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: addItemToCartResponse
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: addItemToCartResponse
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: itemAdded
                          bodyType:
                            $type: ComplexType
                            namespace: http://bookstore.parasoft.com/
                            name: displayOrder
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                              types:
                              - $type: ElementType
                                localName: cartId
                                bodyType:
                                  $type: IntegerType
                                  _id: 1
                              - $type: ElementType
                                minOccurs: 0
                                localName: item
                                bodyType:
                                  $type: ComplexType
                                  namespace: http://bookstore.parasoft.com/
                                  name: order
                                  compositor: true
                                  compositorObj:
                                    $type: SequenceCompositor
                                    types:
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: book
                                      bodyType:
                                        $type: ComplexType
                                        namespace: http://bookstore.parasoft.com/
                                        name: book
                                        compositor: true
                                        compositorObj:
                                          $type: SequenceCompositor
                                          types:
                                          - $type: ElementType
                                            localName: id
                                            bodyType:
                                              $type: IntegerType
                                              _ref: 1
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: name
                                            bodyType:
                                              $type: StringType
                                              _id: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: price
                                            bodyType:
                                              $type: DecimalType
                                          - $type: ElementType
                                            localName: stockQuantity
                                            bodyType:
                                              $type: IntegerType
                                              _ref: 1
                                          - $type: ElementType
                                            minOccurs: 0
                                            maxOccurs: -1
                                            nillable: true
                                            localName: authors
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: description
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: ISBN
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: publicationDate
                                            bodyType:
                                              $type: DateTimeType
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: publisher
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                    - $type: ElementType
                                      localName: quantity
                                      bodyType:
                                        $type: IntegerType
                                        _ref: 1
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                name: parameters
              inputName: addItemToCart
              methodName: addItemToCart
              returnType: "{http://bookstore.parasoft.com/}addItemToCartResponse"
            inputMode: 1
        responseFormat: 2
        mimeType: text/plain
    - $type: SOAPRPCToolTest
      name: addNewItemToInventory
      testID: 2
      tool:
        $type: SOAPRPCTool
        iconName: SOAPClient
        name: addNewItemToInventory
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://localhost:18081/current.wsdl
        soapResponse:
          $type: SOAPOutputProviderImpl
        notes: Test client for operation "addNewItemToInventory" in "http://localhost:18081/current.wsdl".
        wsdlProperties:
          wsdlURL:
            SOAPClient_WSDLLocation: http://localhost:18081/current.wsdl
        endpointProperties:
          defaultEndpoint:
            $type: DefaultEndpointType
          uddiEndpoint:
            $type: UDDIEndpointType
          customEndpoint:
            $type: CustomEndpointType
            customEndpoint:
              SOAPClient_CustomEndpoint: http://localhost:18080/parabank/services/store-01
          wsdlEndpoint:
            $type: WsdlEndpointType
            wsdlEndpoint:
              value: http://localhost:18080/parabank/services/store-01
        mimeOutputProvider:
          $type: MIMEOutputProvider
          attachmentOutputProvider:
            menuName: Attachment
            name: Response Attachment
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
            menuName: SOAP Envelope
            name: Request SOAP Envelope
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        callContainer:
          transportProperties:
            manager:
              protocol: 1
            messageExchangePattern:
              inverted: true
          soapCall: true
          soapCallObj:
            soapMethod: true
            soapMethodObj:
              soapParameters:
              - value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: addNewItemToInventory
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: addNewItemToInventory
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: book
                          bodyType:
                            $type: ComplexType
                            namespace: http://bookstore.parasoft.com/
                            name: book
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                              types:
                              - $type: ElementType
                                localName: id
                                bodyType:
                                  $type: IntegerType
                                  _id: 1
                              - $type: ElementType
                                minOccurs: 0
                                localName: name
                                bodyType:
                                  $type: StringType
                                  _id: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: price
                                bodyType:
                                  $type: DecimalType
                              - $type: ElementType
                                localName: stockQuantity
                                bodyType:
                                  $type: IntegerType
                                  _ref: 1
                              - $type: ElementType
                                minOccurs: 0
                                maxOccurs: -1
                                nillable: true
                                localName: authors
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: description
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: ISBN
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: publicationDate
                                bodyType:
                                  $type: DateTimeType
                              - $type: ElementType
                                minOccurs: 0
                                localName: publisher
                                bodyType:
                                  $type: StringType
                                  _ref: 2
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                name: parameters
              beautify: false
              longName: addNewItemToInventory
              faults:
              - Exception
              portTypeNamespace: http://bookstore.parasoft.com/
              outputName: addNewItemToInventoryResponse
              styleUseProperties:
                targetObjectURI: http://bookstore.parasoft.com/
                encodingStyleURI: null
              portTypeName: Bookstore
              serviceAddress:
                $type: SOAPServiceAddress
                portName: CartServicePort
                address: http://localhost:18080/parabank/services/store-01
              returnParam: true
              returnParamObj:
                value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: addNewItemToInventoryResponse
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: addNewItemToInventoryResponse
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: book
                          bodyType:
                            $type: ComplexType
                            namespace: http://bookstore.parasoft.com/
                            name: book
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                              types:
                              - $type: ElementType
                                localName: id
                                bodyType:
                                  $type: IntegerType
                                  _id: 1
                              - $type: ElementType
                                minOccurs: 0
                                localName: name
                                bodyType:
                                  $type: StringType
                                  _id: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: price
                                bodyType:
                                  $type: DecimalType
                              - $type: ElementType
                                localName: stockQuantity
                                bodyType:
                                  $type: IntegerType
                                  _ref: 1
                              - $type: ElementType
                                minOccurs: 0
                                maxOccurs: -1
                                nillable: true
                                localName: authors
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: description
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: ISBN
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: publicationDate
                                bodyType:
                                  $type: DateTimeType
                              - $type: ElementType
                                minOccurs: 0
                                localName: publisher
                                bodyType:
                                  $type: StringType
                                  _ref: 2
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                name: parameters
              inputName: addNewItemToInventory
              methodName: addNewItemToInventory
              returnType: "{http://bookstore.parasoft.com/}addNewItemToInventoryResponse"
            inputMode: 1
        responseFormat: 2
        mimeType: text/plain
    - $type: SOAPRPCToolTest
      name: getItemById
      testID: 6
      tool:
        $type: SOAPRPCTool
        iconName: SOAPClient
        name: getItemById
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://localhost:18081/current.wsdl
        soapResponse:
          $type: SOAPOutputProviderImpl
        notes: Test client for operation "getItemById" in "http://localhost:18081/current.wsdl".
        wsdlProperties:
          wsdlURL:
            SOAPClient_WSDLLocation: http://localhost:18081/current.wsdl
        endpointProperties:
          defaultEndpoint:
            $type: DefaultEndpointType
          uddiEndpoint:
            $type: UDDIEndpointType
          customEndpoint:
            $type: CustomEndpointType
            customEndpoint:
              SOAPClient_CustomEndpoint: http://localhost:18080/parabank/services/store-01
          wsdlEndpoint:
            $type: WsdlEndpointType
            wsdlEndpoint:
              value: http://localhost:18080/parabank/services/store-01
        mimeOutputProvider:
          $type: MIMEOutputProvider
          attachmentOutputProvider:
            menuName: Attachment
            name: Response Attachment
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
            menuName: SOAP Envelope
            name: Request SOAP Envelope
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        callContainer:
          transportProperties:
            manager:
              protocol: 1
            messageExchangePattern:
              inverted: true
          soapCall: true
          soapCallObj:
            soapMethod: true
            soapMethodObj:
              soapParameters:
              - value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: getItemById
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: getItemById
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          localName: id
                          bodyType:
                            $type: IntegerType
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                            values:
                            - $type: IntegerValue
                              replacedColumn: ""
                              value: 0
                name: parameters
              beautify: false
              longName: getItemById
              faults:
              - Exception
              portTypeNamespace: http://bookstore.parasoft.com/
              outputName: getItemByIdResponse
              styleUseProperties:
                targetObjectURI: http://bookstore.parasoft.com/
                encodingStyleURI: null
              portTypeName: Bookstore
              serviceAddress:
                $type: SOAPServiceAddress
                portName: CartServicePort
                address: http://localhost:18080/parabank/services/store-01
              returnParam: true
              returnParamObj:
                value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: getItemByIdResponse
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: getItemByIdResponse
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: book
                          bodyType:
                            $type: ComplexType
                            namespace: http://bookstore.parasoft.com/
                            name: book
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                              types:
                              - $type: ElementType
                                localName: id
                                bodyType:
                                  $type: IntegerType
                                  _id: 1
                              - $type: ElementType
                                minOccurs: 0
                                localName: name
                                bodyType:
                                  $type: StringType
                                  _id: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: price
                                bodyType:
                                  $type: DecimalType
                              - $type: ElementType
                                localName: stockQuantity
                                bodyType:
                                  $type: IntegerType
                                  _ref: 1
                              - $type: ElementType
                                minOccurs: 0
                                maxOccurs: -1
                                nillable: true
                                localName: authors
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: description
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: ISBN
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: publicationDate
                                bodyType:
                                  $type: DateTimeType
                              - $type: ElementType
                                minOccurs: 0
                                localName: publisher
                                bodyType:
                                  $type: StringType
                                  _ref: 2
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                name: parameters
              inputName: getItemById
              methodName: getItemById
              returnType: "{http://bookstore.parasoft.com/}getItemByIdResponse"
            inputMode: 1
        responseFormat: 2
        mimeType: text/plain
    - $type: SOAPRPCToolTest
      name: getItemByTitle
      testID: 5
      tool:
        $type: SOAPRPCTool
        iconName: SOAPClient
        name: getItemByTitle
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://localhost:18081/current.wsdl
        soapResponse:
          $type: SOAPOutputProviderImpl
        notes: Test client for operation "getItemByTitle" in "http://localhost:18081/current.wsdl".
        wsdlProperties:
          wsdlURL:
            SOAPClient_WSDLLocation: http://localhost:18081/current.wsdl
        endpointProperties:
          defaultEndpoint:
            $type: DefaultEndpointType
          uddiEndpoint:
            $type: UDDIEndpointType
          customEndpoint:
            $type: CustomEndpointType
            customEndpoint:
              SOAPClient_CustomEndpoint: http://localhost:18080/parabank/services/store-01
          wsdlEndpoint:
            $type: WsdlEndpointType
            wsdlEndpoint:
              value: http://localhost:18080/parabank/services/store-01
        mimeOutputProvider:
          $type: MIMEOutputProvider
          attachmentOutputProvider:
            menuName: Attachment
            name: Response Attachment
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
            menuName: SOAP Envelope
            name: Request SOAP Envelope
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        callContainer:
          transportProperties:
            manager:
              protocol: 1
            messageExchangePattern:
              inverted: true
          soapCall: true
          soapCallObj:
            soapMethod: true
            soapMethodObj:
              soapParameters:
              - value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: getItemByTitle
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: getItemByTitle
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: titleKeyword
                          bodyType:
                            $type: StringType
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                name: parameters
              beautify: false
              longName: getItemByTitle
              faults:
              - Exception
              portTypeNamespace: http://bookstore.parasoft.com/
              outputName: getItemByTitleResponse
              styleUseProperties:
                targetObjectURI: http://bookstore.parasoft.com/
                encodingStyleURI: null
              portTypeName: Bookstore
              serviceAddress:
                $type: SOAPServiceAddress
                portName: CartServicePort
                address: http://localhost:18080/parabank/services/store-01
              returnParam: true
              returnParamObj:
                value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: getItemByTitleResponse
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: getItemByTitleResponse
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          maxOccurs: -1
                          localName: book
                          bodyType:
                            $type: ComplexType
                            namespace: http://bookstore.parasoft.com/
                            name: book
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                              types:
                              - $type: ElementType
                                localName: id
                                bodyType:
                                  $type: IntegerType
                                  _id: 1
                              - $type: ElementType
                                minOccurs: 0
                                localName: name
                                bodyType:
                                  $type: StringType
                                  _id: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: price
                                bodyType:
                                  $type: DecimalType
                              - $type: ElementType
                                localName: stockQuantity
                                bodyType:
                                  $type: IntegerType
                                  _ref: 1
                              - $type: ElementType
                                minOccurs: 0
                                maxOccurs: -1
                                nillable: true
                                localName: authors
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: description
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: ISBN
                                bodyType:
                                  $type: StringType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: publicationDate
                                bodyType:
                                  $type: DateTimeType
                              - $type: ElementType
                                minOccurs: 0
                                localName: publisher
                                bodyType:
                                  $type: StringType
                                  _ref: 2
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                name: parameters
              inputName: getItemByTitle
              methodName: getItemByTitle
              returnType: "{http://bookstore.parasoft.com/}getItemByTitleResponse"
            inputMode: 1
        responseFormat: 2
        mimeType: text/plain
    - $type: SOAPRPCToolTest
      name: getItemsInCart
      testID: 3
      tool:
        $type: SOAPRPCTool
        iconName: SOAPClient
        name: getItemsInCart
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://localhost:18081/current.wsdl
        soapResponse:
          $type: SOAPOutputProviderImpl
        notes: Test client for operation "getItemsInCart" in "http://localhost:18081/current.wsdl".
        wsdlProperties:
          wsdlURL:
            SOAPClient_WSDLLocation: http://localhost:18081/current.wsdl
        endpointProperties:
          defaultEndpoint:
            $type: DefaultEndpointType
          uddiEndpoint:
            $type: UDDIEndpointType
          customEndpoint:
            $type: CustomEndpointType
            customEndpoint:
              SOAPClient_CustomEndpoint: http://localhost:18080/parabank/services/store-01
          wsdlEndpoint:
            $type: WsdlEndpointType
            wsdlEndpoint:
              value: http://localhost:18080/parabank/services/store-01
        mimeOutputProvider:
          $type: MIMEOutputProvider
          attachmentOutputProvider:
            menuName: Attachment
            name: Response Attachment
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
            menuName: SOAP Envelope
            name: Request SOAP Envelope
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        callContainer:
          transportProperties:
            manager:
              protocol: 1
            messageExchangePattern:
              inverted: true
          soapCall: true
          soapCallObj:
            soapMethod: true
            soapMethodObj:
              soapParameters:
              - value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: getItemsInCart
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: getItemsInCart
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          localName: cartId
                          bodyType:
                            $type: IntegerType
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                            values:
                            - $type: IntegerValue
                              replacedColumn: ""
                              value: 0
                name: parameters
              beautify: false
              longName: getItemsInCart
              faults:
              - Exception
              portTypeNamespace: http://bookstore.parasoft.com/
              outputName: getItemsInCartResponse
              styleUseProperties:
                targetObjectURI: http://bookstore.parasoft.com/
                encodingStyleURI: null
              portTypeName: Bookstore
              serviceAddress:
                $type: SOAPServiceAddress
                portName: CartServicePort
                address: http://localhost:18080/parabank/services/store-01
              returnParam: true
              returnParamObj:
                value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: getItemsInCartResponse
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: getItemsInCartResponse
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: cart
                          bodyType:
                            $type: ComplexType
                            namespace: http://bookstore.parasoft.com/
                            name: cartManager
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                              types:
                              - $type: ElementType
                                localName: cartId
                                bodyType:
                                  $type: IntegerType
                                  _id: 1
                              - $type: ElementType
                                minOccurs: 0
                                maxOccurs: -1
                                nillable: true
                                localName: item
                                bodyType:
                                  $type: ComplexType
                                  namespace: http://bookstore.parasoft.com/
                                  name: order
                                  compositor: true
                                  compositorObj:
                                    $type: SequenceCompositor
                                    types:
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: book
                                      bodyType:
                                        $type: ComplexType
                                        namespace: http://bookstore.parasoft.com/
                                        name: book
                                        compositor: true
                                        compositorObj:
                                          $type: SequenceCompositor
                                          types:
                                          - $type: ElementType
                                            localName: id
                                            bodyType:
                                              $type: IntegerType
                                              _ref: 1
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: name
                                            bodyType:
                                              $type: StringType
                                              _id: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: price
                                            bodyType:
                                              $type: DecimalType
                                          - $type: ElementType
                                            localName: stockQuantity
                                            bodyType:
                                              $type: IntegerType
                                              _ref: 1
                                          - $type: ElementType
                                            minOccurs: 0
                                            maxOccurs: -1
                                            nillable: true
                                            localName: authors
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: description
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: ISBN
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: publicationDate
                                            bodyType:
                                              $type: DateTimeType
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: publisher
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                    - $type: ElementType
                                      localName: quantity
                                      bodyType:
                                        $type: IntegerType
                                        _ref: 1
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                name: parameters
              inputName: getItemsInCart
              methodName: getItemsInCart
              returnType: "{http://bookstore.parasoft.com/}getItemsInCartResponse"
            inputMode: 1
        responseFormat: 2
        mimeType: text/plain
    - $type: SOAPRPCToolTest
      name: submitOrder
      testID: 4
      tool:
        $type: SOAPRPCTool
        iconName: SOAPClient
        name: submitOrder
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://localhost:18081/current.wsdl
        soapResponse:
          $type: SOAPOutputProviderImpl
        notes: Test client for operation "submitOrder" in "http://localhost:18081/current.wsdl".
        wsdlProperties:
          wsdlURL:
            SOAPClient_WSDLLocation: http://localhost:18081/current.wsdl
        endpointProperties:
          defaultEndpoint:
            $type: DefaultEndpointType
          uddiEndpoint:
            $type: UDDIEndpointType
          customEndpoint:
            $type: CustomEndpointType
            customEndpoint:
              SOAPClient_CustomEndpoint: http://localhost:18080/parabank/services/store-01
          wsdlEndpoint:
            $type: WsdlEndpointType
            wsdlEndpoint:
              value: http://localhost:18080/parabank/services/store-01
        mimeOutputProvider:
          $type: MIMEOutputProvider
          attachmentOutputProvider:
            menuName: Attachment
            name: Response Attachment
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
            menuName: SOAP Envelope
            name: Request SOAP Envelope
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        callContainer:
          transportProperties:
            manager:
              protocol: 1
            messageExchangePattern:
              inverted: true
          soapCall: true
          soapCallObj:
            soapMethod: true
            soapMethodObj:
              soapParameters:
              - value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: submitOrder
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: submitOrder
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          localName: cartId
                          bodyType:
                            $type: IntegerType
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                            values:
                            - $type: IntegerValue
                              replacedColumn: ""
                              value: 0
                name: parameters
              beautify: false
              longName: submitOrder
              portTypeNamespace: http://bookstore.parasoft.com/
              outputName: submitOrderResponse
              styleUseProperties:
                targetObjectURI: http://bookstore.parasoft.com/
                encodingStyleURI: null
              portTypeName: Bookstore
              serviceAddress:
                $type: SOAPServiceAddress
                portName: CartServicePort
                address: http://localhost:18080/parabank/services/store-01
              returnParam: true
              returnParamObj:
                value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: submitOrderResponse
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: submitOrderResponse
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: orderInformation
                          bodyType:
                            $type: ComplexType
                            namespace: http://bookstore.parasoft.com/
                            name: submittedOrder
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                              types:
                              - $type: ElementType
                                minOccurs: 0
                                localName: orderTime
                                bodyType:
                                  $type: DateTimeType
                              - $type: ElementType
                                localName: success
                                bodyType:
                                  $type: BooleanType
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                name: parameters
              inputName: submitOrder
              methodName: submitOrder
              returnType: "{http://bookstore.parasoft.com/}submitOrderResponse"
            inputMode: 1
        responseFormat: 2
        mimeType: text/plain
    - $type: SOAPRPCToolTest
      name: updateItemInCart
      testID: 7
      tool:
        $type: SOAPRPCTool
        iconName: SOAPClient
        name: updateItemInCart
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://localhost:18081/current.wsdl
        soapResponse:
          $type: SOAPOutputProviderImpl
        notes: Test client for operation "updateItemInCart" in "http://localhost:18081/current.wsdl".
        wsdlProperties:
          wsdlURL:
            SOAPClient_WSDLLocation: http://localhost:18081/current.wsdl
        endpointProperties:
          defaultEndpoint:
            $type: DefaultEndpointType
          uddiEndpoint:
            $type: UDDIEndpointType
          customEndpoint:
            $type: CustomEndpointType
            customEndpoint:
              SOAPClient_CustomEndpoint: http://localhost:18080/parabank/services/store-01
          wsdlEndpoint:
            $type: WsdlEndpointType
            wsdlEndpoint:
              value: http://localhost:18080/parabank/services/store-01
        mimeOutputProvider:
          $type: MIMEOutputProvider
          attachmentOutputProvider:
            menuName: Attachment
            name: Response Attachment
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
            menuName: SOAP Envelope
            name: Request SOAP Envelope
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        callContainer:
          transportProperties:
            manager:
              protocol: 1
            messageExchangePattern:
              inverted: true
          soapCall: true
          soapCallObj:
            soapMethod: true
            soapMethodObj:
              soapParameters:
              - value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: updateItemInCart
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: updateItemInCart
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          localName: cartId
                          bodyType:
                            $type: IntegerType
                            _id: 1
                        - $type: ElementType
                          localName: itemId
                          bodyType:
                            $type: IntegerType
                            _ref: 1
                        - $type: ElementType
                          localName: quantity
                          bodyType:
                            $type: IntegerType
                            _ref: 1
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                            values:
                            - $type: IntegerValue
                              replacedColumn: ""
                              value: 0
                          - $type: ElementValue
                            replacedColumn: ""
                            values:
                            - $type: IntegerValue
                              replacedColumn: ""
                              value: 0
                          - $type: ElementValue
                            replacedColumn: ""
                            values:
                            - $type: IntegerValue
                              replacedColumn: ""
                              value: 0
                name: parameters
              beautify: false
              longName: updateItemInCart
              faults:
              - Exception
              portTypeNamespace: http://bookstore.parasoft.com/
              outputName: updateItemInCartResponse
              styleUseProperties:
                targetObjectURI: http://bookstore.parasoft.com/
                encodingStyleURI: null
              portTypeName: Bookstore
              serviceAddress:
                $type: SOAPServiceAddress
                portName: CartServicePort
                address: http://localhost:18080/parabank/services/store-01
              returnParam: true
              returnParamObj:
                value:
                  $type: ElementValue
                  writeType: true
                  type:
                    $type: ElementType
                    namespace: http://bookstore.parasoft.com/
                    localName: updateItemInCartResponse
                    bodyType:
                      $type: ComplexType
                      namespace: http://bookstore.parasoft.com/
                      name: updateItemInCartResponse
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: updatedItem
                          bodyType:
                            $type: ComplexType
                            namespace: http://bookstore.parasoft.com/
                            name: displayOrder
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                              types:
                              - $type: ElementType
                                localName: cartId
                                bodyType:
                                  $type: IntegerType
                                  _id: 1
                              - $type: ElementType
                                minOccurs: 0
                                localName: item
                                bodyType:
                                  $type: ComplexType
                                  namespace: http://bookstore.parasoft.com/
                                  name: order
                                  compositor: true
                                  compositorObj:
                                    $type: SequenceCompositor
                                    types:
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: book
                                      bodyType:
                                        $type: ComplexType
                                        namespace: http://bookstore.parasoft.com/
                                        name: book
                                        compositor: true
                                        compositorObj:
                                          $type: SequenceCompositor
                                          types:
                                          - $type: ElementType
                                            localName: id
                                            bodyType:
                                              $type: IntegerType
                                              _ref: 1
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: name
                                            bodyType:
                                              $type: StringType
                                              _id: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: price
                                            bodyType:
                                              $type: DecimalType
                                          - $type: ElementType
                                            localName: stockQuantity
                                            bodyType:
                                              $type: IntegerType
                                              _ref: 1
                                          - $type: ElementType
                                            minOccurs: 0
                                            maxOccurs: -1
                                            nillable: true
                                            localName: authors
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: description
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: ISBN
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: publicationDate
                                            bodyType:
                                              $type: DateTimeType
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: publisher
                                            bodyType:
                                              $type: StringType
                                              _ref: 2
                                    - $type: ElementType
                                      localName: quantity
                                      bodyType:
                                        $type: IntegerType
                                        _ref: 1
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
                          values:
                          - $type: ElementValue
                            replacedColumn: ""
                name: parameters
              inputName: updateItemInCart
              methodName: updateItemInCart
              returnType: "{http://bookstore.parasoft.com/}updateItemInCartResponse"
            inputMode: 1
        responseFormat: 2
        mimeType: text/plain
