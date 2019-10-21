import { Router } from 'express';
import cursosControllers from '../controllers/cursosControllers';

class CursosRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/', cursosControllers.selectAll);
        this.router.get('/:za_curso(\\d+)', cursosControllers.select);
        this.router.post('/', cursosControllers.insert);
        this.router.delete('/:za_curso(\\d+)', cursosControllers.delete);
        this.router.put('/:za_curso(\\d+)', cursosControllers.update);
    }

}

const cursosRoutes = new CursosRoutes();
export default cursosRoutes.router;
