# Swagger Spec Sanitization

The following changes are needed to fix validation errors in the swagger specification:

## 1. Fix readOnly and writeOnly Conflict

Remove both readOnly and writeOnly attributes from InlinePdf property in the following schemas:

- Api2Pdf.Api.Controllers.ZipRequestInput
- Api2Pdf.Api.Services.Chrome.Dtos.HtmlToImageRequestInputDto
- Api2Pdf.Api.Services.Chrome.Dtos.HtmlToPdfRequestInputDto
- Api2Pdf.Api.Services.Chrome.Dtos.UrlToImageRequestInputDto
- Api2Pdf.Api.Services.Chrome.Dtos.UrlToPdfRequestInputDto
- Api2Pdf.Api.Services.LibreOffice.Dtos.UrlRequestInputDto
- Api2Pdf.Api.Services.PdfSharp.Dtos.BookmarksRequestInputDto
- Api2Pdf.Api.Services.PdfSharp.Dtos.CompressRequestInputDto
- Api2Pdf.Api.Services.PdfSharp.Dtos.ExtractPagesRequestInputDto
- Api2Pdf.Api.Services.PdfSharp.Dtos.MergePdfsRequestInputDto
- Api2Pdf.Api.Services.PdfSharp.Dtos.PasswordsRequestInputDto
- Api2Pdf.Api.Services.Wkhtml.Dtos.HtmlToPdfRequestInputDto
- Api2Pdf.Api.Services.Wkhtml.Dtos.UrlToPdfRequestInputDto

Example fix:
```json
"InlinePdf": {
  "type": "boolean",
  "default": true
}
```

## 2. Fix Bookmarks Array Default Value

In the schema Api2Pdf.Api.Services.PdfSharp.Dtos.BookmarksRequestInputDto, remove the default attribute from the Bookmarks array property:

```json
"Bookmarks": {
  "type": "array",
  "items": {
    "$ref": "#/components/schemas/Api2Pdf.Api.Services.PdfSharp.Dtos.BookmarkDto"
  },
  "nullable": true
}
```

## 3. Add Path Parameter Definition

Add parameter definition for responseId in the /file/{responseid} path:

```json
"/file/{responseid}": {
  "delete": {
    "parameters": [
      {
        "name": "responseid",
        "in": "path",
        "required": true,
        "schema": {
          "type": "string"
        },
        "description": "The response ID from the original file generation request"
      }
    ]
    // ...existing code...
  }
}
```

## Implementation Notes

1. Both readOnly and writeOnly cannot be true for the same property as it would make the property inaccessible
2. Array type properties should not have a default value of null
3. Path parameters must be explicitly defined in the operation parameters