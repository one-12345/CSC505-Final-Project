class Menu {

    private boolean isActive;
    private int menuID;

    public Menu(int menuID) {
        if (menuID == 0) {isActive = true;} else {isActive = false;}
        this.menuID = menuID;
    }

    public void updateMenu() {
        switch (menuID) {
            case 0:
                background(100,150,200);
                stroke(0);
                fill(256);
                rect(width/2-20,height/2-10,width/2+20,height/2+10);
        }
    }

    public boolean active() {
        return isActive;
    }

} 