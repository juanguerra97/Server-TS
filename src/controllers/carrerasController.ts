import { Request, Response, Router } from 'express';
import pool from '../db';

const KEY_CARRERA_PROPS = [
    'za_carrera','codigo_carrera','nombre_carrera'
];

class CarrerasController{

    public async getAll (req:Request, res:Response) {

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

    public async get_Carrera (req:Request, res:Response) {

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

    public async nuevaCarrera(req:Request, res:Response){
        await pool.query("call sen_bot_carreras(0,'" + req.body.codigo_carrera + "','" + req.body.nombre_carrera + "'," + req.body.activo + ",1)");
        res.json({text:"Carrera guardada exitosamente!!!"});
    }

    public async opcionesCarrera(req:Request, res:Response){
        // Accion = 1, inserta o actualiza
        // Accion = 2, Borra
        try{

            let body = req.body;

            if(body.accion == undefined){
                throw {message:`Falta campo accion`};
            }

            for(let i = 0; i < KEY_CARRERA_PROPS.length; ++i){
                if(body[KEY_CARRERA_PROPS[i]] == undefined){
                    throw {message:`Falta campo ${KEY_CARRERA_PROPS[i]}`};
                }
            }

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

    /*public async eliminarCarrera(req:Request, res:Response){
        await pool.query("call sen_bot_carreras(" + req.body.za_carrera + ",'','',0,2);");
        res.send("Carrera actualizada exitosamente!!!");
    }*/

}

const carrerasController = new CarrerasController();
export default carrerasController;