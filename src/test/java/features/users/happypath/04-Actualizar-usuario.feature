@regresion @ignore
Feature: Reto Automatizacion API - Actualizar Usuarios

  Background:
    * url baseUrl
    * def body = read('classpath:resource/req/body/user.json')
    * def msg = read('classpath:helpers/error-response.json')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomId = dataGenerator.getRandomId()
    * def randomEmail = dataGenerator.getRandomEmail()
    * def actualizarSchema = read('classpath:resource/req/schema/schema-actualizar.json')

  @happypath
  Scenario: Actualizar la información de un usuario existente
    Given path 'usuarios', createdId
    * set body.email = "wflores@dev2.com.pe"
    * request body
    When method put
    Then status 200
    And match response == actualizarSchema
    * print response
    * match response.message == msg.usuarioActualizado

  @happypath
  Scenario: Actualizar la información de un usuario no existente
    Given path 'usuarios', randomId
    * set body.email = randomEmail
    * request body
    When method put
    Then status 201
    * print response


