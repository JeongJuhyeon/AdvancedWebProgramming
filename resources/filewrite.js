var fs = require("fs");
var fsp = require("fs").promises;
const filename = __dirname + "/ranking.json";
const slots = 10;

function Ranking(name, score) {
  this.name = name;
  this.score = score;
}

function compareScore(ranking1, ranking2) {
  return ranking2.score - ranking1.score;
}

async function getScores() {
  let arr = [];
  const data = await fsp.readFile(filename, "utf8");

  // return {'hello': 'world'};
  return JSON.parse(data);
}

function addScore(newName, newScore) {
  let arr = [];

  fs.readFile(filename, "utf8", function (err, data) {
    if (err) {
      console.log("file read error");
      throw err;
    }

    let parsedData = JSON.parse(data);
    console.log(parsedData);

    for (let i = 0; i < parsedData.length; i++) {
      arr.push(parsedData[i]);
    }

    console.log(arr.length);

    if (arr.length >= slots) {
      if (arr[slots - 1].score < newScore) {
        arr.pop();
      } else {
        return;
      }
    }

    console.log(arr.length);

    remakeJson();
  });

  function remakeJson() {
    arr.push(new Ranking(newName, newScore));
    arr.sort(compareScore);
    // let stringJson = JSON.stringify(arr[1]) + "\n";
    let stringJson = JSON.stringify(arr, null, 2);
    fs.writeFileSync(filename, stringJson, "utf8", function (err) {
      if (err) {
        throw err;
      }
    });
    // for (let i = 1; i < arr.length; i++) {
    //   let stringJson = JSON.stringify(arr[i]) + "\n";
    //   fs.appendFileSync(filename, stringJson, "utf8", function (err) {
    //     if (err) {
    //       throw err;
    //     }
    //   });
    // }
  }
}

// addScore("Park", 170);

module.exports = {
  addScore: addScore,
  getScores: getScores,
};
