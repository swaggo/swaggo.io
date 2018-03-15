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

comming soon...

## Data Type

comming soon...

## Example

[celler/controller](https://github.com/swaggo/swag/tree/master/example/celler/controller)
