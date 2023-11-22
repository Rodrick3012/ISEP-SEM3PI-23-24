package sem3pl.dei.isep.ipp.pt;


import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;

import java.io.IOException;
import java.io.InputStream;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.Properties;

public class Main {

    public static void main(String[] args) throws SQLException {
        connectDataBase();
        MainMenu mainMenu = new MainMenu();
        mainMenu.run();
    }

    private static void loadProperties() throws IOException {
        Properties properties = new Properties(System.getProperties());

        InputStream inputStream = new Main().getClass().getClassLoader().getResourceAsStream("application.properties");
        properties.load(inputStream);
        inputStream.close();

        System.setProperties(properties);
    }


    private static void connectDataBase() throws SQLException {
        int result = 0;

        try {
            loadProperties();
            DatabaseConnection controller = new DatabaseConnection();
            result = controller.testConnection();
            if (result == DatabaseConnection.CONNECTION_SUCCESS)
                System.out.println("Connected to the database.");
            else
                System.out.println("Not connected to the database!");
        } catch (UnknownHostException e) {
            System.out.println("\nDatabase Server not reachable!");
        } catch (Exception e) {
            System.out.println("App properties not loaded!");
        }
    }
}
