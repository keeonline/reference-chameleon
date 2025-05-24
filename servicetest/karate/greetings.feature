Feature: Call the greetings endpoints of the chameleon service

# Version 1 API tests

  Scenario: Successful call to chameleon service
    Given url 'http://localhost:8080'
    And path 'chameleon/v1/greetings'
    When method GET
    Then status 200
    * match response.serviceName == 'chameleon'
    * match response.message == 'This is the chameleon service!'


  Scenario: Call to service endpoints that has no request handler
    Given url 'http://localhost:8080'
    And path 'chameleon/v1/like'
    When method GET
    Then status 404
    * match response.status == 404
    * match response.error == 'Not Found'
    * match response.path == '/chameleon/v1/like'

  Scenario: Call to a chameleon variant service that is not deployed
    Given url 'http://localhost:8080'
    And path 'zulu/v1/greetings'
    When method GET
    Then status 404

# Version 2 API tests

  Scenario: Successful call to chameleon service
    Given url 'http://localhost:8080'
    And path 'chameleon/v2/greetings'
    When method GET
    Then status 200
    * match response.serviceName == 'chameleon'
    * match response.greeting == 'This is the chameleon service!'

    
  Scenario: Call to service endpoints that has no request handler
    Given url 'http://localhost:8080'
    And path 'chameleon/v2/like'
    When method GET
    Then status 404
    * match response.status == 404
    * match response.error == 'Not Found'
    * match response.path == '/chameleon/v2/like'

  Scenario: Call to a chameleon variant service that is not deployed
    Given url 'http://localhost:8080'
    And path 'zulu/v2/greetings'
    When method GET
    Then status 404
