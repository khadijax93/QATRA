import model.Donor;
import service.DonationService;

public class Main {

    public static void main(String[] args) {

        // Create a donor
        Donor donor = new Donor("Khadija", "O+");

        // Create the service
        DonationService service = new DonationService();

        // First donation (should succeed)
        service.processDonation(donor);

        // Second donation (should fail)
        service.processDonation(donor);
    }
}

