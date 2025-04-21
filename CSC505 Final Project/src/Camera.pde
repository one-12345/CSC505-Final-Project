class Camera {

    private PVector cameraCenter;
    private float zoom;
    final PVector SHIFT = new PVector(width/2,height/2);

    public Camera() {
        this.cameraCenter = SHIFT;
        this.zoom = 50;
    }

    public PVector getCameraPosition() {
        return cameraCenter;
    }

    public float getZoom() {
        return zoom;
    }

    public void cameraMovement() {
        long delta = Timer.getInstance().getDelta();
        float CAMERA_SPEED = 0.5*zoom;
        final float ZOOM_SPEED = 1.003;
        final float MAX_ZOOM = 100;
        final float MIN_ZOOM = 30;
        InputReader inputReader = InputReader.getInstance();
        if (inputReader.getKeyDown(UP) || inputReader.getKeyDown('w')) {
            cameraCenter.add(0,CAMERA_SPEED*delta/zoom);
        }
        if (inputReader.getKeyDown(DOWN) || inputReader.getKeyDown('s')) {
            cameraCenter.add(0,-CAMERA_SPEED*delta/zoom);
        }
        if (inputReader.getKeyDown(LEFT) || inputReader.getKeyDown('a')) {
            cameraCenter.add(CAMERA_SPEED*delta/zoom,0);
        }
        if (inputReader.getKeyDown(RIGHT) || inputReader.getKeyDown('d')) {
            cameraCenter.add(-CAMERA_SPEED*delta/zoom,0);
        }
        if (inputReader.getKeyDown('e')) {
            if (zoom < MAX_ZOOM/ZOOM_SPEED) {
                zoom*=Math.pow(ZOOM_SPEED,delta);
            } else {
                zoom = MAX_ZOOM;
            }
        }
        if (inputReader.getKeyDown('q')) {
            if (zoom > MIN_ZOOM*ZOOM_SPEED) {
                zoom/=Math.pow(ZOOM_SPEED,delta);
            } else {
                zoom = MIN_ZOOM;
            }
        }
    }
}