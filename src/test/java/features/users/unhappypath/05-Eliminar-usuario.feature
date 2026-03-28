@regresion
Feature: Reto Automatizacion API - Eliminar Usuarios Unhappypath

  Background:
    * url baseUrl
    * def body = read('classpath:resource/req/body/carrito.json')
    * def login = call read('classpath:features/login/login-happypath.feature')
    * def token = login.authToken
    * def user = call read('classpath:features/users/happypath/01-Listar-usuarios.feature')
    * def matches = get user.response.usuarios[?(@.email == 'wflores@qa.com.pe')]
    * def userId = matches[0]._id
    * def msg = read('classpath:helpers/error-response.json')
    * def eliminarSchema = read('classpath:resource/req/schema/schema-eliminar-carrito.json')

  @unhappypath
  Scenario: Eliminar usuario con Carrito - NO OK
    Given path 'carrinhos','cancelar-compra'
    And header Authorization = token
    When method delete
    Then status 200

    Given path 'produtos'
    When method get
    Then status 200
    * def id = response.produtos[0]._id
    * print id

    Given path 'carrinhos'
    And header Authorization = token
    * set body.produtos[0].idProduto = id
    * print body
    * request body
    When method post
    Then status 201
    * def carritoID = response._id

    Given path 'usuarios', userId
    When method delete
    Then status 400
    And match response == eliminarSchema
    * print response
    * match response.message == msg.usuarioConCarrito
    * match response.idCarrinho == carritoID
