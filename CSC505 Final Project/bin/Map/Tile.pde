class Tile {
    
    private PVector center;

    public Tile(PVector position) {
        this.center = position.copy();
    }

    public PVector getCenter() {
        return center;
    }

    public void drawTile() {
        CVector brush = center.copy();
        //LOW PRIORITY
    }

}