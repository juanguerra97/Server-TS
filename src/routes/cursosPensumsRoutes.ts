import { Router } from 'express';
import cursosPensumsController from '../controllers/cursosPensumsController';

class IndexRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/:za_carrera/:ano_pensum', cursosPensumsController.getAllCursosPensums);
        this.router.get('/:za_carrera/:ano_pensum/:za_curso', cursosPensumsController.getUnoCursosPensums);
        this.router.post('/', cursosPensumsController.opcionesCursosPensums);
    }

}

const indexRoutes = new IndexRoutes();
export default indexRoutes.router;