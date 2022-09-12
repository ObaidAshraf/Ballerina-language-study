import ballerina/time;
import ballerinax/mysql;
import ballerina/sql;
// import ballerina/io;

public type Employee record {|
    int employee_id?;
    string first_name;
    string last_name;
    string email;
    string phone;
    time:Date hire_date;
    int? manager_id;
    string job_title;
|};

configurable string USER = ?;
configurable string PASSWORD = ?;
configurable string HOST = ?;
configurable int PORT = ?;
configurable string DATABASE = ?;

final mysql:Client dbClient = check new(host=HOST, user=USER, password=PASSWORD, port=PORT, database=DATABASE);

isolated function getTotalNumberEmployees() returns int|error? {
    int result = check dbClient->queryRow(`SELECT COUNT(*) as empCount FROM Employees`);
    return result;
}

isolated function addEmployee(Employee emp) returns int|error? {
    sql:ExecutionResult result = check dbClient->execute(`INSERT INTO employees (employee_id, first_name, 
        last_name, email, phone, hire_date, manager_id, job_title) VALUES (NULL, ${emp.first_name}, 
        ${emp.last_name}, ${emp.email}, ${emp.phone}, ${emp.hire_date}, ${emp.manager_id}, ${emp.job_title})`);

    int|string? lastInsertedId = result.lastInsertId;
    if (lastInsertedId is int) {
        return lastInsertedId;
    }

    return error("Failed to add Employee");
}