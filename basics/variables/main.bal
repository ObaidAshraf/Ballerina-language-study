import ballerina/io;

string name = "obaid";
int numb = 23;
float numF = 3.14;
boolean flag = true;
public function main() {
    io:println(numb, " from ", name);
    io:println(numF + 0.1125, " from ", name);
    io:println(flag, " from ", name);
    io:println(!flag, " from ", name);
    io:println("Division: ", (numF/numb));
}
