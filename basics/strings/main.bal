import ballerina/io;

public function main() {
    string str = "hello";
    io:println(str);

    str += " world";
    io:println(str);

    str = str.toUpperAscii();
    io:println(str);
    io:println("str length: ", str.length());

}
