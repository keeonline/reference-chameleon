Feature: Call the actuator endpoints of the chameleon service

Scenario: Successful call to actuator 'health' endpoint
    Given url 'http://localhost:9080'
    And path 'chameleon/actuator/health'
    When method GET
    Then status 200
    * match response.status == 'UP'
    
Scenario: Successful call to actuator 'info' endpoint
    Given url 'http://localhost:9080'
    And path 'chameleon/actuator/info'
    When method GET
    Then status 200
    * match response.build.artifact == 'chameleon'
