# cypher

```javascript
var cypher = require("cypher")("http://localhost:7474");

cypher("match (n:User) return n").then(function(result) {
}).catch(function(error) {
});
```

multiple

```javascript
cypher(["", ""]).then(function(results) {
}).catch(function(error) {
});
```
