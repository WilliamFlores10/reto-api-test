@regresion
Feature: Reto Automatizacion API - Actualizar Usuarios Unhappypath

  Background:
    * url baseUrl
    * def body = read('classpath:resource/req/body/user.json')
    * def msg = read('classpath:helpers/error-response.json')
    * def actualizarSchema = read('classpath:resource/req/schema/schema-actualizar.json')

  @unhappypath
  Scenario: Actualizar la información de un usuario - NO OK
    Given path 'usuarios', 'createdId'
    * request body
    When method put
    Then status 400
    * print response
    And match response == actualizarSchema
    * match response.message == msg.usuarioExistente
