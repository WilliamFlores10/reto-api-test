function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; //Entorno por defectp
  }

  // Configuracion de URLs y variables globales
  var config = {
    env: env,
    baseUrl: 'https://serverest.dev',
    defaultHeaders: { 'Content-Type': 'application/json', 'Accept': 'application/json' }
  }
  // Ajustar variables segun ambiente
  if (env == 'dev') {
    // customize
    config.baseUrl = 'https://serverest.dev';
  } else if (env == 'qa') {
    // customize
    config.baseUrl = 'https://serverest.dev';

  }
  return config;
}