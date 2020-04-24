function embedDocument(inDocument, Resize) {
  var Document = document.getElementById("webPage");
  if (!Resize) {
    Document.src = inDocument;
  } else {
    var img = new Image();
    img.src = inDocument;
    img.onload = () => {
      var canvas = document.createElement("canvas");
      var MAX_WIDTH = 300;
      var MAX_HEIGHT = 400;
      var width = img.width;
      var height = img.height;
      if (width > MAX_WIDTH) {
        height *= MAX_WIDTH / width;
        width = MAX_WIDTH;
      }
      if (height > MAX_HEIGHT) {
        width *= MAX_HEIGHT / height;
        height = MAX_HEIGHT;
      }
      canvas.width = width;
      canvas.height = height;
      var ctx = canvas.getContext("2d");
      ctx.drawImage(img, 0, 0, width, height);
      Document.src = canvas.toDataURL();
    };
  }
}
