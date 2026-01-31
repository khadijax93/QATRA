package model;

public class Donor {

    private String name;
    private String bloodType;
    private boolean eligible;

    public Donor(String name, String bloodType) {
        this.name = name;
        this.bloodType = bloodType;
        this.eligible = true;
    }

    public boolean isEligible() {
        return eligible;
    }

    public void donate() {
        this.eligible = false;
    }

    public String getName() {
        return name;
    }
}

