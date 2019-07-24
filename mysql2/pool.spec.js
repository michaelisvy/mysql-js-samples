const mysql = require('mysql2/promise');
describe(' database connection with connection pool', () => {
    it('should do a plain select', async () => {
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
    const pool = await getPool();
    let result =  pool.query(query);
    return result;
    
}

function getPool() {
    return  mysql.createPool({ 
        host: 'localhost',
        user: 'michael',
        password: 'michael',
        database: 'mysongdb',
        socketPath: '/Applications/MAMP/tmp/mysql/mysql.sock',
        waitForConnections: true,
        connectionLimit: 10,
        queueLimit: 0
    });
}


module.exports = {findAllSongs};