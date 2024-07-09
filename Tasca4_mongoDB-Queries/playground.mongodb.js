
// https://www.mongodb.com/docs/mongodb-vscode/playgrounds/


// Select the database to use.
use('restaurant');




db.restaurants.find({});
db.restaurants.find({}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find({}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find({}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1});
db.restaurants.find({borough: "Bronx"});
db.restaurants.find({borough: "Bronx"}).limit(5);
db.restaurants.find({borough: "Bronx"}).skip(5).limit(5);
db.restaurants.find({"grades.score": {$gt: 90}});
db.restaurants.find({"grades": {$elemMatch: {score: {$gt: 80, $lt: 100}}}});
db.restaurants.find({"address.coord.0": {$lt: -95.754168}});
db.restaurants.find({$and: [{cuisine: {$regex: /^(?!.*American).*$/}}, {"grades.score": {$gt: 70}}, {"address.coord.1": {$lt: -65.754168}}]});
db.restaurants.aggregate([{$match: {cuisine: {$regex: /^(?!.*American).*$/}}}, {$match: {"grades.score": {$gt: 70}}}, {$match: {"address.coord.1": {$lt: -65.754168}}}]);
db.restaurants.find({$and: [{cuisine: {$regex: /^(?!.*American).*$/}}, {"grades.grade": "A"}, {borough: {$ne: "Brooklyn"}}]}).sort({cuisine: -1});
db.restaurants.find({name: {$regex: /^Wil/}}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find({name: {$regex: /ces$/}}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find({name: {$regex: /Reg/}}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find({$and: [{borough: "Bronx"}, {cuisine: {$in: ["American","American ","Chinese"]}}]});
db.restaurants.find({borough: {$in: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}},{_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find({borough: {$nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}},{_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find({"grades.score": {$not: {$gt: 10}}},{_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find({$or: [{$and: [{cuisine: {$regex: /fish/}}, {cuisine: {$nin: ["American","American ","Chinese"]}}]}, {name: {$regex: /^Wil/}}]},{_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find({grades: {$elemMatch: {grade: "A", score: 11, date: new Date("2014-08-11T00:00:00Z")}}}, {_id: 0, restaurant_id: 1, name: 1, grades: 1});
db.restaurants.find({$and: [{"grades.1.grade": "A"},{"grades.1.score": 9},{"grades.1.date": new Date("2014-08-11T00:00:00Z")}]}, {_id: 0, restaurant_id: 1, name: 1, grades: 1});
db.restaurants.find({"address.coord.1": {$gt: 42, $lt: 52}}, {_id: 0, restaurant_id: 1, name: 1, address: 1});
db.restaurants.aggregate({$sort: {name: 1}});
db.restaurants.aggregate({$sort: {name: -1}});
db.restaurants.aggregate([{$sort: {borough: -1, cuisine: 1}}, {$project: {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1}}]);
db.restaurants.find({"address.street": null});
db.restaurants.find({"address.coord": {$type: "double"}});
db.restaurants.find({"grades.score": {$mod: [7,0]}}, {_id: 0, name: 1, borough: 1, });
db.restaurants.find({name: {$regex: /mon/}}, {_id: 0, name: 1, borough: 1, latitud: { $arrayElemAt: ["$address.coord", 0] }, longitud: { $arrayElemAt: ["$address.coord", 1] }, cuisine: 1});
db.restaurants.find({name: {$regex: /^Mad/}}, {_id: 0, name: 1, borough: 1, latitud: { $arrayElemAt: ["$address.coord", 0] }, longitud: { $arrayElemAt: ["$address.coord", 1] }, cuisine: 1});