import { Request, Response, Router } from 'express';
import pool from '../db';
import checkCamposBody from "../utils";

const KEY_CARRERA_PROPS = [
    'za_carrera','codigo_carrera','nombre_carrera'
];

class CarrerasController{

    // Devuelve todas las carreras
    public async selectAll (req:Request, res:Response) {

        try{

            const rows = await pool.query('select * from bot_carreras');

            res.json({
                status: 200,
                message: "Carreras",
                data: rows[0]
            });

        }catch(error){

            res.json({
                status: 400,
                message: "No se pudieron obtener las carreras",
                error:error.message
            });

        }

    }

    // Metodo para obtener los datos de una carrera en particular
    public async select (req:Request, res:Response) {

        try{

            const rows = await pool.query('select * from bot_carreras where za_carrera = ' + req.params.za_carrera);
            
            let carrera = {};
            if(rows[0].length == 1){
                carrera = rows[0][0];
            }

            res.json({
                status: 200,
                message: "Carrera",
                data: carrera
            });

        }catch(error){

            res.json({
                status: 400,
                message: "No se pudo obtener la carrera",
                error:error.message
            });

        }
    }

    // Metodo para insertar una nueva carrera
    public async insert(req:Request, res:Response){

        try{
            let body = req.body;

            // se verifica que el body tenga los campos de la carrera
            checkCamposBody(req,KEY_CARRERA_PROPS);

            // se no se recibe el campo activo, se asume que sera 0
            if(body.activo == undefined){
                body.activo = 0;
            }

            await pool.query(`INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) 
                VALUES(${body.za_carrera},'${body.codigo_carrera}','${body.nombre_carrera}',${body.activo})`);

            res.json({
               status: 200,
               message: "Se guardo la carrera"
            });
        }catch(error){
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'UK_nombre_carrera'){
                    error = 'El nombre de la carrera esta duplicado';
                } else if(matchError[1] == 'UK_codigo_carrera'){
                    error = 'El codigo de la carrera esta duplicado';
                } else if(matchError[1] == 'PRIMARY'){
                    error = 'El ID de la carrera esta duplicado';
                }
            }

            res.json({
               status: 400,
               message: "No se pudo guardar la carrera",
               error
            });
        }
    }

    // Metodo para actualizar una carrera
    public async update(req:Request, res:Response){

        try{
            let body = req.body;
            let za_carrera = req.params.za_carrera;

            // se verifica que el body tenga los campos de la carrera
            checkCamposBody(req,['codigo_carrera','nombre_carrera','activo']);


            await pool.query(`UPDATE bot_carreras 
                SET 
                    codigo_carrera = '${body.codigo_carrera}', 
                    nombre_carrera = '${body.nombre_carrera}',
                    activo = ${body.activo} 
                WHERE za_carrera = ${za_carrera}`);

            res.json({
                status: 200,
                message: "Se guardaron los cambios"
            });
        }catch(error){
            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                if(matchError[1] == 'UK_nombre_carrera'){
                    error = 'El nombre de la carrera esta duplicado';
                } else if(matchError[1] == 'UK_codigo_carrera'){
                    error = 'El codigo de la carrera esta duplicado';
                } else if(matchError[1] == 'PRIMARY'){
                    error = 'El ID de la carrera esta duplicado';
                }
            }

            res.json({
                status: 400,
                message: "No se pudieron guardar los cambios",
                error
            });
        }
    }

    // Metodo para eliminar una carrera
    public async delete(req:Request,res:Response){

        try{
            let za_carrera = req.params.za_carrera;

            await pool.query(`DELETE FROM bot_carreras WHERE za_carrera = ${za_carrera}`);

            res.json({
                status: 200,
                message: "Se elimino la carrera"
            });

        }catch(error){
            error = error.message;

            const ErrorFkRegex:RegExp = /^ER_ROW_IS_REFERENCED_2:.*$/g;
            let matchError = ErrorFkRegex.exec(error);
            if(matchError){
                error = "Otros registros referencian a esta carrera";
            }

            res.json({
               status: 400,
               message: "No se pudo eliminar la carrera",
               error
            });
        }
    }

    public async opcionesCarrera(req:Request, res:Response){
        // Accion = 1, inserta o actualiza
        // Accion = 2, Borra
        try{

            let body = req.body;

            if(body.accion == undefined){
                throw {message:'Falta campo accion'};
            }

            checkCamposBody(req,KEY_CARRERA_PROPS);

            if(body.activo == undefined){
                body.activo = 0;
            }

            await pool.query(`call sen_bot_carreras(${req.body.za_carrera},'${req.body.codigo_carrera}','${req.body.nombre_carrera}',${req.body.activo},${req.body.accion});`);
            
            res.json({
                status: 200,
                message:"Operación realizada exitosamente"
            });

        }catch(error){

            error = error.message;

            const ErrorDupRegex:RegExp = /^ER_DUP_ENTRY:.*for key '(.*)'.*$/g;

            let matchError:any = ErrorDupRegex.exec(error);
            if(matchError){
                    if(matchError[1] == 'UK_nombre_carrera'){
                        error = 'El nombre de la carrera esta duplicado';
                    } else if(matchError[1] == 'UK_codigo_carrera'){
                        error = 'El codigo de la carrera esta duplicado';
                    } else if(matchError[1] == 'PRIMARY'){
                        error = 'El ID de la carrera esta duplicado';
                    }
            }else {
                const ErrorFkRegex:RegExp = /^ER_ROW_IS_REFERENCED_2:.*$/g;
                matchError = ErrorFkRegex.exec(error);
                if(matchError){
                    error = "Otros registros referencian a esta carrera";
                }
            }

            res.json({
                status: 400,
                message: "No se pudo realizar la accion",
                error
            });

        }

    }

}

const carrerasController = new CarrerasController();
export default carrerasController;
