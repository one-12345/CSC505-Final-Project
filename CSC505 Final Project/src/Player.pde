class Player {
    
    private int playerID;
    private int faction;
    private color playerColor;
    private ArrayList<Unit> units = new ArrayList<Unit>();

    public Player(color c, int n) {
        playerColor = c;
        playerID = n;
    }

    public void setFaction(int n) {
        faction = n;
        units.clear();
        switch (faction) {
            case 0:
                for (int i = 0; i < 8; i++) {
                    units.add(new UnitInfantry(playerID));
                }
                for (int i = 0; i < 2; i++) {
                    units.add(new UnitArmor(playerID));
                }
                for (int i = 0; i < 2; i++) {
                    units.add(new UnitArtillery(playerID));
                }
                units.add(new UnitHQ(playerID));
                break;
            case 1:
                for (int i = 0; i < 8; i++) {
                    units.add(new UnitInfantry(playerID));
                }
                for (int i = 0; i < 2; i++) {
                    units.add(new UnitArmor(playerID));
                }
                for (int i = 0; i < 2; i++) {
                    units.add(new UnitArtillery(playerID));
                }
                units.add(new UnitHQ(playerID));
                break;
            case 2:
                for (int i = 0; i < 8; i++) {
                    units.add(new UnitInfantry(playerID));
                }
                for (int i = 0; i < 2; i++) {
                    units.add(new UnitArmor(playerID));
                }
                for (int i = 0; i < 2; i++) {
                    units.add(new UnitArtillery(playerID));
                }
                units.add(new UnitHQ(playerID));
                break;
        }
    }

    public int getFaction () {
        return faction;
    }

    public void setPlayerColor(color c) {
        playerColor = c;
    }

    public color getPlayerColor() {
        return playerColor;
    }

    public void drawSideBarUnits() {
        int infantryCount = 0;
        int armorCount = 0;
        int artilleryCount = 0;
        int flagCount = 0;
        // Other unit types later
        for (Unit u : units) {
            if (!u.isDeployed() && !u.isDragged()) {
                if (u instanceof UnitInfantry) {
                    infantryCount++;
                }
                if (u instanceof UnitArmor) {
                    armorCount++;
                }
                if (u instanceof UnitArtillery) {
                    artilleryCount++;
                }
                if (u instanceof UnitHQ) {
                    flagCount++;
                }
            }
            if (u.isDragged()) {
                u.drag(playerColor);
            }
        }
        stroke(100,255);
        strokeWeight(6);
        fill(playerColor,255);

        //Infantry symbol
        rect(0.5*UI_SIZE,height/2-3.5*UI_SIZE,1*UI_SIZE,1*UI_SIZE);
        line(0.5*UI_SIZE,height/2-3.5*UI_SIZE,1.5*UI_SIZE,height/2-2.5*UI_SIZE);
        line(0.5*UI_SIZE,height/2-2.5*UI_SIZE,1.5*UI_SIZE,height/2-3.5*UI_SIZE);

        //Armor symbol
        rect(0.5*UI_SIZE,height/2-1.5*UI_SIZE,1*UI_SIZE,1*UI_SIZE);
        rect(0.7*UI_SIZE,height/2-1.2*UI_SIZE,0.6*UI_SIZE,0.4*UI_SIZE,0.2*UI_SIZE);

        //Artillery symbol
        rect(0.5*UI_SIZE,height/2+0.5*UI_SIZE,1*UI_SIZE,1*UI_SIZE);
        fill(100,255);
        circle(UI_SIZE,height/2+UI_SIZE,0.2*UI_SIZE);

        //HQ symbol
        fill(playerColor,255);
        rect(0.5*UI_SIZE,height/2+2.5*UI_SIZE,1*UI_SIZE,1*UI_SIZE);
        fill(100,255);
        textSize(0.5*UI_SIZE);
        text("HQ",UI_SIZE, height/2+3.1*UI_SIZE);

        //Circles (with remaining units able to be deployed)
        textAlign(CENTER);
        strokeWeight(4);
        stroke(50,255);
        circle(1.5*UI_SIZE,height/2-2.5*UI_SIZE,0.5*UI_SIZE);
        circle(1.5*UI_SIZE,height/2-0.5*UI_SIZE,0.5*UI_SIZE);
        circle(1.5*UI_SIZE,height/2+1.5*UI_SIZE,0.5*UI_SIZE);
        circle(1.5*UI_SIZE,height/2+3.5*UI_SIZE,0.5*UI_SIZE);
        textSize(16);
        fill(50,255);
        text(infantryCount,1.5*UI_SIZE,height/2-2.4*UI_SIZE);
        text(armorCount,1.5*UI_SIZE,height/2-0.4*UI_SIZE);
        text(artilleryCount,1.5*UI_SIZE,height/2+1.6*UI_SIZE);
        text(flagCount,1.5*UI_SIZE,height/2+3.6*UI_SIZE);
        
        if (InputReader.getInstance().getMouseDown() && mouseIn(0.5*UI_SIZE,height/2-3.5*UI_SIZE,1.5*UI_SIZE,height/2-2.5*UI_SIZE)) {
            if (infantryCount > 0) {
                for (Unit u : units) {
                    if (!u.isDeployed() && u instanceof UnitInfantry) {
                        u.startDrag();
                        break;
                    }
                }
            }
        }
        if (InputReader.getInstance().getMouseDown() && mouseIn(0.5*UI_SIZE,height/2-1.5*UI_SIZE,1.5*UI_SIZE,height/2-0.5*UI_SIZE)) {
            if (armorCount > 0) {
                for (Unit u : units) {
                    if (!u.isDeployed() && u instanceof UnitArmor) {
                        u.startDrag();
                        break;
                    }
                }
            }
        }
        if (InputReader.getInstance().getMouseDown() && mouseIn(0.5*UI_SIZE,height/2+0.5*UI_SIZE,1.5*UI_SIZE,height/2+1.5*UI_SIZE)) {
            if (artilleryCount > 0) {
                for (Unit u : units) {
                    if (!u.isDeployed() && u instanceof UnitArtillery) {
                        u.startDrag();
                        break;
                    }
                }
            }
        }
        if (InputReader.getInstance().getMouseDown() && mouseIn(0.5*UI_SIZE,height/2+2.5*UI_SIZE,1.5*UI_SIZE,height/2+3.5*UI_SIZE)) {
            if (flagCount > 0) {
                for (Unit u : units) {
                    if (!u.isDeployed() && u instanceof UnitHQ) {
                        u.startDrag();
                        break;
                    }
                }
            }
        }
    }

    public void refreshUnits() {
        for (Unit u : units) {
            if (u.isDeployed()) {
                u.refresh();
            }
        }
    }

    public void removeUnit(Unit u) {
        units.remove(u);
    }

    public void deselectAll() {
        for (Unit u : units) {
            u.deselect();
        }
    }

    public int returnID() {
        return playerID;
    }

}