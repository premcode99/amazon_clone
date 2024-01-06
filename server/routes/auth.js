const express = require("express")
const User = require('../models/user')
const authRouter = express.Router();
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

//Sign up 
authRouter.post("/api/signup", async (req,res) => {
//get the data from client
try{
    const {name, email, password} = req.body;
    //post that data into database
    //return the data to user   
    const existingUser = await User.findOne({email});
    if(existingUser){
        return res.status(400).json({ msg : "User with same email already exist!"});
    }
    const hashpassword = await bcryptjs.hash(password, 8);
    let user = new User({
    email,
    password : hashpassword,
    name,
    })
    
    user = await user.save();
    res.json(user);
}catch(e){
    res.status(500).json({error : e.message});
}

});

//sign in route

authRouter.post("/api/signin", async (req, res) => {

    try{
        const {email, password} = req.body;

        const user = await User.findOne({email});
        if(!user){
           return res.statusCode(400).json({msg : "User with this email does not exist"});
        }

       const isMatch = await bcryptjs.compare(password, user.password);

       if(!isMatch){
        return res.statusCode(400).json({msg : "Incorrect Password"});
       }
       const token = jwt.sign({id : user._id}, "passwordkey");
       res.json({token, ...user._doc});



    }catch(e){
        res.status(500).json({error : e.message})
    }
})
module.exports = authRouter;