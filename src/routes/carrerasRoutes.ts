import { Router } from 'express';
import carrerasController from '../controllers/carrerasController';

class IndexRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/', carrerasController.getAll);
        this.router.get('/:za_carrera', carrerasController.get_Carrera);
    }

}

const indexRoutes = new IndexRoutes();
export default indexRoutes.router;