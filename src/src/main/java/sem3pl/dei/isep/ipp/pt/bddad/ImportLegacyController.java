package sem3pl.dei.isep.ipp.pt.bddad;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;


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
        add("tipoplanta");
        add("tipooperacao");
        add("parcela");
        add("cultura");
        add("datainicial");
        add("datafinal");
        add("quantidade");
        add("unidade");
        add("planta");
        add("fabricante");
        add("formulacao");
        add("classificacao");
        add("objetivo");
        add("substancia");
        add("percentagem");
        add("data");
        add("modo");
        add("operacao");
        add("fatorproducao");
        add("dimensao");

    }};



    public List<String> readFile(String filename) {

        Map<String, String> colheitaProductMapper = new HashMap<>();

        colheitaProductMapper.put("Ameixoeira", "Ameixa");
        colheitaProductMapper.put("Damasqueiro", "Damasco");
        colheitaProductMapper.put("Macieira", "Maçã");
        colheitaProductMapper.put("Cenoura", "Cenoura");
        colheitaProductMapper.put("Tremoço", "Tremoço");
        colheitaProductMapper.put("Milho", "Milho");
        colheitaProductMapper.put("Oliveira", "Azeitona");
        colheitaProductMapper.put("Nabo", "Nabo");
        colheitaProductMapper.put("Videira", "Uva");
        colheitaProductMapper.put("Nabo greleiro", "Nabo Greleiro");
        colheitaProductMapper.put("Pera Nashi", "Peras Nashi");


        Set<String> operacoes = new TreeSet<>();
        operacoes.add("Plantação");
        operacoes.add("Sementeira");
        operacoes.add("Poda");
        operacoes.add("Rega");
        operacoes.add("Incorporação no solo");
        operacoes.add("Colheita");

        String filePath = "/" + filename; // Note the leading forward slash

        List<String> insertStatements = new ArrayList<>();
        for (int j = 0; j < 5; j++) {
        try (InputStream inputStream = ImportLegacyController.class.getResourceAsStream(filePath);
             Workbook workbook = new XSSFWorkbook(inputStream)) {

            Sheet sheet = workbook.getSheetAt(j); // Get the specified sheet


                // Assuming the first row contains column names
                Row headerRow = sheet.getRow(0);

                int numColumns = headerRow.getPhysicalNumberOfCells();

                for (Row row : sheet) {
                    int cont = 0;
                    String sheetName = sheet.getSheetName();
                    sheetName = switch (sheetName) {
                        case "Plantas" -> "planta";
                        case "Exploração agrícola" -> "Edificio";
                        case "Fator Produção" -> "FatorProducao";
                        case "Culturas" -> "Cultura";
                        case "Operações" -> "Operacao";
                        default -> sheetName;
                    };
                    if (row.getRowNum() == 0) {
                        continue; // Skip the header row
                    }

                    if (sheetName.equalsIgnoreCase("edificio")
                            || sheetName.equalsIgnoreCase("parcela")
                            || sheetName.equalsIgnoreCase("cultura")) {
                        atributosExploracao.remove("classificacao");
                    } else {
                        atributosExploracao.add("classificacao");
                    }

                    if (sheetName.equalsIgnoreCase("operacao")){
                        atributosExploracao.remove("planta");

                    } else {
                        atributosExploracao.add("planta");
                    }


                    String auxSheetName = sheetName;
                    if (row.getCell(1) != null && row.getCell(1).getStringCellValue().equals("Parcela")) {
                        sheetName = "Parcela";
                    } else {
                        sheetName = auxSheetName;

                    }


                    StringBuilder insert = new StringBuilder("INSERT INTO " + sheetName + " (");

                    StringBuilder values = new StringBuilder(" VALUES (");
                    List<String> insertFicha = new ArrayList<>();
                    List<String> datas = new ArrayList<>();
                    String typeOp = "";

                    if (sheetName.equals("planta")){
                        insert.append("produto,");
                        if (colheitaProductMapper.containsKey(row.getCell(1).getStringCellValue())){
                            values.append("'"+colheitaProductMapper.get(row.getCell(1).getStringCellValue())+"',");
                        }
                    }

                    for (int i = 0; i < numColumns; i++) {


                        Cell cell = row.getCell(i);
                        Cell headerCell = headerRow.getCell(i);

                        String columnName = headerCell.getStringCellValue();

                        switch (columnName) {
                            case "Área":
                                columnName = "area";
                                break;
                            case "Dimensão":
                                columnName = "area";
                                break;
                            case "Designação":
                                columnName = "designacao";
                                break;
                            case "Espécie":
                                columnName = "especie";
                                break;
                            case "Nome comum":
                                columnName = "nomeComum";
                                break;
                            case "Variedade":
                                columnName = ("variedade");
                                break;
                            case "Tipo Plantação":
                                columnName = ("tipoplanta");
                                break;
                            case "Sementeira/Plantação":
                                columnName = ("dataSementeira");
                                break;
                            case "Poda":
                                columnName = ("dataPoda");
                                break;
                            case "Floração":
                                columnName = ("dataFloracao");
                                break;
                            case "Colheita":
                                columnName = ("dataColheita");
                                break;
                            case "Data Inicial":
                                columnName = ("dataInicial");
                                break;
                            case "Data Final":
                                columnName = ("dataFinal");
                                break;
                            case "Quantidade":
                                columnName = ("quantidade");
                                break;
                            case "Unidades", "Unidade":
                                columnName = ("unidade");
                                break;
                            case "Cultura":
                                if (sheetName.equals("Cultura")){
                                    columnName = ("planta");

                                }else{
                                    columnName = ("cultura");

                                }
                                break;
                            case "Fabricante":
                                columnName = ("fabricante");
                                break;
                            case "Formato":
                                columnName = ("formulacao");
                                break;
                            case "C1", "C2", "C3", "C4":
                                columnName = ("substancia");
                                break;
                            case "Perc":
                                columnName = ("percentagem");
                                break;
                            case "Aplicação":
                                columnName = ("objetivo");
                                break;
                            case "Tipo":
                                columnName = ("classificacao");
                                break;
                            case "Modo":
                                columnName = ("modo");
                                break;
                            case "Operação":
                                columnName = ("tipooperacao");
                                break;
                            case "Fator de produção":
                                columnName = ("fatorproducao");
                                break;
                            case "Data":
                                columnName = ("data");
                                break;

                        }

                        String cellValue = "";


                        if (sheetName.equalsIgnoreCase("parcela")) {
                            atributosExploracao.remove("unidade");
                        } else {
                            atributosExploracao.add("unidade");
                        }





                        if (cell != null) {
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


                        cellValue = cellValue.trim();
                        cellValue = cellValue.replaceAll("'", " ");

                        if (!cellValue.isEmpty()) {
                            cont++;
                        }

                        if (columnName.equals("tipooperacao")) {
                            typeOp = cellValue;
                        }


                        if (operacoes.contains(typeOp)) {
                            atributosExploracao.remove("modo");
                            atributosExploracao.remove("fatorproducao");
                            atributosExploracao.add("tipooperacao");
                        } else {
                            atributosExploracao.add("modo");
                            atributosExploracao.add("fatorproducao");
                            atributosExploracao.remove("tipooperacao");
                        }

                        if (atributosExploracao.contains(columnName.toLowerCase())) {

                            if (!columnName.equals("substancia") && !columnName.equals("dataPoda")
                                    && !columnName.equals("dataSementeira") && !columnName.equals("dataColheita")
                                    && !columnName.equals("dataFloracao")) {
                                insert.append(columnName);

                            }

                            if (columnName.equals("tipoplanta") || columnName.equals("unidade") ||
                                    columnName.equals("fabricante") || columnName.equals("formulacao") ||
                                    (columnName.equals("classificacao")) || columnName.equals("objetivo") ||
                                    columnName.equals("modo") || columnName.equals("tipooperacao")) {
                                    if (columnName.matches("modo")&& cellValue.isEmpty()){
                                        cellValue="Aplicação";

                                    }

                                String insertType = "Insert into " + columnName + "(" + columnName + ") select ('" + cellValue + "') FROM dual where not exists" +
                                        "( Select 1 From " + columnName + " Where  " + columnName + " = '" + cellValue + "');";

                                if (!cellValue.trim().isEmpty()) {

                                    if (!insertStatements.contains(insertType)) {
                                        insertStatements.add(insertType);

                                    }
                                    values.append("(select id from " + columnName + " where " + columnName + "='" + cellValue + "')");

                                } else {
                                    values.append("''");

                                }

                            } else if (columnName.equalsIgnoreCase("parcela")) {

                                values.append("(select designacao from " + columnName + " where lower(designacao) like lower('" + cellValue + "'))");


                            } else if (columnName.equalsIgnoreCase("fatorproducao")) {
                                values.append("(select designacao from " + columnName + " where lower(designacao) like lower('" + cellValue + "'))");

                            } else if (columnName.equalsIgnoreCase("planta")) {

                                values.append("(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL" +
                                        " END AS result from " + columnName + " where lower(nomecomum || ' ' || variedade) like lower('%" + cellValue + "%'))");

                            } else if (columnName.equalsIgnoreCase("cultura") && sheetName.equals("operacao")) {
                                Cell cell1 = row.getCell(9);
                                String auxID;

                                if (cell1 != null) {
                                    if (cell1.getCellType() == CellType.NUMERIC) {
                                        double numericValue = cell1.getNumericCellValue();
                                        auxID = String.valueOf(numericValue);
                                    } else if (cell1.getCellType() == CellType.STRING) {
                                        auxID = cell1.getStringCellValue();
                                    } else {
                                        auxID = ""; // Handle other cell types if needed
                                    }
                                } else {
                                    auxID = ""; // Handle the case when the cell is null
                                }

                                if (!auxID.isEmpty()) {
                                    values.append("'" + auxID + "'");
                                } else {
                                    values.append("null");
                                }
                            } else if (columnName.equalsIgnoreCase("substancia")) {
                                Cell nextCell = row.getCell(i + 1);
                                Cell firstCell = row.getCell(0);
                                if (!cellValue.isEmpty()) {
                                    String insertSubs = "Insert into  " + columnName + " (" + columnName + ") select ('" + cellValue + "') FROM dual where not exists" +
                                            "( Select 1 From " + columnName + " Where  " + columnName + " = '" + cellValue + "');";

                                    String ficha = "Insert into  FichaTecnica (substancia,fatorproducao,percentagem) values " +
                                            "((select id from substancia where substancia like '" + cellValue + "')," +
                                            "(select designacao from fatorproducao where designacao like '" + firstCell.getStringCellValue().trim() + "')," +
                                            "'" + nextCell + "'); ";

                                    insertStatements.add(insertSubs);
                                    insertFicha.add(ficha);
                                }
                            } else if (columnName.equalsIgnoreCase("datasementeira") || columnName.equalsIgnoreCase("datapoda")
                                    || columnName.equalsIgnoreCase("datafloracao") || columnName.equalsIgnoreCase("dataColheita")) {

                                if (!cellValue.isEmpty()) {
                                    Cell nome = row.getCell(1);
                                    Cell var = row.getCell(2);


                                    String data = "Insert into " + columnName + " (planta," + columnName + ") " +
                                            "values ((select id from planta where nomecomum like '" + nome.getStringCellValue().replaceAll("'", " ") + "' and variedade like '" + var.getStringCellValue().replaceAll("'", " ") + "%'),'" + cellValue + "') ;";
                                    ;

                                    datas.add(data);
                                }
                            } else {
                                if (columnName.equals("quantidade") && cellValue.isEmpty()) {
                                    cellValue = String.valueOf(0);
                                }
                                values.append("'").append(cellValue).append("'");

                            }


                            if (i < numColumns - 1) {


                                if (!columnName.equalsIgnoreCase("fatorproducao") && !columnName.equals("substancia") && !columnName.equals("dataPoda")
                                        && !columnName.equals("dataSementeira") && !columnName.equals("dataColheita")
                                        && !columnName.equals("dataFloracao")) {
                                    insert.append(", ");
                                    values.append(", ");
                                }
                            }
                        }
                    }
                    if (insert.toString().endsWith(", ")) {
                        insert.delete(insert.length() - 2, insert.length());
                    }
                    if (values.toString().endsWith(", ")) {
                        values.delete(values.length() - 2, values.length());
                    }

                    insert.append(")");
                    values.append(");");
                    insert.append(values);
                    if (cont != 0) {
                        if (!operacoes.contains(typeOp)) {
                            insertStatements.add(insert.toString().replace("operacao", "operacaofatorproducao"));

                        } else {
                            insertStatements.add(insert.toString());

                        }
                    }

                    if (!insertFicha.isEmpty()) {
                        insertStatements.addAll(insertFicha);
                    }

                    if (!datas.isEmpty()) {
                        insertStatements.addAll(datas);
                    }

                }
            } catch(IOException e){
                e.printStackTrace();
            }
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

