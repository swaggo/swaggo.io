# API Operation

| annotation         | description                                                                                                                |
|--------------------|----------------------------------------------------------------------------------------------------------------------------|
| description        | A verbose explanation of the operation behavior.                                                                           |
| id                 | A unique string used to identify the operation. Must be unique among all API operations.                                   |
| tags               | A list of tags to each API operation that separated by commas.                                                             |
| summary            | A short summary of what the operation does.                                                                                |
| accept             | A list of MIME types the APIs can consume. Value MUST be as described under [Mime Types](#mime-types).                     |
| produce            | A list of MIME types the APIs can produce. Value MUST be as described under [Mime Types](#mime-types).                     |
| param              | Parameters that separated by spaces. `param name`,`param type`,`data type`,`is mandatory?`,`comment` `attribute(optional)` |
| security           | [Security](#security) to each API operation.                                                                               |
| success            | Success response that separated by spaces. `return code`,`{param type}`,`data type`,`comment`                              |
| failure            | Failure response that separated by spaces. `return code`,`{param type}`,`data type`,`comment`                              |
| router             | Failure response that separated by spaces. `path`,`[httpMethod]`                                                           |

## Example

[celler/controller](https://github.com/swaggo/swag/tree/master/example/celler/controller)

## Limitation
- Not supported for cross-package models. Only search in project root folder. [See #39](https://github.com/swaggo/swag/issues/39)

## Mime Types


| Mime Type                         | annotation                                                |
|-----------------------------------|-----------------------------------------------------------|
| application/json                  | application/json, json                                    |
| text/xml                          | text/xml, xml                                             |
| text/plain                        | text/plain, plain                                         |
| html                              | text/html, html                                           |
| multipart/form-data               | multipart/form-data, mpfd                                 |
| application/x-www-form-urlencoded | application/x-www-form-urlencoded, x-www-form-urlencoded  |
| application/vnd.api+json          | application/vnd.api+json, json-api                        |
| application/x-json-stream         | application/x-json-stream, json-stream                    |
| application/octet-stream          | application/octet-stream, octet-stream                    |
| image/png                         | image/png, png                                            |
| image/jpeg                        | image/jpeg, jpeg                                          |
| image/gif                         | image/gif, gif                                            |

## Security

General API info.

```go
// @securityDefinitions.basic BasicAuth

// @securitydefinitions.oauth2.application OAuth2Application
// @tokenUrl https://example.com/oauth/token
// @scope.write Grants write access
// @scope.admin Grants read and write access to administrative information
```

Each API operation.

```go
// @Security ApiKeyAuth
```

Make it AND condition

```go
// @Security ApiKeyAuth
// @Security OAuth2Application[write, admin]
```

## Param Type

- object (struct)
- string (string)
- integer (int, uint, uint32, uint64)
- number (float32)
- boolean (bool)
- array

## Data Type

- string (string)
- integer (int, uint, uint32, uint64)
- number (float32)
- boolean (bool)
- user defined struct

## Attribute

```go
// @Param enumstring query string false "string enums" Enums(A, B, C)
// @Param enumint query int false "int enums" Enums(1, 2, 3)
// @Param enumnumber query number false "int enums" Enums(1.1, 1.2, 1.3)
// @Param string query string false "string valid" minlength(5) maxlength(10)
// @Param int query int false "int valid" mininum(1) maxinum(10)
// @Param default query string false "string default" default(A)
```

### Available

Field Name | Type | Description
---|:---:|---
<a name="parameterDefault"></a>default | * | Declares the value of the parameter that the server will use if none is provided, for example a "count" to control the number of results per page might default to 100 if not supplied by the client in the request. (Note: "default" has no meaning for required parameters.)  See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.2. Unlike JSON Schema this value MUST conform to the defined [`type`](#parameterType) for this parameter.
<a name="parameterMaximum"></a>maximum | `number` | See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.2.
<a name="parameterMinimum"></a>minimum | `number` | See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.3.
<a name="parameterMaxLength"></a>maxLength | `integer` | See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.2.1.
<a name="parameterMinLength"></a>minLength | `integer` | See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.2.2.
<a name="parameterEnums"></a>enums | [\*] | See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.5.1.

### Future

Field Name | Type | Description
---|:---:|---
<a name="parameterFormat"></a>format | `string` | The extending format for the previously mentioned [`type`](#parameterType). See [Data Type Formats](#dataTypeFormat) for further details.
<a name="parameterMultipleOf"></a>multipleOf | `number` | See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.1.
<a name="parameterPattern"></a>pattern | `string` | See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.2.3.
<a name="parameterMaxItems"></a>maxItems | `integer` | See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.3.2.
<a name="parameterMinItems"></a>minItems | `integer` | See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.3.3.
<a name="parameterUniqueItems"></a>uniqueItems | `boolean` | See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.3.4.
<a name="parameterCollectionFormat"></a>collectionFormat | `string` | Determines the format of the array if type array is used. Possible values are: <ul><li>`csv` - comma separated values `foo,bar`. <li>`ssv` - space separated values `foo bar`. <li>`tsv` - tab separated values `foo\tbar`. <li>`pipes` - pipe separated values <code>foo&#124;bar</code>. <li>`multi` - corresponds to multiple parameter instances instead of multiple values for a single instance `foo=bar&foo=baz`. This is valid only for parameters [`in`](#parameterIn) "query" or "formData". </ul> Default value is `csv`.

## TIPS

### User defined structure with an array type

```go
// @Success 200 {array} model.Account <-- This is a user defined struct.
```

```go
package model

type Account struct {
    ID   int    `json:"id" example:"1"`
    Name string `json:"name" example:"account name"`
}
```

### Use multiple path params

```go
/// ...
// @Param group_id path int true "Group ID"
// @Param account_id path int true "Account ID"
// ...
// @Router /examples/groups/{group_id}/accounts/{account_id} [get]
```

### Example value of struct

```go
type Account struct {
    ID   int    `json:"id" example:"1"`
    Name string `json:"name" example:"account name"`
    PhotoUrls []string `json:"photo_urls" example:"http://test/image/1.jpg,http://test/image/2.jpg"`
}
```
