class Map {

    private int size;
    private HashMap<Tile,List<Tile>> adjacencyList;
    private PVector generationVector = new PVector(0,0);

    public Map(int n) {
        size = n;
        adjacencyList = new HashMap<>();
    }

    public void generateMap() {
        for (int i = 0; i < 2*size-1; i++) {
            for (int j = 0; j < size; j++) {
                
            }
        }
    }

    public connectTiles(Tile t1, Tile t2) {
        //DO SOON
    }
}