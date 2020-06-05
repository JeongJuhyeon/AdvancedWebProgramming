var fs = require('fs');
var filename = "ranking.json";

function Ranking(name,score){
  this.name = name;
  this.score = score;
}
function compareScore(ranking1,ranking2){
  return ranking2.score-ranking1.score;
}
var arr = [11];
fs.readFile(filename,'utf8',function(err,data){
    if(err){
      console.log('file read error');
    }
    var strArray = data.split('\n');
    var arrayNum = strArray.length;
    if(strArray.length >0) arrayNum = strArray.length -1;
    for(var i=0;i<arrayNum;i++){
      var one = JSON.parse(strArray[i]);
      arr.push(one);
    }
    var memname = '123up';
    var memscore = 126;
    if(arr.length == 11){
      if(arr[10].score<memscore){
        var deleteranking = new Ranking(arr.pop());
        arr.push(new Ranking(memname,memscore));
        arr.sort(compareScore);
        var stringJson = JSON.stringify(arr[1]) +'\n';
        fs.writeFileSync(filename,stringJson,'utf8',function(err){
            if(err){  throw err;  }
        });
        for(var i =2; i<arr.length;i++){
          var stringJson = JSON.stringify(arr[i]) +'\n';
          fs.appendFileSync(filename, stringJson  ,'utf8',function(err){
            if(err){  throw err;  }
          });
        }
      }
    }else {
      arr.push(new Ranking(memname,memscore));
      arr.sort(compareScore);
      var stringJson = JSON.stringify(arr[1]) +'\n';
      fs.writeFileSync(filename,stringJson,'utf8',function(err){
          if(err){  throw err;  }
      });
      for(var i =2; i<arr.length;i++){
        var stringJson = JSON.stringify(arr[i]) +'\n';
        fs.appendFileSync(filename,stringJson ,'utf8',function(err){
          if(err){  throw err;  }
        });
      }
    }
});
