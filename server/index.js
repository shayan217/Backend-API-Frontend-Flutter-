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

// Create a new user
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

// Read all users
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

// Update a user by ID
app.put("/users/:id", (req, res) => {
  const userId = req.params.id;
  const updatedData = req.body;

  userModel
    .findByIdAndUpdate(userId, updatedData, { new: true, runValidators: true })
    .then((updatedUser) => {
      if (!updatedUser) {
        return res.status(404).json({ error: "User not found" });
      }
      res.json(updatedUser);
    })
    .catch((err) => {
      console.log(err);
      res.status(500).json({ error: "Internal Server Error" });
    });
});

// Delete a user by ID
app.delete("/users/:id", (req, res) => {
  const userId = req.params.id;

  userModel
    .findByIdAndDelete(userId)
    .then((deletedUser) => {
      if (!deletedUser) {
        return res.status(404).json({ error: "User not found" });
      }
      res.json({ message: "User deleted successfully", deletedUser });
    })
    .catch((err) => {
      console.log(err);
      res.status(500).json({ error: "Internal Server Error" });
    });
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
