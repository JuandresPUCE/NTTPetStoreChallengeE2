function() {
    var env = karate.env; // Obtiene el entorno actual

    if (!env) {
        env = 'dev'; // Valor predeterminado si karate.env no está definido
    }

    var config = {
        urlBase: 'https://petstore.swagger.io/v2',
        usersPath: '/pet'
    };

    if (env === 'qa') {
        config.urlBase = 'https://qa-petstore.swagger.io/v2';
    } else if (env === 'prod') {
        config.urlBase = 'https://prod-petstore.swagger.io/v3';
    }

    return config;
}
