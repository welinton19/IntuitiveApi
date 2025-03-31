import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.apache.commons.io.FileUtils;

import java.io.*;
import java.net.URL;
import java.nio.file.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;




public class OpenSite {
    public static void main(String[] args) throws Exception {
        String url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos";
        String outputDir = "output/";
        Files.createDirectories(Paths.get(outputDir));

        // Baixa a página e procura por links de PDF contendo "Anexo I" e "Anexo II"
        Document doc = Jsoup.connect(url).get();
        Elements links = doc.select("a[href$=.pdf]");

        int count = 0;
        for (Element link : links) {
            String href = link.absUrl("href");
            if (href.contains("anexo") || href.toLowerCase().contains("anexo")) {
                count++;
                String fileName = "Anexo_" + count + ".pdf";
                System.out.println("Baixando: " + href);
                FileUtils.copyURLToFile(new URL(href), new File(outputDir + fileName));
                if (count == 2) break;
            }
        }

        // Compacta os arquivos em um .zip
        String zipFileName = "output/anexos_compactados.zip";
        try (FileOutputStream fos = new FileOutputStream(zipFileName);
             ZipOutputStream zos = new ZipOutputStream(fos)) {

            for (int i = 1; i <= 2; i++) {
                File fileToZip = new File(outputDir + "Anexo_" + i + ".pdf");
                try (FileInputStream fis = new FileInputStream(fileToZip)) {
                    ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
                    zos.putNextEntry(zipEntry);

                    byte[] bytes = new byte[1024];
                    int length;
                    while ((length = fis.read(bytes)) >= 0) {
                        zos.write(bytes, 0, length);
                    }
                }
            }
        }

        System.out.println("Download e compactação finalizados.");
    }
}
