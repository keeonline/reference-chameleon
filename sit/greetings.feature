Feature: Call the greetings endpoints of the chameleon based services

  Scenario: using karate-config
    * print baseUrl
 
  Scenario Outline: Successful call to chameleon service variants
    Given url baseUrl
    And path '<serviceName>/greetings'
    When method GET
    Then status 200
    * match response.serviceName == '<serviceName>'
    * match response.greeting == '<greeting>'

    Examples:
      | serviceName | greeting                       | 
      | chameleon   | This is the chameleon service! |
      | alpha       | This is the alpha service!     |
      | bravo       | This is the bravo service!     |

  Scenario: Call to a chameleon service that is not deployed
    Given url baseUrl
    And path 'zulu/greetings'
    When method GET
    Then status 404
