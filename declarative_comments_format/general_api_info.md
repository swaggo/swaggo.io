# General API Info

| annotation         | description                                                                                               | 
|--------------------|-----------------------------------------------------------------------------------------------------------|
| title              | **Required.** The title of the application.                                                               |
| version            | **Required.** Provides the version of the application API.                                                |
| description        | A short description of the application.                                                                   |
| termsOfService     | The Terms of Service for the API.                                                                         |
| contact.name       | The contact information for the exposed API.                                                              |
| contact.url        | The URL pointing to the contact information. MUST be in the format of a URL.                              |
| contact.email      | The email address of the contact person/organization. MUST be in the format of an email address.          |
| license.name       | **Required.** The license name used for the API.                                                          |
| license.url        | A URL to the license used for the API. MUST be in the format of a URL.                                    |
| host               | The host (name or ip) serving the API.                                                                    |
| BasePath           | The base path on which the API is served.                                                                 |

## Security

| annotation                              | description                                                                                    | parameters                        |
|-----------------------------------------|------------------------------------------------------------------------------------------------|-----------------------------------|
| securitydefinitions.basic               | [Basic](https://swagger.io/docs/specification/2-0/authentication/basic-authentication/) auth.  |                                   |
| securitydefinitions.apikey              | [API key](https://swagger.io/docs/specification/2-0/authentication/api-keys/) auth.            | in, name                          |
| securitydefinitions.oauth2.application  | [OAuth2 application](https://swagger.io/docs/specification/authentication/oauth2/) auth.       | tokenUrl, scope                   |
| securitydefinitions.oauth2.implicit     | [OAuth2 implicit](https://swagger.io/docs/specification/authentication/oauth2/) auth.          | authorizationUrl, scope           |
| securitydefinitions.oauth2.password     | [OAuth2 password](https://swagger.io/docs/specification/authentication/oauth2/) auth.          | tokenUrl, scope                   |
| securitydefinitions.oauth2.accessCode   | [OAuth2 access code](https://swagger.io/docs/specification/authentication/oauth2/) auth.       | tokenUrl, authorizationUrl, scope |

## Example

[celler/main.go](https://github.com/swaggo/swag/blob/master/example/celler/main.go)
