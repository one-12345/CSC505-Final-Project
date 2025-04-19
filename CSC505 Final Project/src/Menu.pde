class Menu {

    private int menuID;
    private int timeInMenu = 0;
    private int previousMenu = 0;

    public Menu(int menuID) {
        this.menuID = menuID;
    }

    public void updateMenu() {
        timeInMenu+=Timer.getInstance().getDelta();
        switch (menuID) {
            case 0:
                //MAIN MENU
                this.drawMainMenu();
                //Check button presses
                if (InputReader.getInstance().getMouseDown() && mouseIn(width-UI_SIZE,height-UI_SIZE,width,height)) {
                    previousMenu = menuID;
                    menuID = 1;
                    timeInMenu = 0;
                }
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2-UI_SIZE,height/2+50-UI_SIZE/2,width/2+UI_SIZE,height/2+50+UI_SIZE/2)) {
                    previousMenu = menuID;
                    menuID = 2;
                    player1.setFaction(0);
                    player2.setFaction(0);
                    timeInMenu = 0;
                }
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2-UI_SIZE, height/2+190-UI_SIZE/2, width/2+UI_SIZE, height/2+190+UI_SIZE/2)) {
                    exit();
                }
                break;
            case 1: 
                //SETTINGS MENU
                background(25,25,25);
                strokeWeight(6);

                //Exit button
                stroke(50);
                fill(50);
                rect(width-UI_SIZE,0,UI_SIZE,UI_SIZE,UI_SIZE/5);
                stroke(100);
                fill(100);
                line(width-UI_SIZE+10, 10, width-10, UI_SIZE-10);
                line(width-10, 10, width-UI_SIZE+10, UI_SIZE-10);
    

                //Check button presses
                if (InputReader.getInstance().getMouseDown() && mouseIn(width-UI_SIZE,0,width,UI_SIZE)) {
                    menuID = previousMenu;
                    previousMenu = 1;
                    timeInMenu = 0;
                }
                if (InputReader.getInstance().getKeyDown(0) && timeInMenu > 200) {
                    menuID = previousMenu;
                    previousMenu = 1;
                    timeInMenu = 0;
                }
                break;
            case 2:
                //GAME SETUP MENU
                
                this.drawGameSetupMenu();

                //Check button presses
                if (InputReader.getInstance().getMouseDown() && mouseIn(width-UI_SIZE,0,width,UI_SIZE)) {
                    previousMenu = menuID;
                    menuID = 0;
                }
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2-6*UI_SIZE,height/2-120+UI_SIZE/2,width/2-2*UI_SIZE-5,height/2-120+2*UI_SIZE)) {
                    player1.setFaction(0);
                }
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2-2*UI_SIZE,height/2-120+UI_SIZE/2,width/2+2*UI_SIZE-5,height/2-120+2*UI_SIZE)) {
                    player1.setFaction(1);
                }
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2+2*UI_SIZE,height/2-120+UI_SIZE/2,width/2+6*UI_SIZE,height/2-120+2*UI_SIZE)) {
                    player1.setFaction(2);
                }
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2-6*UI_SIZE,height/2+120+UI_SIZE/2,width/2-2*UI_SIZE-5,height/2+120+2*UI_SIZE)) {
                    player2.setFaction(0);
                }
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2-2*UI_SIZE,height/2+120+UI_SIZE/2,width/2+2*UI_SIZE-5,height/2+120+2*UI_SIZE)) {
                    player2.setFaction(1);
                }
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2+2*UI_SIZE,height/2+120+UI_SIZE/2,width/2+6*UI_SIZE,height/2+120+2*UI_SIZE)) {
                    player2.setFaction(2);
                }
                if (InputReader.getInstance().getKeyDown('\n') && timeInMenu > 200) {
                    previousMenu = menuID;
                    menuID = 3;
                    timeInMenu = 0;
                    map.generateMap();
                }
                if (InputReader.getInstance().getKeyDown(0) && timeInMenu > 200) {
                    previousMenu = menuID;
                    menuID = 0;
                    timeInMenu = 0;
                }
                break;
            case 3:
                //PLAY MENU
                background(25,25,25);
                strokeWeight(6);

                //Pause button
                stroke(50);
                fill(50);
                rect(width-UI_SIZE,0,UI_SIZE,UI_SIZE,UI_SIZE/5);
                stroke(100);
                fill(100);
                line(width-UI_SIZE+15, 10, width-UI_SIZE+15, UI_SIZE-10);
                line(width-15, 10, width-15, UI_SIZE-10);

                //MAP SQUARE RENDER
                map.mapSquareRender();

                //Check button presses
                if (InputReader.getInstance().getMouseDown() && mouseIn(width-UI_SIZE,0,width,UI_SIZE)) {
                    previousMenu = menuID;
                    menuID = 4;
                    timeInMenu = 0;
                }
                if (InputReader.getInstance().getKeyDown(' ') && timeInMenu > 200) {
                    previousMenu = menuID;
                    menuID = 4;
                    timeInMenu = 0;
                }
                break;
            case 4:
                //PAUSE MENU
                
                stroke(37.5);
                fill(37.5);
                rect(width/2-2*UI_SIZE,height/2-3*UI_SIZE,4*UI_SIZE,6*UI_SIZE,2*UI_SIZE/5);

                stroke(50);
                fill(50);
                rect(width/2-1.5*UI_SIZE,height/2-2.5*UI_SIZE,3*UI_SIZE,UI_SIZE,UI_SIZE/5);
                rect(width/2-1.5*UI_SIZE,height/2-0.5*UI_SIZE,3*UI_SIZE,UI_SIZE,UI_SIZE/5);
                rect(width/2-1.5*UI_SIZE,height/2+1.5*UI_SIZE,3*UI_SIZE,UI_SIZE,UI_SIZE/5);

                textSize(25);
                stroke(100);
                fill(100);
                text("MAIN MENU", width/2, height/2+-1.8*UI_SIZE);
                text("SETTINGS", width/2, height/2+0.2*UI_SIZE);
                text("RESUME", width/2, height/2+2.2*UI_SIZE);

                //Unpause button

                stroke(50);
                fill(50);
                rect(width-UI_SIZE,0,UI_SIZE,UI_SIZE,UI_SIZE/5);
                stroke(100);
                fill(100);
                triangle(width-UI_SIZE+15,12,width-UI_SIZE+15,UI_SIZE-12,width-15,UI_SIZE/2);


                //Check button presses
                
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2-1.5*UI_SIZE,height/2-2.2*UI_SIZE,width/2+1.5*UI_SIZE,height/2-1.5*UI_SIZE)) {
                    previousMenu = menuID;
                    menuID = 0;
                    timeInMenu = 0;
                }
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2-1.5*UI_SIZE,height/2-0.2*UI_SIZE,width/2+1.5*UI_SIZE,height/2+0.5*UI_SIZE)) {
                    previousMenu = menuID;
                    menuID = 1;
                    timeInMenu = 0;
                }
                if (InputReader.getInstance().getMouseDown() && mouseIn(width/2-1.5*UI_SIZE,height/2+1.8*UI_SIZE,width/2+1.5*UI_SIZE,height/2+2.5*UI_SIZE)) {
                    previousMenu = menuID;
                    menuID = 3;
                    timeInMenu = 0;
                }
                if (InputReader.getInstance().getKeyDown(' ') && timeInMenu > 200) {
                    previousMenu = menuID;
                    menuID = 3;
                    timeInMenu = 0;
                }
                if (InputReader.getInstance().getKeyDown(0) && timeInMenu > 200) {
                    previousMenu = menuID;
                    menuID = 0;
                    timeInMenu = 0;
                }

                break;
        }
    }
    public void drawMainMenu() {
        textAlign(CENTER);
        background(25,25,25);
        strokeWeight(3);
               
        //buttons
        stroke(50);
        fill(50);
        translate(width/2, height/2);
        rect(-UI_SIZE, 50-UI_SIZE/2, 2*UI_SIZE, UI_SIZE,UI_SIZE/5);
        rect(-UI_SIZE, 190-UI_SIZE/2, 2*UI_SIZE, UI_SIZE,UI_SIZE/5);
        rect(width/2-UI_SIZE, height/2-UI_SIZE, UI_SIZE, 2*UI_SIZE,UI_SIZE/5);

        // tutorial button (WIP)
        stroke(37.5);
        fill(37.5);
        rect(-1.5*UI_SIZE, 120-UI_SIZE/2, 3*UI_SIZE, UI_SIZE,UI_SIZE/5);
        fill(50);
        stroke(50);
        text("TUTORIAL", 0, 120+UI_SIZE/5);
                
        //"PLAY" text
        fill(100);
        stroke(100);
        textSize(UI_SIZE*2);
        text("UNTITLED", 0, -150+4*UI_SIZE/5);
        textSize(UI_SIZE/2);
        text("PLAY", 0, 50+UI_SIZE/5);
        text("QUIT", 0, 190+UI_SIZE/5);

                
        //Settings gear
        translate(width/2-UI_SIZE/2,height/2-UI_SIZE/2);
        circle(0, 0, UI_SIZE/2);
        for (int i = 0; i < 8; i++) {
            arc(0, 0, UI_SIZE/1.5, UI_SIZE/1.5, i*PI/4-PI/16, i*PI/4+PI/16);
        }
        stroke(50);
        fill(50);
        circle(0, 0, UI_SIZE/4);
    }

    public void drawGameSetupMenu() {
        background(25,25,25);
        strokeWeight(6);

        //Exit button
        stroke(50);
        fill(50);
        rect(width-UI_SIZE,0,UI_SIZE,UI_SIZE,UI_SIZE/5);
        stroke(100);
        fill(100);
        line(width-UI_SIZE+10, 10, width-10, UI_SIZE-10);
        line(width-10, 10, width-UI_SIZE+10, UI_SIZE-10);
    
        //Faction select buttons
        stroke(50);
        fill(50);
        rect(width/2-6*UI_SIZE,height/2-120-2*UI_SIZE,12*UI_SIZE,4*UI_SIZE,2*UI_SIZE/5);
        rect(width/2-6*UI_SIZE,height/2+120-2*UI_SIZE,12*UI_SIZE,4*UI_SIZE,2*UI_SIZE/5);
        rect(width/2-6*UI_SIZE,height/2-120+2*UI_SIZE-10,12*UI_SIZE,10);
        rect(width/2-6*UI_SIZE,height/2+120+2*UI_SIZE-10,12*UI_SIZE,10);
                
        stroke(37.5);
        fill(37.5);
        switch (player1.getFaction()) {
            case 0:
                rect(width/2-6*UI_SIZE,height/2-120+UI_SIZE/2,4*UI_SIZE-5,1.5*UI_SIZE);
                break;
            case 1:
                rect(width/2-2*UI_SIZE,height/2-120+UI_SIZE/2,4*UI_SIZE-5,1.5*UI_SIZE);
                break;
            case 2:
                rect(width/2+2*UI_SIZE,height/2-120+UI_SIZE/2,4*UI_SIZE,1.5*UI_SIZE);
                break;
        }
        switch (player2.getFaction()) {
            case 0:
                rect(width/2-6*UI_SIZE,height/2+120+UI_SIZE/2,4*UI_SIZE-5,1.5*UI_SIZE);
                break;
            case 1:
                rect(width/2-2*UI_SIZE,height/2+120+UI_SIZE/2,4*UI_SIZE-5,1.5*UI_SIZE);
                break;
            case 2:
                rect(width/2+2*UI_SIZE,height/2+120+UI_SIZE/2,4*UI_SIZE,1.5*UI_SIZE);
                break;
        }
                
        stroke(25);
        fill(25);
        line(width/2-6*UI_SIZE-5,height/2-120+UI_SIZE/2,width/2+6*UI_SIZE+5,height/2-120+UI_SIZE/2);
        line(width/2-6*UI_SIZE-5,height/2+120+UI_SIZE/2,width/2+6*UI_SIZE+5,height/2+120+UI_SIZE/2);
        line(width/2-2*UI_SIZE,height/2-120+UI_SIZE/2,width/2-2*UI_SIZE,height/2-115+2*UI_SIZE);
        line(width/2+2*UI_SIZE,height/2-120+UI_SIZE/2,width/2+2*UI_SIZE,height/2-115+2*UI_SIZE);
        line(width/2-2*UI_SIZE,height/2+120+UI_SIZE/2,width/2-2*UI_SIZE,height/2+125+2*UI_SIZE);
        line(width/2+2*UI_SIZE,height/2+120+UI_SIZE/2,width/2+2*UI_SIZE,height/2+125+2*UI_SIZE);
                
        stroke(100);
        fill(100);
        textSize(64);
        text("PLAYER 1", width/2-3*UI_SIZE, height/2-120-0.5*UI_SIZE);
        text("PLAYER 2", width/2-3*UI_SIZE, height/2+120-0.5*UI_SIZE);
        textSize(32);
        text("TERRAN", width/2-4*UI_SIZE, height/2-120+1.5*UI_SIZE);
        text("TERRAN", width/2-4*UI_SIZE, height/2+120+1.5*UI_SIZE);
        text("XENO", width/2, height/2-120+1.5*UI_SIZE);
        text("XENO", width/2, height/2+120+1.5*UI_SIZE);
        text("MECH", width/2+4*UI_SIZE, height/2-120+1.5*UI_SIZE);
        text("MECH", width/2+4*UI_SIZE, height/2+120+1.5*UI_SIZE);
    }
} 