function() {
    var env = karate.env; // Obtiene el entorno actual desde el sistema o desde Gradle
    if (!env) {
        env = 'dev'; // Valor predeterminado si no se pasa el entorno
    }

    var config = {
        urlBase: 'https://petstore.swagger.io/v2', // URL base por defecto para desarrollo
        usersPath: '/pet'
    };

    if (env === 'qa') {
        config.urlBase = 'https://petstore.swagger.io/v2';
    } else if (env === 'prod') {
        config.urlBase = 'https://prod-petstore.swagger.io/v3';
        karate.fail('Pruebas no permitidas en el entorno de producción: ' + env);
    }

    karate.log('Entorno: ' + env + ' URL Base: ' + config.urlBase); // Log para verificar
    return config;
}
