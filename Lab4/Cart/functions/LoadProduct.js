const fs = require('fs')

const loadProduct = () => {
    try {
        const dataBuffer = fs.readFileSync('products.json')
        const dataJSON = dataBuffer.toString()
        const data = JSON.parse(dataJSON)
        return data
    } catch (error) {
        return []
    }

}

module.exports = loadProduct;