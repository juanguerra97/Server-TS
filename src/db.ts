import mysql2 from 'promise-mysql2';
import config from './config.db';

const pool = mysql2.createPool(config.database);

pool.getConnection().then(connection => {
    pool.releaseConnection(connection);
    console.log("Conectado a db_universidad");
}, err => {
    console.log("Error al conectar a la bd: " + err);
});

export default pool;