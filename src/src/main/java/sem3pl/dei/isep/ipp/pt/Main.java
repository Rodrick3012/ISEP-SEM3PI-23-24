package sem3pl.dei.isep.ipp.pt;

import sem3pl.dei.isep.ipp.pt.bddad.ImportLegacyController;

public class Main {
    public static void main(String[] args) {
        ImportLegacyController importLegacyController = new ImportLegacyController();
        importLegacyController.writeSQLToFile(importLegacyController.readFile("Legacy_Data.xlsx"),"docs/Sprint 1/BDDAD/USBD04/usbd04.sql");
            ApplicationChooser applicationChooser = new ApplicationChooser();
        applicationChooser.run();
    }
}