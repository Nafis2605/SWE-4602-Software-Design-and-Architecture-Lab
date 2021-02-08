const fs = require('fs')

const loadSession = () => {
    try {
        const dataBuffer = fs.readFileSync('session.json')
        const dataJSON = dataBuffer.toString()
        const data = JSON.parse(dataJSON)
        return data
    } catch (error) {
        return []
    }

}

module.exports = loadSession;