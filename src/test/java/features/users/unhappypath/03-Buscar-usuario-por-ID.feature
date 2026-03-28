@regresion
Feature: Reto Automatizacion API - Buscar Usuarios por ID Unhappypath

  Background:
    * url baseUrl
    * def msg = read('classpath:helpers/error-response.json')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomId = dataGenerator.getRandomId()
    * def actualizarSchema = read('classpath:resource/req/schema/schema-actualizar.json')

  @unhappypath
  Scenario: Buscar un usuario específico por un ID erroneo - NO OK
    Given path 'usuarios', randomId
    When method get
    Then status 400
    * print response
    And match response == actualizarSchema
    * match response.message == msg.usuarioInexistente
