class Player {
    
    private int faction;
    private color playerColor;
    private ArrayList<Unit> units;


    public Player(color c) {
        playerColor = c;
    }

    public void setFaction(int n) {
        faction = n;
    }

    public int getFaction () {
        return faction;
    }

    public void setPlayerColor(color c) {
        playerColor = c;
    }

    public color getPlayerColor() {
        return playerColor;
    }

}