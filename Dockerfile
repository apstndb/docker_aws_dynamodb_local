#
# Dockerfile for DynamoDB Local
#
# https://aws.amazon.com/blogs/aws/dynamodb-local-for-desktop-development/
#
FROM openjdk:7-jre
MAINTAINER Dean Giberson <dean@deangiberson.com>
ARG VERSION=2017-02-16

# Create working space
WORKDIR /var/dynamodb_wd

# Default port for DynamoDB Local
EXPOSE 8000

# Get the package from Amazon
RUN curl https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_${VERSION}.tar.gz | tar xz

# Default command for image
ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar", "-dbPath", "/var/dynamodb_local"]
CMD ["-port", "8000"]

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME ["/var/dynamodb_local", "/var/dynamodb_wd"]
