import { Router } from 'express';
import envioPdfController from '../controllers/envioPdfController';

class EnvioPdfRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.post('/', envioPdfController.enviarPdf);
    }

}

const envioPdfRoutes = new EnvioPdfRoutes();
export default envioPdfRoutes.router;