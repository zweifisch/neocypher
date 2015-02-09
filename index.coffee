r = require "request"

request = (options)->
    new Promise (resolve, reject)->
        r options, (err, response, body)->
            if err
                reject err
            else
                resolve [body, response]


class Cypher

    constructor: (@endpoint)->

    getTransationEndpoint: ->
        @transactionEndpoint or @transationEndpoint = request(method: "GET", uri: @endpoint, json:yes).then ([{data}])->
            request(method: "GET", uri: data, json:yes).then ([{transaction}])-> transaction

    query: (statements)->
        statements = [statements] unless Array.isArray statements
        @getTransationEndpoint().then (endpoint)->
            request method: "POST", uri: "#{endpoint}/commit", json:yes, body: statements: (statement: s for s in statements)
            .then ([body])->
                if body.errors.length
                    throw errors[0]
                body.results


module.exports = (endpoint="http://localhost:7474")->
    cypher = new Cypher endpoint
    (query)->
        cypher.query query
