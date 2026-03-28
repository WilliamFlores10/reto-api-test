@regresion @ignore
Feature: Reto Automatizacion API - Buscar Usuariso por ID

  Background:
    * url baseUrl

  @happypath
  Scenario: Buscar un usuario específico por su ID
    Given path 'usuarios',id
    When method get
    Then status 200
    * print response
    * def id = response._id
    * print response.message , id
