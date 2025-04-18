class Tile {
    
    private PVector center;

    public Tile(PVector position) {
        this.center = position.copy();
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

}