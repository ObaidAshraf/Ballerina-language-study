import ballerina/http;

service /employees on new http:Listener(8080) {
    isolated resource function get .() returns int|error? {
        return getTotalNumberEmployees();
    }

    isolated resource function post.(@http:Payload Employee emp) returns int|error? {
        return addEmployee(emp);
    }
}