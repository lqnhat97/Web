var express = require('express');
var router = express.Router();
var productRepos = require('../repo/productRepos');


router.get('/', (req,res)=>{
	var p1 = productRepos.loadNewProduct();
	var p2 = productRepos.loadNewProduct2();
	var p3 = productRepos.loadNewProduct3();
	var p4 = productRepos.loadbestsell();
	var p5 = productRepos.loadMostView();
	var p6 = productRepos.loadMostView2();
	var p7 = productRepos.loadMostView3()
	Promise.all([p1,p2,p3,p4,p5,p6,p7]).then(([rows,rows2,rows3,sell,mv,mv2,mv3])=>{
		var vm ={
			categories:rows,
			categories2:rows2,
			categories3:rows3,
			bestsell:sell,
			mostview:mv,
			mostview2:mv2,
			mostview3:mv3
		};
		res.render('home/web_home',vm);

	});
})

module.exports = router;