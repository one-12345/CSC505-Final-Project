import java.util.*;


final int UI_SIZE = 50;
PVector mousePosition;
PVector origin = new PVector(0,0);
Map map;
Camera camera;
Game game = new Game(false);
int menuID = 0;
Menu menu;
int turn = 1;
Player player1 = new Player(color(0,40,10),1);
Player player2 = new Player(color(0,10,40),2);


void setup() {
  size(800,600);
  mousePosition = new PVector(mouseX,mouseY);
  camera = new Camera();
  menu = new Menu(0);
  map = new Map(8);
  player1.setFaction(0);
  player2.setFaction(0);
}

void draw() {
  Timer.getInstance().updateTime();
  
  mousePosition.x = mouseX;
  mousePosition.y = mouseY;

  menu.updateMenu();
}

public boolean mouseIn(float x1, float y1, float x2, float y2) {
  return (mousePosition.x > x1 && mousePosition.x<x2 && mousePosition.y > y1 && mousePosition.y<y2);
}

void keyPressed() {
  if (key == ESC) {
    key = 0;
  }
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

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

boolean insideHexagon(PVector test, PVector center, float radius) {
  //double radius test
  if ((test.x-center.x)*(test.x-center.x)+(test.y-center.y)*(test.y-center.y)>radius*radius) {
    return false;
  }
  if ((test.x-center.x)*(test.x-center.x)+(test.y-center.y)*(test.y-center.y)<0.75*radius*radius) {
    return true;
  }
  //test for if close to border (between radii)
  float projectedX = center.x * 2/(float)Math.sqrt(3);
  float projectedY = 0.5*projectedX + center.y;
  if (projectedX > radius || projectedX < -radius) {
    return false;
  }
  if (projectedX-projectedY > radius || projectedX-projectedY < -radius) {
    return false;
  }
  return true;

}