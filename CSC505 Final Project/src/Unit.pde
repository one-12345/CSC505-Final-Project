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
    private color playerColor;

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
        if (player == 1) {
            player1.removeUnit(this);
        }
        if (player == 2) {
            player2.removeUnit(this);
        }
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

    public void drag(color c) {
        playerColor = c;
        stroke(100,191);
        strokeWeight(6);
        fill(c,127);
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
            Tile t = map.checkDrop();
            if (t != null && t.isEmpty()) {
                location = t;
                isDeployed = true;
                t.moveIn(this);
            }
        }
    }

    public void drawUnit() {
        PVector v = location.getCenter();
        float size = 0.2*camera.getZoom();
        strokeWeight(camera.getZoom()/20);
        color borderColor;
        if (canAttack || canMove) {
            borderColor = color(150,150,0);
        }
        else {
            borderColor = color(100);
        }
        if (playerColor != 0) {
            stroke(borderColor,255);
            fill(playerColor,255);
        }
        rect(camera.getZoom()*v.x+camera.getCameraPosition().x-size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-size,2*size,2*size);
        if (this instanceof UnitInfantry) {
            line(camera.getZoom()*v.x+camera.getCameraPosition().x-size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-size,camera.getZoom()*v.x+camera.getCameraPosition().x+size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)+size);
            line(camera.getZoom()*v.x+camera.getCameraPosition().x+size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-size,camera.getZoom()*v.x+camera.getCameraPosition().x-size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)+size);
        }
        if (this instanceof UnitArmor) {
            rect(camera.getZoom()*v.x+camera.getCameraPosition().x-0.6*size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-0.4*size,1.2*size,0.8*size,0.4*size);
        }
        if (this instanceof UnitArtillery) {
            fill(borderColor,255);
            circle(camera.getZoom()*v.x+camera.getCameraPosition().x, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y),0.4*size);
        }
        if (this instanceof UnitHQ) {
            fill(borderColor,255);
            textSize(size);
            text("HQ",camera.getZoom()*v.x+camera.getCameraPosition().x, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y));
        }
    }

}