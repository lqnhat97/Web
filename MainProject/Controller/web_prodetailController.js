var express = require('express');
var router = express.Router();
var productRepos = require('../repo/productRepos');

router.get('/',(req,res)=>{
	var p1=productRepos.loadSameBrandProduct(req.query.id);
	var p2=productRepos.productDetail(req.query.id);
	Promise.all([p1,p2]).then(([rows,rows2])=>{
		var vm={
			brand:rows,
			category:rows2
		}
	res.render('product/product_details',vm);
	});
});

module.exports = router;