import { Request, Response } from 'express';
import pool from '../db';
import checkCamposBody from "../utils";

const CAMPOS_CURSO_MODIFICABLES = [
  'nombre_curso','usa_laboratorio','activo'
];

const CAMPOS_CURSO = [
  'za_curso',...CAMPOS_CURSO_MODIFICABLES
];

class CursosController{

    public async selectAll (req:Request, res:Response) {
        try {
            const rows = await pool.query('select * from bot_cursos');
            res.json({
                status: 200,
                message: "Cursos",
                data: rows[0]
            });
        } catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: "No se pudieron obtener los cursos",
                error
            });
        }
    }

    public async select (req:Request, res:Response) {
        try{
            const rows = await pool.query('select * from bot_cursos where za_curso = ' + req.params.za_curso);
            let curso = {};
            if(rows[0].length == 1){
                curso = rows[0][0];
            }
            res.json({
                status: 200,
                message: "Curso",
                data: curso
            });
        }catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: "No se pudo obtener el curso",
                error
            });
        }
    }

    public async insert(req:Request, res:Response){
        try{
            let body = req.body;
            checkCamposBody(req,['nombre_curso','usa_laboratorio']);

            if(body.activo == undefined){
                body.activo = 0;
            }


            const rs = await pool.query(`SELECT ins_curso('${body.nombre_curso}',${body.usa_laboratorio},${body.activo}) as za_curso`);
            const {za_curso} = rs[0][0];

            res.json({
                status: 200,
                message: "Se guardo el curso",
                data: {
                    za_curso,
                    nombre_curso: body.nombre_curso,
                    usa_laboratorio: body.usa_laboratorio,
                    activo: body.activo
                }
            });

        } catch(error){
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'UK_nombre_curso'){
                    error = 'El nombre del curso esta duplicado';
                } else if(matchError[1] == 'PRIMARY'){
                    error = 'El ID del curso esta duplicado';
                }
            }

            res.json({
                status: 400,
                message: "No se pudo guardar el curso",
                error
            });
        }
    }

    public async update(req:Request, res:Response) {
        try{
            let body = req.body;
            let za_curso = req.params.za_curso;
            checkCamposBody(req,CAMPOS_CURSO_MODIFICABLES);

            await pool.query(`call upd_curso(${za_curso},'${body.nombre_curso}',${body.usa_laboratorio},${body.activo})`);

            res.json({
                status: 200,
                message: "Se guardaron los cambios"
            });

        } catch(error){
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'UK_nombre_curso'){
                    error = 'El nombre del curso esta duplicado';
                } else if(matchError[1] == 'PRIMARY'){
                    error = 'El ID del curso esta duplicado';
                }
            }

            res.json({
                status: 400,
                message: "No se pudo guardar el curso",
                error
            });
        }
    }

    public async delete(req:Request, res:Response) {
        try{
            let za_curso = req.params.za_curso;

            await pool.query(`DELETE FROM bot_cursos WHERE za_curso = ${za_curso}`);

            res.json({
                status: 200,
                message: "Se elimino el curso"
            });

        }catch(error){
            error = error.message;

            const ErrorFkRegex:RegExp = /^ER_ROW_IS_REFERENCED(_2)?:.*$/g;
            let matchError = ErrorFkRegex.exec(error);
            if(matchError){
                error = "Otros registros referencian a este curso";
            }

            res.json({
                status: 400,
                message: "No se pudo eliminar el curso",
                error
            });
        }
    }

    public async opcionesCurso (req:Request, res:Response) {
        pool.query("call sen_bot_cursos(" + req.body.za_curso + ",'" + req.body.nombre_curso + "'," + req.body.usa_laboratorio + "," + req.body.activo + "," + req.body.accion + ");");
        res.json({text:"Operación realizada exitosamente!!!"});
    }

}

const cursosController = new CursosController();
export default cursosController;
