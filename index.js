import express from "express";
import knex from "knex";
import cors from "cors";

const app = express();
const port = 1212;
app.use(express.json());
app.use(cors());

const proconnect = knex({
  client: "mysql2",
  connection: {
    host: "127.0.0.1",
    port: 3306,
    user: "root",
    password: "senacrs",
    database: "proconnect",
  },
});

// Get => Listar
// Post => Criar
// Put => Editar Vários (usuários, informaçoes, etc)
// Patch => Edita apenas UM
// Delete => Deletar

// app.get('/usuarios') // Trzer todo os usuarios
// app.post('/usuarios') // Cria um novo usuario
// app.put('/usuarios') // Edita um usuario
// app.delete('/usuarios') // Deleta um usuario

/*  O que Se precisa
  1) Tipo de Rota / Método HTTP
  2) Endereço ('/')
*/

app.get('/usuario', async (req, res) => {
  const usuarios = await proconnect.select("*").from("usuarios");
  res.send(usuarios)
})

app.post('/registro', async (req,res) => {
  const { nome, email, senha } = req.body;
  const nUsuario = await proconnect("usuarios").insert({ nome, email, senha })
  res.json(nUsuario);
})

app.post('/login', async (req,res) => {
  const { email, senha } = req.body;
  const usuario = await proconnect("usuarios").where({ email }).first()
  if(senha !== usuario.senha) {
    return res.status(401).json({ message: "Usuário ou senha inválidos" });
  }
  console.log(usuario);
  
  if(!usuario) {
    return res.status(401).json({ message: "Usuário ou senha inválidos" });
  }
  res.json(usuario);
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
