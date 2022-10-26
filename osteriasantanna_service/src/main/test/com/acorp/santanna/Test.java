package com.acorp.santanna;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;

public class Test {

    @org.junit.Test
    public void test(){
        ObjectMapper mapper = new ObjectMapper();

        try {

            // 1. convert JSON array to Array objects
            WineExport[] pp1 = mapper.readValue(testConversion(), WineExport[].class);

            System.out.println("JSON array to Array objects...");
            for (WineExport person : pp1) {
                System.out.println(person);
            }



        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String testConversion(){
        return "[\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Tormaresca\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"negroamaro \"\n" +
                "    ],\n" +
                "    \"name\": \"Fichimori\",\n" +
                "    \"price\": 18\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"bollicine\",\n" +
                "    \"changes\": [\n" +
                "      \"Contadi Castaldi \"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"239l016VGcb6ERoEgBlx\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Pinot nero\",\n" +
                "      \" Chardonnay\"\n" +
                "    ],\n" +
                "    \"name\": \"Contadi Castaldi Brut\",\n" +
                "    \"price\": 35\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Poderi Angelini\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Fiano \"\n" +
                "    ],\n" +
                "    \"name\": \"Fiano I.G.T.\",\n" +
                "    \"price\": 20\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Tramin\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"4PcANBJaGkgYe1fL4Kxd\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Muller Thurgau\"\n" +
                "    ],\n" +
                "    \"name\": \"Muller Thurgau D.O.C.\",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"vigne e vini\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"4fEpxzDn4PSSHNPp9YMP\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"verdeca\",\n" +
                "      \" chardonnay\",\n" +
                "      \" malvasia bianca\"\n" +
                "    ],\n" +
                "    \"name\": \"Dodici e Mezzo I.G.P.\",\n" +
                "    \"price\": 17\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Tenuta Folonari\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Merlot\"\n" +
                "    ],\n" +
                "    \"name\": \"CAMPO AL MARE BOLGHERI D.O.C. \",\n" +
                "    \"price\": 23\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Consorzio Produttori Vini\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"5QI5PyhswGIOaR88fZf1\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Primitivo di Manduria\"\n" +
                "    ],\n" +
                "    \"name\": \"Lirica D.O.C.\",\n" +
                "    \"price\": 17\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Tenute del Cabreo\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" CabernetS.\",\n" +
                "      \" merlot\",\n" +
                "      \" sangiovese\"\n" +
                "    ],\n" +
                "    \"name\": \"Cabreo il Borgo\",\n" +
                "    \"price\": 70\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Masseria Masciullo\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Negroamaro\"\n" +
                "    ],\n" +
                "    \"name\": \"Negroamaro I.G.T. BIO\",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Varvaglione\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"6jdxojNNMaHTsWjWScEm\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Negroamaro\"\n" +
                "    ],\n" +
                "    \"name\": \"12 e Mezzo I.G.T.\",\n" +
                "    \"price\": 17\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Casa vinicola Garofoli \"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Montepulciano\"\n" +
                "    ],\n" +
                "    \"name\": \"Brut Rosé \",\n" +
                "    \"price\": 35\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"San Leonardo\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"9eKlH3I5vdbd7HpZ4bHw\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Sauvignon\"\n" +
                "    ],\n" +
                "    \"name\": \"Vette\",\n" +
                "    \"price\": 25\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"rosewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Tenuta Viglione\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"9nEqTQ2UswPhU7kEABwi\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Susumaniello\"\n" +
                "    ],\n" +
                "    \"name\": \"Morso Rosa I.G.P.\",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Antinori\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"A1HSMDXHj1FubBAzSUkC\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Chardonnay\",\n" +
                "      \" Grechetto\"\n" +
                "    ],\n" +
                "    \"name\": \"Cervaro della Sala\",\n" +
                "    \"price\": 71\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Vallone\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Negroamaro\",\n" +
                "      \" sussumaniello\"\n" +
                "    ],\n" +
                "    \"name\": \"Castel Serranova I.G.P. \",\n" +
                "    \"price\": 28\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Casa vinicola Garofoli \"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Montepulciano\"\n" +
                "    ],\n" +
                "    \"name\": \"Komaros I.G.T.\",\n" +
                "    \"price\": 16\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Marabino\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"FYi7q2bQBtMsgrgO6TJM\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Nero d'avola\"\n" +
                "    ],\n" +
                "    \"name\": \"Rosso di Contrada\",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Bianco\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Liveli\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"GdTA26um6qRpCGoXwhvj\",\n" +
                "    \"image\": \"images/wines/askos_verdeca.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Verdeca\"\n" +
                "    ],\n" +
                "    \"name\": \"Askos I.G.T.\",\n" +
                "    \"price\": 26\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Az. Agr. Rivera\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"HHfldmYhAlCYRYPfSV8d\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Nero di Troia e Montepulciano\"\n" +
                "    ],\n" +
                "    \"name\": \"Il Falcone Riserva D.O.C.G.\",\n" +
                "    \"price\": 30\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Cantina Candialle\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"J8F4MHJopW3D41I2hAOy\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Sangiovese\",\n" +
                "      \" Malvasia\",\n" +
                "      \" Cana\"\n" +
                "    ],\n" +
                "    \"name\": \"La Misse D.O.C.G. Chianti Classico\",\n" +
                "    \"price\": 25\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Rosato\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"rosewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Cannito\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"JLkyuksCr7Myh2Cq0KhD\",\n" +
                "    \"image\": \"images/wines/drumon_rosato.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Primitivo\",\n" +
                "      \" Montepulciano\"\n" +
                "    ],\n" +
                "    \"name\": \"Drumon Rosato\",\n" +
                "    \"price\": 19\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Sacco\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"JSvn1R8shUzUKASJeGWX\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Falanghina\"\n" +
                "    ],\n" +
                "    \"name\": \"Aleis  I.G.P.\",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Poderi Angelini\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"K2b0OsQ6GwmEsbj1jKHq\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Chardonnay\"\n" +
                "    ],\n" +
                "    \"name\": \"Chardonnay \",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"del cinese\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"cinamia \"\n" +
                "    ],\n" +
                "    \"name\": \"cinese\",\n" +
                "    \"price\": 15\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"bollicine\",\n" +
                "    \"changes\": [\n" +
                "      \"Charles Heidsieck \"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Pinot Nero\"\n" +
                "    ],\n" +
                "    \"name\": \"Charles Heidsieck Rose\",\n" +
                "    \"price\": 110\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"rosewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Az. Agr. Sacco\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"LEWmxfma7R6U6hCM6Fi7\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Nero di Troia\"\n" +
                "    ],\n" +
                "    \"name\": \"Una Notte I.G.P.\",\n" +
                "    \"price\": 20\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Tramin\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"OByMACQ64XjEDwfhEnqS\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Pinot Nero\"\n" +
                "    ],\n" +
                "    \"name\": \"Blauburgunder D.O.C.\",\n" +
                "    \"price\": 28\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Varvaglione\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"PgxxK9t4IQn4dQ5TS0mQ\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Negroamaro e Malvasia\"\n" +
                "    ],\n" +
                "    \"name\": \"Salice Salentino\",\n" +
                "    \"price\": 20\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Poderi Angelini\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Susumaniello \"\n" +
                "    ],\n" +
                "    \"name\": \"Susumaniello I.G.T.\",\n" +
                "    \"price\": 25\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Arnaldo Caprai\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"QCwEWeCVtTG8GzWLxOtI\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Sagrantino\"\n" +
                "    ],\n" +
                "    \"name\": \"Sagrantino di Montefalco 25 anni\",\n" +
                "    \"price\": 80\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Bollicine\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"bollicine\",\n" +
                "    \"changes\": [\n" +
                "      \"Cuvee del Fondatore millesimato\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"QrfEdXuD9HK7kCJCwSBX\",\n" +
                "    \"image\": \"images/wines/prosecco_oca.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Glera\"\n" +
                "    ],\n" +
                "    \"name\": \"VALDOBBIADENE PROSECCO D.O.C.\",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Cantina Moros\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Negroamaro e malvasia nera\"\n" +
                "    ],\n" +
                "    \"name\": \"Moros D.O.P. Riserva\",\n" +
                "    \"price\": 55\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Farina\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"corvina\",\n" +
                "      \" corvinone\",\n" +
                "      \" molinara\",\n" +
                "      \" rondinella\",\n" +
                "      \" oseleta \"\n" +
                "    ],\n" +
                "    \"name\": \"Amarone D.O.C.G. della Valpolicella\",\n" +
                "    \"price\": 60\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Bollicine\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"bollicine\",\n" +
                "    \"changes\": [\n" +
                "      \"Giancarlo Ceci\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"TdhzBV69f7C2IMUg2LA8\",\n" +
                "    \"image\": \"images/wines/apnea_pampanuto.png\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Pampanuto\"\n" +
                "    ],\n" +
                "    \"name\": \"Apnea\",\n" +
                "    \"price\": 24\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Az. Agr. Basilisco\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"TsJnpfgPK6uUvhJlfaAu\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Aglianico del Vulture\"\n" +
                "    ],\n" +
                "    \"name\": \"Teodosio\",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Marchesi Antinori\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Sangiovese\",\n" +
                "      \" cabernet s.\",\n" +
                "      \" cabernet f.\"\n" +
                "    ],\n" +
                "    \"name\": \"Tignanello I.G.T.\",\n" +
                "    \"price\": 140\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"cinesina \"\n" +
                "    ],\n" +
                "    \"name\": \"cina cinese\",\n" +
                "    \"price\": 20\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Az.Agr. Torrevento\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"YGxM3deicIzwfFCWL2Yt\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Nero di Troia\"\n" +
                "    ],\n" +
                "    \"name\": \"Vigna Pedale Riserva D.O.C.G.\",\n" +
                "    \"price\": 23\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"San Leonardo\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"ZzYGt8RW4LBRIs23EvIb\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Cabernet Sauvignon\",\n" +
                "      \" Merlot\",\n" +
                "      \" Carmenere\"\n" +
                "    ],\n" +
                "    \"name\": \"Terre\",\n" +
                "    \"price\": 25\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Tenute Chiaromonte\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"aed9ofdHUy6T9iJfsdaE\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Primitivo di Gioia\"\n" +
                "    ],\n" +
                "    \"name\": \"Muro sant'Angelo contrada Barbatto D.O.C.\",\n" +
                "    \"price\": 60\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Tramin\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Pinot bianco\"\n" +
                "    ],\n" +
                "    \"name\": \"Moriz D.O.C. \",\n" +
                "    \"price\": 29\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Cantele\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"dLe12p3J50V2tBJoADBW\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Sussumaniello\"\n" +
                "    ],\n" +
                "    \"name\": \"Rohesia Sussumaniello\",\n" +
                "    \"price\": 20\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"cantele\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"shah \"\n" +
                "    ],\n" +
                "    \"name\": \"angeloprova\",\n" +
                "    \"price\": 15\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"La Tunella\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"fv41Jni9DDPS4B3KndRp\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Pinot Grigio\"\n" +
                "    ],\n" +
                "    \"name\": \"Pinot Grigio D.O.P. \",\n" +
                "    \"price\": 27\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Az. AGR. Sacco\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"g2lrySKl5qtjk0Q70Oza\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Nero di Troia\"\n" +
                "    ],\n" +
                "    \"name\": \"Magis\",\n" +
                "    \"price\": 25\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Bianco\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Cantele\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"iVLHajnMMF9q9i10PAgH\",\n" +
                "    \"image\": \"images/wines/teresa.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Chardonnay Barrique\"\n" +
                "    ],\n" +
                "    \"name\": \"Teresa Manara\",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Cantele\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"ikuc58AU265q6DNoff3I\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Primitivo e Negroamaro\"\n" +
                "    ],\n" +
                "    \"name\": \"Amativo I.G.T.\",\n" +
                "    \"price\": 30\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Rosso\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Cantele\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"jMb5R5xFcS4He3wZP66l\",\n" +
                "    \"image\": \"images/wines/salice_doc_riserva.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Negroamaro\",\n" +
                "      \" Malvasia Nera\"\n" +
                "    ],\n" +
                "    \"name\": \"Salice Salentino D.O.C.\",\n" +
                "    \"price\": 17\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Gianfranco Fino\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" primitivo di manduria \"\n" +
                "    ],\n" +
                "    \"name\": \"Es\",\n" +
                "    \"price\": 90\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Masciullo\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"k8rgWFL8mJMiao2q48Wc\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" verdeca\"\n" +
                "    ],\n" +
                "    \"name\": \"Verdeca I.g.t.\",\n" +
                "    \"price\": 23\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Tenute Folonari\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Chardonnay\"\n" +
                "    ],\n" +
                "    \"name\": \"La Pietra\",\n" +
                "    \"price\": 60\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Duca Carlo Guarini\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"lGU99NngLvkb6brLxADb\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Negroamaro\"\n" +
                "    ],\n" +
                "    \"name\": \"Taersia I.G.T.\",\n" +
                "    \"price\": 17\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"bollicine\",\n" +
                "    \"changes\": [\n" +
                "      \"Contadi Castaldi\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"nFvqQop0zol7Z4g70CVQ\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Pinot nero\",\n" +
                "      \" Chardonnay\"\n" +
                "    ],\n" +
                "    \"name\": \"Contadi Castaldi Rose'\",\n" +
                "    \"price\": 40\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Casa vinicola Garofoli \"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Verdicchio\"\n" +
                "    ],\n" +
                "    \"name\": \"Brut Riserva\",\n" +
                "    \"price\": 35\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Poderi Angelini\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"nsq1CvNuBM1PXQsYcgPg\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Negroamato\"\n" +
                "    ],\n" +
                "    \"name\": \"Negroamaro I.G.T.\",\n" +
                "    \"price\": 25\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"rosewine\",\n" +
                "    \"changes\": [\n" +
                "      \"AZ. Vitivinicola Cantele\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"oeKlo9psYHSsY5TYNcxw\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Negroamaro\"\n" +
                "    ],\n" +
                "    \"name\": \"Rohesia I.G.P.\",\n" +
                "    \"price\": 21\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Bera\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Nebbiolo \"\n" +
                "    ],\n" +
                "    \"name\": \"Barolo D.O.C.G.\",\n" +
                "    \"price\": 55\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"bollicine\",\n" +
                "    \"changes\": [\n" +
                "      \"D'Araprì\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Pinot Nero \"\n" +
                "    ],\n" +
                "    \"name\": \"D'Araprì Brut\",\n" +
                "    \"price\": 37\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Tenute Folonari\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"pR1WhjpCvQ4LZXzoF6QK\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Sangiovese\"\n" +
                "    ],\n" +
                "    \"name\": \"Morellino di Scansano D.O.C.G.\",\n" +
                "    \"price\": 25\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Mastroberardino\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Aglianico\"\n" +
                "    ],\n" +
                "    \"name\": \"Taurasi Historia 2003\",\n" +
                "    \"price\": 45\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Gianfranco Fino \"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" primitivo di manduria \"\n" +
                "    ],\n" +
                "    \"name\": \"Se\",\n" +
                "    \"price\": 75\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Rosato\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"rosewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Masseria Masciullo\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"qEpLdkb3Q27555khyjTO\",\n" +
                "    \"image\": \"images/wines/negroamaro_rosato_igt.png\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Negroamaro\"\n" +
                "    ],\n" +
                "    \"name\": \"Negroamaro Masciullo\",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Rosato Frizzante\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"rosewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Az. Agricola Faniglione Pietro\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"qHeJ31bHGl6xlif3D0nD\",\n" +
                "    \"image\": \"images/wines/fos_rosato_frizzante.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Negroamaro\"\n" +
                "    ],\n" +
                "    \"name\": \"Fos Rosato\",\n" +
                "    \"price\": 17\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"bollicine\",\n" +
                "    \"changes\": [\n" +
                "      \"Charles Heidsieck\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"qln6BfNPDQSgRRKpCPHW\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Pinot Nero\",\n" +
                "      \" Chardonnay\",\n" +
                "      \" Pinot Meunier\"\n" +
                "    ],\n" +
                "    \"name\": \"Charles Heidsieck Brut\",\n" +
                "    \"price\": 90\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"La Tunella\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"rMUm5Glt7uKEKCcS8eiQ\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Sauvignon blanc\"\n" +
                "    ],\n" +
                "    \"name\": \"Sauvignon D.O.P. \",\n" +
                "    \"price\": 27\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Casa vinicola Garofoli\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Verdicchio\"\n" +
                "    ],\n" +
                "    \"name\": \"Podium D.O.C. \",\n" +
                "    \"price\": 30\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Az. Agricola Faniglione Pietro \"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"smnTsRE70DAntgFDIZMD\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Verdeca\"\n" +
                "    ],\n" +
                "    \"name\": \"Primi Filari\",\n" +
                "    \"price\": 17\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"\",\n" +
                "    \"changes\": [\n" +
                "      \"Tenuta la Fuga\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Sangiovese\"\n" +
                "    ],\n" +
                "    \"name\": \"Brunello di Montalcino D.O.C.G.\",\n" +
                "    \"price\": 70\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Rosso\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Cannito\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"tD3goc6PoXfqaSL1oS8f\",\n" +
                "    \"image\": \"images/wines/drumon_rosso.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Primitivo di Gioia\"\n" +
                "    ],\n" +
                "    \"name\": \"Drumon Rosso\",\n" +
                "    \"price\": 22\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Tramin\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"ummH8JuD3fckMPlhcunr\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Gewurztraminer\"\n" +
                "    ],\n" +
                "    \"name\": \"Selida D.O.C.\",\n" +
                "    \"price\": 27\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Gianfranco Fino\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" negroamaro\"\n" +
                "    ],\n" +
                "    \"name\": \"Jo\",\n" +
                "    \"price\": 85\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Livio Felluga\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"wpBBtqRz14HIWkkCwroe\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Chardonnay\",\n" +
                "      \" Ribolla Gialla\"\n" +
                "    ],\n" +
                "    \"name\": \"Sharis\",\n" +
                "    \"price\": 25\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Bollicine\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"bollicine\",\n" +
                "    \"changes\": [\n" +
                "      \"Ca' del Bosco\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"wvW6uY9h2T8FQ4NYgs4e\",\n" +
                "    \"image\": \"images/wines/ca_del_bosco.png\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Chardonnay\",\n" +
                "      \" Pinot Bianco\",\n" +
                "      \" Pinot Nero\"\n" +
                "    ],\n" +
                "    \"name\": \"Ca’ del Bosco\",\n" +
                "    \"price\": 58\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Cantele\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"x7hLr5ULnPbKnlRIkyeq\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Negroamaro\"\n" +
                "    ],\n" +
                "    \"name\": \"Teresa Manara I.G.T.\",\n" +
                "    \"price\": 26\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"La Tunella\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"xZypFpl9cyW0UlkerTRa\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Ribolla Gialla\"\n" +
                "    ],\n" +
                "    \"name\": \"RiJalla DOP\",\n" +
                "    \"price\": 27\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Conti Zecca\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"xdK2xJ14u2pLkeYAMFhj\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Cabernet Sauvignon\",\n" +
                "      \" Negroamaro\"\n" +
                "    ],\n" +
                "    \"name\": \"Nero\",\n" +
                "    \"price\": 45\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Bianco Frizzante\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Az. Agricola Faniglione Pietro\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"xtMLTMBWrFzdIwwgUmCC\",\n" +
                "    \"image\": \"images/wines/furfante_fos.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Verdeca\",\n" +
                "      \" Bianco d’Alessano\",\n" +
                "      \" Minutolo\"\n" +
                "    ],\n" +
                "    \"name\": \"Fos Bianco\",\n" +
                "    \"price\": 17\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"bollicine\",\n" +
                "    \"changes\": [\n" +
                "      \"Ca' del Bosco\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"xuLyUwfVN62HV3ic0Bod\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Pinot Nero\",\n" +
                "      \" Chardonnay\"\n" +
                "    ],\n" +
                "    \"name\": \"Ca' del Bosco Rose\",\n" +
                "    \"price\": 75\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \" Garofoli\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"ybMjjNUBNRwKlzJNpgM3\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Montepulciano\"\n" +
                "    ],\n" +
                "    \"name\": \"Piancarda D.O.C. Rosso conero\",\n" +
                "    \"price\": 20\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"Bianco\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"whitewine\",\n" +
                "    \"changes\": [\n" +
                "      \"Cannito\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"zPmb1vsEoaMwzNzlpIiD\",\n" +
                "    \"image\": \"images/wines/drumon_fiano_minutolo.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"Fiano Minutolo\"\n" +
                "    ],\n" +
                "    \"name\": \"Drumon Bianco I.G.T.\",\n" +
                "    \"price\": 19\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"redwine\",\n" +
                "    \"changes\": [\n" +
                "      \"Marchesi Antinori\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"zUjOMJa3T1X44Uw0R4dF\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \"cabernet sauvignon\",\n" +
                "      \" sangiovese\",\n" +
                "      \" cabernet franc\"\n" +
                "    ],\n" +
                "    \"name\": \"Solaia I.G.T.\",\n" +
                "    \"price\": 380\n" +
                "  },\n" +
                "  {\n" +
                "    \"allergens\": [\n" +
                "      \"\"\n" +
                "    ],\n" +
                "    \"available\": \"true\",\n" +
                "    \"category\": \"bollicine\",\n" +
                "    \"changes\": [\n" +
                "      \"D'Araprì\"\n" +
                "    ],\n" +
                "    \"discountApplied\": 0,\n" +
                "    \"id\": \"\",\n" +
                "    \"image\": \"images/sushi/default_sushi.jpg\",\n" +
                "    \"ingredients\": [\n" +
                "      \" Montepulciano\",\n" +
                "      \" Pinot Nero\"\n" +
                "    ],\n" +
                "    \"name\": \"D'Araprì Brut Rose\",\n" +
                "    \"price\": 40\n" +
                "  }\n" +
                "]";
    }
}
