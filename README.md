# Ballerina api2pdf connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-api2pdf/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-api2pdf/actions/workflows/ci.yml)
[![Trivy](https://github.com/ballerina-platform/module-ballerinax-api2pdf/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-api2pdf/actions/workflows/trivy-scan.yml)
[![GraalVM Check](https://github.com/ballerina-platform/module-ballerinax-api2pdf/actions/workflows/build-with-bal-test-graalvm.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-api2pdf/actions/workflows/build-with-bal-test-graalvm.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-api2pdf.svg)](https://github.com/ballerina-platform/module-ballerinax-api2pdf/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/api2pdf.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%api2pdf)

## Overview
The Ballerina API2PDF connector provides capabilities to interact with the [API2PDF REST API v2](https://www.api2pdf.com). API2PDF is a powerful REST API for generating PDF and Office documents from HTML, URLs, Microsoft Office Documents, Email files, and images. This connector supports all major features including PDF generation, document conversion, merging PDFs, adding passwords, and creating image thumbnails.

## Setup guide

1. Create an account at [portal.api2pdf.com](https://portal.api2pdf.com/register) to obtain your API key.

2. Add the API2PDF dependency to your Ballerina project's `Ballerina.toml` file:
    ```toml
    [dependencies]
    "ballerinax/api2pdf" = "*"
    ```

3. Import the API2PDF module in your Ballerina program:
    ```ballerina
    import ballerinax/api2pdf;
    ```

## Quickstart

```ballerina
import ballerina/io;
import ballerinax/api2pdf;

configurable string apiKey = ?;

public function main() returns error? {
    api2pdf:Client api2pdfClient = check new({
        auth: {
            apiKey: apiKey
        }
    });

    // Convert HTML to PDF using Chrome
    api2pdf:HtmlToPdfRequest payload = {
        html: "<h1>Hello World</h1>",
        inline: true,
        fileName: "example.pdf",
        options: {
            margin: {
                top: "2in",
                right: "1in",
                bottom: "2in",
                left: "1in"
            }
        }
    };
    
    api2pdf:ApiResponse response = check api2pdfClient->chromeHtmlToPdf(payload);
    io:println("PDF URL: ", response.url);
}
```

## Examples

The `api2pdf` connector provides examples for converting HTML content to PDF format. This includes features like:

- Custom page margins and dimensions
- Headers and footers
- Custom CSS styling
- Page breaks and orientations
- Document metadata

Find complete examples in the [examples](https://github.com/ballerina-platform/module-ballerinax-api2pdf/tree/main/examples/) directory.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`api2pdf` package](https://central.ballerina.io/ballerinax/api2pdf/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
