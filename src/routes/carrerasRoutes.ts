import { Router } from 'express';
import carrerasController from '../controllers/carrerasController';

class CarrerasRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/', carrerasController.getAll);
        this.router.get('/:za_carrera', carrerasController.get_Carrera);
        this.router.post('/', carrerasController.opcionesCarrera);
    }

}

const carrerasRoutes = new CarrerasRoutes();
export default carrerasRoutes.router;