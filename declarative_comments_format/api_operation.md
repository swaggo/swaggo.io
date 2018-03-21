# API Operation

| annotation         | description                                                                                               | 
|--------------------|-----------------------------------------------------------------------------------------------------------|
| description        | A verbose explanation of the operation behavior.                                                          |
| id                 | A unique string used to identify the operation. Must be unique among all API operations.                  |
| tags               | A list of tags to each API operation that separated by commas.                                            |
| summary            | A short summary of what the operation does.                                                               |
| accept             | A list of MIME types the APIs can consume. Value MUST be as described under [Mime Types](#mime-types).    |
| produce            | A list of MIME types the APIs can produce. Value MUST be as described under [Mime Types](#mime-types).    |
| param              | Parameters that separated by spaces. `param name`,`param type`,`data type`,`is mandatory?`,`comment`      | 
| success            | Success response that separated by spaces. `return code`,`{param type}`,`data type`,`comment`             | 
| failure            | Failure response that separated by spaces. `return code`,`{param type}`,`data type`,`comment`             | 
| router             | Failure response that separated by spaces. `path`,`[httpMethod]`                                          | 

## Example

[celler/controller](https://github.com/swaggo/swag/tree/master/example/celler/controller)

## Limitation
- Not supported for cross-package models. Only search in project root folder. [See #39](https://github.com/swaggo/swag/issues/39)

## Mime Types

```
json
application/json
xml
text/xml
plain
text/plain
html
text/html
mpfd
multipart/form-data
json-api
application/vnd.api+json
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
