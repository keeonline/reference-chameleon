Feature: Call the greetings endpoints of the chameleon service

  Scenario: Successful call to chameleon service
    Given url 'http://localhost:18080'
    And path 'chameleon/greetings'
    When method GET
    Then status 200
    * match response.serviceName == 'chameleon'
    * match response.greeting == 'This is the chameleon service!'

  Scenario: Call to service endpoints that has no request handler
    Given url 'http://localhost:18080'
    And path 'chameleon/like'
    When method GET
    Then status 404
    * match response.status == 404
    * match response.error == 'Not Found'
    * match response.path == '/chameleon/like'

  Scenario: Call to a chameleon varisnt service that is not deployed
    Given url 'http://localhost:18080'
    And path 'zulu/greetings'
    When method GET
    Then status 404
