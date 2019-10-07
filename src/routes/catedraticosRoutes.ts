import { Router } from 'express';
import catedraticosController from '../controllers/catedraticosController';
import checkCamposBody from "../utils";

class CatedraticosRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('/', catedraticosController.selectAll);
        this.router.get('/:za_profesor(\\d+)', catedraticosController.select);
        this.router.post('/', catedraticosController.insert);
        this.router.delete('/:za_profesor(\\d+)',catedraticosController.delete);
        this.router.put('/:za_profesor(\\d+)', catedraticosController.update);
    }

}

const catedraticosRoutes = new CatedraticosRoutes();
export default catedraticosRoutes.router;
