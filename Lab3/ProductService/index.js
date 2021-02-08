const express = require("express")
const uuid = require("uuid")
const app = express()

const products = require("./product")

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => console.log("Server has started"))


//Body parser Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }))

//Task 1.1

app.post('/product/add', (req, res) => {
    const addProduct = {
        id: uuid.v4(),
        name: req.body.name,
        categoryId: req.body.categoryId
    }

    if (!addProduct.name || !addProduct.categoryId) {
        return res.status(500).json({ msg: 'Please include data' })
    }

    const duplicate = products.some(product => product.name === req.body.name);

    if (duplicate) {
        return res.status(400).json({ msg: 'Data is already taken' })
    }
    else {
        products.push(addProduct)
        res.status(201).json(products)
    }
});


//Task 1.2

app.delete('/product/remove/:id', (req, res) => {
    const found = products.some((product) => product.id === req.params.id);
    if (found) {
        res.json({ msg: "Product is deleted", products: products.filter((product) => product.id !== req.params.id) });
    }
    else {
        res.json({ msg: "Product Not Found!" })
    }
})


//Task 1.3

app.get('/product/list', (req, res) => {
    res.json(products)
})


//Task 1.4

app.post('/product/updateCategory', (req, res) => {

    const duplicate = products.some(product => product.name === req.body.name);
    console.log(duplicate)
    if (duplicate) {
        products.forEach((product) => {
            if (product.name === req.body.name) {
                product.categoryId = parseInt(req.body.categoryId)
                product.name = req.body.name
            }
            res.json(products)
        })
    }
    else {
        res.json({ msg: 'Product is not found!' })
    }
})
