import { Router } from 'express';
import asigController from '../controllers/asigController';

class AsigRoutes{

    public router: Router;

    constructor(){
        this.router = Router();
        this.config();
    }

    config():void{
        this.router.get('', asigController.getAllAsignaciones);
        this.router.post('', asigController.insertAsignacion);
        this.router.delete('',asigController.deleteAsignacion);
        this.router.put('',asigController.updateAsignacion);
    }

}

const asigRoutes = new AsigRoutes();
export default asigRoutes.router;