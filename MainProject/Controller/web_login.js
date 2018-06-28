var express = require('express');
var router = express.Router();
var SHA256 = require('crypto-js/sha256');
var userRepo = require('../repo/user');


router.get('/',(req,res)=>{
	res.render('login/login');
})

router.post('/login', (req, res) => {
    var user = {
        email: req.body.username,
        password: SHA256(req.body.password).toString()
    };

    userRepo.login(user).then(rows => {
        if (rows.length > 0) {
            // user = rows[0];

            req.session.isLogged = true;

            res.redirect('/');

        } else {
            var vm = {
                showError: true,
                errorMsg: 'Login failed'
            };
            res.render('login/login', vm);
        }
    });
});

module.exports = router;