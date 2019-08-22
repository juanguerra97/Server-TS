import { Request, Response } from 'express';
import pool from '../db';

class CursosController{

    public async getAllCursos (req:Request, res:Response) {
        const rows = await pool.query('select * from bot_cursos');
        res.json(rows[0]);
    }

    public async getUnoCurso (req:Request, res:Response) {
        const rows = await pool.query('select * from bot_cursos where za_curso = ' + req.params.za_curso);
        res.json(rows[0]);
    }

    public async opcionesCurso (req:Request, res:Response) {
        pool.query("call sen_bot_cursos(" + req.body.za_curso + ",'" + req.body.nombre_curso + "'," + req.body.usa_laboratorio + "," + req.body.activo + "," + req.body.accion + ");");
        res.json({text:"Operación realizada exitosamente!!!"});
    }

}

const cursosController = new CursosController();
export default cursosController;