function fn() {
    var config = {
        baseUrl: karate.properties['baseurl'] || 'http://localhost/'
    }
    return config;
}