class Map {

    private int size;
    private HashMap<Tile,ArrayList<Tile>> tileMap;
    private PVector generationVector = new PVector(0,0);
    private Tile generationTile = new Tile(generationVector);

    public Map(int n) {
        size = n;
        tileMap = new HashMap<>();
    }

    public void generateMap() {
        Tile temp;
        for (int y = 0; y < size; y++) {
            for (int x = -size+1; x < size; x++) {
                generationVector.x = x;
                generationVector.y = y;
                generationTile.setCenter(generationVector);
                temp = generationTile.copy();
                if (Math.random() > 0.15) {
                    tileMap.put(temp, null);
                }
            }
        }
        for (int y = size; y < size*2; y++) {
            for (int x = -2*size+1+y; x < 2*size-y; x++) {
                generationVector.x = x;
                generationVector.y = y;
                generationTile.setCenter(generationVector);
                temp = generationTile.copy();
                if (Math.random() > 0.15) {
                    tileMap.put(temp, null);
                }
            }
        }
        for (Tile t : tileMap.keySet()) {
            this.generateAdjacencies(t);
        }
        //Write Diamond Square Terrain Algorithm here
    }

    public void mapSquareRender() {
        translate(width/2,height/2+200);
        PVector v;
        for (Tile t : tileMap.keySet()) {
            strokeWeight(6);
            stroke(25);
            fill(100);
            v = t.getCenter();
            rect(20*v.x-10,-20*v.y-10-10*Math.abs(v.x),20,20);
            if (mouseIn(width/2+20*v.x-10,height/2+size*20-20*v.y-10-10*Math.abs(v.x),width/2+20*v.x+10,height/2+size*20-20*v.y+10-10*Math.abs(v.x))) {
                fill(255,255,0);
                rect(20*v.x-10,-20*v.y-10-10*Math.abs(v.x),20,20);
                stroke(255,0,0);
                strokeWeight(1);
                for (Tile neighbor : tileMap.get(t)) {
                    line(20*v.x,-20*v.y-10*Math.abs(v.x),20*neighbor.getCenter().x,-20*neighbor.getCenter().y-10*Math.abs(neighbor.getCenter().x));
                }
            }
        }
    }

    public void drawMap() {
        Unit u;
        for (Tile t : tileMap.keySet()) {
            t.drawTile();
        }
        for (Tile t : tileMap.keySet()) {
            u = t.getUnitIn();
            if (u != null) {
                if (u.isSelected()) {
                    int mob = u.mob();
                    int range = u.range();
                    for (Tile m : u.bfsmovesearch(mob)) {
                        m.drawMoveTile();
                        if (InputReader.getInstance().getMouseDown() && m.mouseOver()) {
                            u.moveTo(m);
                        }
                    }
                    for (Tile m : u.bfsattacksearch(range)) {
                        m.drawAttackTile();
                        if (m.mouseOver()) {
                            u.previewAttack(m.getUnitIn());
                            if (InputReader.getInstance().getMouseDown()) {
                                u.attack(m);
                            }
                        }
                    }
                }
            }
        }
    }

    public void connectTiles(Tile t1, Tile t2) {
        ArrayList<Tile> list1 = new ArrayList<Tile>();
        ArrayList<Tile> list2 = new ArrayList<Tile>();
        if (tileMap.get(t1)!=null) {
            list1 = tileMap.get(t1);
        }
        if (tileMap.get(t2)!=null) {
            list2 = tileMap.get(t2);
        }
        list1.add(t2);
        list2.add(t1);
        tileMap.put(t1,list1);
        tileMap.put(t2,list2);
    }

    public void connectTiles(boolean adjacent, Tile t1, Tile t2) {
        if (adjacent) {
            ArrayList<Tile> list1 = new ArrayList<Tile>();
            ArrayList<Tile> list2 = new ArrayList<Tile>();
            if (tileMap.get(t1)!=null) {
                list1 = tileMap.get(t1);
            }
            if (tileMap.get(t2)!=null) {
                list2 = tileMap.get(t2);
            }
            list1.add(t2);
            list2.add(t1);
            tileMap.put(t1,list1);
            tileMap.put(t2,list2);
        }
    }

    public void generateAdjacencies(Tile t1) {
        Tile temp = new Tile(t1.getCenter());
        for (Tile t : tileMap.keySet()) {
            temp.setCenter(t1.getCenter().copy().add(-1,0));
            if (t.equals(temp)) {
                this.connectTiles(t1,t);
            }
            temp.setCenter(t1.getCenter().copy().add(0,-1));
            if (t.equals(temp)) {
                this.connectTiles(t1,t);
            }
            temp.setCenter(t1.getCenter().copy().add(1,1));
            if (t.equals(temp) && t.getCenter().x<=0) {
                this.connectTiles(t1,t);
            }
            temp.setCenter(t1.getCenter().copy().add(-1,1));
            if (t.equals(temp) && t.getCenter().x>=0) {
                this.connectTiles(t1,t);
            }
        }
    }

    public Tile checkTileOver() {
        for (Tile t : tileMap.keySet()) {
            if (t.getMouseOver()) {
                return t;
            }
        }
        return null;
    }

    public ArrayList<Tile> getConnections(Tile t) {
        if (tileMap.keySet().contains(t)) {
            return tileMap.get(t);
        }
        return null;
    }
}