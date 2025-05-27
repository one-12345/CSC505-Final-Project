class Tile {
    
    private PVector center;
    private Unit unit;
    private boolean mouseOver;

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
        fill(50);
        if (mouseOver()) {
            fill(200);
            mouseOver = true;
        }
        else {
            mouseOver = false;
        }
        polygon(camera.getZoom()*center.x+camera.getCameraPosition().x, (float) (camera.getZoom()*(center.y+Math.abs(center.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y),camera.getZoom()/2,6);
        if (unit != null) {
            unit.drawUnit();
        }
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

    public boolean isEmpty() {
        return unit == null;
    }

    public void moveIn(Unit u) {
        unit = u;
    }

    public boolean mouseOver() {
        PVector v = new PVector(camera.getZoom()*center.x+camera.getCameraPosition().x, (float) (camera.getZoom()*(center.y+Math.abs(center.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y));
        return insideHexagon(mousePosition,v,camera.getZoom()/2);
    }

    public boolean getMouseOver() {
        return mouseOver;
    }

    public Unit getUnitIn() {
        return unit;
    }

    public void drawMoveTile() {
        strokeWeight(camera.getZoom()/20);
        stroke(25);
        fill(100,100,0);
        if (mouseOver()) {
            fill(200,200,0);
            mouseOver = true;
        }
        else {
            mouseOver = false;
        }
        polygon(camera.getZoom()*center.x+camera.getCameraPosition().x, (float) (camera.getZoom()*(center.y+Math.abs(center.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y),camera.getZoom()/2,6);
    }

    public void drawAttackTile() {
        strokeWeight(camera.getZoom()/20);
        stroke(25);
        fill(100,0,0);
        if (mouseOver()) {
            fill(0,200,0);
            mouseOver = true;
        }
        else {
            mouseOver = false;
        }
        polygon(camera.getZoom()*center.x+camera.getCameraPosition().x, (float) (camera.getZoom()*(center.y+Math.abs(center.x/2))*2/Math.sqrt(3)+camera.getCameraPosition().y),camera.getZoom()/2,6);
        unit.drawUnit();
    }
}