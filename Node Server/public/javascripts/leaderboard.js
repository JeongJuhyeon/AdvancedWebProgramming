function submitScore() {
    // TODO change  this to coordinates received from click on  map
    let name = "Kim";
    let score = 100 + Math.floor(Math.random() * 100);
    fetch("/api/scores/" + name + "/" + score, { method: "POST" }).then(() => {
        console.log("posted");
    });
  }
  