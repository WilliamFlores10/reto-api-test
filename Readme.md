# 🚀 Reto de Automatización QA - BackEnd

Este proyecto contiene las pruebas automatizadas para la API de ServeRest, desarrolladas con el framework Karate DSL. Karate combina la ejecución de pruebas API con BDD (Gherkin) de una manera sencilla y potente.

## 📋 Requisitos Previos
Antes de configurar el proyecto, asegúrate de tener instalado:

- Java JDK 11 o superior (Recomendado JDK 21).
- Maven (Recomendado Apache Maven 3.9.6) (Gestionador de dependencias).
- IDE (IntelliJ IDEA recomendado, o VS Code) con el plugin de Cucumber for Java/Gherkin para resaltar sintaxis.
- Configurar las variables de entorno del sistema JAVA_HOME y M2_HOME (para la versiones del Java y Maven seleccionadas)

## 🛠️ Configuracion del proyecto
Clonar del repositorio:
https://github.com/WilliamFlores10/reto-api-test.git

## 🧪 Ejecucion de Pruebas
Puedes ejecutar las pruebas de diferentes maneras:
1. Ejecutar por Tags (recomendado)
2. mvn clean test "-Dkarate.options=--tags @regresion" -Dkarate.parallel=1
3. mvn clean test "-Dkarate.options=--tags @happypath" -Dkarate.parallel=1
4. mvn clean test "-Dkarate.options=--tags @unhappypath" -Dkarate.parallel=1

## 📊 Reportes de Ejecución
Una vez finalizada la ejecución, Karate genera reportes detallados en formato HTML. Puedes encontrarlos en:
- Ruta: target/karate-reports/karate-summary.html

## 🛠️ Se integro workflows para Github Actions
Puedes ejecutar desde Github Actions seleccionando los tags designados.
