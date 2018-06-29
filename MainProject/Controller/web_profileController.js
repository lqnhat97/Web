var express = require('express');
var router = express.Router();
var userRepo = require('../repo/user');


router.get('/',(req,res)=>{

	userRepo.loadUsers(req.session.user.id).then(rows=>{
		var vm={
			info:rows
		};
   		 res.render('user_info/user_info',vm);

	});
})

router.post('/',(req,res)=>{
	var vm={
		name: req.body.name,
		phone:req.body.phone,
		address: req.body.city,
		gender:req.body.gender,
		addtion:req.body.addition,
		birthday:req.body.birthday
	}
	userRepo.updateUser(vm).then(rows=>{
		var ok = {
            add_ok: true,
        }
        console.log(rows);
        res.render('user_info/user_info',ok);
    }).catch(err=>{
        var f = {
            add_ok: false
        }
        console.log(err);
        res.render('user_info/user_info',f);
	});
})



module.exports = router;
