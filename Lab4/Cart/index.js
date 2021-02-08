const removeProduct = require("./functions/RemoveProduct")
const addProduct = require("./functions/AddProduct")
const getProduct = require("./functions/GetProduct")
const decreaseProduct = require("./functions/DecreaseProduct")
const createSession = require("./functions/CreateSession")
const session = require("./session.json")
const uuid = require("uuid")
const chalk = require('chalk')

const express = require("express")
const app = express()
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log("Server has started"))

//Body parser Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }))


app.post('/cart/add/:name', (req, res) => {
    if (session.length === 0) {
        session_id = createSession(uuid.v4())
        result = addProduct(req.params.name);
        res.json({
            session_id: session_id,
            result: result
        }
        );
    }
    else {
        result = addProduct(req.params.name);
        res.json(result);
    }
    console.log(chalk.greenBright.inverse(session[id]));
})

app.delete('/cart/remove/:name', (req, res) => {
    result = removeProduct(req.params.name)
    res.json(result)
})

app.delete('/cart/decrease/:name', (req, res) => {
    result = decreaseProduct(req.params.name);
    res.json(result)
})

app.get('/cart', (req, res) => {
    result = getProduct()
    res.json(result)
})