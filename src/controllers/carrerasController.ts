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
        
    }

}

const carrerasController = new CarrerasController();
export default carrerasController;