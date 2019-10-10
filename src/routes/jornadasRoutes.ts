import { Router } from 'express';
import jornadasController from '../controllers/jornadasController';

class JornadasRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/:za_carrera(\\d+)', jornadasController.selectAllByCarrera);
        this.router.get('/:za_carrera(\\d+)/:za_jornada(\\d+)', jornadasController.select);
        this.router.post('/', jornadasController.insert);
        this.router.delete('/:za_carrera(\\d+)/:za_jornada(\\d+)', jornadasController.delete);
        this.router.put('/:za_carrera(\\d+)/:za_jornada(\\d+)', jornadasController.update);
    }

}

const jornadasRoutes = new JornadasRoutes();
export default jornadasRoutes.router;