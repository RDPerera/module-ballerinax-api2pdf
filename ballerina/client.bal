// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/http;

# 
# # Introduction
#   
# [Api2Pdf.com](https://www.api2pdf.com) is a powerful REST API for instantly generating PDF and Office documents from HTML, URLs, Microsoft Office Documents (Word, Excel, PPT), Email files, and images. You can generate image preview or thumbnail of a PDF, office document, or email file. The API also supports merge / concatenation of two or more PDFs, setting passwords on PDFs, and adding bookmarks to PDFs. Api2Pdf is a wrapper for popular libraries such as wkhtmltopdf, Headless Chrome, PdfSharp, and LibreOffice.
# 
# # SDKs & Client Libraries
#   
# - Python [https://github.com/Api2Pdf/api2pdf.python](https://github.com/Api2Pdf/api2pdf.python)
# 
# - Node [https://github.com/Api2Pdf/api2pdf.node](https://github.com/Api2Pdf/api2pdf.node)
#   
# - PHP [https://github.com/Api2Pdf/api2pdf.php](https://github.com/Api2Pdf/api2pdf.php)
# 
# - C# [https://github.com/Api2Pdf/api2pdf.dotnet](https://github.com/Api2Pdf/api2pdf.dotnet)
# 
# - Java [https://github.com/Api2Pdf/api2pdf.java](https://github.com/Api2Pdf/api2pdf.java)
# 
# # Authorization
#   
# Create an account at [portal.api2pdf.com](https://portal.api2pdf.com/register) to get an API key.
# 
# **Two ways to authorize your API calls**
# 
# - Query string parameter: apikey=YOUR-API-KEY
# 
# - Request header: 
# 
# ```
# Authorization: YOUR-API-KEY
# ```
# 
# # Quickstart
# 
# If you are looking for just a quick call to grab PDFs of a URL, you can do a GET request like:
# 
# ```
# https://v2.api2pdf.com/chrome/pdf/url?url={UrlToConvert}&apikey={YourApiKey}
# ```
# 
# For more advanced usage and settings, see the API specification below.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, ConnectionConfig config =  {}) returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }

    # Delete a file on command
    #
    # + responseid - The response ID from the original file generation request
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function delete file/[string responseid](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/file/${getEncodedUri(responseid)}`;
        map<anydata> queryParam = {};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        return self.clientEp->delete(resourcePath, headers = httpHeaders);
    }

    # Check remaining credit balance on your account
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function get balance(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/balance`;
        map<anydata> queryParam = {};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Convert URL to Image
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function get chrome/image/url(map<string|string[]> headers = {}, *ChromeGetUrlToImageQueries queries) returns error? {
        string resourcePath = string `/chrome/image/url`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Convert URL to PDF
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function get chrome/pdf/url(map<string|string[]> headers = {}, *ChromeGetUrlToPdfQueries queries) returns error? {
        string resourcePath = string `/chrome/pdf/url`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Health check for the API
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function get status(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/status`;
        map<anydata> queryParam = {};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Convert URL to PDF. Recommended to use Chrome endpoints instead.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function get wkhtml/pdf/url(map<string|string[]> headers = {}, *WkthmlGetUrlToPdfQueries queries) returns error? {
        string resourcePath = string `/wkhtml/pdf/url`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Generate bar codes and QR codes with ZXING.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function get zebra(map<string|string[]> headers = {}, *ZebraGetBarcodeQueries queries) returns error? {
        string resourcePath = string `/zebra`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Convert raw HTML to Image
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post chrome/image/html(Api2Pdf\.Api\.Services\.Chrome\.Dtos\.HtmlToImageRequestInputDto payload, map<string|string[]> headers = {}, *ChromePostHtmlToImageQueries queries) returns error? {
        string resourcePath = string `/chrome/image/html`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Convert URL to Image
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post chrome/image/url(Api2Pdf\.Api\.Services\.Chrome\.Dtos\.UrlToImageRequestInputDto payload, map<string|string[]> headers = {}, *ChromePostUrlToImageQueries queries) returns error? {
        string resourcePath = string `/chrome/image/url`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Convert raw HTML to PDF
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post chrome/pdf/html(Api2Pdf\.Api\.Services\.Chrome\.Dtos\.HtmlToPdfRequestInputDto payload, map<string|string[]> headers = {}, *ChromePostHtmlToPdfQueries queries) returns error? {
        string resourcePath = string `/chrome/pdf/html`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Convert URL to PDF
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post chrome/pdf/url(Api2Pdf\.Api\.Services\.Chrome\.Dtos\.UrlToPdfRequestInputDto payload, map<string|string[]> headers = {}, *ChromePostUrlToPdfQueries queries) returns error? {
        string resourcePath = string `/chrome/pdf/url`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post libreoffice/any\-to\-pdf(Api2Pdf\.Api\.Services\.LibreOffice\.Dtos\.UrlRequestInputDto payload, map<string|string[]> headers = {}, *LibrePostAnyToPdfQueries queries) returns error? {
        string resourcePath = string `/libreoffice/any-to-pdf`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post libreoffice/html\-to\-docx(Api2Pdf\.Api\.Services\.LibreOffice\.Dtos\.UrlRequestInputDto payload, map<string|string[]> headers = {}, *LibrePostHtmlToDocxQueries queries) returns error? {
        string resourcePath = string `/libreoffice/html-to-docx`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post libreoffice/html\-to\-xlsx(Api2Pdf\.Api\.Services\.LibreOffice\.Dtos\.UrlRequestInputDto payload, map<string|string[]> headers = {}, *LibrePostHtmlToXlsxQueries queries) returns error? {
        string resourcePath = string `/libreoffice/html-to-xlsx`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post libreoffice/pdf\-to\-html(Api2Pdf\.Api\.Services\.LibreOffice\.Dtos\.UrlRequestInputDto payload, map<string|string[]> headers = {}, *LibrePostPdfToHtmlQueries queries) returns error? {
        string resourcePath = string `/libreoffice/pdf-to-html`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Generate an image of the first page of a PDF or Office Document
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post libreoffice/thumbnail(Api2Pdf\.Api\.Services\.LibreOffice\.Dtos\.UrlRequestInputDto payload, map<string|string[]> headers = {}, *LibrePostThumbnailQueries queries) returns error? {
        string resourcePath = string `/libreoffice/thumbnail`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Add bookmarks to an existing PDF
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post pdfsharp/bookmarks(Api2Pdf\.Api\.Services\.PdfSharp\.Dtos\.BookmarksRequestInputDto payload, map<string|string[]> headers = {}, *PdfSharpPostBookmarksQueries queries) returns error? {
        string resourcePath = string `/pdfsharp/bookmarks`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Compress the file size of an existing PDF
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post pdfsharp/compress(Api2Pdf\.Api\.Services\.PdfSharp\.Dtos\.CompressRequestInputDto payload, map<string|string[]> headers = {}, *PdfSharpPostCompressQueries queries) returns error? {
        string resourcePath = string `/pdfsharp/compress`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post pdfsharp/extract\-pages(Api2Pdf\.Api\.Services\.PdfSharp\.Dtos\.ExtractPagesRequestInputDto payload, map<string|string[]> headers = {}, *PdfSharpPostExtractPagesQueries queries) returns error? {
        string resourcePath = string `/pdfsharp/extract-pages`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Combine multiple PDF files into a single PDF file
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post pdfsharp/merge(Api2Pdf\.Api\.Services\.PdfSharp\.Dtos\.MergePdfsRequestInputDto payload, map<string|string[]> headers = {}, *PdfSharpPostMergePdfsQueries queries) returns error? {
        string resourcePath = string `/pdfsharp/merge`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Add a password to an existing PDF
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post pdfsharp/password(Api2Pdf\.Api\.Services\.PdfSharp\.Dtos\.PasswordsRequestInputDto payload, map<string|string[]> headers = {}, *PdfSharpPostPasswordQueries queries) returns error? {
        string resourcePath = string `/pdfsharp/password`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Convert raw HTML to PDF. Recommended to use Chrome endpoints instead.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post wkhtml/pdf/html(Api2Pdf\.Api\.Services\.Wkhtml\.Dtos\.HtmlToPdfRequestInputDto payload, map<string|string[]> headers = {}, *WkhtmlPostHtmlToPdfQueries queries) returns error? {
        string resourcePath = string `/wkhtml/pdf/html`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Convert URL to PDF. Recommended to use Chrome endpoints instead.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post wkhtml/pdf/url(Api2Pdf\.Api\.Services\.Wkhtml\.Dtos\.UrlToPdfRequestInputDto payload, map<string|string[]> headers = {}, *WkhtmlPostUrlToPdfQueries queries) returns error? {
        string resourcePath = string `/wkhtml/pdf/url`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Create a .zip file from multiple files
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function post zip(Api2Pdf\.Api\.Controllers\.ZipRequestInput payload, map<string|string[]> headers = {}, *ZipPostGenerateZipQueries queries) returns error? {
        string resourcePath = string `/zip`;
        map<anydata> queryParam = {...queries};
        queryParam["apiKey"] = self.apiKeyConfig.apiKey;
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<anydata> headerValues = {...headers};
        headerValues["Authorization"] = self.apiKeyConfig.Authorization;
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }
}
