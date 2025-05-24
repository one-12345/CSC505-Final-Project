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
        strokeWeight(camera.getZoom()/20);
        stroke(25);
        fill(100);
        polygon(camera.getZoom()*center.x+camera.getCameraPosition().x, (float) (camera.getZoom()*(center.y+Math.abs(center.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y),camera.getZoom()/2,6);
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