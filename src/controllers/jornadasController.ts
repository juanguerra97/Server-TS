import { Request, Response } from 'express';
import pool from '../db';
import checkCamposBody from '../utils';

const CAMPOS_MODIFICABLES_JORNADA = ['nombre_jornada','activo'];
const CAMPOS_JORNADA = [ 'za_carrera','za_jornada',...CAMPOS_MODIFICABLES_JORNADA];

class JornadasController{

    public async selectAllByCarrera (req:Request, res:Response) {
        try {
            const rows = await pool.query(`
                SELECT za_carrera,za_jornada,nombre_jornada,activo 
                FROM bot_jornadas WHERE za_carrera = ${req.params.za_carrera}`);
            res.json({
                status: 200,
                message: "Jornadas",
                data: rows[0]
            });
        } catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: "No se pudieron obtener las jornadas"
            })
        }
    }

    public async select (req:Request, res:Response) {
        try {
            const {za_carrera:za_carrera,za_jornada:za_jornada} = req.params;

            const rows = await pool.query(`
                SELECT za_carrera,za_jornada,nombre_jornada,activo FROM bot_jornadas 
                WHERE za_carrera = ${za_carrera} AND za_jornada = ${za_jornada}`);
            let jornada = {};
            if(rows[0].length == 1){
                jornada = rows[0][0];
            }
            res.json({
                status: 200,
                message: "Jornada",
                data: jornada
            });
        } catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: "No se pudo obtener la jornada"
            })
        }
    }

    public async insert(req:Request, res:Response) {
        try {
            const body = req.body;

            checkCamposBody(req,CAMPOS_JORNADA);

            const rs = await pool.query(`SELECT ins_jornada(${body.za_carrera},'${body.nombre_jornada}',${body.activo}) AS za_jornada`);
            const { za_jornada } = rs[0][0];

            res.json({
                status: 200,
                message: "Se guardo la jornada",
                data: {
                    za_carrera: body.za_carrera,
                    za_jornada,
                    nombre_jornada: body.nombre_jornada,
                    activo: body.activo
                }
            });
        } catch(error) {
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'UK_nombre_jornada'){
                    error = 'El nombre esta duplicado';
                } else if(matchError[1] == 'PRIMARY'){
                    error = 'El ID esta duplicado';
                }
            }

            res.json({
               status: 400,
               message: "No se guardo la jornada",
               error
            });
        }
    }

    public async update(req:Request, res:Response) {
        try {
            const body = req.body;
            const { za_carrera:za_carrera, za_jornada:za_jornada } = req.params;

            checkCamposBody(req,CAMPOS_MODIFICABLES_JORNADA);

            await pool.query(`call upd_jornada(${za_carrera}, ${za_jornada} ,'${body.nombre_jornada}',${body.activo})`);

            res.json({
                status: 200,
                message: "Se guardo la jornada",
                data: {
                    za_carrera,
                    za_jornada,
                    nombre_jornada: body.nombre_jornada,
                    activo: body.activo
                }
            });
        } catch(error) {
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'UK_nombre_jornada'){
                    error = 'El nombre esta duplicado';
                } else if(matchError[1] == 'PRIMARY'){
                    error = 'El ID esta duplicado';
                }
            }

            res.json({
               status: 400,
               message: "No se guardaron los cambios",
               error
            });
        }
    }

    public async delete(req:Request,res:Response){

        try{
            const { za_carrera:za_carrera, za_jornada:za_jornada } = req.params;

            await pool.query(`
                    DELETE FROM bot_jornadas 
                    WHERE za_carrera = ${za_carrera} AND za_jornada = ${za_jornada}`);

            res.json({
                status: 200,
                message: "Se elimino la jornada"
            });

        }catch(error){
            error = error.message;

            const ErrorFkRegex:RegExp = /^ER_ROW_IS_REFERENCED(_2)?:.*$/g;
            let matchError = ErrorFkRegex.exec(error);
            if(matchError){
                error = "Otros registros referencian a esta jornada";
            }

            res.json({
               status: 400,
               message: "Se cancelo la eliminacion",
               error
            });
        }
    }

    public async opcionesJornadas(req:Request, res:Response){
        await pool.query("call sen_bot_jornadas(" + req.body.za_jornada + "," + req.body.za_carrera + ",'" + req.body.nombre_jornada + "'," + req.body.activo + "," + req.body.accion + ");");
        res.json({text:"Operación realizada exitosamente!!!"});
    }

}

const jornadasController = new JornadasController();
export default jornadasController;