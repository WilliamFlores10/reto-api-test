@regresion
Feature: Reto Automatizacion API - Actualizar Usuarios

  Background:
    #Llamar al archivo Body, Msg Errores esperados y Schema desde Json
    * def body = read('classpath:resource/req/body/user.json')
    * def msg = read('classpath:helpers/error-response.json')
    * def actualizarSchema = read('classpath:resource/req/schema/schema-actualizar.json')
    #Llamar a DataGenerator funcion Datafaker para generar datos aleatorios
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomId = dataGenerator.getRandomId()
    * def randomEmail = dataGenerator.getRandomEmail()
    #llamar a DataStore para la funcion de envio de ID
    * def DataStore = Java.type('helpers.DataStore')
    * def idDesdeJava = DataStore.getSharedId()
    * def idDesdeJava2 = DataStore.getSharedId2()
    * print 'ID recuperado de Java:', idDesdeJava , idDesdeJava2
    * def emailDesdeJava = DataStore.getSharedEmail()
    # Si es null, seteamos un valor por defecto
    * if (emailDesdeJava == null) karate.set('emailFinal', 'wflores00@qa.com.pe')
    # Si NO es null, usamos el de Java
    * if (emailDesdeJava != null) karate.set('emailFinal', emailDesdeJava)

  @happypath
  Scenario: Actualizar la información de un usuario existente
    Given url baseUrl + '/usuarios/' + idDesdeJava
    * set body.email = randomEmail
    * request body
    When method put
    Then status 200
    And match response == actualizarSchema
    * print response
    * match response.message == msg.usuarioActualizado
    * def emailGenerado = randomEmail
    * DataStore.setSharedEmail(emailGenerado)
    * set body.email = emailGenerado

  @happypath
  Scenario: Actualizar la información de un usuario no existente
    Given url baseUrl + '/usuarios/' + randomId
    * set body.email = randomEmail
    * request body
    When method put
    Then status 201
    * print response

  @unhappypath
  Scenario: Actualizar la información de un usuario - NO OK
    Given url baseUrl + '/usuarios/' +  "9999999999999999"
    * set body.email = emailFinal
    * request body
    When method put
    Then status 400
    * print response
    And match response == actualizarSchema
    * match response.message == msg.usuarioExistente

     #eliminar la data generada
    Given url baseUrl + '/usuarios/' + idDesdeJava2
    When method delete
    Then status 200



