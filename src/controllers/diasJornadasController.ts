import { Request, Response } from 'express';
import pool from '../db';

class DiasJornadasController{

    public async getAllDiasJornadas (req:Request, res:Response) {
        const rows = await pool.query('call cos_bot_dias_jornadas(' + req.params.za_carrera + ',' + req.params.za_jornada + ',0);');
        res.json(rows[0][0]);
    }

    public async getUnaDiaJornada (req:Request, res:Response) {
        const rows = await pool.query('call cos_bot_dias_jornadas(' + req.params.za_carrera + ',' + req.params.za_jornada + ',' + req.params.za_dia + ');');
        res.json(rows[0][0]);
    }

    public async opcionesDiasJornadas(req:Request, res:Response){
        await pool.query("call sen_bot_dias_jornadas("+ req.body.za_dia + "," + req.body.za_jornada + "," + req.body.za_carrera + ",'" + req.body.dia + "'," + req.body.activo + "," + req.body.accion + ");");
        res.json({text:"Operación realizada exitosamente!!!"});
    }

}

const diasJornadasController = new DiasJornadasController();
export default diasJornadasController;