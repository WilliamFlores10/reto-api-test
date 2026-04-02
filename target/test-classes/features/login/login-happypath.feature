
Feature: Reto Automatizacion API - Login

  Background:
    * url baseUrl
    * def body = read('classpath:resource/req/body/login-token.json')

  @login
  Scenario: Realizar Login para generar token - OK
    Given path 'login'
    * request body
    When method post
    Then status 200
    And match response == read('classpath:resource/req/schema/schema-login.json')
    * def authToken = response.authorization

