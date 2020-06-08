var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('leaderboard', { title: 'Express', pagejs: "leaderboard.js" });
});

module.exports = router;