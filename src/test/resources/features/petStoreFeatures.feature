@petStoreTest
Feature: Petstore API Tests

  Background:
    * def config = call read('classpath:karate-config.js')
    * def urlBase = config.urlBase
    * def usersPath = config.usersPath

  @addPet  # Tag para el escenario de añadir una mascota
  Scenario Outline: Agregar una mascota a la tienda
    # Dada la url urlBase + usersPath
    Given url urlBase + usersPath
    # encabezados de la petición de la API
    And header Content-Type = 'application/json'
    # Cuerpo de la petición
    And request { "id": <id>, "name": "<name>", "status": "<status>" }
    # Cuando se hace una petición de tipo post
    When method post
    # Entonces el estado de la respuesta es <statusCode>
    Then status <statusCode>
    # Y la respuesta tiene el id, nombre y el estatus esperado de la lista del escenario de prueba
    And match response.id == <expectedId>
    And match response.name == '<expectedName>'
    And match response.status == '<expectedStatus>'
    * def petId = response.id
    Then print petId

    Examples:
      | id| name   | status      | statusCode | expectedId | expectedName | expectedStatus |
      | 7 | Perrin | available   | 200        | 7          | Perrin       | available      |
      | 8 | Perron | available   | 200        | 8          | Perron       | available      |
      | 9 |        | available   | 200        | 9          |              | available      |
      | 3 | Rayo   | sold        | 200        | 3          | Rayo         | sold           |
      | 4 | Perroso| unavailable | 200        | 4          | Perroso      | unavailable    |
      | 5 | Carlol | available   | 200        | 5          | Carlol       | available      |
      | 6 | Maxtor | available   | 200        | 6          | Maxtor       | available      |

  @findByIdPet # Tag para el escenario de buscar una mascota por su id
  Scenario Outline: Buscar una mascota por su id
    Given url urlBase + usersPath + '/' + <petId>
    When method get
    Then status <statusCode>
    And match response.id == <expectedId>
    And match response.name == '<expectedName>'
    And match response.status == '<expectedStatus>'
    # nota: se debe correr la prueba anterior ya que la API retiene por un tiempo la mascota creada y la borra
    Examples:
      | petId | expectedId | expectedName | expectedStatus | statusCode |
      | 7     | 7          | Perrin       | available      | 200        |
      | 8     | 8          | Perron       | available      | 200        |
      | 9     | 9          |              | available      | 200        |
      | 3     | 3          | Rayo         | sold           | 200        |
      | 4     | 4          | Perroso      | unavailable    | 200        |
      | 5     | 5          | Carlol       | available      | 200        |
      | 6     | 6          | Maxtor       | available      | 200        |

  @updatePetSoldPet  # Tag para el escenario de actualizar una mascota vendida
  Scenario Outline: Actualizar el nombre y el estado de una mascota a vendida "sold"
    Given url urlBase + usersPath
    And header Content-Type = 'application/json'
    # Enviar todos los parámetros requeridos, no solo id, name y status, ojo debe recibir todos los parámetros que solicita la API
    # parametros requeridos en formato json: id, category, name, photoUrls, tags, status
    And request {"id": <petId>,"category": {"id": 0,"name": "category_value"},"name": "<newName>","photoUrls": [ "http://example.com/photo.jpg" ],"tags": [{ "id": 0, "name": "tag1" }],"status": "sold"}
    # debe ser de tipo put no esta permitido patch
    When method put
    # el estado de la respuesta debe ser 200 utilizando: Then status 200 o la columna statusCode
    Then status <statusCode>
    # comprobacion de los valores básicos de la respuesta
    And match response.id == <petId>
    And match response.name == "<newName>"
    And match response.status == "sold"

    Examples:
      | petId | newName        | statusCode |
      | 7     | Rin            | 200        |
      | 8     | ROn            | 200        |
      | 9     | Peluchin       | 200        |
      | 3     | Rayomcueen     | 200        |
      | 4     | Perroson       | 200        |
      | 5     | Cart           | 200        |
      | 6     | Maxt           | 200        |

  @findByStatusPet  # Tag para el escenario de consultar una mascota por estado
  Scenario Outline: Consultar una mascota por estado
    Given url urlBase + usersPath + '/' + <petId>
    When method get
    # el estado de la respuesta utilizando: Then status 200 o la columna statusCode
    Then status <statusCode>
    And match response.id == <petId>
    And match response.status == "<status>"

    Examples:
      | petId | status  | statusCode |
      | 7     | sold    | 200        |
      | 8     | sold    | 200        |
      | 9     | sold    | 200        |
      | 3     | sold    | 200        |
      | 4     | sold    | 200        |
      | 5     | sold    | 200        |
      | 6     | sold    | 200        |

