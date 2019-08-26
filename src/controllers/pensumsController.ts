import { Request, Response } from 'express';
import pool from '../db';

class PensumsController{

    public async getAllPensums (req:Request, res:Response) {
        const rows = await pool.query('call cos_bot_pensums(' + req.params.za_carrera + ',0);');
        res.json(rows[0][0]);
    }

    public async getOnePensums (req:Request, res:Response) {
        const rows = await pool.query('call cos_bot_pensums(' + req.params.za_carrera + ',' + req.params.ano_pensum + ');');
        res.json(rows[0][0]);
    }

    public async opcionesPensums (req:Request, res:Response) {
        await pool.query("call sen_bot_pensums(" + req.body.ano_pensum + "," + req.body.za_carrera + "," + req.body.codigo_pensum + "," + req.body.activo + "," + req.body.accion + ");")
        res.json({text:"Operación realizada exitosamente!!!"});
    }

}

const pensumsController = new PensumsController();
export default pensumsController;