class Camera {

    private PVector position;
    private float zoom;
    private boolean zoomLocked;

    public Camera(PVector position) {
        this.position = position;
        this.zoom = 10;
        this.zoomLocked = true;
    }

    public PVector getPosition() {
        return position;
    }

    public float getZoom() {
        return zoom;
    }

    

}