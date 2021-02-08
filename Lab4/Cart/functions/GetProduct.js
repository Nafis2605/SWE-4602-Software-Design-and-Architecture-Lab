const loadProduct = require("./LoadProduct")

const getProduct = () => {
    const products = loadProduct()
    return products;
}

module.exports = getProduct;