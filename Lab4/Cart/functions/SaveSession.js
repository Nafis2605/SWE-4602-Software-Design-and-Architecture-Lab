const fs = require('fs')

const saveSession = (session) => {
    const dataJSON = JSON.stringify(session)
    fs.writeFileSync("session.json", dataJSON)
}

module.exports = saveSession;