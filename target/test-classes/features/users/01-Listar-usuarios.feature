@regresion
Feature: Reto Automatizacion API - Listar Usuarios

  @happypath
  Scenario: Obtener una lista de todos los usuarios
    Given url baseUrl + '/usuarios/'
    When method get
    Then status 200
    * print response
