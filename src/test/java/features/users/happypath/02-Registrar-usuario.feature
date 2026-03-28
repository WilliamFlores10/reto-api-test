@regresion @ignore
Feature: Reto Automatizacion API - Registrar Usuarios

  Background:
    * url baseUrl
    * def body = read('classpath:resource/req/body/user.json')
    * def registrarSchema = read('classpath:resource/req/schema/schema-registrar.json')

  @happypath
  Scenario: Registrar un nuevo usuario con datos válidos
    Given path 'usuarios'
    * set body.email = email
    * set body.nome = username
    * request body
    When method post
    Then status 201
    * print response
    And match response == registrarSchema
    * def createdId = response._id
    * print response.message , createdId


