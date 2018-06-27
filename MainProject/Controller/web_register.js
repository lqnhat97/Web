var express = require('express');
var router = express.Router();
var user = require('../repo/user');

router.get('/',(req,res)=>{
	res.render('register/register');
})

router.post('/',(req,res)=>{
	var vm={
		name: req.body.name,
		mail:req.body.email,
		phone:req.body.phone,
		address:req.body.address + "," + req.body.city,
		pass:req.body.password,
	}
	user.register(vm).then(rows=>{
		var ok = {
            add_ok: true,
        }
        console.log(rows);
        res.redirect('home/web_home',ok);
    }).catch(err=>{
        var f = {
            add_ok: false
        }
        console.log(err);
        res.render('home/web_home',f);
	});
})

module.exports = router;
