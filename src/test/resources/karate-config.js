function() {
    var env = karate.env; // Entorno actual desde el sistema o desde Gradle
    if (!env) {
        env = 'dev'; // Valor predeterminado si no se pasa el entorno
    }

    var config = {
        urlBase: 'https://petstore.swagger.io/v2', // URL base por defecto para desarrollo
        usersPath: '/pet'
    };

    if (env === 'qa') {
        config.urlBase = 'https://petstore.swagger.io/v2'; //apunta a QA para el ejemplo igual que desarrollo
    } else if (env === 'prod') {
        config.urlBase = 'https://prod-petstore.swagger.io/v3'; // apunta a producción para el ejemplo pero esta debe fallar ya que la url es hipotética
        karate.fail('Pruebas no permitidas en el entorno de producción: ' + env);
    }

    karate.log('Entorno: ' + env + ' URL Base: ' + config.urlBase); // Log para verificar
    return config;
}
