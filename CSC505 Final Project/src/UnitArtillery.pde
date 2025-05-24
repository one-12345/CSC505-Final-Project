class UnitArtillery extends Unit {

    private int cv; //Combat Value, represents size of the unit and scales the # of dice rolled in combat
    private int drm; //Dice Roll Modifier, represents combat power per CV by adding to each dice roll
    private int hp; //Represents damage absorbed before losing a CV
    private int mob; //Mobility - how far unit can move
    private int range; //Range - how far unit can attack from
    private boolean zoneOfControl; //Whether unit exerts zone of control
    private boolean isDeployed;
    private boolean canMove;
    private boolean canAttack;
    private Tile location;

    public UnitArtillery() {
        cv = 4;
        drm = -1;
        hp = 4;
        mob = 2;
        range = 3;
        isDeployed = false;
        location = null;
    }
    
}