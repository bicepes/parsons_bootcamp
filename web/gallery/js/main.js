window.addEventListener("DOMContentLoaded", function(e) {
  console.log("hello!");
  loadImages();
});

const imageNum = 15;
const col = document.getElementsByClassName("column");

function loadImages() {
  for (var i = 0; i < imageNum; i++) {
    var newImg = document.createElement("img");
    newImg.src = ("./image/" + i + ".jpg");
    col[i%col.length].appendChild(newImg);
  }
}
