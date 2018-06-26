var express = require('express');
var express_hbs=require('express-handlebars');
var express_hbs_sections=require('express-handlebars-sections');

var path=require('path');

var app=express();

app.engine('hbs', express_hbs({
	defaultLayout:'web',
	layoutsDir:'views/layout/',
	helpers:{
		section: express_hbs_sections()
	}
}))
app.set('view engine','hbs');

app.use(express.static(path.resolve(__dirname,'themes')));

app.get('/', (req,res)=>{
	res.render('home/web_home');
})

app.get('/login',(req,res)=>{
	res.render('login/login');
})

app.get('/product_details',(req,res)=>{
	res.render('product/product_details');
})

app.get('/product_summary',(req,res)=>{
	res.render('product/product_summary');
})

app.get('/products',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('product/products',vm);
})

app.get('/register',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('register/register',vm);
})

app.get('/compair',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('compair/compair',vm);
})

app.get('/contact',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('contact/contact',vm);
})

app.get('/faq',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('faq/faq',vm);
})

app.get('/forgetpass',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('forgetpass/forgetpass',vm);
})

app.get('/legal_notice',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('legal_notice/legal_notice',vm);
})

app.get('/normal',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('delivery/normal',vm);
})

app.get('/special_offer',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('special_offer/special_offer',vm);
})

app.get('/tac',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('tac/tac',vm);
})

app.listen(3000, () => {
    console.log('Site running on port 3000');
});

