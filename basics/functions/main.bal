import ballerina/io;
import ballerina/lang.'float;

function roundFn(float n1, int n2) returns float {
    return float:round(n1/n2);
    
}

// Function to return Nil
function returnNil(float f) returns () {
    return ();
}

public function main() {

    int n1 = 23;
    float n2 = 10.0;
    int? n3 = ();

    float res = roundFn(n2, n1);
    io:println("res: ", res);

    n3 = returnNil(res);
    io:println("n3: ", n3 == () ? "Nil" : n3);
}
