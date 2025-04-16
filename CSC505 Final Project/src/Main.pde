import java.util.*;

final int UI_SIZE = 50;
PVector mousePosition;
PVector origin = new PVector(0,0);
Map map;
Camera camera;
int menuID = 0;
Menu mainMenu;
Menu settingsMenu;

void setup() {
  size(800,600);
  mousePosition = new PVector(mouseX,mouseY);
  camera = new Camera(origin);
  mainMenu = new Menu(0);
  settingsMenu = new Menu(1);
}

void draw() {
  
  mousePosition.x = mouseX;
  mousePosition.y = mouseY;

  textSize(128);
  fill(0);
  text("word", 40, 120); 

  switch (menuID) {
    case 0:
      mainMenu.updateMenu();
      break;
    case 1:
      break;
  }
}

public PVector hexToRect(PVector hexCoords) {
        PVector rectCoords = new PVector(0,0);
        //HIGH PRIORITY
        return rectCoords;
}

public PVector rectToHex(PVector rectCoords) {
        PVector hexCoords = new PVector(0,0);
        //HIGH PRIORITY
        return hexCoords;
}

void keyPressed() {
  if (key == CODED) {
    InputReader.getInstance().pressKey(keyCode);
  } else {
    InputReader.getInstance().pressKey(key);
  }
}

void keyReleased() {
  if (key == CODED) {
    InputReader.getInstance().releaseKey(keyCode);
  } else {
    InputReader.getInstance().releaseKey(key);
  }
}