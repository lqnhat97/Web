var express = require('express');
var express_hbs=require('express-handlebars');
var express_hbs_sections=require('express-handlebars-sections');

var path=require('path');

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
	
app.get('/', (req, res) => {
	var vm={
		home_active:true
	}
    res.render('home/index',vm);
});

app.get('/warehouse/index', (req, res) => {
	var vm={
		warehouse_active:true
	}
    res.render('warehouse/index',vm);
});


app.listen(3000, () => {
    console.log('Site running on port 3000');
});