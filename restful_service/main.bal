import ballerina/http;
// import ballerina/io;

// https://api.open-meteo.com/v1/forecast?latitude=51.5002&longitude=-0.1262&current_weather=true

service / on new http:Listener(8080) {

    resource function get greetme/[string name]() returns json|error {
        return "Hello" + " " + name;
    }

    resource function get weather() returns json|error {
        http:Client clientEP = check new ("https://api.open-meteo.com/v1");
        json payload = <json> check clientEP->get("/forecast?latitude=51.5002&longitude=-0.1262&current_weather=true");

        json currentWeather = <json> check payload.current_weather;

        return currentWeather;
    }

}