var express=require('express');
var express_hbs=require('express-handlebars');
var express_hbs_sections=require('express-handlebars-sections');

var path=require('path');
var productRepo=require('./repository/productRepo.js');

var app=express();

app.engine('hbs',express_hbs({
	defaultLayout: 'administrator',
	layoutsDir: '../',
    helpers: {
        section: express_hbs_sections()
    }
}));

app.set('view engine','hbs');
app.use(express.static(path.resolve('E:/3rd-1512379/Web/1512379_1512672/Web')));

app.get('/home',(req,res)=>{
	res.redirect('../administrator.handlebars');	
})

app.get('/',(req,res)=>{
	res.render('../administrator');	
})

app.get('/catalog/index',(req,res)=>{
	res.render('/admin/catalog');	
})


app.listen(8080, () => {

    console.log('Site running on port 8080');
});