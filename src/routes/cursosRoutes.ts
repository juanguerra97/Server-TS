import { Router } from 'express';
import cursosControllers from '../controllers/cursosControllers';

class CursosRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/', cursosControllers.getAllCursos);
        this.router.get('/:za_curso', cursosControllers.getUnoCurso);
        this.router.post('/', cursosControllers.opcionesCurso);
    }

}

const cursosRoutes = new CursosRoutes();
export default cursosRoutes.router;