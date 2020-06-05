var fs = require("fs");
const filename = "ranking.json";
const slots = 10;

function Ranking(name, score) {
  this.name = name;
  this.score = score;
}

function compareScore(ranking1, ranking2) {
  return ranking2.score - ranking1.score;
}

function addScore(newName, newScore) {
  let arr = [];

  fs.readFile(filename, "utf8", function (err, data) {
    if (err) {
      console.log("file read error");
      throw err;
    }

    let strArray = data.split("\n");
    let arrayNum = strArray.length;
    if (strArray.length > 0) 
      arrayNum = strArray.length - 1;

    for (let i = 0; i < arrayNum; i++) {
      let one = JSON.parse(strArray[i]);
      arr.push(one);
    }

    if ((arr.length == slots) && (arr[slots - 1].score < newScore)) {
        let deleteranking = new Ranking(arr.pop());
    }
    
    remakeJson();
  });


  function remakeJson() {
    arr.push(new Ranking(newName, newScore));
    arr.sort(compareScore);
    // let stringJson = JSON.stringify(arr[1]) + "\n";
    let stringJson = JSON.stringify(arr)
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

// addScore("Kim", 169)
module.exports = addScore;