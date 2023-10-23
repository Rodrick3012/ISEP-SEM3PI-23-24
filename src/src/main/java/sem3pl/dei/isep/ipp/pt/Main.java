package sem3pl.dei.isep.ipp.pt;

import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.ImportLegacyController;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        /*
        ImportLegacyController importLegacyController = new ImportLegacyController();


        for (String str :importLegacyController.readFile("Legacy_Data.xlsx",0)) {
            System.out.println(str);
        }
        for (String str :importLegacyController.readFile("Legacy_Data.xlsx",1)) {
            System.out.println(str);
        }
        for (String str :importLegacyController.readFile("Legacy_Data.xlsx",2)) {
            System.out.println(str);
        }
        for (String str :importLegacyController.readFile("Legacy_Data.xlsx",3)) {
            System.out.println(str);
        }
        */




            ApplicationChooser applicationChooser = new ApplicationChooser();
        applicationChooser.run();
    }
}