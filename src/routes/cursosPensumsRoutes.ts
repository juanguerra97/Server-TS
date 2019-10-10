import { Router } from 'express';
import cursosPensumsController from '../controllers/cursosPensumsController';

class CursosPensumsRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/',cursosPensumsController.getAllCursosByPensumAndCiclo);
        this.router.get('/:za_carrera(\\d+)/:ano_pensum(\\d+)', cursosPensumsController.getAllCursosPensums);
        this.router.get('/:za_carrera(\\d+)/:ano_pensum(\\d+)/:za_curso(\\d+)', cursosPensumsController.getUnoCursosPensums);
        this.router.post('/', cursosPensumsController.insert);
        this.router.delete('/:za_carrera(\\d+)/:ano_pensum(\\d+)/:za_curso(\\d+)',cursosPensumsController.delete);
        this.router.put('/:za_carrera(\\d+)/:ano_pensum(\\d+)/:za_curso(\\d+)',cursosPensumsController.update);
    }

}

const cursosPensumsRoutes = new CursosPensumsRoutes();
export default cursosPensumsRoutes.router;