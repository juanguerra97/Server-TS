import { Request, Response } from 'express';
import pool from '../db';

class DiasJornadasController{

    public async getAllDiasJornadas (req:Request, res:Response) {
        const carreras = await pool.query('select * from bot_jornadas where za_carrera = ' + req.params.za_carrera + ' and za_jornada = ' + req.params.za_jornada);
        res.json(carreras[0]);
    }

    public async getUnaDiaJornada (req:Request, res:Response) {
        const carreras = await pool.query('select * from bot_jornadas where za_carrera = ' + req.params.za_carrera + ' and za_jornada = ' + req.params.za_jornada + ' and za_dia = ' + req.params.za_dia);
        res.json(carreras[0]);
    }

    public async opcionesDiasJornadas(req:Request, res:Response){
        await pool.query("call sen_bot_dias_jornadas(" + req.body.za_jornada + "," + req.body.za_carrera + ",'" + req.body.nombre_jornada + "'," + req.body.activo + "," + req.body.accion + ");");
        res.send("Operación realizada exitosamente!!!");
    }

}

const diasJornadasController = new DiasJornadasController();
export default diasJornadasController;