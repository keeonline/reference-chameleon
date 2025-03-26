Feature: Call the greetings endpoints of the chameleon based services

  Scenario Outline: Successful call to chameleon service variants
    Given url 'http://localhost:8080/<service>/greeting'
    When method GET
    Then status 200
    * match response.serviceName == '<serviceName>'
    * match response.greeting == '<greeting>'

    Examples:
      | serviceName | greeting                   | 
      | alpha       | This is the alpha service! |
      | bravo       | This is the bravo service! |

  Scenario: Call to a chameleon service that is not deployed
    Given url 'http://localhost:8080/zulu/greeting'
    When method GET
    Then status 404
