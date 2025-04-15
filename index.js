import express from "express";
import knex from "knex";
import cors from "cors";

const app = express();
const port = 1212;
app.use(express.json());
app.use(cors());

const knexDb = knex({
  client: "mysql2",
  connection: {
    host: "127.0.0.1",
    port: 3306,
    user: "root",
    password: "root",
    database: "proconnect",
  },
});

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})