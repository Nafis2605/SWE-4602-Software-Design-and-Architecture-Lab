const chalk = require('chalk')

const loadProduct = require("./LoadProduct")
const saveProducts = require("./SaveProducts")

const removeProduct = (name) => {
    const products = loadProduct()

    const duplicateProduct = products.find((product) => product.name === name)
    //console.log(duplicateProduct.quantity);

    const productsToKeep = products.filter(
        (product) => {
            return product.name != name
        }
    )

    if (products.length > productsToKeep.length) {
        console.log(chalk.green.inverse(name + " is removed"))
        saveProducts(productsToKeep)
    }
    else {
        console.log(chalk.red.inverse(name + " is not found!"))
    }
    return loadProduct()
}

module.exports = removeProduct;