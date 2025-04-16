abstract class Unit {

    private int maxHealth;
    private int currentHealth;

    private int maxOrg;
    private int currentOrg;

    private int melee;

    private int direction;

    public int getMaxHealth() {return maxHealth;}
    public int getCurrentHealth() {return currentHealth;}
    public int getMaxOrg() {return maxOrg;}
    public int getCurrentOrg() {return currentOrg;}
    public int getMelee() {return melee;}
    public int getDirection() {return direction;}

    public void takeDamage() {currentHealth--;maxHealth--;}
    public void takeDamage(int n) {currentHealth-=n;maxHealth-=n;}
}