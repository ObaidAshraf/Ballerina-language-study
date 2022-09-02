import ballerina/io;
import ballerina/lang.'float;

function roundFn(float n1, int n2) returns float {
    return float:round(n1/n2);
    
}

public function main() {

    int n1 = 23;
    float n2 = 10.0;

    float res = roundFn(n2, n1);
    io:println("res: ", res);
}
