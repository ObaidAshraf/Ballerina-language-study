import ballerina/io;

function getRunningSum(int[] arr) returns int {
    int res = 0;
    foreach var data in arr {
        res += data;
    }

    return res;
}

function showTillNegative(int[] arr) returns () {
    return ();
}

public function main() {
    int[] arr = [1, 2, 3];
    int sum = 0;

    io:println("Array length: ", arr.length());
    arr[3] = 4;
    arr[4] = -1;

    sum = getRunningSum(arr);
    io:println("sum: ", sum);

}
