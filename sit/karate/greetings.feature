Feature: Call the greetings endpoints for chameleon based services

Scenario: Show the baseUrl value
    * print baseUrl

Scenario Outline: Successful call to chameleon service variants
    Given url baseUrl
    And path '<serviceName>/v1/greetings'
    And retry until responseStatus == 200
    When method GET
    Then status 200
    * match response.serviceName == '<serviceName>'
    * match response.message == '<message>'

    Examples:
        | serviceName | message |
        | alpha       | This is the alpha service! |
        | bravo       | This is the bravo service! |

Scenario Outline: Call to service endpoints that have no request handlers
    Given url baseUrl
    And path '<path>'
    And retry until responseStatus == 404
    When method GET
    Then status 404
    * match response.error == 'Not Found'
    * match karate.toString(response.path) contains '/<path>'

    Examples:
        | path |
        | alpha/v1/numerics |
        | bravo/v1/bravo |

Scenario: Call to a service that is not configured
    Given url baseUrl
    And path 'zulu/v1/greetings'
    When method GET
    Then status 503
    * match response == 'The service you have requested is unavailable'    