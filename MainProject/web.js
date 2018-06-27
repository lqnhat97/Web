var express = require('express');
var express_hbs=require('express-handlebars');
var express_hbs_sections=require('express-handlebars-sections');
var body_parser = require('body-parser');

var web_homeController=require('./Controller/web_homeController');
var web_productsController = require('./Controller/web_productsController')
var web_prodetailController=require('./Controller/web_prodetailController')
var web_register=require('./Controller/web_register');
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
app.use(body_parser.json());
app.use(body_parser.urlencoded({
    extended: false
}));
//home
app.use('/',web_homeController);

//product
app.use('/products',web_productsController)

//product_detail
app.use('/product_details',web_prodetailController)


//register
app.use('/register', web_register)


app.get('/login',(req,res)=>{
	res.render('login/login');
})



app.get('/product_summary',(req,res)=>{
	res.render('product/product_summary');
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

