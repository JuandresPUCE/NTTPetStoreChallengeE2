Feature: Petstore API Tests

  Scenario Outline: Crear mascotas con diferentes atributos
    Given url 'https://petstore.swagger.io/v2/pet'
    And header Content-Type = 'application/json'
    And request { "id": <id>, "name": <name>, "status": "<status>" }
    When method post
    Then status <statusCode>
    And match response.id == <expectedId>
    And match response.name == '<expectedName>'
    And match response.status == '<expectedStatus>'

    Examples:
      | id   | name   | status      | statusCode | expectedId | expectedName | expectedStatus |
      | 7771 | Perrin | available   | 200        | 7771       | Perrin       | available      |
      | 7773 | Perron | available   | 200        | 7773       | Perron       | available      |
      | 7772 |        | available   | 200        | 7772       |              | available      |
      | 3    | Rayo   | sold        | 200        | 3          | Rayo         | sold           |
      | 4    | Perroso| unavailable | 200        | 4          | Perroso      | unavailable    |
      | 5    | Carlol | available   | 200        | 5          | Carlol       | available      |
      | 6    | Maxtor | available   | 200        | 6          | Maxtor       | available      |
