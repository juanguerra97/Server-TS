import { Router } from 'express';
import diasJornadasController from '../controllers/diasJornadasController';

class CarrerasRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/:za_carrera(\\d+)/:za_jornada(\\d+)', diasJornadasController.getAllDiasJornadas);
        this.router.get('/:za_carrera(\\d+)/:za_jornada(\\d+)/:za_dia(\\d+)', diasJornadasController.getUnaDiaJornada);
        this.router.post('/', diasJornadasController.insert);
        this.router.delete('/:za_carrera(\\d+)/:za_jornada(\\d+)/:za_dia(\\d+)',diasJornadasController.delete);
        this.router.put('/:za_carrera(\\d+)/:za_jornada(\\d+)/:za_dia(\\d+)',diasJornadasController.update);
    }

}

const carrerasRoutes = new CarrerasRoutes();
export default carrerasRoutes.router;