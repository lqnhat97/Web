var express=require('express');
var path=require('path');
app=express();

app.use(express.static(path.resolve('E:/3rd-1512379/Web/1512379_1512672/Web')));

app.get('/home',(request, response)=>{
	response.sendfile('E:/3rd-1512379/Web/1512379_1512672/Web/login.html');
})

app.listen(8080,(err)=>{
	if(err) throw (err);
	console.log('Connected at port 8080');
})
