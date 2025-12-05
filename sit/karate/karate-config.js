function fn() {
    var config = {
        baseUrl: karate.properties['baseurl'] || 'http://localhost',
        appEnv: karate.properties['appenv'] || 'default'
    }
    karate.configure('retry', { count: 10, interval: 20000 });
    return config;
}
