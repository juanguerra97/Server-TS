import { Router } from 'express';
import reporte3Controller from '../controllers/reportecantidadcursosController';

class Reporte3Routes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/', reporte3Controller.getAllreporte);
    }

}

const reporte3Routes = new Reporte3Routes();
export default reporte3Routes.router;