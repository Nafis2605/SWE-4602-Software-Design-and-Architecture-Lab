const chalk = require('chalk')

const loadProduct = require("./LoadProduct")
const saveProduct = require("./SaveProducts")
const removeProduct = require("./RemoveProduct")

const decreaseProduct = (name) => {
    const products = loadProduct();

    const duplicateProduct = products.find((product) => product.name === name)


    if (!duplicateProduct) {
        console.log(chalk.red.inverse(name + " is not found!"))
    }
    else if (duplicateProduct.quantity === 1) {
        duplicateProduct.quantity = 0
        console.log(chalk.yellow.inverse("Product is removed"));
        saveProduct(products);
    }
    else if (duplicateProduct.quantity > 1) {
        duplicateProduct.quantity = duplicateProduct.quantity - 1
        console.log(chalk.green.inverse("Product amount is decreased!"));
        saveProduct(products);
    }


    return loadProduct()
}

module.exports = decreaseProduct;