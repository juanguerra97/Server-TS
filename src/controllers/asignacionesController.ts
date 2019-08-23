import { Request, Response } from 'express';
import pool from '../db';

class AsignacionesController{

    public async getAllAsignaciones (req:Request, res:Response) {
        const rows = await pool.query('select * from bot_asignaciones where za_carrera' + req.params.za_carrera + ' and za_curso = ' + req.params.za_curso + ' and ano_pensum = ' + req.params.ano_pensum);
        res.json(rows[0]);
    }

    public async getUnaAsignaciones (req:Request, res:Response) {
        const rows = await pool.query('select * from bot_asignaciones where za_carrera' + req.params.za_carrera + ' and za_profesor = ' + req.params.za_profesor + ' and za_curso = ' + req.params.za_curso + ' and ano_pensum = ' + req.params.ano_pensum);
        res.json(rows[0]);
    }

    public async opcionesAsignaciones (req:Request, res:Response) {
        await pool.query('call sen_bot_asignaciones(' + req.body.za_carrera + ',' + req.body.za_profesor + ',' + req.body.za_curso + ',' + req.body.ano_pensum + ',' + req.body.no_semestre + ',' + req.body.seccion + ',' + req.body.hora_inicio + ',' + req.body.hora_fin + ',' + req.body.accion + ');');
        res.json({text: "Operación realizada exitosamente!!!"});
    }

}

const asignacionesController = new AsignacionesController();
export default asignacionesController;