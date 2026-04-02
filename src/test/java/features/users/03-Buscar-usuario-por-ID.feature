@regresion
Feature: Reto Automatizacion API - Buscar Usuarios por ID

  Background:
    #llamar schema y msg desde json
    * def msg = read('classpath:helpers/error-response.json')
    * def actualizarSchema = read('classpath:resource/req/schema/schema-actualizar.json')
    #llamar a DataStore para la funcion de envio de ID
    * def DataStore = Java.type('helpers.DataStore')
    * def idDesdeJava = DataStore.getSharedId()
    * print 'ID recuperado de Java:', idDesdeJava
    #Llamar a DataGenerator funcion Datafaker para generar datos aleatorios
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomId = dataGenerator.getRandomId()

  @happypath
  Scenario: Buscar un usuario específico por su ID
    Given url baseUrl + '/usuarios/' + idDesdeJava
    When method get
    Then status 200
    * print response
    And match response._id == idDesdeJava

  @unhappypath
  Scenario: Buscar un usuario específico por un ID erroneo - NO OK
    Given url baseUrl + '/usuarios/' + randomId
    When method get
    Then status 400
    * print response
    And match response == actualizarSchema
    * match response.message == msg.usuarioInexistente
