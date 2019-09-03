import { Router } from 'express';
import  reporte2Controller  from '../controllers/reportecatedraticosController';

class Reporte2Routes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/:Codigo_catedratico/:anio/:no_semestre', reporte2Controller.getOneCatedratico);
    }

}

const reporte2Routes = new Reporte2Routes();
export default reporte2Routes.router;