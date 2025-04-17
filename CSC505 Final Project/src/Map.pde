class Map {

    private int size;
    private HashMap<Tile,List<Tile>> adjacencyList;
    private PVector generationVector = new PVector(0,0);

    public Map(int n) {
        size = n;
        adjacencyList = new HashMap<>();
    }
    }

}