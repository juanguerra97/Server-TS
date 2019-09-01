import { Request, Response } from 'express';
import pool from '../db';

class CursosPensumsController{

    public async getAllCursosPensums (req:Request, res:Response) {
        const rows = await pool.query('call cos_bot_cursos_pensums(' + req.params.za_carrera + ',' + req.params.ano_pensum + ',0);');
        res.json(rows[0][0]);
    }

    public async getUnoCursosPensums (req:Request, res:Response) {
        const rows = await pool.query('call cos_bot_cursos_pensums(' + req.params.za_carrera + ',' + req.params.ano_pensum + ',' + req.params.za_curso + ');');
        res.json(rows[0][0]);
    }

    public async opcionesCursosPensums (req:Request, res:Response) {
        await pool.query('call sen_bot_cursos_pensums(' + req.body.za_carrera + ',' + req.body.ano_pensum + ',' + req.body.za_curso + ',' + req.body.ciclo + ',' + req.body.activo + ',' + req.body.accion + ');');
        res.json({text: "Operación realizada exitosamente!!!"});
    }

    public async getAllCursosByPensumAndCiclo(req:Request, res:Response){
        
        try{

            for(let parametro in ['za_carrera','ano_pensum','ciclo']){
                if(req.query[parametro] == undefined){
                    throw {message:"Falta parametro " + parametro};
                }
            }

            const rows = await pool.query(
                `SELECT C.za_curso,C.nombre_curso,C.usa_laboratorio,C.activo 
                FROM bot_cursos C JOIN bot_cursos_pensums CP 
                ON C.za_curso = CP.za_curso 
                WHERE CP.za_carrera = ${req.query.za_carrera} AND 
                    CP.ano_pensum = ${req.query.ano_pensum} AND 
                    CP.ciclo = ${req.query.ciclo}`);
            
            res.json({
                status: 200,
                message: "OK",
                data: rows[0]
            });

        }catch(error){
            error = error.message;

            res.json({
                status: 400,
                message: "Ocurrió un error",
                error:{
                    message: error
                }
            });
        }

    }

}

const cursosPensumsController = new CursosPensumsController();
export default cursosPensumsController;