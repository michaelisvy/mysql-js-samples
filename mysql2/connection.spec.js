const mysql = require('mysql2/promise');
describe('Name of the group', () => {
    it('should behave...', async () => {
        let songs = await findAllSongs();
        expect(songs[0].title).toEqual("Photographs");
        expect(songs[0].price).toEqual(10);
    });
});

async function findAllSongs () {
    const [rows] = await runWithinConnection('select * from Song');
    return rows;
}

async function runWithinConnection(query) {
    const connection = await getConnection();
    let result =  connection.query(query);
    closeConnection(connection);
    return result;
    
}

function getConnection() {
    return  mysql.createConnection({ 
        host: 'localhost',
        user: 'michael',
        password: 'michael',
        database: 'mysongdb',
        socketPath: '/Applications/MAMP/tmp/mysql/mysql.sock'
    });
}

function closeConnection(connection) {
    connection.end();
}

module.exports = {findAllSongs};