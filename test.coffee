cypher = require("./index") "http://localhost:7474"

cypher("match (n) return n")
.then ([{data, columns}])->
    console.log columns
    console.log data.map (x)-> x.row
.catch ({message})->
    console.log message
