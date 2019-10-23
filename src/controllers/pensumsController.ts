import { Request, Response } from 'express';
import pool from '../db';
import checkCamposBody from '../utils';

const CAMPOS_MODIFICABLES = ['codigo_pensum','activo'];
const CAMPOS_PENSUM = ['za_carrera','ano_pensum',...CAMPOS_MODIFICABLES];

class PensumsController{

    public async selectAllPensumsByCarrera (req:Request, res:Response) {
        
        try {
            const rows = await pool.query('call cos_bot_pensums(' + req.params.za_carrera + ',0);');

            res.json({
                status:200,
                message: '',
                data: rows[0][0]
            });
        } catch( error) {
            error = error.message;
            res.json({
                status: 400,
                message: 'No se pudieron obtener los pensums',
                error
            });
        }
    }

    public async selectPensum (req:Request, res:Response) {
        
        try {

            const rows = await pool.query('call cos_bot_pensums(' + req.params.za_carrera + ',' + req.params.ano_pensum + ');');
            
            let pensum = {};
            if(rows[0].length == 1){
                pensum = rows[0][0];
            }

            res.json({
                status:200,
                message: '',
                data: pensum
            })
        } catch( error) {
            error = error.message;
            res.json({
                status: 400,
                message: 'No se pudo obtener el pensum',
                error
            })
        }
    }

    public async insert(req:Request, res:Response) {
        try {
            const body = req.body;

            checkCamposBody(req,CAMPOS_PENSUM);

            await pool.query(`call ins_pensum(${body.za_carrera},${body.ano_pensum},'${body.codigo_pensum}',${body.activo})`);

            res.json({
                status: 200,
                message: "Se guardo el pensum",
                data: {
                    za_carrera: body.za_carrera,
                    ano_pensum: body.ano_pensum,
                    codigo_pensum: body.codigo_pensum,
                    activo: body.activo
                }
            });
        } catch(error) {
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'UK_codigo_pensum'){
                    error = 'El codigo esta duplicado';
                } else if(matchError[1] == 'PRIMARY'){
                    error = 'El ID esta duplicado';
                }
            }

            res.json({
               status: 400,
               message: "No se guardo el pensum",
               error
            });
        }
    }

    public async update(req:Request, res:Response) {
        try {
            const body = req.body;
            const params = req.params;

            checkCamposBody(req,CAMPOS_MODIFICABLES);

            await pool.query(`call upd_pensum(${params.za_carrera},${params.ano_pensum},'${body.codigo_pensum}',${body.activo})`);

            res.json({
                status: 200,
                message: "Se guardaron los cambios",
                data: {
                    za_carrera: params.za_carrera,
                    ano_pensum: params.ano_pensum,
                    codigo_pensum: body.codigo_pensum,
                    activo: body.activo
                }
            });
        } catch(error) {
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'UK_codigo_pensum'){
                    error = 'El codigoesta duplicado';
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
            const { za_carrera:za_carrera, ano_pensum:ano_pensum } = req.params;

            await pool.query(`call del_pensum(${za_carrera},${ano_pensum})`);

            res.json({
                status: 200,
                message: "Se elimino el pensum"
            });

        }catch(error){
            error = error.message;

            const ErrorFkRegex:RegExp = /^ER_ROW_IS_REFERENCED(_2)?:.*$/g;
            let matchError = ErrorFkRegex.exec(error);
            if(matchError){
                error = "Otros registros referencian a este pensum";
            }

            res.json({
               status: 400,
               message: "Se cancelo la eliminacion",
               error
            });
        }
    }

    public async opcionesPensums (req:Request, res:Response) {
        await pool.query("call sen_bot_pensums(" + req.body.ano_pensum + "," + req.body.za_carrera + "," + req.body.codigo_pensum + "," + req.body.activo + "," + req.body.accion + ");")
        res.json({text:"Operación realizada exitosamente!!!"});
    }

}

const pensumsController = new PensumsController();
export default pensumsController;