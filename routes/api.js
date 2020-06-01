var express = require("express");
var router = express.Router();

router.post("/start/:lat/:long", function (req, res, next) {
    const center_coordinates = { lat: req.params.lat, long: req.params.long };
    let s = req.session;
    s.center_coordinates = center_coordinates;
    res.send(center_coordinates);
  });

router.get("/start/", function (req, res, next) {
    res.json(req.session.center_coordinates)
});

module.exports = router;
