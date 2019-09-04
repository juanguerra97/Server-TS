import express, { Application } from 'express';
import indexRoutes from './routes/indexRoutes';
import carrerasRoutes from './routes/carrerasRoutes';
import jornadasRoutes from './routes/jornadasRoutes';
import diasJornadasRoutes from './routes/diasJornadasRoutes';
import pensumsRoutes from './routes/pensumsRoutes';
import cursosRoutes from './routes/cursosRoutes';
import catedraticosRoutes from './routes/catedraticosRoutes';
import cursosPensumsRoutes from './routes/cursosPensumsRoutes';
//import asignaciones from './routes/asignacionesRoutes';
import asigRoutes from './routes/asigRoutes';
import reporte3Routes from './routes/reportecantidadcursoRoutes'; 
import morgan from 'morgan';
import cors from 'cors';
import reporte2Routes from './routes/reportecatedraticosRoutes';
import path from 'path';
import loginRoutes from './routes/loginRoutes';

class Server{

    public app: Application;
    

    constructor(){
        this.app = express();
        this.config();
        this.routes();
    }

    config():void{
        this.app.set('port', process.env.PORT || 4000);
        //this.app.set('host', "www.universidadguatemalteca.com.gt" || "localhost");
        this.app.use(morgan('dev'));
        this.app.use(express.json());
        this.app.use(express.urlencoded({extended: false}));
        this.app.use(express.static(__dirname + '/dist'));
        this.app.use(cors());
        // this.app.use(function(req, res, next) {
        //     res.header("Access-Control-Allow-Origin", "*");
        //     res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization");
        //     if(req.method === "OPTIONS"){
        //         res.header("Access-Control-Allow-Methods","GET, POST, DELETE, PUT, PATCH, HEAD, OPTIONS");
        //         return res.status(200).json({});
        //     }
        //     next();
        // });
        
    }

    routes():void{
        //this.app.use(indexRoutes);
        this.app.use('/cruds/carreras', carrerasRoutes);
        this.app.use('/cruds/jornadas', jornadasRoutes);
        this.app.use('/cruds/diasjornadas', diasJornadasRoutes);
        this.app.use('/cruds/pensums', pensumsRoutes);
        this.app.use('/cruds/cursos', cursosRoutes);
        this.app.use('/cruds/catedraticos', catedraticosRoutes);
        this.app.use('/cruds/cursosPensums', cursosPensumsRoutes);
        //this.app.use('/cruds/asignaciones', asignaciones);
        this.app.use('/cruds/asignaciones', asigRoutes);
        this.app.use('/reportes/reporte3',reporte3Routes);
        this.app.use('/reportes/reporte2',reporte2Routes);
        this.app.use('/login',loginRoutes);


        this.app.get('/', function(req, res) {
            res.sendFile(path.join(__dirname));
        });
        
    }

    iniciar():void{
        this.app.listen(this.app.get('port'), () => {
            console.log("Servidor corriendo en el puerto: " + this.app.get('port'));
        });
    }

}

const server = new Server();
server.iniciar();