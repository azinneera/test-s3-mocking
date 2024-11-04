
import ballerinax/aws.s3;

public final s3:Client amazonS3Client = check intializeClient();

public function create() returns error? {
    return createInternal();
}

function createInternal() returns error? {
    byte[] fileContent = [];
    return amazonS3Client->createObject(
                "bucketName",
                "uniqueFileName",
                fileContent
            );
}
function intializeClient() returns s3:Client|error {
    s3:ConnectionConfig amazonS3Config = {
    accessKeyId: "accessKeyId",
    secretAccessKey: "secretAccessKey",
    region: "region"
};

    return check new(amazonS3Config);
}
