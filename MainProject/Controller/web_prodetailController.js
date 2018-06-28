var express = require('express');
var router = express.Router();
var productRepos = require('../repo/productRepos');

router.get('/',(req,res)=>{
	productRepos.productDetail(req.query.id).then(rows=>{
		var vm={
			category:rows
		}
		console.log(rows)
	res.render('product/product_details',vm);

	});
});

module.exports = router;