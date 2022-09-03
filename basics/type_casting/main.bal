import ballerina/io;

// Convert integer to float
function to_float(int n) returns float {
    return <float>n;
}

// Convert float to integer
function to_int(float n) returns int {
    return <int>n;
}

public function main() {
    int n1 = 55;
    float n2 = 3.14;

    io:println(to_float(n1));
    io:println(to_int(n2));

}
