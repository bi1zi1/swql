//  This file was automatically generated and should not be edited.

import Apollo

public final class CharacterListQuery: GraphQLQuery {
  public let operationDefinition =
    "query CharacterList($after: String, $first: Int!) {\n  allPeople(after: $after, first: $first) {\n    __typename\n    totalCount\n    pageInfo {\n      __typename\n      hasNextPage\n      endCursor\n    }\n    people {\n      __typename\n      id\n      name\n      height\n      mass\n      homeworld {\n        __typename\n        name\n      }\n    }\n  }\n}"

  public var after: String?
  public var first: Int

  public init(after: String? = nil, first: Int) {
    self.after = after
    self.first = first
  }

  public var variables: GraphQLMap? {
    return ["after": after, "first": first]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Root"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allPeople", arguments: ["after": GraphQLVariable("after"), "first": GraphQLVariable("first")], type: .object(AllPerson.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allPeople: AllPerson? = nil) {
      self.init(unsafeResultMap: ["__typename": "Root", "allPeople": allPeople.flatMap { (value: AllPerson) -> ResultMap in value.resultMap }])
    }

    public var allPeople: AllPerson? {
      get {
        return (resultMap["allPeople"] as? ResultMap).flatMap { AllPerson(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "allPeople")
      }
    }

    public struct AllPerson: GraphQLSelectionSet {
      public static let possibleTypes = ["PeopleConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("totalCount", type: .scalar(Int.self)),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        GraphQLField("people", type: .list(.object(Person.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCount: Int? = nil, pageInfo: PageInfo, people: [Person?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "PeopleConnection", "totalCount": totalCount, "pageInfo": pageInfo.resultMap, "people": people.flatMap { (value: [Person?]) -> [ResultMap?] in value.map { (value: Person?) -> ResultMap? in value.flatMap { (value: Person) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A count of the total number of objects in this connection, ignoring pagination.
      /// This allows a client to fetch the first five objects by passing "5" as the
      /// argument to "first", then fetch the total count so it could display "5 of 83",
      /// for example.
      public var totalCount: Int? {
        get {
          return resultMap["totalCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCount")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      /// A list of all of the objects returned in the connection. This is a convenience
      /// field provided for quickly exploring the API; rather than querying for
      /// "{ edges { node } }" when no edge data is needed, this field can be be used
      /// instead. Note that when clients like Relay need to fetch the "cursor" field on
      /// the edge to enable efficient pagination, this shortcut cannot be used, and the
      /// full "{ edges { node } }" version should be used instead.
      public var people: [Person?]? {
        get {
          return (resultMap["people"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Person?] in value.map { (value: ResultMap?) -> Person? in value.flatMap { (value: ResultMap) -> Person in Person(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Person?]) -> [ResultMap?] in value.map { (value: Person?) -> ResultMap? in value.flatMap { (value: Person) -> ResultMap in value.resultMap } } }, forKey: "people")
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("endCursor", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool, endCursor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }
      }

      public struct Person: GraphQLSelectionSet {
        public static let possibleTypes = ["Person"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("height", type: .scalar(Int.self)),
          GraphQLField("mass", type: .scalar(Double.self)),
          GraphQLField("homeworld", type: .object(Homeworld.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, height: Int? = nil, mass: Double? = nil, homeworld: Homeworld? = nil) {
          self.init(unsafeResultMap: ["__typename": "Person", "id": id, "name": name, "height": height, "mass": mass, "homeworld": homeworld.flatMap { (value: Homeworld) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of this person.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The height of the person in centimeters.
        public var height: Int? {
          get {
            return resultMap["height"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "height")
          }
        }

        /// The mass of the person in kilograms.
        public var mass: Double? {
          get {
            return resultMap["mass"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "mass")
          }
        }

        /// A planet that this person was born on or inhabits.
        public var homeworld: Homeworld? {
          get {
            return (resultMap["homeworld"] as? ResultMap).flatMap { Homeworld(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "homeworld")
          }
        }

        public struct Homeworld: GraphQLSelectionSet {
          public static let possibleTypes = ["Planet"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Planet", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of this planet.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class CharacterFilmsQuery: GraphQLQuery {
  public let operationDefinition =
    "query CharacterFilms($personId: ID!) {\n  person(id: $personId) {\n    __typename\n    filmConnection {\n      __typename\n      films {\n        __typename\n        id\n        title\n      }\n    }\n  }\n}"

  public var personId: GraphQLID

  public init(personId: GraphQLID) {
    self.personId = personId
  }

  public var variables: GraphQLMap? {
    return ["personId": personId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Root"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("person", arguments: ["id": GraphQLVariable("personId")], type: .object(Person.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(person: Person? = nil) {
      self.init(unsafeResultMap: ["__typename": "Root", "person": person.flatMap { (value: Person) -> ResultMap in value.resultMap }])
    }

    public var person: Person? {
      get {
        return (resultMap["person"] as? ResultMap).flatMap { Person(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "person")
      }
    }

    public struct Person: GraphQLSelectionSet {
      public static let possibleTypes = ["Person"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("filmConnection", type: .object(FilmConnection.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(filmConnection: FilmConnection? = nil) {
        self.init(unsafeResultMap: ["__typename": "Person", "filmConnection": filmConnection.flatMap { (value: FilmConnection) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var filmConnection: FilmConnection? {
        get {
          return (resultMap["filmConnection"] as? ResultMap).flatMap { FilmConnection(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "filmConnection")
        }
      }

      public struct FilmConnection: GraphQLSelectionSet {
        public static let possibleTypes = ["PersonFilmsConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("films", type: .list(.object(Film.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(films: [Film?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "PersonFilmsConnection", "films": films.flatMap { (value: [Film?]) -> [ResultMap?] in value.map { (value: Film?) -> ResultMap? in value.flatMap { (value: Film) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of all of the objects returned in the connection. This is a convenience
        /// field provided for quickly exploring the API; rather than querying for
        /// "{ edges { node } }" when no edge data is needed, this field can be be used
        /// instead. Note that when clients like Relay need to fetch the "cursor" field on
        /// the edge to enable efficient pagination, this shortcut cannot be used, and the
        /// full "{ edges { node } }" version should be used instead.
        public var films: [Film?]? {
          get {
            return (resultMap["films"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Film?] in value.map { (value: ResultMap?) -> Film? in value.flatMap { (value: ResultMap) -> Film in Film(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Film?]) -> [ResultMap?] in value.map { (value: Film?) -> ResultMap? in value.flatMap { (value: Film) -> ResultMap in value.resultMap } } }, forKey: "films")
          }
        }

        public struct Film: GraphQLSelectionSet {
          public static let possibleTypes = ["Film"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, title: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Film", "id": id, "title": title])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The title of this film.
          public var title: String? {
            get {
              return resultMap["title"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }
        }
      }
    }
  }
}

public final class FilmListQuery: GraphQLQuery {
  public let operationDefinition =
    "query FilmList {\n  allFilms {\n    __typename\n    films {\n      __typename\n      id\n      title\n      director\n      releaseDate\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Root"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allFilms", type: .object(AllFilm.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allFilms: AllFilm? = nil) {
      self.init(unsafeResultMap: ["__typename": "Root", "allFilms": allFilms.flatMap { (value: AllFilm) -> ResultMap in value.resultMap }])
    }

    public var allFilms: AllFilm? {
      get {
        return (resultMap["allFilms"] as? ResultMap).flatMap { AllFilm(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "allFilms")
      }
    }

    public struct AllFilm: GraphQLSelectionSet {
      public static let possibleTypes = ["FilmsConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("films", type: .list(.object(Film.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(films: [Film?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "FilmsConnection", "films": films.flatMap { (value: [Film?]) -> [ResultMap?] in value.map { (value: Film?) -> ResultMap? in value.flatMap { (value: Film) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of all of the objects returned in the connection. This is a convenience
      /// field provided for quickly exploring the API; rather than querying for
      /// "{ edges { node } }" when no edge data is needed, this field can be be used
      /// instead. Note that when clients like Relay need to fetch the "cursor" field on
      /// the edge to enable efficient pagination, this shortcut cannot be used, and the
      /// full "{ edges { node } }" version should be used instead.
      public var films: [Film?]? {
        get {
          return (resultMap["films"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Film?] in value.map { (value: ResultMap?) -> Film? in value.flatMap { (value: ResultMap) -> Film in Film(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Film?]) -> [ResultMap?] in value.map { (value: Film?) -> ResultMap? in value.flatMap { (value: Film) -> ResultMap in value.resultMap } } }, forKey: "films")
        }
      }

      public struct Film: GraphQLSelectionSet {
        public static let possibleTypes = ["Film"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("director", type: .scalar(String.self)),
          GraphQLField("releaseDate", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String? = nil, director: String? = nil, releaseDate: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Film", "id": id, "title": title, "director": director, "releaseDate": releaseDate])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The title of this film.
        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// The name of the director of this film.
        public var director: String? {
          get {
            return resultMap["director"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "director")
          }
        }

        /// The ISO 8601 date format of film release at original creator country.
        public var releaseDate: String? {
          get {
            return resultMap["releaseDate"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "releaseDate")
          }
        }
      }
    }
  }
}

public final class FilmIntroQuery: GraphQLQuery {
  public let operationDefinition =
    "query FilmIntro($filmId: ID!) {\n  film(id: $filmId) {\n    __typename\n    id\n    title\n    director\n    releaseDate\n    episodeID\n    openingCrawl\n  }\n}"

  public var filmId: GraphQLID

  public init(filmId: GraphQLID) {
    self.filmId = filmId
  }

  public var variables: GraphQLMap? {
    return ["filmId": filmId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Root"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("film", arguments: ["id": GraphQLVariable("filmId")], type: .object(Film.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(film: Film? = nil) {
      self.init(unsafeResultMap: ["__typename": "Root", "film": film.flatMap { (value: Film) -> ResultMap in value.resultMap }])
    }

    public var film: Film? {
      get {
        return (resultMap["film"] as? ResultMap).flatMap { Film(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "film")
      }
    }

    public struct Film: GraphQLSelectionSet {
      public static let possibleTypes = ["Film"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("director", type: .scalar(String.self)),
        GraphQLField("releaseDate", type: .scalar(String.self)),
        GraphQLField("episodeID", type: .scalar(Int.self)),
        GraphQLField("openingCrawl", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, director: String? = nil, releaseDate: String? = nil, episodeId: Int? = nil, openingCrawl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Film", "id": id, "title": title, "director": director, "releaseDate": releaseDate, "episodeID": episodeId, "openingCrawl": openingCrawl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of an object
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The title of this film.
      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// The name of the director of this film.
      public var director: String? {
        get {
          return resultMap["director"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "director")
        }
      }

      /// The ISO 8601 date format of film release at original creator country.
      public var releaseDate: String? {
        get {
          return resultMap["releaseDate"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "releaseDate")
        }
      }

      /// The episode number of this film.
      public var episodeId: Int? {
        get {
          return resultMap["episodeID"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "episodeID")
        }
      }

      /// The opening paragraphs at the beginning of this film.
      public var openingCrawl: String? {
        get {
          return resultMap["openingCrawl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "openingCrawl")
        }
      }
    }
  }
}

public final class FilmSpeciesQuery: GraphQLQuery {
  public let operationDefinition =
    "query FilmSpecies($filmId: ID!) {\n  film(id: $filmId) {\n    __typename\n    speciesConnection {\n      __typename\n      species {\n        __typename\n        name\n        classification\n        designation\n        homeworld {\n          __typename\n          id\n        }\n      }\n    }\n  }\n}"

  public var filmId: GraphQLID

  public init(filmId: GraphQLID) {
    self.filmId = filmId
  }

  public var variables: GraphQLMap? {
    return ["filmId": filmId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Root"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("film", arguments: ["id": GraphQLVariable("filmId")], type: .object(Film.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(film: Film? = nil) {
      self.init(unsafeResultMap: ["__typename": "Root", "film": film.flatMap { (value: Film) -> ResultMap in value.resultMap }])
    }

    public var film: Film? {
      get {
        return (resultMap["film"] as? ResultMap).flatMap { Film(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "film")
      }
    }

    public struct Film: GraphQLSelectionSet {
      public static let possibleTypes = ["Film"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("speciesConnection", type: .object(SpeciesConnection.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(speciesConnection: SpeciesConnection? = nil) {
        self.init(unsafeResultMap: ["__typename": "Film", "speciesConnection": speciesConnection.flatMap { (value: SpeciesConnection) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var speciesConnection: SpeciesConnection? {
        get {
          return (resultMap["speciesConnection"] as? ResultMap).flatMap { SpeciesConnection(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "speciesConnection")
        }
      }

      public struct SpeciesConnection: GraphQLSelectionSet {
        public static let possibleTypes = ["FilmSpeciesConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("species", type: .list(.object(Species.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(species: [Species?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "FilmSpeciesConnection", "species": species.flatMap { (value: [Species?]) -> [ResultMap?] in value.map { (value: Species?) -> ResultMap? in value.flatMap { (value: Species) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of all of the objects returned in the connection. This is a convenience
        /// field provided for quickly exploring the API; rather than querying for
        /// "{ edges { node } }" when no edge data is needed, this field can be be used
        /// instead. Note that when clients like Relay need to fetch the "cursor" field on
        /// the edge to enable efficient pagination, this shortcut cannot be used, and the
        /// full "{ edges { node } }" version should be used instead.
        public var species: [Species?]? {
          get {
            return (resultMap["species"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Species?] in value.map { (value: ResultMap?) -> Species? in value.flatMap { (value: ResultMap) -> Species in Species(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Species?]) -> [ResultMap?] in value.map { (value: Species?) -> ResultMap? in value.flatMap { (value: Species) -> ResultMap in value.resultMap } } }, forKey: "species")
          }
        }

        public struct Species: GraphQLSelectionSet {
          public static let possibleTypes = ["Species"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("classification", type: .scalar(String.self)),
            GraphQLField("designation", type: .scalar(String.self)),
            GraphQLField("homeworld", type: .object(Homeworld.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, classification: String? = nil, designation: String? = nil, homeworld: Homeworld? = nil) {
            self.init(unsafeResultMap: ["__typename": "Species", "name": name, "classification": classification, "designation": designation, "homeworld": homeworld.flatMap { (value: Homeworld) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of this species.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The classification of this species, such as "mammal" or "reptile".
          public var classification: String? {
            get {
              return resultMap["classification"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "classification")
            }
          }

          /// The designation of this species, such as "sentient".
          public var designation: String? {
            get {
              return resultMap["designation"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "designation")
            }
          }

          /// A planet that this species originates from.
          public var homeworld: Homeworld? {
            get {
              return (resultMap["homeworld"] as? ResultMap).flatMap { Homeworld(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "homeworld")
            }
          }

          public struct Homeworld: GraphQLSelectionSet {
            public static let possibleTypes = ["Planet"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID) {
              self.init(unsafeResultMap: ["__typename": "Planet", "id": id])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of an object
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }
          }
        }
      }
    }
  }
}

public final class FilmCharactersQuery: GraphQLQuery {
  public let operationDefinition =
    "query FilmCharacters($filmId: ID!) {\n  film(id: $filmId) {\n    __typename\n    characterConnection {\n      __typename\n      characters {\n        __typename\n        name\n        height\n        mass\n        homeworld {\n          __typename\n          name\n        }\n      }\n    }\n  }\n}"

  public var filmId: GraphQLID

  public init(filmId: GraphQLID) {
    self.filmId = filmId
  }

  public var variables: GraphQLMap? {
    return ["filmId": filmId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Root"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("film", arguments: ["id": GraphQLVariable("filmId")], type: .object(Film.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(film: Film? = nil) {
      self.init(unsafeResultMap: ["__typename": "Root", "film": film.flatMap { (value: Film) -> ResultMap in value.resultMap }])
    }

    public var film: Film? {
      get {
        return (resultMap["film"] as? ResultMap).flatMap { Film(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "film")
      }
    }

    public struct Film: GraphQLSelectionSet {
      public static let possibleTypes = ["Film"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("characterConnection", type: .object(CharacterConnection.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(characterConnection: CharacterConnection? = nil) {
        self.init(unsafeResultMap: ["__typename": "Film", "characterConnection": characterConnection.flatMap { (value: CharacterConnection) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var characterConnection: CharacterConnection? {
        get {
          return (resultMap["characterConnection"] as? ResultMap).flatMap { CharacterConnection(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "characterConnection")
        }
      }

      public struct CharacterConnection: GraphQLSelectionSet {
        public static let possibleTypes = ["FilmCharactersConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("characters", type: .list(.object(Character.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(characters: [Character?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "FilmCharactersConnection", "characters": characters.flatMap { (value: [Character?]) -> [ResultMap?] in value.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of all of the objects returned in the connection. This is a convenience
        /// field provided for quickly exploring the API; rather than querying for
        /// "{ edges { node } }" when no edge data is needed, this field can be be used
        /// instead. Note that when clients like Relay need to fetch the "cursor" field on
        /// the edge to enable efficient pagination, this shortcut cannot be used, and the
        /// full "{ edges { node } }" version should be used instead.
        public var characters: [Character?]? {
          get {
            return (resultMap["characters"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Character?] in value.map { (value: ResultMap?) -> Character? in value.flatMap { (value: ResultMap) -> Character in Character(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Character?]) -> [ResultMap?] in value.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } } }, forKey: "characters")
          }
        }

        public struct Character: GraphQLSelectionSet {
          public static let possibleTypes = ["Person"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("height", type: .scalar(Int.self)),
            GraphQLField("mass", type: .scalar(Double.self)),
            GraphQLField("homeworld", type: .object(Homeworld.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, height: Int? = nil, mass: Double? = nil, homeworld: Homeworld? = nil) {
            self.init(unsafeResultMap: ["__typename": "Person", "name": name, "height": height, "mass": mass, "homeworld": homeworld.flatMap { (value: Homeworld) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of this person.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The height of the person in centimeters.
          public var height: Int? {
            get {
              return resultMap["height"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "height")
            }
          }

          /// The mass of the person in kilograms.
          public var mass: Double? {
            get {
              return resultMap["mass"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "mass")
            }
          }

          /// A planet that this person was born on or inhabits.
          public var homeworld: Homeworld? {
            get {
              return (resultMap["homeworld"] as? ResultMap).flatMap { Homeworld(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "homeworld")
            }
          }

          public struct Homeworld: GraphQLSelectionSet {
            public static let possibleTypes = ["Planet"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Planet", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of this planet.
            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }
      }
    }
  }
}