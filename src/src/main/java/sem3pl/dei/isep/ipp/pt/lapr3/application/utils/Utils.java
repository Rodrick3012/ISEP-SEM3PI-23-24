package sem3pl.dei.isep.ipp.pt.lapr3.application.utils;

import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Cultura;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Parcela;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.TipoOperacao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class Utils {
    private static Scanner scanner = new Scanner(System.in);

    public static Date readDate(String message,String format) {
        Date date = null;
        boolean isValid = false;
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        dateFormat.setLenient(false);

        while (!isValid) {
            try {
                System.out.print(message + " ("+format+"): ");
                String input = scanner.nextLine();
                date = dateFormat.parse(input);
                isValid = true; // Set isValid to true if parsing is successful
            } catch (ParseException e) {
                System.out.println("Invalid date format. Please enter date in "+format+" format.");
            }
        }

        return date;
    }

    public static String readString(String message) {
        System.out.print(message + ": ");
        return scanner.nextLine();
    }

    // Method to read an integer from the user
    public static int readInt(String message) {
        int num = 0;
        boolean isValid = false;

        while (!isValid) {
            try {
                System.out.print(message + ": ");
                num = scanner.nextInt();
                isValid = true;
            } catch (InputMismatchException e) {
                System.out.println("Invalid input. Please enter a valid integer.");
                scanner.next(); // Clear the input buffer
            }
        }
        scanner.nextLine(); // Consume the newline character after reading the int
        return num;
    }

    // Method to select an option from a list
    public static String selectParcelaList(String message,List<Parcela> options) {
        System.out.println(message);

        for (int i = 0; i < options.size(); i++) {
            System.out.println((i + 1) + ". " + options.get(i));
        }

        int choice = readInt("Enter the number of your choice");
        while (choice < 1 || choice > options.size()) {
            System.out.println("Invalid choice. Please choose a number between 1 and " + options.size());
            choice = readInt("Enter the number of your choice");
        }


        return  options.get(choice - 1).getDesignacao();
    }

    public static int selectCulturaList(String message,List<Cultura> options) {
        System.out.println(message);
        for (int i = 0; i < options.size(); i++) {
            System.out.println((i + 1) + ". " + options.get(i));
        }

        int choice = readInt("Enter the number of your choice");
        while (choice < 1 || choice > options.size()) {
            System.out.println("Invalid choice. Please choose a number between 1 and " + options.size());
            choice = readInt("Enter the number of your choice");
        }


        return  options.get(choice - 1).getId();
    }

    public static Integer selectTipoOperacaoList(String message,List<TipoOperacao> options) {
        System.out.println(message);

        for (int i = 0; i < options.size(); i++) {
            System.out.println((i + 1) + ". " + options.get(i));
        }

        int choice = readInt("Enter the number of your choice");
        while (choice < 1 || choice > options.size()) {
            System.out.println("Invalid choice. Please choose a number between 1 and " + options.size());
            choice = readInt("Enter the number of your choice");
        }


        return options.get(choice - 1).getId();
    }
}
