const fs = require('fs')

const saveProducts = (products) => {
    const dataJSON = JSON.stringify(products)
    fs.writeFileSync("products.json", dataJSON)
}

module.exports = saveProducts;