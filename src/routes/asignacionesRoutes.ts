import { Router } from 'express';
import asignacionesController from '../controllers/asignacionesController';

class AsignacionesRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/:za_carrera/:za_curso/:ano_pensum', asignacionesController.getAllAsignaciones);
        this.router.get('/:za_carrera/:za_profesor/:za_curso/:ano_pensum', asignacionesController.getUnaAsignaciones);
        this.router.post('/', asignacionesController.getUnaAsignaciones);
    }

}

const asignacionesRoutes = new AsignacionesRoutes();
export default asignacionesRoutes.router;