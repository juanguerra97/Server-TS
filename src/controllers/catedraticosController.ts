import { Request, Response } from 'express';
import pool from '../db';
import checkCamposBody from "../utils";

const CAMPOS_CATEDRATICO_MODIFICABLES = [
    'nombres','apellidos',
    'profesion','activo'
];

const CAMPOS_CATEDRATICO = [
  'za_profesor', ...CAMPOS_CATEDRATICO_MODIFICABLES
];

class CatedraticosController{

    public async selectAll (req:Request, res:Response) {
        try{
            const rows = await pool.query('select * from bot_catedraticos');
            res.json({
                status: 200,
                message: "Catedraticos",
                data: rows[0]
            })
        }catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: "No se pudieron obtener los catedraticos",
                error
            })
        }
    }

    public async select (req:Request, res:Response) {
        try{
            const rows = await pool.query('select * from bot_catedraticos where za_profesor = ' + req.params.za_profesor);
            let catedratico = {};
            if(rows[0].length == 1){
                catedratico = rows[0][0];
            }
            res.json({
                status: 200,
                message: "Catedratico",
                data: catedratico
            });
        } catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: "No se pudo obtener el catedratico",
                error
            })
        }
    }

    public async insert(req:Request, res:Response) {

        try{

            let body = req.body;
            checkCamposBody(req,CAMPOS_CATEDRATICO);

            if(body.activo == undefined){
                body.activo = 0;
            }

            const rs = await pool.query(`SELECT ins_catedratico('${body.nombres}','${body.apellidos}','${body.profesion}',${body.activo}) as za_profesor`);
            const {za_profesor} = rs[0][0];


            res.json({
               status: 200,
               message: "Se guardo el catedratico",
               data: {
                   za_profesor,
                   nombres: body.nombres,
                   apellidos: body.apellidos,
                   profesion: body.profesion,
                   activo: body.activo
               }
            });

        } catch(error){
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'PRIMARY'){
                    error = 'El ID del catedratico esta duplicado';
                }
            }

            res.json({
                status: 400,
                message: "No se pudo guardar el catedratico",
                error
            });
        }

    }

    public async update(req:Request, res:Response) {

        try{

            let body = req.body;
            let za_profesor = req.params.za_profesor;
            checkCamposBody(req,CAMPOS_CATEDRATICO_MODIFICABLES);

            await pool.query(`call upd_catedratico(${za_profesor},'${body.nombres}','${body.apellidos}','${body.profesion}',${body.activo})`);

            res.json({
                status: 200,
                message: "Se guardaron los cambios"
            });

        } catch(error){
            error = error.message;

            res.json({
                status: 400,
                message: "No se pudieron guardar los cambios",
                error
            });
        }

    }

    public async delete(req:Request,res:Response){

        try{
            let za_profesor = req.params.za_profesor;

            await pool.query(`DELETE FROM bot_catedraticos WHERE za_profesor = ${za_profesor}`);

            res.json({
                status: 200,
                message: "Se elimino el catedratico"
            });

        }catch(error){
            error = error.message;

            const ErrorFkRegex:RegExp = /^ER_ROW_IS_REFERENCED(_2)?:.*$/g;
            let matchError = ErrorFkRegex.exec(error);
            if(matchError){
                error = "Otros registros referencian a este catedratico";
            }

            res.json({
                status: 400,
                message: "No se pudo eliminar el catedratico",
                error
            });
        }
    }


    public async opcionesCatedraticos (req:Request, res:Response) {
        await pool.query("call sen_bot_catedraticos(" + req.body.za_profesor + ",'" + req.body.nombres + "','" + req.body.apellidos + "','" + req.body.profesion + "'," + req.body.activo + "," + req.body.accion + ");");
        res.json({text: "Operación realizada exitosamente!!!"});
    }

}

const catedraticosController = new CatedraticosController();
export default catedraticosController;
