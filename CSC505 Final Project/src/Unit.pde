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
    private boolean isHidden;

    private boolean canMove;
    private boolean canAttack;
    private Tile location;

    private int player;
    private color playerColor;

    public void takeDamage(int dmg) {
        if (this instanceof UnitInfantry) {
            UnitInfantry u = (UnitInfantry) this;
            u.takeDamage(dmg);
        }
        if (this instanceof UnitArmor) {
            UnitArmor u = (UnitArmor) this;
            u.takeDamage(dmg);
        }
        if (this instanceof UnitArtillery) {
            UnitArtillery u = (UnitArtillery) this;
            u.takeDamage(dmg);
        }
        if (this instanceof UnitHQ) {
            UnitHQ u = (UnitHQ) this;
            u.takeDamage(dmg);
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

    public void defresh() {
        canMove = false;
        canAttack = false;
    }

    public void attack(Tile target) {
        int damage = 0;
        int retaliation = 0;
        Unit targetUnit = target.getUnitIn();
        for (int i = 0; i < cv(); i++) {
            damage+=(int) (Math.random()*6)+1 + drm();
        }
        if (targetUnit.bfsattacksearch(targetUnit.range(true),true).contains(location)) {
            for (int i = 0; i < targetUnit.cv(); i++) {
                retaliation+=(int) (Math.random()*6)+1 + targetUnit.drm();
            }
        }
        targetUnit.takeDamage(damage);
        takeDamage(retaliation);
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

    public void moveTo(Tile t) {
        location.empty();
        location = t;
        location.moveIn(this);
        canMove = false;
    }

    public int player() {
        return player;
    }

    public color playerColor() {
        return playerColor;
    }

    public int cv() {
        if (this instanceof UnitInfantry) {
            UnitInfantry u = (UnitInfantry) this;
            return u.cv();
        }
        if (this instanceof UnitArmor) {
            UnitArmor u = (UnitArmor) this;
            return u.cv();
        }
        if (this instanceof UnitArtillery) {
            UnitArtillery u = (UnitArtillery) this;
            return u.cv();
        }
        if (this instanceof UnitHQ) {
            UnitHQ u = (UnitHQ) this;
            return u.cv();
        }
        return -1;
    }

    public int drm() {
        if (this instanceof UnitInfantry) {
            UnitInfantry u = (UnitInfantry) this;
            return u.drm();
        }
        if (this instanceof UnitArmor) {
            UnitArmor u = (UnitArmor) this;
            return u.drm();
        }
        if (this instanceof UnitArtillery) {
            UnitArtillery u = (UnitArtillery) this;
            return u.drm();
        }
        if (this instanceof UnitHQ) {
            UnitHQ u = (UnitHQ) this;
            return u.drm();
        }
        return -1;
    }

    public int hp() {
        if (this instanceof UnitInfantry) {
            UnitInfantry u = (UnitInfantry) this;
            return u.hp();
        }
        if (this instanceof UnitArmor) {
            UnitArmor u = (UnitArmor) this;
            return u.hp();
        }
        if (this instanceof UnitArtillery) {
            UnitArtillery u = (UnitArtillery) this;
            return u.hp();
        }
        if (this instanceof UnitHQ) {
            UnitHQ u = (UnitHQ) this;
            return u.hp();
        }
        return -1;
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

    public int range() {
        if (this instanceof UnitInfantry) {
            UnitInfantry u = (UnitInfantry) this;
            return u.range();
        }
        if (this instanceof UnitArmor) {
            UnitArmor u = (UnitArmor) this;
            return u.range();
        }
        if (this instanceof UnitArtillery) {
            UnitArtillery u = (UnitArtillery) this;
            return u.range();
        }
        if (this instanceof UnitHQ) {
            UnitHQ u = (UnitHQ) this;
            return u.range();
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
        strokeWeight(0.25*size);
        color borderColor;
        if (canAttack && canMove) {
            borderColor = color(0,100,0);
            if (isSelected) {
                borderColor = color(0,150,0);
            }
        }
        else if (canAttack) {
            borderColor = color(100,100,0);
            if (isSelected) {
                borderColor = color(150,150,0);
            }
        }
        else {
            borderColor = color(100);
            if (isSelected) {
                borderColor = color(50);
            }
        }
        if (playerColor != 0) {
            stroke(borderColor,255);
            fill(playerColor,255);
        }
        rect(camera.getZoom()*v.x+camera.getCameraPosition().x-size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-size,2*size,2*size);
        if (this instanceof UnitInfantry && !(isHidden && game.getTurn() % 2 != player % 2)) {
            line(camera.getZoom()*v.x+camera.getCameraPosition().x-size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-size,camera.getZoom()*v.x+camera.getCameraPosition().x+size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)+size);
            line(camera.getZoom()*v.x+camera.getCameraPosition().x+size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-size,camera.getZoom()*v.x+camera.getCameraPosition().x-size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)+size);
        }
        if (this instanceof UnitArmor && !(isHidden && game.getTurn() % 2 != player % 2)) {
            rect(camera.getZoom()*v.x+camera.getCameraPosition().x-0.6*size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-0.4*size,1.2*size,0.8*size,0.4*size);
        }
        if (this instanceof UnitArtillery && !(isHidden && game.getTurn() % 2 != player % 2)) {
            fill(borderColor,255);
            circle(camera.getZoom()*v.x+camera.getCameraPosition().x, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y),0.4*size);
        }
        if (this instanceof UnitHQ && !(isHidden && game.getTurn() % 2 != player % 2)) {
            fill(borderColor,255);
            textSize(size);
            text("HQ",camera.getZoom()*v.x+camera.getCameraPosition().x, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y));
        }
        stroke(borderColor);
        fill(borderColor);
        strokeWeight(0.1*size);
        for (int i = 0; i < cv(); i++) {
            triangle(camera.getZoom()*v.x+camera.getCameraPosition().x-(1-0.5*i)*size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-size,camera.getZoom()*v.x+camera.getCameraPosition().x-(0.5-0.5*i)*size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-size,camera.getZoom()*v.x+camera.getCameraPosition().x-(0.75-0.5*i)*size, (float) (camera.getZoom()*(v.y+Math.abs(v.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y)-(1+(float)Math.sqrt(3)/4)*size);
        }
    }

    public ArrayList<Tile> bfsmovesearch(int range) {
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

    public ArrayList<Tile> bfsattacksearch(int range) {
        ArrayList<Tile> attackTargets = new ArrayList<Tile>();
        ArrayList<Tile> connections = new ArrayList<Tile>();
        Queue<Tile> q = new LinkedList<Tile>();
        Queue<Tile> nextq = new LinkedList<Tile>();
        q.add(location);
        for (int i = 0; i <= range; i++) {
            //each 'step' of BFS
            while (!q.isEmpty()) {
                //each step of while adds the connections of each in q
                attackTargets.add(q.peek());
                connections = map.getConnections(q.remove());
                for (Tile t : connections) {
                    if (!attackTargets.contains(t) && !nextq.contains(t) && !q.contains(t)) {
                        nextq.add(t);
                    }
                }
            }
            //has complete nextq of all adjacent to current q.
            while (!nextq.isEmpty()) {
                q.add(nextq.remove());
            }
        }
        attackTargets.remove(location);
        ArrayList<Tile> finalTargets = new ArrayList<Tile>();
        for (Tile t : attackTargets) {
            if (!t.isEmpty() && t.getUnitIn().player() % 2 != game.getTurn() % 2) {
                finalTargets.add(t);
            }
        }
        return finalTargets;
    }

    public void previewAttack(Unit u) {
        stroke(100);
        fill(playerColor,192);
        strokeWeight(4);
        rect(width/2-4*UI_SIZE,height-3*UI_SIZE,4*UI_SIZE,3*UI_SIZE);
        fill(playerColor,255);
        rect(width/2-3.5*UI_SIZE,height-2.5*UI_SIZE,UI_SIZE,UI_SIZE);
        if (this instanceof UnitInfantry) {
            line(width/2-3.5*UI_SIZE,height-2.5*UI_SIZE,width/2-2.5*UI_SIZE,height-1.5*UI_SIZE);
            line(width/2-3.5*UI_SIZE,height-1.5*UI_SIZE,width/2-2.5*UI_SIZE,height-2.5*UI_SIZE);
        }
        if (this instanceof UnitArmor) {
            rect(width/2-3.3*UI_SIZE,height-2.2*UI_SIZE,0.6*UI_SIZE,0.4*UI_SIZE,0.2*UI_SIZE);
        }
        if (this instanceof UnitArtillery) {
            fill(100);
            circle(width/2-3*UI_SIZE,height-2*UI_SIZE,0.2*UI_SIZE);
        }
        if (this instanceof UnitHQ) {
            textSize(UI_SIZE);
            text("HQ",width/2-3*UI_SIZE,height-2.1*UI_SIZE);
        }
        textAlign(LEFT);
        fill(100);
        textSize(20);
        text("CV: " + cv(),width/2-2*UI_SIZE,height-2*UI_SIZE);
        text("DRM: +" + drm(),width/2-2*UI_SIZE,height-1.5*UI_SIZE);
        text("HP: " + hp(),width/2-2*UI_SIZE,height-UI_SIZE);
        int lowBound = (1+drm())*cv()/u.hp();
        int highBound = (6+drm())*cv()/u.hp();
        text("ED: " + lowBound + " - " + highBound,width/2-2*UI_SIZE,height-0.5*UI_SIZE);
        textAlign(CENTER);


        fill(u.playerColor(),192);
        rect(width/2,height-3*UI_SIZE,4*UI_SIZE,3*UI_SIZE);
        fill(u.playerColor(),255);
        rect(width/2+0.5*UI_SIZE,height-2.5*UI_SIZE,UI_SIZE,UI_SIZE);
        if (u instanceof UnitInfantry) {
            line(width/2+0.5*UI_SIZE,height-2.5*UI_SIZE,width/2+1.5*UI_SIZE,height-1.5*UI_SIZE);
            line(width/2+0.5*UI_SIZE,height-1.5*UI_SIZE,width/2+1.5*UI_SIZE,height-2.5*UI_SIZE);
        }
        if (u instanceof UnitArmor) {
            rect(width/2+0.7*UI_SIZE,height-2.2*UI_SIZE,0.6*UI_SIZE,0.4*UI_SIZE,0.2*UI_SIZE);
        }
        if (u instanceof UnitArtillery) {
            fill(100);
            circle(width/2+UI_SIZE,height-2*UI_SIZE,0.2*UI_SIZE);
        }
        if (u instanceof UnitHQ) {
            fill(100);
            textSize(0.5*UI_SIZE);
            text("HQ",width/2+UI_SIZE,height-2*UI_SIZE);
        }
        textAlign(LEFT);
        fill(100);
        textSize(20);
        text("CV: " + u.cv(),width/2+2*UI_SIZE,height-2*UI_SIZE);
        text("DRM: +" + u.drm(),width/2+2*UI_SIZE,height-1.5*UI_SIZE);
        text("HP: " + u.hp(),width/2+2*UI_SIZE,height-UI_SIZE);
        lowBound = (1+u.drm())*u.cv()/hp();
        highBound = (6+u.drm())*u.cv()/hp();
        text("ED: " + lowBound + " - " + highBound,width/2+2*UI_SIZE,height-0.5*UI_SIZE);
        textAlign(CENTER);
    }

    public ArrayList<Tile> bfsattacksearch(int range, boolean retaliation) {
        ArrayList<Tile> attackTargets = new ArrayList<Tile>();
        ArrayList<Tile> connections = new ArrayList<Tile>();
        Queue<Tile> q = new LinkedList<Tile>();
        Queue<Tile> nextq = new LinkedList<Tile>();
        q.add(location);
        for (int i = 0; i <= range; i++) {
            //each 'step' of BFS
            while (!q.isEmpty()) {
                //each step of while adds the connections of each in q
                attackTargets.add(q.peek());
                connections = map.getConnections(q.remove());
                for (Tile t : connections) {
                    if (!attackTargets.contains(t) && !nextq.contains(t) && !q.contains(t)) {
                        nextq.add(t);
                    }
                }
            }
            //has complete nextq of all adjacent to current q.
            while (!nextq.isEmpty()) {
                q.add(nextq.remove());
            }
        }
        attackTargets.remove(location);
        ArrayList<Tile> finalTargets = new ArrayList<Tile>();
        for (Tile t : attackTargets) {
            if (!t.isEmpty()) {
                finalTargets.add(t);
            }
        }
        return finalTargets;
    }

    public int range(boolean retaliation) {
        if (this instanceof UnitInfantry) {
            UnitInfantry u = (UnitInfantry) this;
            return u.range(retaliation);
        }
        if (this instanceof UnitArmor) {
            UnitArmor u = (UnitArmor) this;
            return u.range(retaliation);
        }
        if (this instanceof UnitArtillery) {
            UnitArtillery u = (UnitArtillery) this;
            return u.range(retaliation);
        }
        if (this instanceof UnitHQ) {
            UnitHQ u = (UnitHQ) this;
            return u.range(retaliation);
        }
        return -1;
    }

}