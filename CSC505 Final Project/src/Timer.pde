static class Timer {

    private static final Timer INSTANCE= new Timer();
    private long delta;
    private long lastTime;

    private Timer() {
        delta = 0;
        lastTime = 0;
    }

    public static Timer getInstance() {
        return INSTANCE;
    }

    public void updateTime() {
        delta = System.currentTimeMillis() - lastTime;
        lastTime+=delta;
    }

    public long getDelta() {
        return delta;
    }
}