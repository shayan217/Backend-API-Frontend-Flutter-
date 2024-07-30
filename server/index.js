const express = require("express");
const mongoose = require("mongoose");
const userModel = require("./users");
const app = express();
const port = 3000;
const cors = require("cors");

mongoose
  .connect("mongodb://127.0.0.1:27017/myapp")
  .then(() => {
    console.log("connected");
  })
  .catch((err) => {
    console.log("ERROR: " + err);
  });

app.use(express.json());
app.use(cors());

app.post("/users", (req, res) => {
  let data = new userModel(req.body);
  data
    .save()
    .then((result) => {
      console.log(result);
      res.json(result);
    })
    .catch((err) => {
      console.log(err);
      res.status(500).json({ error: "Internal Server Error" });
    });
});

app.get("/users", (req, res) => {
  userModel
    .find()
    .then((users) => {
      res.json(users);
    })
    .catch((err) => {
      console.log(err);
      res.status(500).json({ error: "Internal Server Error" });
    });
});



app.listen(port, () => {
  console.log(`App running on port ${port}`);
});















