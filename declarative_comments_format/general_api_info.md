# General API Info

| annotation         | description                                                                                     | example                                                         |
|--------------------|-------------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| title              | **Required.** The title of the application.                                                     | // @title Swagger Example API                                   |
| version            | **Required.** Provides the version of the application API.                                      | // @version 1.0                                                 |
| description        | A short description of the application.                                                         | // @description This is a sample server celler server.          |
| termsOfService     | The Terms of Service for the API.                                                               | // @termsOfService http://swagger.io/terms/                     |
| contact.name       | The contact information for the exposed API.                                                    | // @contact.name API Support                                    |
| contact.url        | The URL pointing to the contact information. MUST be in the format of a URL.                    | // @contact.url http://www.swagger.io/support                   |
| contact.email      | The email address of the contact person/organization. MUST be in the format of an email address.| // @contact.email support@swagger.io                            |
| license.name       | **Required.** The license name used for the API.                                                | // @license.name Apache 2.0                                     |
| license.url        | A URL to the license used for the API. MUST be in the format of a URL.                          | // @license.url http://www.apache.org/licenses/LICENSE-2.0.html |
| host               | The host (name or ip) serving the API.                                                          | // @host localhost:8080                                         |
| BasePath           | The base path on which the API is served.                                                       | // @BasePath /api/v1                                            |

## Security

| annotation                              | description                                                                                    | parameters                        | example                                                      |
|-----------------------------------------|------------------------------------------------------------------------------------------------|-----------------------------------|--------------------------------------------------------------|
| securitydefinitions.basic               | [Basic](https://swagger.io/docs/specification/2-0/authentication/basic-authentication/) auth.  |                                   | // @securityDefinitions.basic BasicAuth                      |
| securitydefinitions.apikey              | [API key](https://swagger.io/docs/specification/2-0/authentication/api-keys/) auth.            | in, name                          | // @securityDefinitions.apikey ApiKeyAuth                    |
| securitydefinitions.oauth2.application  | [OAuth2 application](https://swagger.io/docs/specification/authentication/oauth2/) auth.       | tokenUrl, scope                   | // @securitydefinitions.oauth2.application OAuth2Application |
| securitydefinitions.oauth2.implicit     | [OAuth2 implicit](https://swagger.io/docs/specification/authentication/oauth2/) auth.          | authorizationUrl, scope           | // @securitydefinitions.oauth2.implicit OAuth2Implicit       |
| securitydefinitions.oauth2.password     | [OAuth2 password](https://swagger.io/docs/specification/authentication/oauth2/) auth.          | tokenUrl, scope                   | // @securitydefinitions.oauth2.password OAuth2Password       |
| securitydefinitions.oauth2.accessCode   | [OAuth2 access code](https://swagger.io/docs/specification/authentication/oauth2/) auth.       | tokenUrl, authorizationUrl, scope | // @securitydefinitions.oauth2.accessCode OAuth2AccessCode   |


| parameters annotation | example                                                  |
|-----------------------|----------------------------------------------------------|
| in                    | // @in header                                            |
| name                  | // @name Authorization                                   |
| tokenUrl              | // @tokenUrl https://example.com/oauth/token             |
| authorizationurl      | // @authorizationurl https://example.com/oauth/authorize |
| scope.hoge            | // @scope.write Grants write access                      |

## Example

[celler/main.go](https://github.com/swaggo/swag/blob/master/example/celler/main.go)
