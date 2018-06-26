var express = require('express');
var router = express.Router();
var productRepos = require('../repo/productRepos');

router.get('/', (req, res) => {
	productRepos.loadAll().then(rows=>{
		var vm={
		layout: false,
        categories: rows,
        warehouse_active:true
	};
    res.render('warehouse/index',vm);
	});
});

router.get('/add',(req,res)=>{
	res.render('warehouse/warehouse_addproduct')
})

router.post('/add',(req,res)=>{
	var vm={
		catalogid: req.body.catalog_id,
		name:req.body.name,
		price:req.body.price,
		content:req.body.content,
		discount:req.body.discount,
		image_link:req.body.image_link,
		created:req.body.created,
	}
	productRepos.addProduct(vm).then(rows=>{
		var ok = {
            add_ok: true,
            layout:false
        }
        res.render('warehouse/warehouse_addproduct',ok);
    }).catch(err=>{
        var f = {
            layout:false,
            add_ok: false
        }
        res.render('warehouse/warehouse_addproduct',f);
	});
})



router.get('/delete',(req,res)=>{
	var vm={
		pid:req.param.id
	}
	res.render('warehouse/warehouse_delproduct',vm);
})

router.post('/delete', (req, res) => {
    productRepos.delProduct(req.body.pid).then(rows =>{
    	res.redirect('/warehouse');
    })
});


module.exports = router;
