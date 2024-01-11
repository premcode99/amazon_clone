console.log("Hello World");
const express = require("express");
const mongoose = require('mongoose');


const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");

const PORT = 3000;
const app = express();
const DB = `mongodb+srv://prem:prem123@cluster0.ccndr6n.mongodb.net/?retryWrites=true&w=majority`;

//middleware
app.use(express.json())
app.use(authRouter)
app.use(adminRouter)


mongoose
    .connect(DB)
    .then(() => {
        console.log("Connection Successful");
    }).catch((e) => {
        console.log(e);
}) ;


app.listen(PORT,() => {
    console.log(`connected to port ${PORT} text` );
});



