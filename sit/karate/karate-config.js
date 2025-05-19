function fn() {
    var config = {
        baseUrl: karate.properties['baseurl'] || 'http://localhost'
    }
    // karate.configure('retry', { count: 4, interval: 5000 });
    return config;
}