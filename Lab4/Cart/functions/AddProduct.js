const chalk = require('chalk')

const loadProduct = require("./LoadProduct")
const saveProduct = require("./SaveProducts")

const addProduct = (name) => {
    const products = loadProduct();

    const duplicateProduct = products.find((product) => product.name === name)

    if (!duplicateProduct) {
        products.push(
            {
                name: name,
                quantity: 1
            }
        )
        console.log(chalk.greenBright.inverse("New Product is added"));
    }
    else {
        //console.log(duplicateProduct)
        duplicateProduct.quantity = duplicateProduct.quantity + 1
        console.log(chalk.greenBright.inverse("Product Quantity is increased"))

    }
    saveProduct(products);
    return loadProduct()

}

module.exports = addProduct;