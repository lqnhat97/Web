var express = require('express');
var cartRepo = require('../repo/cartRepo'),
    productRepo = require('../repo/productRepos');

var router = express.Router();

router.get('/', (req, res) => {

    // var arr_p = [];
    // for (var i = 0; i < req.session.cart.length; i++) {
    //     var cartItem = req.session.cart[i];
    //     var p = productRepo.productDetail(cartItem.id);
    //     arr_p.push(p);
    // }

    // var items = [];
    // Promise.all(arr_p).then(result => {
    //     for (var i = result.length - 1; i >= 0; i--) {
    //         var pro = result[i][0];
    //         var item = {
    //             Product: pro,
    //             Amount: pro.price, 
    //         };
    //         items.push(item);
    //     }

    //     var vm = {
    //         items: items
    //     };
        res.render('product/product_summary');
    });
//});

router.post('/add', (req, res) => {
    var item = {
        ProId: req.query.id,
    };

    cartRepo.add(req.session.cart, item);
    res.redirect(req.headers.referer);
});

router.post('/remove', (req, res) => {
    cartRepo.remove(req.session.cart, req.body.ProId);
    res.redirect(req.headers.referer);
});

module.exports = router;