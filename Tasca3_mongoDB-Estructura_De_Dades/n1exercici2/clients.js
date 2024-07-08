db.createCollection('clients', {validator: {$jsonSchema: {bsonType: 'object',title: 'clients',required: ['name','registerDate'],properties:{name:{bsonType: 'string'},address:{bsonType: 'object',title: 'object',properties:{street:{bsonType: 'string'},number:{bsonType: 'int'},floor:{bsonType: 'string'},door:{bsonType: 'string'},city:{bsonType: 'string'},postalCode:{bsonType: 'string'},country:{bsonType: 'string'}}},phone:{bsonType: 'int'},email:{bsonType: 'string'},registerDate:{bsonType: 'timestamp'},recommenderId:{bsonType: 'objectId'}}}}});