
import ballerina/http;
import tests3.foo;
import ballerina/io;

service / on new http:Listener(9090) {
    
    isolated resource function get greeting() {
        io:println("Greetings start!!!");
         error? createObjectResponse = foo:create();
         io:println("Greetings end!!!");
    }
}



