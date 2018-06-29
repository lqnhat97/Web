var express = require('express');
var router = express.Router();
var productRepos = require('../repo/productRepos');
var config=require('../config/config')

router.get('/', (req, res) => {
	// var page=req.query.page;
	// if(!page) {page=1};
	// var offset = (page -1) *config.PRODUCTS_PER_PAGE;
    productRepos.allbrandProduct(req.query.catId).then(rows => {
        var vm = {
            categories:rows,
        };
        //console.log(rows);
        res.render('product/products', vm);
    })
})


router.get('/price', (req, res) => {
    productRepos.loadProductBasePrice(req.query.catId,req.query.price1,req.query.price2).then(rows => {
        var vm = {
            categories:rows,
        };
        res.render('product/products', vm);
    })
})
	
router.get('/searchbyname', (req, res) => {
    var name=req.query.name;
    productRepos.searchProductName(name).then(rows => {
        var vm = {
            categories:rows,
        };
        res.render('product/products', vm);
    })
})
module.exports = router;