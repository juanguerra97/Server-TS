import { Request, Response } from 'express';
import pool from '../db';

class CatedraticosController{

    public async getAllCatedraticos (req:Request, res:Response) {
        const rows = await pool.query('select * from bot_catedraticos');
        res.json(rows[0]);
    }

    public async getUnoCatedraticos (req:Request, res:Response) {
        const rows = await pool.query('select * from bot_catedraticos where za_profesor = ' + req.params.za_profesor);
        res.json(rows[0]);
    }

    public async opcionesCatedraticos (req:Request, res:Response) {
        await pool.query("call sen_bot_catedraticos(" + req.body.za_profesor + ",'" + req.body.nombres + "','" + req.body.apellidos + "','" + req.body.profesion + "'," + req.body.activo + "," + req.body.accion + ");");
        res.json({text: "Operación realizada exitosamente!!!"});
    }

}

const catedraticosController = new CatedraticosController();
export default catedraticosController;