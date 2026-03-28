@regresion @ignore
Feature: Reto Automatizacion API - Users

  Background:
    * url baseUrl
    * def msg = read('classpath:helpers/error-response.json')
    * def eliminarSchema = read('classpath:resource/req/schema/schema-eliminar.json')

  @happypath
  Scenario: Eliminar la información de un usuario existente
    Given path 'usuarios', createdId
    When method delete
    Then status 200
    And match response == eliminarSchema
    * print response
    * match response.message == msg.usuarioEliminado

  @happypath
  Scenario: Eliminar ningun registro de un usuario
    Given path 'usuarios', 'createdId'
    When method delete
    Then status 200
    And match response == eliminarSchema
    * print response
    * match response.message == msg.usuarioNoEliminado

