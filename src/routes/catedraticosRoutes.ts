import { Router } from 'express';
import catedraticosController from '../controllers/catedraticosController';

class CatedraticosRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/', catedraticosController.getAllCatedraticos);
        this.router.get('/:za_profesor', catedraticosController.getUnoCatedraticos);
        this.router.post('/', catedraticosController.opcionesCatedraticos);
    }

}

const catedraticosRoutes = new CatedraticosRoutes();
export default catedraticosRoutes.router;