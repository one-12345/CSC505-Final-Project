class Game {

    private int turn;
    private boolean active;

    public Game(boolean b) {
        active = b;
    }

    public void updateGame() {
        if (turn % 2 == 1) {
            stroke(player1.getPlayerColor(),191);
            fill(player1.getPlayerColor(),127);
            rect(0.5*UI_SIZE,0.4*UI_SIZE,3*UI_SIZE,0.7*UI_SIZE,UI_SIZE/5);
            stroke(100,255);
            fill(100,255);
            text("PLAYER 1", 2*UI_SIZE,UI_SIZE);
            player1.drawHand();
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

}