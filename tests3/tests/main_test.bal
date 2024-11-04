import ballerina/io;
import ballerina/test;
import ballerinax/aws.s3;
import tests3.foo;
import ballerina/http;


s3:Client mockCl = foo:amazonS3Client;
http:Client clientEndpoint = check new ("http://localhost:9090/");

@test:Config {}
function testFunction() returns error? {
    io:println("I'm in test function!");
    test:prepare(mockCl).when("createObject").doNothing();
    http:Response result = check clientEndpoint->/greeting;
    
}

@test:Mock { 
    moduleName: "tests3.foo", 
    functionName: "intializeClient" 
    }
function getMockClient() returns s3:Client|error {
    return test:mock(s3:Client);
}
