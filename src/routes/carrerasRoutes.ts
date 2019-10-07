import { Router } from 'express';
import carrerasController from '../controllers/carrerasController';

class CarrerasRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/', carrerasController.selectAll);
        this.router.get('/:za_carrera(\\d+)', carrerasController.select);
        this.router.post('/', carrerasController.insert);
        this.router.delete('/:za_carrera(\\d+)', carrerasController.delete);
        this.router.put('/:za_carrera(\\d+)', carrerasController.update)
    }

}

const carrerasRoutes = new CarrerasRoutes();
export default carrerasRoutes.router;
