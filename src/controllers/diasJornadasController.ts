import { Request, Response } from 'express';
import pool from '../db';
import checkCamposBody from '../utils';

const CAMPOS_MODIFICABLES = ['dia','activo'];
const CAMPOS_SIN_KEY = ['za_carrera','za_jornada',...CAMPOS_MODIFICABLES];
const CAMPOS = [...CAMPOS_SIN_KEY,'za_dia'];

class DiasJornadasController{

    public async getAllDiasJornadas (req:Request, res:Response) {
        try {
            const rows = await pool.query('call cos_bot_dias_jornadas(' + req.params.za_carrera + ',' + req.params.za_jornada + ',0);');
            res.json({
                status: 200,
                message: "Dias",
                data: rows[0][0]
            });
        } catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: "No se pudieron obtener los dias",
                error
            });
        }
    }

    public async getUnaDiaJornada (req:Request, res:Response) {
        try {
            const rows = await pool.query('call cos_bot_dias_jornadas(' + req.params.za_carrera + ',' + req.params.za_jornada + ',' + req.params.za_dia + ');');
            let dia = {};
            if(rows[0].length == 1){
                dia = rows[0][0];
            }
            res.json({
                status: 200,
                message: "Dia",
                data: dia
            });
        } catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: "No se pudo obtener el dia",
                error
            });
        }
    }

    public async insert(req:Request, res:Response) {
        try {
            let body = req.body;
            checkCamposBody(req,CAMPOS_SIN_KEY);

            const rs = await pool.query(`SELECT ins_dia(${body.za_carrera},${body.za_jornada},'${body.dia}',${body.activo}) as za_dia`);
            const {za_dia} = rs[0][0];

            res.json({
                status: 200,
                message: "Se guardo el día",
                data: {
                    za_carrera: body.za_carrera,
                    za_jornada: body.za_jornada,
                    za_dia,
                    dia: body.dia,
                    activo: body.activo
                }
             });

        } catch(error){
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'UK_dia'){
                    error = 'El dia esta duplicado';
                }
                else if(matchError[1] == 'PRIMARY'){
                    error = 'El ID esta duplicado';
                } 
            }

            res.json({
                status: 400,
                message: "No se guardo el dia",
                error
            });
        }
    }

    public async update(req:Request, res:Response) {
        try {
            const body = req.body;
            const params = req.params;
            checkCamposBody(req,CAMPOS_MODIFICABLES);

            await pool.query(`call upd_dia(${params.za_carrera},${params.za_jornada},${params.za_dia},'${body.dia}',${body.activo})`);

            res.json({
                status: 200,
                message: "Se guardaron los cambios",
                data: {
                    za_carrera: params.za_carrera,
                    za_jornada: params.za_jornada,
                    za_dia: params.za_dia,
                    dia: body.dia,
                    activo: body.activo
                }
             });

        } catch(error){
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'UK_dia'){
                    error = 'El dia esta duplicado';
                }
                else if(matchError[1] == 'PRIMARY'){
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

    public async delete(req:Request, res:Response) {
        try {
            const params = req.params;

            await pool.query(`call del_dia(${params.za_carrera},${params.za_jornada},${params.za_dia})`);

            res.json({
                status: 200,
                message: "Se elimino el día"
             });
        } catch(error) {
            error = error.message;

            const ErrorFkRegex:RegExp = /^ER_ROW_IS_REFERENCED(_2)?:.*$/g;
            let matchError = ErrorFkRegex.exec(error);
            if(matchError){
                error = "Otros registros referencian a este dia";
            }

            res.json({
                status: 400,
                message: "Se cancelo la eliminacion",
                error
            });            
        }
    }

    public async opcionesDiasJornadas(req:Request, res:Response){
        await pool.query("call sen_bot_dias_jornadas("+ req.body.za_dia + "," + req.body.za_jornada + "," + req.body.za_carrera + ",'" + req.body.dia + "'," + req.body.activo + "," + req.body.accion + ");");
        res.json({text:"Operación realizada exitosamente!!!"});
    }

}

const diasJornadasController = new DiasJornadasController();
export default diasJornadasController;