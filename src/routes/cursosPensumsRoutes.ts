import { Router } from 'express';
import cursosPensumsController from '../controllers/cursosPensumsController';

class CursosPensumsRoutes{

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

const cursosPensumsRoutes = new CursosPensumsRoutes();
export default cursosPensumsRoutes.router;