package sem3pl.dei.isep.ipp.pt;

import sem3pl.dei.isep.ipp.pt.bddad.ImportLegacyController;

public class Main {
    public static void main(String[] args) {
        ImportLegacyController importLegacyController = new ImportLegacyController();
        importLegacyController.writeSQLToFile(importLegacyController.readFile("Legacy_Data_v2.xlsx"),"output.sql");
            ApplicationChooser applicationChooser = new ApplicationChooser();
        applicationChooser.run();
    }
}