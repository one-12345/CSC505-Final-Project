class UnitArtillery extends Unit {

    private int cv; //Combat Value, represents size of the unit and scales the # of dice rolled in combat
    private int drm; //Dice Roll Modifier, represents combat power per CV by adding to each dice roll
    private int hp; //Represents damage absorbed before losing a CV
    private int mob; //Mobility - how far unit can move
    private int range; //Range - how far unit can attack from

    private boolean zoneOfControl; //Whether unit exerts zone of control
    private boolean isDeployed;
    private boolean recentlyDeployed; //If it is the first turn Unit is deployed
    private boolean isDragged;
    private boolean isSelected;

    private boolean canMove;
    private boolean canAttack;
    private Tile location;

    private int player;

    public UnitArtillery(int p) {
        cv = 4;
        drm = -1;
        hp = 4;
        mob = 2;
        range = 3;
        zoneOfControl = false;
        isDeployed = false;
        recentlyDeployed = false;
        isSelected = false;
        location = null;
        isDragged = false;
        canMove = false;
        canAttack = false;
        player = p;
    }

    @Override public int player() {
        return player;
    }

    @Override public int mob() {
        if (!super.canMove()) {
            return 0;
        }
        return mob;
    }
    
}