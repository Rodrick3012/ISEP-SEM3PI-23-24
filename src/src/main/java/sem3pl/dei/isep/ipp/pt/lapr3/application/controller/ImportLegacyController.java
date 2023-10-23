package sem3pl.dei.isep.ipp.pt.lapr3.application.controller;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import static java.util.Calendar.DATE;


public class ImportLegacyController {
    Set<String> atributosExploracao = new HashSet<>(){{
        add("designacao");
        add("area");
        add("especie");
        add("nomecomum");
        add("variedade");
        add("datasementeira");
        add("datapoda");
        add("datafloracao");
        add("datacolheita");
        add("tipoplantacao");
        add("parcela");
        add("cultura");
        add("datainicial");
        add("datafinal");
        add("quantidade");
        add("unidade");
        add("plantacao");

        }};


    public List<String> readFile(String filename, int sheetIndex) {
        String filePath = "/" + filename; // Note the leading forward slash

        List<String> insertStatements = new ArrayList<>();

        try (InputStream inputStream = ImportLegacyController.class.getResourceAsStream(filePath);
             Workbook workbook = new XSSFWorkbook(inputStream)) {

            Sheet sheet = workbook.getSheetAt(sheetIndex); // Get the specified sheet


            // Assuming the first row contains column names
            Row headerRow = sheet.getRow(0);

            int numColumns = headerRow.getPhysicalNumberOfCells();

            for (Row row : sheet) {
                int cont=0;
                String sheetName=sheet.getSheetName();
                sheetName = switch (sheetName) {
                    case "Plantas" -> "Plantacao";
                    case "Exploração agrícola" -> "Edificio";
                    case "Fator Produção" -> "FatorProducao";
                    case "Culturas" -> "Cultura";
                    case "Operações" -> "Operacao";
                    default -> sheetName;
                };
                if (row.getRowNum() == 0) {
                    continue; // Skip the header row
                }

                String auxSheetName=sheetName;
                if (row.getCell(1)!=null && row.getCell(1).getStringCellValue().equals("Parcela")){
                    sheetName="Parcela";
                }else {
                    sheetName=auxSheetName;

                }


                StringBuilder insert = new StringBuilder("INSERT INTO "+ sheetName + " (");

                StringBuilder values = new StringBuilder(" VALUES (");

                for (int i = 0; i < numColumns; i++) {
                    Cell cell = row.getCell(i);
                    Cell headerCell = headerRow.getCell(i);

                    String columnName = headerCell.getStringCellValue();
                    switch (columnName){
                        case "Área": columnName="area";break;
                        case "Designação":columnName="designacao";break;
                        case"Espécie": columnName="especie";break;
                        case"Nome comum": columnName="nomeComum";break;
                        case "Variedade": columnName=("variedade");break;
                        case "Tipo Plantação": columnName=("tipoPlantacao");break;
                        case "Sementeira/Plantação": columnName=("dataSementeira");break;
                        case "Poda": columnName=("dataPoda");break;
                        case "Floração": columnName=("dataFloracao");break;
                        case "Colheita": columnName=("dataColheita");break;
                        case "Data Inicial": columnName=("dataInicial");break;
                        case "Data Final": columnName=("dataFinal");break;
                        case "Quantidade": columnName=("quantidade");break;
                        case "Unidades": columnName=("unidade");break;
                        case "Unidade": columnName=("unidade");break;
                        case "Cultura": columnName=("plantacao");break;


                    }
                    String cellValue = "";

                    if (sheetName.equalsIgnoreCase("parcela")){
                        atributosExploracao.remove("unidade");
                    }else {
                        atributosExploracao.add("unidade");
                    }

                    if (cell!=null) {
                        switch (cell.getCellType()) {
                            case STRING:
                                cellValue = cell.getStringCellValue();
                                break;
                            case NUMERIC:
                                if (DateUtil.isCellDateFormatted(cell)) {
                                    // If the cell contains a date value, format it as needed
                                    Date date = cell.getDateCellValue();
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy"); // Adjust the date format as needed
                                    cellValue = sdf.format(date);
                                } else {
                                    cellValue = String.valueOf(cell.getNumericCellValue());
                                }
                                break;
                            case BOOLEAN:
                                cellValue = String.valueOf(cell.getBooleanCellValue());
                                break;
                        }
                    }

                    cellValue =cellValue.trim();
                    if (!cellValue.isEmpty()){
                        cont++;
                    }

                    if (atributosExploracao.contains(columnName.toLowerCase())) {


                        // Build the INSERT statement
                        insert.append(columnName);
                        if (columnName.equals("tipoPlantacao") || columnName.equals("unidade")){

                                String insertType = "Insert into " + columnName + "(" + columnName + ") select ('" + cellValue + "') FROM dual where not exists" +
                                        "( Select 1 From " + columnName + " Where  " + columnName + " = '" + cellValue + "');";

                            if (!cellValue.trim().isEmpty()) {

                                if (!insertStatements.contains(insertType)){
                                    insertStatements.add(insertType);

                                }
                                values.append("(select id from "+columnName+" where "+columnName+"='"+cellValue+"')");

                            }else {
                                values.append("''");

                            }

                        } else if (columnName.equalsIgnoreCase("parcela")) {
                            values.append("(select id from "+columnName+" where lower(designacao) like lower('"+cellValue+"'))");

                        } else if (columnName.equalsIgnoreCase("plantacao")) {
                            values.append("(select id from " + columnName + " where lower(nomecomum || ' ' || variedade) like lower('" + cellValue + "%'))");

                        } else {
                                values.append("'").append(cellValue.replaceAll("'", "")).append("'");
                        }

                        if (i < numColumns - 1) {
                            insert.append(", ");
                            values.append(", ");
                        }
                    }
                }
                if (insert.toString().endsWith(", ")) {
                    insert.delete(insert.length()-2,insert.length());
                }
                if (values.toString().endsWith(", ")) {
                  values.delete(values.length()-2,values.length());
                }
                insert.append(")");
                values.append(");");
                insert.append(values);
                if (cont!=0){
                    insertStatements.add(insert.toString());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return insertStatements;
    }


    public void writeSQLToFile(List<String> sqlStatements, String filePath) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (String sqlStatement : sqlStatements) {
                writer.write(sqlStatement);
                writer.newLine(); // Add a new line after each statement
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

