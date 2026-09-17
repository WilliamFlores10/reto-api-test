function fn() {
  var env = karate.env;
  karate.log('karate.env entorno:', env);
  if (!env) {
    env = 'dev'; //Entorno por defectp
  }

  // Configuracion de URLs y variables globales
  var config = {
    env: env,
    baseUrl: 'https://serverest.dev',
    defaultHeaders: karate.read('classpath:resource/req/headers/headers.json')
  }
  // Ajustar variables segun ambiente ()
  if (env == 'dev') {
    config.baseUrl = 'https://serverest.dev';
  } else if (env == 'qa') {
    config.baseUrl = 'https://serverest.dev';
  } else if (env == 'prod') {
    config.baseUrl = 'https://serverest.dev';
  }

  // Llamado al token cada 4 minutos
  karate.configure('callSingleCache', { minutes: 4 });
  var loginResult = karate.callSingle('classpath:features/login/login-happypath.feature', config);
  config.authToken = loginResult.token;
  config.defaultHeaders['Authorization'] = 'Bearer ' + loginResult.token;

  return config;
}