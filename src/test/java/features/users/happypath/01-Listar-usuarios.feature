@regresion @ignore
Feature: Reto Automatizacion API - Listar Usuarios

  Background:
    * url baseUrl

  @happypath
  Scenario: Obtener una lista de todos los usuarios
    Given path 'usuarios'
    When method get
    Then status 200
    * print response
