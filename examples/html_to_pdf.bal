import ballerina/io;
import ballerinax/api2pdf;

configurable string apiKey = ?;

public function main() returns error? {
    api2pdf:Client api2pdfClient = check new({
        auth: {
            apiKey: apiKey
        }
    });

    // Sample HTML content with CSS
    string htmlContent = string `
        <!DOCTYPE html>
        <html>
        <head>
            <style>
                body { font-family: Arial, sans-serif; }
                .header { color: #444; }
                .content { margin: 20px; }
                table { width: 100%; border-collapse: collapse; }
                th, td { border: 1px solid #ddd; padding: 8px; }
                th { background-color: #f2f2f2; }
            </style>
        </head>
        <body>
            <h1 class="header">Sample Report</h1>
            <div class="content">
                <h2>Data Table</h2>
                <table>
                    <tr>
                        <th>Item</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>Item 1</td>
                        <td>100</td>
                    </tr>
                    <tr>
                        <td>Item 2</td>
                        <td>200</td>
                    </tr>
                </table>
            </div>
        </body>
        </html>
    `;

    // Configure PDF options
    api2pdf:HtmlToPdfRequest payload = {
        html: htmlContent,
        inline: true,
        fileName: "report.pdf",
        options: {
            marginTop: ".4in",
            marginBottom: ".4in",
            marginLeft: ".4in",
            marginRight: ".4in",
            printBackground: true,
            displayHeaderFooter: true,
            headerTemplate: "<div style='font-size: 10px; margin-left: 20px;'><span class='date'></span></div>",
            footerTemplate: "<div style='font-size: 10px; text-align: center;'><span class='pageNumber'></span> of <span class='totalPages'></span></div>",
            landscape: false,
            scale: 1
        }
    };
    
    // Generate PDF
    api2pdf:ApiResponse response = check api2pdfClient->chromeHtmlToPdf(payload);
    io:println("Generated PDF URL: ", response.url);
}
