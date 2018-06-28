var express = require('express');
var router = express.Router();
var passport=require('passport');
var localStrategy=require('passport-local').Strategy;
var userRepo = require('../repo/user');

router.get('/',(req,res)=>{
	res.render('login/login');
}).post('/',passport.authenticate('local',{failureRedirect: 'login/login',
											successRedirect: 'home/web_home'}));

passport.use(new localStrategy(
    (username, password, done) => {

        var db = JSON.parse(userRepo.loadAll());
        var userRecord = db.find(user => user.email == username);
        if (userRecord && userRecord.password == password) {
            return done(null, userRecord);
        } else {
            return done(null, false);
        }
    }

))

passport.serializeUser((user,done)=>
{
	done(null,user.email)
})

passport.deserializeUser((name,done)=>{
	
        var db = JSON.parse(userRepo.loadAll());
        var userRecord = db.find(user => user.email == username);
        if (userRecord && userRecord.password == password) {
            return done(null, userRecord);
        } else {
            return done(null, false);
        }
})

module.exports=router;