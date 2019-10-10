import { Request, Response } from 'express';
import pool from '../db';
import checkCamposBody from '../utils';

const CAMPOS_MODIFICABLES = ['ciclo','activo'];
const CAMPOS_CURSOPENSUM = ['za_carrera','ano_pensum','za_curso',...CAMPOS_MODIFICABLES];

class CursosPensumsController{

    public async getAllCursosPensums (req:Request, res:Response) {
        try {
            const rows = await pool.query('call cos_bot_cursos_pensums(' + req.params.za_carrera + ',' + req.params.ano_pensum + ',0);');
            res.json({
                status: 200,
                message: "CursosPensums",
                data: rows[0][0]
            });
        } catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: "No se pudieron obtener los datos",
                error
            });
        }
    }

    public async getUnoCursosPensums (req:Request, res:Response) {
        try {
            const rows = await pool.query('call cos_bot_cursos_pensums(' + req.params.za_carrera + ',' + req.params.ano_pensum + ',' + req.params.za_curso + ');');
            let cursopensum = {};
            if(rows[0].length == 1){
                cursopensum = rows[0][0];
            }
            res.json({
                status: 200,
                message: "CursoPensum",
                data: cursopensum
            });
        } catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: "No se pudieron obtener los datos",
                error
            });
        }
    }

    public async insert(req:Request, res:Response) {
        try {
            const body = req.body;
            checkCamposBody(req,CAMPOS_CURSOPENSUM);

            await pool.query(`call ins_cursopensum(${body.za_carrera},${body.ano_pensum},${body.za_curso},${body.ciclo},${body.activo})`);

            res.json({
                status: 200,
                message: "Se guardaron los datos",
                data: {
                    za_carrera: body.za_carrera,
                    ano_pensum: body.ano_pensum,
                    za_curso: body.za_curso,
                    ciclo: body.ciclo,
                    activo: body.activo
                }
            });

        } catch(error) {
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'PRIMARY'){
                    error = 'El ID esta duplicado';
                }
            }

            res.json({
               status: 400,
               message: "No se pudieron guardar los datos",
               error
            });
        }
    }

    public async update(req:Request, res:Response) {
        try {
            const body = req.body;
            const params = req.params;
            checkCamposBody(req,CAMPOS_MODIFICABLES);

            await pool.query(`call upd_cursopensum(${params.za_carrera},${params.ano_pensum},${params.za_curso},${body.ciclo},${body.activo})`);

            res.json({
                status: 200,
                message: "Se guardaron los datos",
                data: {
                    za_carrera: params.za_carrera,
                    ano_pensum: params.ano_pensum,
                    za_curso: params.za_curso,
                    ciclo: body.ciclo,
                    activo: body.activo
                }
            });

        } catch(error) {
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'PRIMARY'){
                    error = 'El ID esta duplicado';
                }
            }

            res.json({
               status: 400,
               message: "No se pudieron guardar los cambios",
               error
            });
        }
    }

    public async delete(req:Request,res:Response){

        try{
            const { za_carrera:za_carrera, ano_pensum:ano_pensum, za_curso:za_curso } = req.params;

            await pool.query(`
                    DELETE FROM bot_cursos_pensums
                    WHERE za_carrera = ${za_carrera} AND ano_pensum = ${ano_pensum} AND za_curso = ${za_curso}`);

            res.json({
                status: 200,
                message: "Se eliminaron los datos"
            });

        }catch(error){
            error = error.message;

            const ErrorFkRegex:RegExp = /^ER_ROW_IS_REFERENCED_2:.*$/g;
            let matchError = ErrorFkRegex.exec(error);
            if(matchError){
                error = "Otros registros referencian a estos datos";
            }

            res.json({
               status: 400,
               message: "No se pudieron eliminar los datos",
               error
            });
        }
    }

    public async opcionesCursosPensums (req:Request, res:Response) {
        await pool.query('call sen_bot_cursos_pensums(' + req.body.za_carrera + ',' + req.body.ano_pensum + ',' + req.body.za_curso + ',' + req.body.ciclo + ',' + req.body.activo + ',' + req.body.accion + ');');
        res.json({text: "Operación realizada exitosamente!!!"});
    }

    public async getAllCursosByPensumAndCiclo(req:Request, res:Response){
        
        try{

            if(req.query.za_carrera == undefined){
                throw {message:"Falta parametro za_carrera"};
            }

            if(req.query.ano_pensum == undefined){
                throw {message:"Falta parametro ano_pensum"};
            }

            if(req.query.ciclo == undefined){
                throw {message:"Falta parametro ciclo"};
            }

            // for(let parametro in ['za_carrera','ano_pensum','ciclo'].values()){
            //     if(req.query[parametro] == undefined){
            //         throw {message:"Falta parametro " + parametro};
            //     }
            // }

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
                message: "No se pudieron obtener los datos",
                error:{
                    message: error
                }
            });
        }

    }

}

const cursosPensumsController = new CursosPensumsController();
export default cursosPensumsController;