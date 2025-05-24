abstract class Unit {

    private int cv; //Combat Value, represents size of the unit and scales the # of dice rolled in combat
    private int drm; //Dice Roll Modifier, represents combat power per CV by adding to each dice roll
    private int hp; //Represents damage absorbed before losing a CV
    private int mob; //Mobility - how far unit can move
    private int range; //Range - how far unit can attack from

    private boolean zoneOfControl; //Whether unit exerts zone of control
    private boolean isDeployed;
    private boolean isDragged;

    private boolean canMove;
    private boolean canAttack;
    private Tile location;

    private int player;

    public void deployTo(Tile location) {
        isDeployed = true;
        location = location;
    }

    public void takeDamage(int dmg) {
        cv -= dmg/hp;
        if (cv < 1) {
            unitDeath();
        }
    }

    public void unitDeath() {
        location.empty();
        // TO FILL OUT SOON
    }

    public void refresh() {
        canMove = true;
        canAttack = true;
    }

    public void attack(Tile target) {
        canAttack = false;
        canMove = false;
    }

    public void move (Tile target) {
        canMove = false;
    }

    public boolean isDeployed() {
        return isDeployed;
    }

    public boolean isDragged() {
        return isDragged;
    }

    public void startDrag() {
        isDragged = true;
    }

    public void drag() {
        stroke(100,191);
        strokeWeight(6);
        if (player == 1) {
            fill(player1.getPlayerColor(),127);
        }
        else {
            fill(player2.getPlayerColor(),127);
        }
        if (InputReader.getInstance().getMouseDown()) {
            if (this instanceof UnitInfantry) {
                rect(mouseX-0.5*UI_SIZE,mouseY-0.5*UI_SIZE,UI_SIZE,UI_SIZE);
                line(mouseX-0.5*UI_SIZE,mouseY-0.5*UI_SIZE,mouseX+0.5*UI_SIZE,mouseY+0.5*UI_SIZE);
                line(mouseX-0.5*UI_SIZE,mouseY+0.5*UI_SIZE,mouseX+0.5*UI_SIZE,mouseY-0.5*UI_SIZE);
            }
            if (this instanceof UnitArmor) {
                rect(mouseX-0.5*UI_SIZE,mouseY-0.5*UI_SIZE,UI_SIZE,UI_SIZE);
                rect(mouseX-0.3*UI_SIZE,mouseY-0.2*UI_SIZE,0.6*UI_SIZE,0.4*UI_SIZE,0.2*UI_SIZE);
            }
            if (this instanceof UnitArtillery) {
                rect(mouseX-0.5*UI_SIZE,mouseY-0.5*UI_SIZE,UI_SIZE,UI_SIZE);
                fill(100,255);
                circle(mouseX,mouseY,0.2*UI_SIZE);
            }
            if (this instanceof UnitHQ) {
                rect(mouseX-0.5*UI_SIZE,mouseY-0.5*UI_SIZE,UI_SIZE,UI_SIZE);
                fill(100,255);
                textSize(0.5*UI_SIZE);
                text("HQ",mouseX, mouseY+0.1*UI_SIZE);
            }
        }
        else {
            isDragged = false;
        }
    }

}