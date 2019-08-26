import { Request, Response } from 'express';
import pool from '../db';

class CursosPensumsController{

    public async getAllCursosPensums (req:Request, res:Response) {
        const rows = await pool.query('select * from bot_cursos_pensums where za_carrera = ' + req.params.za_carrera + ' and ano_pensum = ' + req.params.ano_pensum);
        res.json(rows[0]);
    }

    public async getUnoCursosPensums (req:Request, res:Response) {
        const rows = await pool.query('select * from bot_cursos_pensums where za_carrera = ' + req.params.za_carrera + ' and ano_pensum = ' + req.params.ano_pensum + ' and za_curso =' + req.params.za_curso);
        res.json(rows[0]);
    }

    public async opcionesCursosPensums (req:Request, res:Response) {
        await pool.query('call sen_bot_cursos_pensums(' + req.body.za_carrera + ',' + req.body.ano_pensum + ',' + req.body.za_curso + ',' + req.body.ciclo + ',' + req.body.activo + ',' + req.body.accion + ');');
        res.json({text: "Operación realizada exitosamente!!!"});
    }

}

const cursosPensumsController = new CursosPensumsController();
export default cursosPensumsController;