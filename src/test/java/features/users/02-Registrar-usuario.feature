@regresion
Feature: Reto Automatizacion API - Registrar Usuarios

  Background:
    #Llamar al archivo Body, Msg Errores esperados y Schema desde Json
    * def body = read('classpath:resource/req/body/user.json')
    * def msg = read('classpath:helpers/error-response.json')
    * def registrarSchema = read('classpath:resource/req/schema/schema-registrar.json')
    * def actualizarSchema = read('classpath:resource/req/schema/schema-actualizar.json')

  @happypath
  Scenario: Registrar un nuevo usuario con datos válidos
    Given url baseUrl + '/usuarios'
    * request body
    When method post
    Then status 201
    * print response
    And match response == registrarSchema
    # Guardamos el ID en la clase Java
    * def DataStore = Java.type('helpers.DataStore')
    * DataStore.setSharedId(response._id)
    * print 'ID guardado en memoria estática:', response._id

  @unhappypath
  Scenario: Registrar un usuario con datos (correo) ya registrados - NO OK
    #requisito para esta prueba genera la data
    Given url baseUrl + '/usuarios'
    * set body.email = "wflores00@qa.com.pe"
    * request body
    When method post
    Then status 201
    # Guardamos el ID en la clase Java
    * def DataStore = Java.type('helpers.DataStore')
    * DataStore.setSharedId2(response._id)
    * print 'ID guardado en memoria estática:', response._id

    Given url baseUrl + '/usuarios'
    * set body.email = "wflores00@qa.com.pe"
    * request body
    When method post
    Then status 400
    And match response == actualizarSchema
    * match response.message == msg.usuarioExistente
