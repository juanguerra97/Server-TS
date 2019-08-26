import { Request, Response } from 'express';
import pool from '../db';

class JornadasController{

    public async getAllJornadas (req:Request, res:Response) {
        const rows = await pool.query('call cos_bot_jornadas(' + req.params.za_carrera + ',0);');
        res.json(rows[0][0]);
    }

    public async getUnaJornada (req:Request, res:Response) {
        const rows = await pool.query('call cos_bot_jornadas(' + req.params.za_carrera + ',' + req.params.za_jornada + ');');
        res.json(rows[0][0]);
    }

    public async opcionesJornadas(req:Request, res:Response){
        await pool.query("call sen_bot_jornadas(" + req.body.za_jornada + "," + req.body.za_carrera + ",'" + req.body.nombre_jornada + "'," + req.body.activo + "," + req.body.accion + ");");
        res.json({text:"Operación realizada exitosamente!!!"});
    }

}

const jornadasController = new JornadasController();
export default jornadasController;