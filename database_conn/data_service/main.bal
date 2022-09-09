import ballerina/time;
// import ballerinax/mysql.driver as _;
import ballerinax/mysql;
import ballerina/sql;
import ballerina/io;

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

isolated function getTotalNumberEmployees() returns int|error {
    sql:ExecutionResult result = check dbClient->execute(`SELECT COUNT(*) FROM Employees`);
    io:println("result: ", result);
    return 0;
}