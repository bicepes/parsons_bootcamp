window.addEventListener("DOMContentLoaded", function(e) {
  console.log("hello!");
  //loadImages();
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

// function loadImages1() {
//   for (var i = 0; i < imageNum; i++) {
//     var newImg = document.createElement("img");
//     newImg.src = ("./image/" + i + ".jpg");
//     var shCol = getMin()
//     col[shCol].appendChild(newImg);
//   }
// }
//
// function getMin() {
//   var heightArr = new Int16Array(col.length);
//   var minCol = 0;
//
//   for (var i = 0; i < col.length; i++) {
//     var colHeight = col[i].clientHeight;
//     heightArr[i] = colHeight;
//     console.log("column" + i + "is: " + heightArr[i]);
//   }
//
//   for (var i = 0; i < col.length; i++) {
//     if (minHeight > heightArr[i]) {
//       minCol = i;
//       minHeight = heightArr[i];
//       console.log(minHeight);
//     }
//   }
//
//   console.log(minCol);
//
//   return minCol;
// }
