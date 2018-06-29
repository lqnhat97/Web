var express = require('express');
var router = express.Router();
var brandRepo = require('../repo/brandRepos');

router.get('/', (req, res) => {
	brandRepo.loadAll().then(rows=>{
		var vm={
		layout: false,
        categories: rows,
        brand_active:true
	};
    res.render('brand/brand',vm);
	});
});

router.get('/add',(req,res)=>{
	res.render('brand/add_brand');
})

router.post('/add',(req,res)=>{
	var vm={
		name:req.body.name,
	}
	brandRepo.addBrand(vm).then(rows=>{
		var ok = {
            add_ok: true,
            layout:false
        }
        console.log(rows);
        res.render('brand/add_brand',ok);
    }).catch(err=>{
        var f = {
            layout:false,
            add_ok: false
        }
        console.log('err');
        res.render('brand/add_brand',f);
	});
})



router.get('/delete',(req,res)=>{
	var vm={
		pid:req.param.id
	}
	res.render('brand/del_brand',vm);
})

router.post('/delete', (req, res) => {
    brandRepo.delBrand(req.body.pid).then(rows =>{
    	res.redirect('/brand');
    })
});


module.exports = router;
