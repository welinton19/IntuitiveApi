public class Main {
    public static void main(String[] args) throws Exception {
        String inputPdf = "output/Anexo_1.pdf";
        String outputCsv = "output/teste_seu_nome.csv";
        String outputZip = "output/Teste_seu_nome.zip";

        String text = ReadPdf.extractText(inputPdf);
        PdfToCsvConvert.convert(text, outputCsv);
        Zipper.zipCsv(outputCsv, outputZip);
    }
}
