@regresion
Feature: Reto Automatizacion API - Orquestador

  Background:
    * def body = read('classpath:resource/req/body/user.json')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()

  Scenario: Flujo completo llamando a features externos

  # 1. CREATE: Llamamos al feature y capturamos su resultado
    * def createResult = call read('classpath:features/users/happypath/02-Registrar-usuario.feature') { email: '#(randomEmail)', username: '#(randomUsername)'}
    * def userId = createResult.createdId
    * print 'ID Creado con éxito:', userId

  # 2. READ: Usamos el ID directamente aquí o en otro call
    * def readResult = call read('classpath:features/users/happypath/01-Listar-usuarios.feature')

  # 3. UPDATE: Pasamos el ID como parámetro al feature de actualización
    * def updateResult = call read('classpath:features/users/happypath/04-Actualizar-usuario.feature') { createdId: '#(userId)' }

  # 4. DELETE
    * def deleteResult = call read('classpath:features/users/happypath/05-Eliminar-usuario.feature') { createdId: '#(userId)' }

