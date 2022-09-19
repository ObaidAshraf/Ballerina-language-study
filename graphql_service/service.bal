import ballerina/time;
import ballerinax/mysql;
// import ballerina/sql;

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

public distinct service class EmployeeData {

    private final readonly & Employee employee;

    function init(Employee employee) {
        self.employee = employee.cloneReadOnly();
    }

    resource function get first_name() returns string|error {
        return self.employee.first_name;
    }


}
