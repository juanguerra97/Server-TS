import { Request, Response } from 'express';
import pool from '../db';

class PensumsController{

    public async getAllPensums (req:Request, res:Response) {
        const rows = await pool.query('select * from bot_pensums where za_carrera = ' + req.params.za_carrera);
        res.json(rows[0]);
    }

    public async getOnePensums (req:Request, res:Response) {
        const rows = await pool.query('select * from bot_pensums where za_carrera = ' + req.params.za_carrera + ' and ano_pensum = ' + req.params.ano_pensum);
        res.json(rows[0]);
    }

    public async opcionesPensums (req:Request, res:Response) {
        await pool.query("call sen_bot_pensums(" + req.body.ano_pensum + "," + req.body.za_carrera + "," + req.body.codigo_pensum + "," + req.body.activo + "," + req.body.accion + ");")
        res.send("Operación realizada exitosamente!!!");
    }

}

const pensumsController = new PensumsController();
export default pensumsController;