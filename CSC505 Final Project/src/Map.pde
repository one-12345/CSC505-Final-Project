class Map {

    private int size;
    private HashMap<Tile,List<Tile>> tileMap;
    private PVector generationVector = new PVector(0,0);

    public Map(int n) {
        size = n;
        tileMap = new HashMap<>();
    }

    public void generateMap() {
        for (int y = 0; y < size; y++) {
            for (int x = -size+1; x < size; x++) {
                tileMap.put(new Tile(new PVector(x,y)), null);
            }
        }
        for (int y = size; y < size*2-1; i++) {
            for (int x = -2*size+1+y; x < 2*size-y; y++) {
                tileMap.put(new Tile(new PVector(x,y)), null);
            }
        }
    }

    public void connectTiles(Tile t1, Tile t2) {
        //DO SOON
    }
}