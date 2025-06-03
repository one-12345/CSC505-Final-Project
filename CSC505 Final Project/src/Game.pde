class Game {

    private int turn;
    private boolean active; // not actually sure what this does yet but it might be useful later
    private boolean showDeploymentp1;
    private boolean showDeploymentp2;

    public Game(boolean b) {
        active = b;
        showDeploymentp1 = true;
        showDeploymentp2 = true;
    }

    public void updateGame() {
        int win = checkWin();
        switch (win) {
            case 1:
                menu.win(1);
                return;
            case 2:
                menu.win(2);
                return;
        }
        textSize(32);
        drawStrengthComparison();
        if (turn % 2 == 1) {
            stroke(player1.getPlayerColor(),191);
            fill(player1.getPlayerColor(),127);
            rect(0.5*UI_SIZE,0.4*UI_SIZE,3*UI_SIZE,0.7*UI_SIZE,UI_SIZE/5);
            rect(0.5*UI_SIZE,height-1.1*UI_SIZE,3*UI_SIZE,0.7*UI_SIZE,UI_SIZE/5);
            stroke(100,255);
            fill(100,255);
            text("PLAYER 1", 2*UI_SIZE,UI_SIZE);
            text("TURN " + turn, 2*UI_SIZE,height-0.5*UI_SIZE);
            if (showDeploymentp1) {
                stroke(player1.getPlayerColor(),191);
                fill(player1.getPlayerColor(),127);
                rect(2*UI_SIZE,height/2-0.5*UI_SIZE,0.6*UI_SIZE,UI_SIZE);
                rect(0,height/2-4*UI_SIZE,2*UI_SIZE,8*UI_SIZE);
                stroke(100,255);
                fill(100,255);
                strokeWeight(8);
                line(2.2*UI_SIZE,height/2,2.4*UI_SIZE,height/2-0.4*UI_SIZE);
                line(2.2*UI_SIZE,height/2,2.4*UI_SIZE,height/2+0.4*UI_SIZE);
                if (InputReader.getInstance().getMouseDown() && mouseIn(2*UI_SIZE,height/2-UI_SIZE,2.6*UI_SIZE,height/2+UI_SIZE)) {
                    showDeploymentp1 = false;
                }
                player1.drawSideBarUnits();
            }
            else {
                stroke(player1.getPlayerColor(),191);
                fill(player1.getPlayerColor(),127);
                rect(0,height/2-0.5*UI_SIZE,0.6*UI_SIZE,UI_SIZE);
                stroke(100,255);
                fill(100,255);
                strokeWeight(8);
                line(0.4*UI_SIZE,height/2,0.2*UI_SIZE,height/2-0.4*UI_SIZE);
                line(0.4*UI_SIZE,height/2,0.2*UI_SIZE,height/2+0.4*UI_SIZE);
                if (InputReader.getInstance().getMouseDown() && mouseIn(0,height/2-UI_SIZE,0.6*UI_SIZE,height/2+UI_SIZE)) {
                    showDeploymentp1 = true;
                }
            }
        }
        if (turn % 2 == 0) {
            stroke(player2.getPlayerColor(),191);
            fill(player2.getPlayerColor(),127);
            rect(0.5*UI_SIZE,0.4*UI_SIZE,3*UI_SIZE,0.7*UI_SIZE,UI_SIZE/5);
            rect(0.5*UI_SIZE,height-1.1*UI_SIZE,3*UI_SIZE,0.7*UI_SIZE,UI_SIZE/5);
            stroke(100,255);
            fill(100,255);
            text("PLAYER 2", 2*UI_SIZE,UI_SIZE);
            text("TURN " + turn, 2*UI_SIZE,height-0.5*UI_SIZE);
            if (showDeploymentp2) {
                stroke(player2.getPlayerColor(),191);
                fill(player2.getPlayerColor(),127);
                rect(2*UI_SIZE,height/2-0.5*UI_SIZE,0.6*UI_SIZE,UI_SIZE);
                rect(0,height/2-4*UI_SIZE,2*UI_SIZE,8*UI_SIZE);
                stroke(100,255);
                fill(100,255);
                strokeWeight(8);
                line(2.2*UI_SIZE,height/2,2.4*UI_SIZE,height/2-0.4*UI_SIZE);
                line(2.2*UI_SIZE,height/2,2.4*UI_SIZE,height/2+0.4*UI_SIZE);
                if (InputReader.getInstance().getMouseDown() && mouseIn(2*UI_SIZE,height/2-UI_SIZE,2.6*UI_SIZE,height/2+UI_SIZE)) {
                    showDeploymentp2 = false;
                }
                player2.drawSideBarUnits();
            }
            else {
                stroke(player2.getPlayerColor(),191);
                fill(player2.getPlayerColor(),127);
                rect(0,height/2-0.5*UI_SIZE,0.6*UI_SIZE,UI_SIZE);
                stroke(100,255);
                fill(100,255);
                strokeWeight(8);
                line(0.4*UI_SIZE,height/2,0.2*UI_SIZE,height/2-0.4*UI_SIZE);
                line(0.4*UI_SIZE,height/2,0.2*UI_SIZE,height/2+0.4*UI_SIZE);
                if (InputReader.getInstance().getMouseDown() && mouseIn(0,height/2-UI_SIZE,0.6*UI_SIZE,height/2+UI_SIZE)) {
                    showDeploymentp2 = true;
                }
            }
        }
    }

    public boolean getActivity() {
        return active;
    }

    public void setActivity() {
        active = !active;
        if (active) {
            turn = 1;
        }
    }

    public void setActivity(boolean b) {
        active = b;
        if (active) {
            turn = 1;
        }
    }

    public void nextTurn() {
        turn++;
        if (turn % 2 == 1) {
            player1.refreshUnits();
            player2.defreshUnits();
            player2.deselectAll();
        } 
        else {
            player2.refreshUnits();
            player1.defreshUnits();
            player1.deselectAll();
        }
    }

    public int getTurn() {
        return turn;
    }

    public int checkWin(){
        if (player1.playerLost()) {
            return player2.getFaction();
        }
        if (player2.playerLost()) {
            return player1.getFaction();
        }
        if(turn>30){
            if(player1.playerStrength()>player2.playerStrength()){
                return player1.getFaction();
            }
            if(player1.playerStrength()<player2.playerStrength()){
                return player2.getFaction();
            }
        }
        return -1;
    }

    private void drawStrengthComparison() {
        int p1strength = player1.playerStrength();
        int p2strength = player2.playerStrength();
        int sum = p1strength + p2strength;
        color c = player1.getPlayerColor();
        strokeWeight(8);
        if (p1strength != 0 && p2strength != 0) {
            //normal bar
            stroke(100);
            fill(c,127);
            rect(width/2-4*UI_SIZE,0.5*UI_SIZE,8*UI_SIZE*((float)p1strength/(float)sum),0.5*UI_SIZE);
            c = player2.getPlayerColor();
            fill(c,127);
            rect(width/2-4*UI_SIZE+8*UI_SIZE*((float)p1strength/(float)sum),0.5*UI_SIZE,8*UI_SIZE*((float)p2strength/(float)sum),0.5*UI_SIZE);
        }
        else if (sum != 0) {
            if (p1strength != 0) {
                //full p1 bar
                stroke(100);
                fill(c,127);
                rect(width/2-4*UI_SIZE,0.5*UI_SIZE,8*UI_SIZE,0.5*UI_SIZE);
            }
            else {
                //full p2 bar
                c = player2.getPlayerColor();
                stroke(100);
                fill(c,127);
                rect(width/2-4*UI_SIZE,0.5*UI_SIZE,8*UI_SIZE,0.5*UI_SIZE);
            }
        }
        else {
            //setup bar
            stroke(100);
            fill(100,127);
            rect(width/2-4*UI_SIZE,0.5*UI_SIZE,8*UI_SIZE,0.5*UI_SIZE);
        }
    }
}