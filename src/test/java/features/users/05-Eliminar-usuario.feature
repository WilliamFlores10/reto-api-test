@regresion
Feature: Reto Automatizacion API - Users

  Background:
    #Llamar al archivo Body, Msg Errores esperados y Schema desde Json
    * def msg = read('classpath:helpers/error-response.json')
    * def eliminarSchema = read('classpath:resource/req/schema/schema-eliminar.json')
  #llamar a DataStore para la funcion de envio de ID
    * def DataStore = Java.type('helpers.DataStore')
    * def idDesdeJava = DataStore.getSharedId()
    * print 'ID recuperado de Java:', idDesdeJava

  @happypath
  Scenario: Eliminar la información de un usuario existente
    Given url baseUrl + '/usuarios/' + idDesdeJava
    When method delete
    Then status 200
    And match response == eliminarSchema
    * print response
    * match response.message == msg.usuarioEliminado

  @happypath
  Scenario: Eliminar ningun registro de un usuario
    Given url baseUrl + '/usuarios/' + idDesdeJava
    When method delete
    Then status 200
    And match response == eliminarSchema
    * print response
    * match response.message == msg.usuarioNoEliminado

