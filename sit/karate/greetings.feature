Feature: Call the greetings endpoints of the chameleon based services

    # Version 1 API tests

  Scenario: using karate-config
    * print baseUrl
 
  # Scenario Outline: Successful call to chameleon service variants
  #   Given url baseUrl
  #   And path '<serviceName>/v1/greetings'
  #   And retry until responseStatus == 200
  #   When method GET
  #   Then status 200
  #   * match response.serviceName == '<serviceName>'
  #   * match response.message == '<message>'

  #   Examples:
  #     | serviceName | message                    | 
  #     | alpha       | This is the alpha service! |
  #     | bravo       | This is the bravo service! |

  # Scenario Outline: Call to service endpoints that have no request handlers
  #   Given url baseUrl
  #   And path '<path>'
  #   When method GET
  #   Then status 404
  #   * match response.status == 404
  #   * match response.error == 'Not Found'
  #   * match response.path == '/<path>'

  #   Examples:
  #     | path           | 
  #     | alpha/v1/numerics |
  #     | bravo/v2/bravo    |

  # Scenario: Call to a service that is not deployed
  #   Given url baseUrl
  #   And path 'zulu/v1/greetings'
  #   When method GET
  #   Then status 503
  #   * match response == 'The service you have requested is unavailable'

  #   # Version 2 API tests

  # Scenario: using karate-config
  #   * print baseUrl
 
  # Scenario Outline: Successful call to chameleon service variants
  #   Given url baseUrl
  #   And path '<serviceName>/v2/greetings'
  #   And retry until responseStatus == 200
  #   When method GET
  #   Then status 200
  #   * match response.serviceName == '<serviceName>'
  #   * match response.greeting == '<greeting>'

  #   Examples:
  #     | serviceName | greeting                   | 
  #     | alpha       | This is the alpha service! |
  #     | bravo       | This is the bravo service! |

  # Scenario Outline: Call to service endpoints that have no request handlers
  #   Given url baseUrl
  #   And path '<path>'
  #   When method GET
  #   Then status 404
  #   * match response.status == 404
  #   * match response.error == 'Not Found'
  #   * match response.path == '/<path>'

  #   Examples:
  #     | path           | 
  #     | alpha/v2/numerics |
  #     | bravo/v2/bravo    |

  # Scenario: Call to a service that is not deployed
  #   Given url baseUrl
  #   And path 'zulu/v2/greetings'
  #   When method GET
  #   Then status 503
  #   * match response == 'The service you have requested is unavailable'
