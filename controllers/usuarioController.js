const pool = require("../../database/db.js");

const bienvenido = (req, res) => {
    res.send("Bienvenido a la página principal");
};

const crearUsuario = async (req, res) => {
    const { nombre, rut, correo, contrasena, id_tipo_usuario } = req.body;

    const newUsuario = {
        nombre: nombre,
        rut: rut,
        correo: correo,
        contrasena: contrasena,
        id_tipo_usuario: id_tipo_usuario
    };

    await pool.query("INSERT INTO usuario set ?", [newUsuario]);
    res.redirect("/");
};

const loguearUsuario = async (req, res) => {
    const { correo, contrasena } = req.body;
    const [rows] = await pool.query("SELECT * FROM usuario WHERE correo = ? AND contrasena = ?", [correo, contrasena]);

    if (rows.length > 0) {
        res.redirect("/");  // Redirige a donde quieras tras un inicio de sesión exitoso
    } else {
        res.send("Correo electrónico o contraseña incorrectos");
    }
};

module.exports = {
    bienvenido,
    crearUsuario,
    loguearUsuario
};