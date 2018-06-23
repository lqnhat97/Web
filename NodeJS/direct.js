var express=require('express');

app=express();

app.get('/home',(request, response)=>{
	response.sendfile('E:/3rd-1512379/Web/1512379_1512672/Web/index.html');
})

app.listen(8080,(err)=>{
	if(err) throw (err);
	console.log('Connected at port 8080');
})
