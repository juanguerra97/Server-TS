import { Router } from 'express';
import pensumsController from '../controllers/pensumsController';

class PensumsRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/:za_carrera(\\d+)', pensumsController.selectAllPensumsByCarrera);
        this.router.get('/:za_carrera(\\d+)/:ano_pensum(\\d+)', pensumsController.selectPensum);
        this.router.post('/', pensumsController.insert);
        this.router.delete('/:za_carrera(\\d+)/:ano_pensum(\\d+)', pensumsController.delete);
        this.router.put('/:za_carrera(\\d+)/:ano_pensum(\\d+)',pensumsController.update);
    }

}

const pensumsRoutes = new PensumsRoutes();
export default pensumsRoutes.router;