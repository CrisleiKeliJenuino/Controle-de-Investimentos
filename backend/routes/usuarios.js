const express = require('express');
const router = express.Router();

const db = require('../config/db');

// Rota para criar um novo usuário
router.post('/', (req, res) => {
    const { nome, email, senha } = req.body;  

    const sql = `INSERT INTO usuarios (nome, email, senha) 
    VALUES (?, ?, ?)
    `;

    db.query(sql, [nome, email, senha], (err, result) => {
        if (err) {
            console.error("Erro ao criar usuário:", err);
            return res.status(500).json({ error: "Erro ao criar usuário" });
        }
        res.status(201).json({ 
            message: "Usuário criado com sucesso",
            id: result.insertId
        });
    });
});

module.exports = router;