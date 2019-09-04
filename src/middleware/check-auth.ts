import { Request, Response } from 'express';
import jwt from 'jsonwebtoken';

export default (req:Request,res:Response, next:Function) => {

    try{
        if(!req.headers.authorization){
            throw {message:'Falta token de autorizacion'};
        }
        const datos = jwt.verify(req.headers.authorization.split(" ")[1],'VOLDEMORT');
        next();
    }catch(error){
        res.status(401).json({
            status: 400,
            message: 'Usuario no autorizado',
            error: error.message
        })
    }
}