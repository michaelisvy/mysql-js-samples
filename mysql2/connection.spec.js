const mysql = require('mysql2/promise');
describe('Simple database connection without connection pool', () => {
    it('should do a plain select', async (done) => {
        let [songs] = await runWithinConnection('select * from Song');
        expect(songs[0].title).toEqual("Photographs");
        expect(songs[0].price).toEqual(10);
        done();
    });
});

async function runWithinConnection(query) {
    const connection = await getConnection();
    let result = connection.query(query);
    connection.end();
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