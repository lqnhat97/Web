var express = require('express');
var router = express.Router();
var SHA256 = require('crypto-js/sha256');
var userRepo = require('../repo/user');
var restrict = require('../middle-wares/restrict');


router.get('/',(req,res)=>{
	res.render('login/login');
})

router.post('/login', (req, res) => {
    var user = {
        username: req.body.username,
        password: SHA256(req.body.password).toString()
    };
    console.log('user');

    userRepo.login(user).then(rows => {
        if (rows.length > 0) {
            // user = rows[0];

            req.session.isLogged = true;
            req.session.user = rows[0];


            var url = '/';
            if (req.query.retUrl) {
                url = req.query.retUrl;
            }
            console.log('req.query.retUrl');

            res.redirect(url);

        } else {
            var vm = {
                showError: true,
                errorMsg: 'Login failed'
            };
            res.render('login/login', vm);
        }
    });
});


router.get('/profile', restrict, (req, res) => {
    res.render('user_info/user_info');
});
module.exports = router;