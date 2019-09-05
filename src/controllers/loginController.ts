import { Request, Response } from 'express';
import pool from '../db';
import jwt from 'jsonwebtoken';

class LoginController{

    public async login(req:Request,res:Response){
        try{
            if(req.body.usuario == undefined){
                throw {message: 'Se requiere el nombre de usuario'};
            }
            if(req.body.contrasena == undefined){
                throw {message: 'Se requiere la contraseña'};
            }
            
            const rows = await pool.query(
                `SELECT za_usuario,usuario,contrasena,activo 
                FROM bot_usuarios 
                WHERE usuario = '${req.body.usuario}'`
            );
            
            if(rows[0].length > 0){
                const user = rows[0][0];
                if(user.usuario == req.body.usuario && user.contrasena == req.body.contrasena){
                    
                    if(user.activo.data[0] != 1){
                        throw {message:'Usuario inactivo'};
                    }

                    const token = jwt.sign({
                        za_usuario:user.za_usuario,
                        usuario:user.usuario
                    }, 
                    'VOLDEMORT',
                    {
                        expiresIn: '1d'
                    });

                    res.json({
                        status: 200,
                        message: 'Usuario autenticado',
                        data: {
                            za_usuario: user.za_usuario,
                            usuario: user.usuario,
                            token
                        }
                    });

                } else {
                    throw {message:'Credenciales invalidas'};
                }
            }else{
                throw {message: 'Credenciales invalidas'};
            }
        }catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: 'No se puede iniciar sesion',
                error
            });
        }
    }


}

const loginController = new LoginController();
export default loginController;