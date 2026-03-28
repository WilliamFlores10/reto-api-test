# Reto de Automatización QA - BackEnd

Este proyecto contiene las pruebas automatizadas para la API de ServeRest, desarrolladas con el framework Karate DSL. Karate combina la ejecución de pruebas API con BDD (Gherkin) de una manera sencilla y potente.

## Requisitos Previos
Antes de configurar el proyecto, asegúrate de tener instalado:

- Java JDK 11 o superior (Recomendado JDK 21).
- Maven (Gestionador de dependencias).
- IDE (IntelliJ IDEA recomendado, o VS Code) con el plugin de Cucumber/Gherkin para resaltar sintaxis.
- Configurar las variables de entorno del sistema JAVA_HOME y M2_HOME (para la versiones del Java y Maven seleccionadas)

## Configuracion del proyecto
Clonar del repositorio:

## Ejecucion de Pruebas
Puedes ejecutar las pruebas de diferentes maneras:
1. Ejecutar por Tags (recomendado)
   * Ejemplo: mvn test "-Dkarate.options=--tags @regresion"

## Reportes de Ejecución
Una vez finalizada la ejecución, Karate genera reportes detallados en formato HTML. Puedes encontrarlos en:
- Ruta: target/karate-reports/karate-summary.html