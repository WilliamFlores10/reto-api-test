@regresion
Feature: Reto Automatizacion API - Registrar Usuarios Unhappypath

  Background:
    * url baseUrl
    * def body = read('classpath:resource/req/body/user.json')
    * def msg = read('classpath:helpers/error-response.json')
    * def actualizarSchema = read('classpath:resource/req/schema/schema-actualizar.json')

  @unhappypath
  Scenario: Registrar un usuario con datos (correo) ya registrados - NO OK
    Given path 'usuarios'
    * set body.email = "newuser00@qa.com.pe"
    * request body
    When method post
    Then status 201
    * def userId = response._id

    Given path 'usuarios'
    * request body
    When method post
    Then status 400
    And match response == actualizarSchema
    * match response.message == msg.usuarioExistente

    Given path 'usuarios', userId
    When method delete
    Then status 200

