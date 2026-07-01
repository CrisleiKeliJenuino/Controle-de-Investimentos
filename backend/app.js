 
const express = require('express');
const cors = require('cors');
require("dotenv").config();
require('./config/db');

const app = express();

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.json({
        status: "API funcionando",
        projeto: "InvestControl"
    });
});

const usuariosRoutes = require("./routes/usuarios");
app.use("/usuarios", usuariosRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);   
});