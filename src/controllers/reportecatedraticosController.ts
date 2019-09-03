import { Request, Response } from 'express';
import pool from '../db';

class reportecatedraticosController{
  
    public async getOneCatedratico(req:Request, res:Response) {
        const rows = await pool.query('call reporte_catedratico('+req.params.Codigo_catedratico+','+req.params.anio+','+req.params.no_semestre+' )');
        res.json(rows[0][0]);
    }
}

const reporte2Controller = new reportecatedraticosController();
export default reporte2Controller;