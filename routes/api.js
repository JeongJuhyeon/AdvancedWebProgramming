var express = require("express");
var router = express.Router();

var scores = require("../resources/filewrite.js");

router.post("/start/:lat/:long", function (req, res, next) {
  const center_coordinates = { lat: req.params.lat, long: req.params.long };
  let s = req.session;
  s.center_coordinates = center_coordinates;
  res.send(center_coordinates);
});

router.get("/start/", function (req, res, next) {
  res.json(req.session.center_coordinates);
});

router.post("/scores/:name/:score", function (req, res, next) {
  scores.addScore(req.params.name, req.params.score);
  res.send(true);
});

router.get("/scores/", function (req, res, next) {
  scores.getScores().then((data) => res.json(data));
});

module.exports = router;
