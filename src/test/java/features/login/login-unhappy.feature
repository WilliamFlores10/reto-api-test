
Feature: Reto Automatizacion API - Login Unhappys

  Background:
    * url baseUrl
    * def body = read('classpath:resource/req/body/login-token.json')
    * def msg = read('classpath:helpers/error-response.json')

  @unhappypath
  Scenario Outline: Realizar Login para generar token email incorrecto - NO OK
    Given path 'login'
    * set body.email = "<email>"
    * request body
    When method post
    Then status 400
    * match response.email == msg.emailInvalido
    Examples:
      | email            |
      | xxxxxxx@qa.com.p |
      | xxxxxxx@qa.c     |
      | xxxxxxx@qa       |
      | xxxxxxx@         |
      | xxxxxxx          |

  @unhappypath
  Scenario: Realizar Login para generar token email en blanco - NO OK
    Given path 'login'
    * set body.email = ""
    * request body
    When method post
    Then status 400
    * match response.email == msg.emailVacio

  @unhappypath
  Scenario: Realizar Login para generar token email null - NO OK
    Given path 'login'
    * set body.email = null
    * request body
    When method post
    Then status 400
    * match response.email == msg.emailNull

  @unhappypath
  Scenario Outline: Realizar Login para generar token contraseña incorrecto - NO OK
    Given path 'login'
    * set body.password = "<contraseña>"
    * request body
    When method post
    Then status 401
    * match response.message == msg.passwordInvalido
    Examples:
      | contraseña |
      | tester     |

  @unhappypath
  Scenario: Realizar Login para generar token contraseña en blanco - NO OK
    Given path 'login'
    * set body.password = ""
    * request body
    When method post
    Then status 400
    * match response.password == msg.passwordVacio

  @unhappypath
  Scenario: Realizar Login para generar token contraseña null - NO OK
    Given path 'login'
    * set body.password = null
    * request body
    When method post
    Then status 400
    * match response.password == msg.passwordNull

  @unhappypath
  Scenario: Realizar Login para generar token body vacio - NO OK
    Given path 'login'
    * request {}
    When method post
    Then status 400
    * match response.email == msg.bodyVacioEmail
    * match response.password == msg.bodyVacioPassword