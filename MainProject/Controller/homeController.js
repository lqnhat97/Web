var express = require('express');
var router = express.Router();

router.get('/', (req, res) => {
	var vm={
		home_active:true
	}
    res.render('home/index',vm);
});

module.exports = router;