abstract class Unit {

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

    public void deployTo(Tile location) {
        isDeployed = true;
        location = location;
    }

    public void takeDamage(int dmg) {
        cv -= dmg/hp;
        if (cv < 1) {
            unitDeath();
        }
    }

    public void unitDeath() {
        location.empty();
        // TO FILL OUT SOON
    }

    public void refresh() {
        canMove = true;
        canAttack = true;
    }

    public void attack(Tile target) {
        canAttack = false;
        canMove = false;
    }

    public void move (Tile target) {
        canMove = false;
    }

    public boolean isDeployed() {
        return isDeployed;
    }

    public void drag() {
        
    }

}