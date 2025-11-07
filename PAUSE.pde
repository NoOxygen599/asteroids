void pause() {
  if (frameCount % 6 == 0){
      image(gif[f], 0, 0, width, height);
      f = f + 1;
    }
    if (f == noF) f = 0;
   int i = 0;
  while ( i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.show(); 
    i++;
  }
}

void pauseClicks() {
  if(mouseX < width && mouseY < height) {
    mode = GAME;
  }
}
