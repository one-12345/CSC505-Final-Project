static class InputReader {
    private static final InputReader INSTANCE= new InputReader();
    private HashMap<Integer, Boolean> intKeyDown;
    private HashMap<Character, Boolean> charKeyDown;

    private InputReader() {
        intKeyDown = new HashMap<Integer, Boolean>();
        charKeyDown = new HashMap<Character, Boolean>();
    }

    public static InputReader getInstance() {
        return INSTANCE;
    }

    public void pressKey(int k) {
        intKeyDown.put(k, true);
    }
    
    public void pressKey(char k) {
        charKeyDown.put(k, true);
    }

    public void releaseKey(int k) {
        intKeyDown.put(k, false);
    }
    
    public void releaseKey(char k) {
        charKeyDown.put(k, false);
    }

    public boolean getKeyDown(int k) {
        if (intKeyDown.get(k) == null) {
            releaseKey(k);
        }
        return intKeyDown.get(k);

    }
    
    public boolean getKeyDown(char k) {
        if (charKeyDown.get(k) == null) {
            releaseKey(k);
        }
        return charKeyDown.get(k);

    }
}
