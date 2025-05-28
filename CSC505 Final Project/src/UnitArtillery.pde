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

    public UnitArtillery(int p, int f) {
        cv = 4;
        zoneOfControl = false;
        isDeployed = false;
        recentlyDeployed = false;
        isSelected = false;
        location = null;
        isDragged = false;
        canMove = false;
        canAttack = false;
        player = p;
        switch (f) {
            case 0:
                drm = 0;
                hp = 6;
                mob = 1;
                range = 4;
                break;
            case 1:
                drm = 0;
                hp = 6;
                mob = 1;
                range = 3;
                break;
            case 2:
                drm = 0;
                hp = 6;
                mob = 2;
                range = 4;
                break;
        }
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

    @Override public int range() {
        if (!super.canAttack()) {
            return 0;
        }
        return range;
    }

    @Override public int range(boolean retaliation) {
        if (!retaliation && !super.canAttack()) {
            return 0;
        }
        return range;
    }

    @Override public int cv() {
        return cv;
    }

    @Override public int drm() {
        return drm;
    }

    @Override public int hp() {
        return hp;
    }

    @Override public void takeDamage(int dmg) {
        cv -= dmg/hp;
        if (cv < 1) {
            unitDeath();
        }
    }
    
}