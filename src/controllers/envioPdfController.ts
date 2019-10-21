import { Request, Response } from 'express';
import * as nodemailer from 'nodemailer';
import checkCamposBody from '../utils';

class EnvioPdfController{

    public async enviarPdf(req:Request,res:Response){
        try{
            
            checkCamposBody(req,['correo','pdf','asunto','texto','nombrepdf']);
            const body = req.body;

            var transporter = nodemailer.createTransport({
                service: 'gmail',
                auth: {
                  user: 'deswebumg@gmail.com',
                  pass: 'desarrollo2019'
                }
              });
              
              var mailOptions = {
                from: 'deswebumg@gmail.com',
                to: body.correo,
                subject: body.asunto,
                text: body.texto,
                attachments: [
                    {
                        filename: body.nombrepdf,
                        path: body.pdf,
                        contentType: 'application/pdf',
                        encoding: 'base64'   
                    }
                ]
              };
              
              transporter.sendMail(mailOptions, function(error, info){
                if (error) {
                  res.json({
                      status:200,
                      message: "No se pudo enviar el email",
                      error
                  });
                } else {
                  res.json({
                      status: 200,
                      message: "Email enviado"
                  });
                }
              }); 
        }catch(error){
            error = error.message;
            res.json({
                status: 400,
                message: 'No se pudo enviar el email',
                error
            });
        }
    }


}

const envioPdfController = new EnvioPdfController();
export default envioPdfController;