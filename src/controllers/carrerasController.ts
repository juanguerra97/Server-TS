import { Request, Response, Router } from 'express';
import pool from '../db';

class CarrerasController{

    public async getAll (req:Request, res:Response) {
        const carreras = await pool.query('select * from bot_carreras');
        res.json(carreras[0]);
    }

    public async get_Carrera (req:Request, res:Response) {
        const carreras = await pool.query('select * from bot_carreras where za_carrera = ' + req.params.za_carrera);
        res.json(carreras[0]);
    }

    public async nuevaCarrera(req:Request, res:Response){
        await pool.query("call sen_bot_carreras(0,'" + req.body.codigo_carrera + "','" + req.body.nombre_carrera + "'," + req.body.activo + ",1)");
        res.send("Carrera guardada exitosamente!!!");
    }

    public async opcionesCarrera(req:Request, res:Response){
        // Accion = 1, inserta o actualiza
        // Accion = 2, Borra
        await pool.query("call sen_bot_carreras(" + req.body.za_carrera + ",'" + req.body.codigo_carrera + "','" + req.body.nombre_carrera + "'," + req.body.activo + "," + req.body.accion + ");");
        res.send("Operación realizada exitosamente!!!");
    }

    /*public async eliminarCarrera(req:Request, res:Response){
        await pool.query("call sen_bot_carreras(" + req.body.za_carrera + ",'','',0,2);");
        res.send("Carrera actualizada exitosamente!!!");
    }*/

}

const carrerasController = new CarrerasController();
export default carrerasController;