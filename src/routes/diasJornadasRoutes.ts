import { Router } from 'express';
import diasJornadasController from '../controllers/diasJornadasController';

class CarrerasRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/:za_carrera/:za_jornada', diasJornadasController.getAllDiasJornadas);
        this.router.get('/:za_carrera/:za_jornada/:za_dia', diasJornadasController.getUnaDiaJornada);
        this.router.post('/', diasJornadasController.opcionesDiasJornadas);
    }

}

const carrerasRoutes = new CarrerasRoutes();
export default carrerasRoutes.router;