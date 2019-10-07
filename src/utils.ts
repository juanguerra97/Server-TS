import { Request } from 'express';

// funcion que verifica que el body de una peticion tenga ciertos campos
// tira una excepcion si falta un campo
export default function checkCamposBody(req:Request, campos:string[]):void {
    let body = req.body;
    for(let i = 0; i < campos.length; ++i){
        if(body[campos[i]] == undefined){
            throw {message:`Falta campo ${campos[i]}`};
        }
    }
}
