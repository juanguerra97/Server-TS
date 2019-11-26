# PlanUMG

Backend del proyecto PlanUMG desarrollado en el curso de Desarrollo Web 2019. Esta aplicación permite registrar las asignaciones de horarios de cursos y catedráticos y genera reportes en formato PDF que se pueden descargar o enviar por correo electrónico.

## Tecnolog&iacute;as utilizadas

- [TypeScript](https://www.typescriptlang.org/)
- [Node.js](https://nodejs.org/)
- [Express.js](https://expressjs.com/)
- [JSON Web Tokens](https://jwt.io/)
- [MySQL](https://www.mysql.com/)

## Ejecuci&oacute;n

1. Clonar el repositorio
    ```
    git clone https://github.com/juanguerra97/planumg_backend.git
    ```
1. Ir al directorio del repositorio clonado
    ```
    cd planumg_backend
    ```
1. Instalar la dependencias
    ```
    npm i
    ```
1. Crear la base de datos
    1. Ve al directorio Database, ah&iacute; est&aacute;n los scripts para crear la base de datos.
    1. Primero ejecuta *script.sql*, despu&eacute;s *reportes.sql* y por &uacute;ltimo *data.sql* 
    
1. Configurar conexi&oacute;n a base de datos
   
   Si est&aacute;s ejecutando la base de datos en una direcci&oacute;n diferente a ***localhost*** debes ir al archivo *src/config.db.ts* y en ***host*** colocar la direcci&oacute;n de tu servidor de base de datos.

1. Configurar correo electr&oacute;nico

    Si quieres utilizar la funcionalidad de enviar reporte por correo electr&oacute;nico entonces necesitas un correo gmail desde el cual enviar los reportes.
    
    Debes configurar tu correo electr&oacute;nico gmail para permitirle el acceso a aplicaciones menos seguras, sigue el paso 1 del siguiente tutorial: https://www.hostinger.com.ar/tutoriales/como-usar-el-servidor-smtp-gmail-gratuito/
    
    Ve a *src/controllers/envioPdfController.ts* y ver&aacute;s una parte de c&oacute;digo como la siguiente:
    ```
    var transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
        user: 'tucorreo@gmail.com',
        pass: 'tucontraseña'
        }
    });
    ```
    En ***user*** coloca tu correo gmail y en ***pass*** la contrase&ntilde;a de ese correo.
    
1. Compilar
    
    Debido a que el c&oacute;digo fuente est&aacute; en TypeScript es necesario compilar a JavaScript:
    ```
    npm run build
    ```
1. Ejecutar
    ```
    npm start
    ```
    
Si todo est&aacute; bien el servidor iniciar&aacute; correctamente. Ahora ya puedes ejecutar el frontend que utiliza este servidor: https://github.com/juanguerra97/planumg_frontend

> Nota: Recuerda siempre compilar el c&oacute;digo antes de ejecutarlo despu&eacute;s de haber realizado alg&uacute;n cambio.


## Autores

- Juan Guerra - [juanguerra97](https://github.com/juanguerra97)
- Hancel Guzm&aacute;n - [HancelGH](https://github.com/HancelGH)
- Allan L&oacute;pez - [EdGames05](https://github.com/EdGames05)
- Frank Orozco - [fkrazy](https://github.com/fkrazy)
