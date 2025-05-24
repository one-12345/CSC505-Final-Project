class UnitInfantry extends Unit {

    private int cv; //Combat Value, represents size of the unit and scales the # of dice rolled in combat
    private int drm; //Dice Roll Modifier, represents combat power per CV by adding to each dice roll
    private int hp; //Represents damage absorbed before losing a CV
    private int mob; //Mobility - how far unit can move
    private int range; //Range - how far unit can attack from

    private boolean zoneOfControl; //Whether unit exerts zone of control
    private boolean isDeployed;
    private boolean isDragged;

    private boolean canMove;
    private boolean canAttack;
    private Tile location;

    private int player;

    public UnitInfantry(int p) {
        cv = 4;
        drm = 0;
        hp = 8;
        mob = 3;
        range = 1;
        zoneOfControl = true;
        isDeployed = false;
        location = null;
        isDragged = false;
        canMove = false;
        canAttack = false;
        player = p;
    }
    
}