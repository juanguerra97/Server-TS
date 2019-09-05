import { Request, Response } from 'express';
import pool from '../db';

class reportecantidadcController{

    public async getAllreporte (req:Request, res:Response) {
        const rows = await pool.query('Call reporte_cursos()');
        res.json(rows[0]);
    }

}

const reporte3Controller = new reportecantidadcController();
export default reporte3Controller;