var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");
var session = require("express-session");
var cors = require("cors")

var indexRouter = require("./routes/index");
var gameRouter = require("./routes/game");
var apiRouter = require("./routes/api");
var leaderboardRouter = require("./routes/leaderboard");

var app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "hjs");
app.engine("hjs", require("h-js").renderFile);

app.set("partials", {
  footer: "footer",
  header: "header",
});

app.use(cors())
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use(
  session({
    secret: "@#geography#@",
    resave: false,
    saveUninitialized: false,
  })
);

app.use("/", indexRouter);
app.use("/game", gameRouter);
app.use("/api", apiRouter);
app.use("/leaderboard", leaderboardRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;
