import java.util.*;

final int UI_SIZE = 50;
PVector mousePosition;
PVector origin = new PVector(0,0);
Map map;
Camera camera;
int menuID = 0;
Menu menu;

void setup() {
  size(800,600);
  mousePosition = new PVector(mouseX,mouseY);
  camera = new Camera(origin);
  menu = new Menu(0);
}

void draw() {
  
  mousePosition.x = mouseX;
  mousePosition.y = mouseY;

  menu.updateMenu();
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

void mousePressed() {
  InputReader.getInstance().pressMouse();
}

void mouseReleased() {
  InputReader.getInstance().releaseMouse();
}