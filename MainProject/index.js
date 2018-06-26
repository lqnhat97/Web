var express = require('express');
var express_hbs=require('express-handlebars');
var express_hbs_sections=require('express-handlebars-sections');
var body_parser = require('body-parser');

var path=require('path');
var homeController=require('./Controller/homeController');
var warehouseController=require('./Controller/warehouseController');

var app=express();


app.engine('hbs', express_hbs({
	defaultLayout:'administrator',
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
app.use('/',homeController);
app.use('/warehouse',warehouseController);


app.listen(3000, () => {
    console.log('Site running on port 3000');
});