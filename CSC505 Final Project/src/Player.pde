class Player {
    
    private int faction;
    private color playerColor;

    public Player() {

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