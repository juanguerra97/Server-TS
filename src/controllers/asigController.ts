import { Request, Response } from 'express';
import pool from '../db';

const DupErrorRegex:RegExp = /^ER_DUP_ENTRY:.*$/;

const KEY_ASIG_PROPS = [
    'za_carrera','ano_pensum','za_jornada',
    'ano','no_semestre','seccion',
    'za_curso','za_profesor',
    'za_dia','hora_inicio'
];

const All_ASIG_PROPS = [
    ...KEY_ASIG_PROPS,'hora_fin'
];

const UPD_ASIG_PROPS = [
    'za_curso','za_profesor','za_dia','hora_inicio','hora_fin'
];

class AsigController{

    

    public async getAllAsignaciones (req:Request, res:Response) {
        
        try{

            let whereClause = "WHERE";
            if(req.query.za_carrera != undefined){
                whereClause += ` A.za_carrera=${req.query.za_carrera} AND`;
            }
            if(req.query.ano_pesum != undefined){
                whereClause += ` A.ano_pensum=${req.query.ano_pensum} AND`;
            }
            if(req.query.za_jornada != undefined){
                whereClause += ` A.za_jornada=${req.query.za_jornada} AND`;
            }
            if(req.query.ano != undefined){
                whereClause += ` A.ano=${req.query.ano} AND`;
            }
            if(req.query.no_semestre != undefined){
                whereClause += ` A.no_semestre=${req.query.no_semestre} AND`;
            }
            if(req.query.seccion != undefined){
                whereClause += ` A.seccion='${req.query.seccion}' AND`;
            }
            whereClause += " 1=1";

            const rows = await pool.query(
            `SELECT A.za_carrera, A.ano_pensum, A.za_jornada, 
                A.ano, A.no_semestre, A.seccion,
                A.za_curso, CU.nombre_curso, CU.usa_laboratorio, CU.activo AS curso_activo,
                A.za_profesor, CA.nombres, CA.apellidos, CA.profesion, CA.activo AS profesor_activo,
                A.za_dia, D.dia, 
                hora_inicio,hora_fin
            FROM bot_asignaciones A
                JOIN bot_dias_jornadas D 
                JOIN bot_catedraticos CA
                JOIN bot_cursos CU
                ON A.za_curso = CU.za_curso  
                    AND A.za_profesor = CA.za_profesor 
                    AND A.za_carrera = D.za_carrera  
                    AND A.za_jornada = D.za_jornada  
                    AND A.za_dia = D.za_dia ${whereClause}`);
            // WHERE A.za_carrera = ${req.query.za_carrera}  
            //     AND A.ano_pensum = ${req.query.ano_pensum} 
            //     AND A.za_jornada = ${req.query.za_jornada} 
            //     AND A.ano = ${req.query.ano}
            //     AND A.no_semestre = ${req.query.no_semestre} 
            //     AND A.seccion = '${req.query.seccion}'`);
        res.json({
            status: 200,
            message: "OK",
            data: rows[0]
        });

        }catch(error){
            res.json({
                status: 400,
                message: "Ocurrió un error",
                error:{
                    message: ""+error
                }
            });
        }
        
    }

    public async insertAsignacion(req:Request, res:Response){
        
        try{
            const nueva = req.body;
            
            for(let i = 0; i < All_ASIG_PROPS.length; ++i){
                if(!nueva.hasOwnProperty(All_ASIG_PROPS[i]) 
                    || nueva[All_ASIG_PROPS[i]] == undefined){
                        throw {message:`Falta campo ${All_ASIG_PROPS[i]}`};
                }
            }

            await pool.query(
                `INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,
                    ano,no_semestre,seccion,za_curso,za_profesor,
                    za_dia,hora_inicio,hora_fin) 
                VALUES(${nueva.za_carrera},${nueva.ano_pensum},
                    ${nueva.za_jornada},${nueva.ano},${nueva.no_semestre},
                    '${nueva.seccion}',${nueva.za_curso},${nueva.za_profesor},
                    ${nueva.za_dia},'${nueva.hora_inicio}','${nueva.hora_fin}')`);
            
            // await pool.query(`
            //     call sen_bot_asignaciones(${nueva.za_carrera},${nueva.ano_pensum},
            //         ${nueva.za_jornada},${nueva.ano},${nueva.no_semestre},'${nueva.seccion}',
            //         ${nueva.za_curso},${nueva.za_profesor},
            //         ${nueva.za_dia},'${nueva.hora_inicio}','${nueva.hora_fin}',1)`);
            res.json({
                status: 200,
                message: "Se insertó un nueva asignación"
            });
        }catch(error){
            
            error = error.message;
            if(DupErrorRegex.test(error)){
                error = "Datos duplicados";
            }
            res.json({
                status: 400,
                message: "Ocurrió un error",
                error:{
                    message: ""+error
                }
            });
        }
    }


    public async deleteAsignacion(req:Request, res:Response){
        try{
            const asig = req.body;
            
            for(let i = 0; i < KEY_ASIG_PROPS.length; ++i){
                if(asig[KEY_ASIG_PROPS[i]] == undefined){
                        throw {message:`Falta campo ${KEY_ASIG_PROPS[i]}`};
                }
            }

            const rs = await pool.query(`DELETE FROM bot_asignaciones WHERE
                 za_carrera=${asig.za_carrera} AND
                 ano_pensum=${asig.ano_pensum} AND
                 za_jornada=${asig.za_jornada} AND
                 ano=${asig.ano} AND
                 no_semestre=${asig.no_semestre} AND
                 za_curso=${asig.za_curso} AND 
                 za_profesor=${asig.za_profesor} AND 
                 za_dia=${asig.za_dia} AND
                 hora_inicio='${asig.hora_inicio}'`);

            res.json({
                status: 200,
                message: "Se eliminó una asignación"
            });
        }catch(error){
            res.json({
                status: 400,
                message: "Ocurrió un error",
                error:{
                    message: ""+error.message
                }
            });
        }
    }

    public async updateAsignacion(req:Request, res:Response){
       
        const old = req.body.old;
        const upd = req.body.update;

        try{

            for(let i = 0; i < KEY_ASIG_PROPS.length; ++i){
                if(old[KEY_ASIG_PROPS[i]] == undefined){
                        throw {message:`Falta campo clave ${KEY_ASIG_PROPS[i]}`};
                }
            }

            for(let i = 0; i < UPD_ASIG_PROPS.length; ++i){
                if(upd[UPD_ASIG_PROPS[i]] == undefined){
                        throw {message:`Falta campo ${UPD_ASIG_PROPS[i]}`};
                }
            }

            const rs = await pool.query(
                `UPDATE bot_asignaciones SET 
                    za_curso=${upd.za_curso}, 
                    za_profesor=${upd.za_profesor},
                    za_dia=${upd.za_dia}, 
                    hora_inicio='${upd.hora_inicio}',
                    hora_fin='${upd.hora_fin}'
                WHERE za_carrera=${old.za_carrera} AND 
                    ano_pensum=${old.ano_pensum} AND
                    za_jornada=${old.za_jornada} AND
                    ano=${old.ano} AND 
                    no_semestre=${old.no_semestre} AND
                    seccion='${old.seccion}' AND
                    za_curso=${old.za_curso} AND 
                    za_profesor=${old.za_profesor} AND
                    za_dia=${old.za_dia} AND
                    hora_inicio='${old.hora_inicio}'`);
        
            res.json({
                status: 200,
                message: "Se actualizó una asignación"
            });
        }catch(error){

            error = error.message;
            if(DupErrorRegex.test(error)){
                error = "Datos duplicados";
            }
            res.json({
                status: 400,
                message: "Ocurrió un error",
                error:{
                    message: ""+error
                }
            });
        }
    }

}

const asigController = new AsigController();
export default asigController;