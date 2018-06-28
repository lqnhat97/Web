var express = require('express');
var express_hbs=require('express-handlebars');
var express_hbs_sections=require('express-handlebars-sections');
var body_parser = require('body-parser');
var passport=require('passport');
var session=require('express-session');
var path = require('path');
var wnumb = require('wnumb');

var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);


var handleLayoutMDW = require('./middle-wares/handleLayout'),
    handle404MDW = require('./middle-wares/handle404');

var web_homeController=require('./Controller/web_homeController');
var web_productsController = require('./Controller/web_productsController')
var web_prodetailController=require('./Controller/web_prodetailController')
var web_register=require('./Controller/web_register');
var web_login=require('./Controller/web_login');
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
var sessionStore = new MySQLStore({
    host: 'localhost',
    port: 3305,
    user: 'root',
    password: '',
    database: 'navistore',
    createDatabaseTable: true,
    schema: {
        tableName: 'sessions',
        columnNames: {
            session_id: 'session_id',
            expires: 'expires',
            data: 'data'
        }
    }
});

app.use(session({
    key: 'session_cookie_name',
    secret: 'session_cookie_secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: false
}));

app.use(handleLayoutMDW);
//home
app.use('/',web_homeController);

//product
app.use('/products',web_productsController)
// app.use('/products/price',web_productsController)

//product_detail
app.use('/product_details',web_prodetailController)

//register
app.use('/register', web_register)

app.use('/login',web_login)


app.get('/product_summary',(req,res)=>{
	res.render('product/product_summary');
})


app.get('/compair',(req,res)=>{
	res.render('compair/compair');
})

app.get('/contact',(req,res)=>{
	res.render('contact/contact');
})

app.get('/faq',(req,res)=>{
	res.render('faq/faq');
})

app.get('/forgetpass',(req,res)=>{
	res.render('forgetpass/forgetpass');
})

app.get('/legal_notice',(req,res)=>{
	res.render('legal_notice/legal_notice');
})

app.get('/normal',(req,res)=>{
	res.render('delivery/normal');
})

app.get('/special_offer',(req,res)=>{
	res.render('special_offer/special_offer');
})

app.get('/tac',(req,res)=>{
	res.render('tac/tac');
})
app.get('/user_info',(req,res)=>{
    res.render('user_info/user_info');
})

app.use(handle404MDW);

app.listen(3000, () => {
    console.log('Site running on port 3000');
});

