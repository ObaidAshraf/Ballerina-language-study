import ballerina/io;

string name = "obaid";
int numb = 23;
float numF = 3.14;
boolean flag = true;

// Declare a Nil datatype. It is similar to NULL in C.
int? x = ();

public function main() {
    io:println(numb, " from ", name);
    io:println(numF + 0.1125, " from ", name);
    io:println(flag, " from ", name);
    io:println(!flag, " from ", name);
    io:println("Division: ", (numF/numb));

    io:println("x value is ", x != () ? x : "Nil");
    x = 32;
    io:println("x value is ", x != () ? x : "Nil");

    // Using Elvis operator
    x = ();
    io:println("x value is ", x ?: x);
    x = 65;
    io:println("x value is ", x ?: x);

}
