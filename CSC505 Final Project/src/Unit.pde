abstract class Unit {

    private int cv; //Combat Value, represents size of the unit and scales the # of dice rolled in combat
    private int drm; //Dice Roll Modifier, represents combat power per CV by adding to each dice roll
    private int hp; //Represents damage absorbed before losing a CV
    private int mob; //Mobility - how far unit can move
    private int range; //Range - how far unit can attack from

    private boolean zoneOfControl; //Whether unit exerts zone of control
    private boolean isDeployed;
    private boolean recentlyDeployed; //If it is the first turn Unit is deployed
    private boolean isDragged;
    private boolean isSelected;

    private boolean canMove;
    private boolean canAttack;
    private Tile location;

    private int player;
    private color playerColor;

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
        recentlyDeployed = false;
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

    public boolean isSelected() {
        return isSelected;
    }

    public boolean canMove() {
        return canMove;
    }

    public boolean canAttack() {
        return canAttack;
    }

    public void startDrag() {
        isDragged = true;
    }

    public void select() {
        isSelected = true;
    }

    public void deselect() {
        isSelected = false;
    }

    public int player() {
        return player;
    }

    public int mob() {
        if (this instanceof UnitInfantry) {
            UnitInfantry u = (UnitInfantry) this;
            return u.mob();
        }
        if (this instanceof UnitArmor) {
            UnitArmor u = (UnitArmor) this;
            return u.mob();
        }
        if (this instanceof UnitArtillery) {
            UnitArtillery u = (UnitArtillery) this;
            return u.mob();
        }
        if (this instanceof UnitHQ) {
            UnitHQ u = (UnitHQ) this;
            return u.mob();
        }
        return -1;
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
            Tile t = map.checkTileOver();
            if (t != null && t.isEmpty()) {
                location = t;
                isDeployed = true;
                recentlyDeployed = true;
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
            if (isSelected) {
                borderColor = color(150,0,0);
            }
        }
        else {
            borderColor = color(100);
            if (isSelected) {
                borderColor = color(50,0,0);
            }
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

    public ArrayList<Tile> bfssearch(int range) {
        ArrayList<Tile> moveTargets = new ArrayList<Tile>();
        ArrayList<Tile> connections = new ArrayList<Tile>();
        Queue<Tile> q = new LinkedList<Tile>();
        Queue<Tile> nextq = new LinkedList<Tile>();
        q.add(location);
        for (int i = 0; i <= range; i++) {
            //each 'step' of BFS
            while (!q.isEmpty()) {
                //each step of while adds the connections of each in q
                moveTargets.add(q.peek());
                connections = map.getConnections(q.remove());
                for (Tile t : connections) {
                    if (!moveTargets.contains(t) && !nextq.contains(t) && !q.contains(t) && t.isEmpty()) {
                        nextq.add(t);
                    }
                }
            }
            //has complete nextq of all adjacent to current q.
            while (!nextq.isEmpty()) {
                q.add(nextq.remove());
            }
        }
        moveTargets.remove(location);
        return moveTargets;

    }

}