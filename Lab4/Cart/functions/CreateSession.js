const chalk = require('chalk')

const loadSession = require("./LoadSession")
const saveSession = require("./SaveSession")

const createSession = (id) => {

    const session = loadSession();

    session.push(
        {
            id: id
        }
    )
    console.log(chalk.greenBright.inverse("New Session is created"));
    //console.log(session);

    saveSession(session);
    return loadSession()
}

module.exports = createSession;