import { Router } from 'express';
import pensumsController from '../controllers/pensumsController';

class PensumsRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/:za_carrera', pensumsController.getAllPensums);
        this.router.get('/:za_carrera/:ano_pensum', pensumsController.getOnePensums);
        this.router.post('/', pensumsController.opcionesPensums);
    }

}

const pensumsRoutes = new PensumsRoutes();
export default pensumsRoutes.router;