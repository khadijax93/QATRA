package service;

import model.Donor;

public class DonationService {

    public void processDonation(Donor donor) {
        if (donor.isEligible()) {
            donor.donate();
            System.out.println(donor.getName() + " donated successfully.");
        } else {
            System.out.println("Donor is not eligible to donate.");
        }
    }
}

