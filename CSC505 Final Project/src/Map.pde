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
        for (int y = size; y < size*2-1; y++) {
            for (int x = -2*size+1+y; x < 2*size-y; y++) {
                tileMap.put(new Tile(new PVector(x,y)), null);
            }
        }
    }

    public void connectTiles(Tile t1, Tile t2) {
        List<Tile> list1 = tileMap.get(t1);
        List<Tile> list2 = tileMap.get(t2);
        list1.add(t2);
        list2.add(t1);
        tileMap.put(t1,list1);
        tileMap.put(t2,list2);
    }
}