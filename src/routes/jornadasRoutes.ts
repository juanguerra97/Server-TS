import { Router } from 'express';
import jornadasController from '../controllers/jornadasController';

class JornadasRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/:za_carrera', jornadasController.getAllJornadas);
        this.router.get('/:za_carrera/:za_jornada', jornadasController.getUnaJornada);
        this.router.post('/', jornadasController.opcionesJornadas);
    }

}

const jornadasRoutes = new JornadasRoutes();
export default jornadasRoutes.router;