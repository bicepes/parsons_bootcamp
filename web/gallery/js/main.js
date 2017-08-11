window.addEventListener('DOMContentLoaded', function(e) {
  console.log('hello!');
  //loadImages();
  loadImages();
});

const imageNum = 15;
const col = document.getElementsByClassName('column');
var curImg = 0;

function loadImages() {
  for (var i = 0; i < imageNum; i++) {
    var newImg = document.createElement('img');
    newImg.src = ('./image/' + i + '.jpg');

    newImg.id = i;
    newImg.style.cursor = 'zoom-in'
    newImg.addEventListener('click', function(e) {
      curImg = e.target.id;
      console.log(e.target);
      popUp(e.target);
    });
    col[i%col.length].appendChild(newImg);
  }
}

function popUp(img) {
  var photoctn = document.getElementById('photo-container');
  var photo = document.getElementById('pic');
  photo.src = './image/' + curImg + '.jpg'
  if (img.height > img.width) {
    photo.style.height = '100%';
    photo.style.width = 'auto';
  }
  else {
    photo.style.width = '100%';
    photo.style.height = 'auto';
  }
  photoctn.style.display = 'block';

  photo.addEventListener('click', function(e) {
    close();
  });
}

function close() {
  console.log("close");
  var photoctn = document.getElementById('photo-container');
  photoctn.style.display = 'none';
}

function switchImg(direction) {
  var nextImg = 0;

  // have to use parseInt on both integers, fuck javascript
  nextImg = parseInt(curImg) + parseInt(direction);
  console.log(nextImg);

  if (nextImg < 0) {
    console.log(nextImg);
    nextImg = imageNum - 1;
  }
  if (nextImg > imageNum - 1) {
    nextImg = 0;
  }
  curImg = nextImg;
  var newImg = document.createElement('img');
  newImg.src = ('./image/' + curImg + '.jpg');
  popUp(newImg);
}

// function loadImages1() {
//   for (var i = 0; i < imageNum; i++) {
//     var newImg = document.createElement('img');
//     newImg.src = ('./image/' + i + '.jpg');
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
//     console.log('column' + i + 'is: ' + heightArr[i]);
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
