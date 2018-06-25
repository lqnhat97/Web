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
	res.render('product/products');
})

app.get('/register',(req,res)=>{
	var vm={
		layout:false
	}
	res.render('register/register',vm);
})

app.listen(3000, () => {
    console.log('Site running on port 3000');
});