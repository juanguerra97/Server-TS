import { Request, Response } from 'express';
import pool from '../db';

class IndexController{

    public async index (req:Request, res:Response) {
        const carreras = await pool.query('DESCRIBE bot_carreras');
        res.json(carreras);
    }

}

const indexController = new IndexController();
export default indexController;