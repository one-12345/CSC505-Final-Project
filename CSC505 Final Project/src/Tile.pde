class Tile {
    
    private PVector center;
    private Unit unit;

    public Tile(PVector position) {
        this.center = position.copy();
        unit = null;
    }

    public PVector getCenter() {
        return center;
    }

    public void setCenter(PVector newCenter) {
        center = newCenter;
    }

    public void drawTile() {
        PVector brush = center.copy();
        //LOW PRIORITY
    }

    public Tile copy() {
        return new Tile(this.center);
    }

    public boolean equals(Tile t) {
        return t.getCenter().equals(center);
    }

    public String toString() {
        return this.center.toString();
    }

    public void empty() {
        unit = null;
    }

}