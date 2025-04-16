class Menu {

    private int menuID;

    public Menu(int menuID) {
        this.menuID = menuID;
    }

    public void updateMenu() {
        switch (menuID) {
            case 0:
                background(25,25,25);
                strokeWeight(3);
               
                //buttons
                stroke(50);
                fill(50);
                translate(width/2, height/2);
                rect(-UI_SIZE, 50-UI_SIZE/2, 2*UI_SIZE, UI_SIZE,UI_SIZE/5);
                rect(width/2-UI_SIZE, height/2-UI_SIZE, 2*UI_SIZE, 2*UI_SIZE,UI_SIZE/5);
                
                //"PLAY" text
                textAlign(CENTER);
                fill(100);
                stroke(100);
                textSize(UI_SIZE*2);
                text("TITLE", 0, -150+4*UI_SIZE/5);
                textSize(UI_SIZE/2);
                text("PLAY", 0, +50+UI_SIZE/5);
                
                //Settings gear
                translate(width/2-UI_SIZE/2,height/2-UI_SIZE/2);
                circle(0, 0, UI_SIZE/2);
                for (int i = 0; i < 8; i++) {
                  arc(0, 0, UI_SIZE/1.5, UI_SIZE/1.5, i*PI/4-PI/16, i*PI/4+PI/16);
                }
                stroke(50);
                fill(50);
                circle(0, 0, UI_SIZE/4);

                //Check button presses
                if (InputReader.getInstance().getMouseDown() && mousePosition.x>width-UI_SIZE && mousePosition.y>height-UI_SIZE) {
                    menuID = 1;
                }
                break;
            case 1: 
                background(25,25,25);
                strokeWeight(6);

                //Exit button
                stroke(50);
                fill(50);
                rect(width-UI_SIZE,0,UI_SIZE,UI_SIZE,UI_SIZE/5);
                stroke(100);
                fill(100);
                line(width-UI_SIZE+2, 0, width-2, UI_SIZE-2);
                line(width, 0, width-UI_SIZE+2, UI_SIZE-2);
    

                //Checkbutton presses
                if (InputReader.getInstance().getMouseDown() && mousePosition.x>width-UI_SIZE && mousePosition.y<UI_SIZE) {
                    menuID = 0;
                }
                break;
            case 2:
                break;
        }
    }
} 