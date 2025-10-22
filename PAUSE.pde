void pause() {
  if (frameCount % 6 == 0){
      image(gif[f], 0, 0, width, height);
      f = f + 1;
    }
    if (f == NoF) f = 0;
   int i = 0;
  while ( i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.show(); 
    if (currentObject.lives == 0) 
      objects.remove(i);
    else
      i++;
  }
}

void pauseClicks() {
  if(mouseX < width && mouseY < height) {
    mode = GAME;
  }
}
