var express = require('express');
var router = express.Router();
var user = require('../repo/user');
var SHA256 = require('crypto-js/sha256');

router.get('/',(req,res)=>{
	res.render('register/register');
})

router.post('/',(req,res)=>{
	var vm={
		name: req.body.name,
		mail:req.body.email,
		phone:req.body.phone,
		address: req.body.city,
		pass:SHA256(req.body.passwpord).toString(),
		gender:req.body.gender,
		addtion:req.body.addition,
		birthday:req.body.birthday
	}
	user.register(vm).then(rows=>{
		var ok = {
            add_ok: true,
        }
        console.log(rows);
        res.render('register/register',ok);
    }).catch(err=>{
        var f = {
            add_ok: false
        }
        console.log(err);
        res.render('register/register',f);
	});
})

module.exports = router;
