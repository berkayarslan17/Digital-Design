/* tb_alu_nzvc_auto.sv
 *
 * testvectorlerinden okuyup otomatik karsilastirma yapan testbench.
 */

`timescale 1ns/1ps

module tb_alu_nzvc_auto ();

    localparam XLEN = 32; // ALU nun bit uzunlugu

    logic clk;
    logic [XLEN-1:0] a, b;
    logic [3:0] op;
    logic [XLEN-1:0] s, sexp;
    logic n, z, v, c, nexp, zexp, vexp, cexp;
    logic hata;

    // clk port olarak mevcut, fakat iceride bagli degil. (ALU comb. logicden olusuyor sadece)
    // XLEN ALU bit uzunlugu, sizin tasariminizda kullanmayabilirsiniz.
    lab4_g61_p3 #(XLEN) dut0(
        .clk(clk), .a(a), .b(b), .op(op), .s(s), .n(n), .z(z), .v(v), .c(c), .hata(hata));

    initial
    begin
        // file descriptor
        int fd;

        // test vector dosyasini ac. bu dosya ile ayni klasorde olacak. (videodaki gibi modelsim projeniz sim/ klasorunun altinda ise)
        // yoksa asagidan dogru yere yonlendirin
        fd = $fopen ("../tb/lab4_p3_testvector.txt", "r");
        // eger acildiysa devam et
        if (fd)
            // sonuna kadar dosyayi oku
            while (!$feof(fd)) begin
                // her satiri tek tek oku. testvector asagida gosterilen siraya gore olusturulmustur. binary olarak.
                // hata cikisi bulunmamaktadir. (yani hatali bir op degeri yok, TODO: siz birkac hatali ekleyin testvectorlerinin sonuna)
                // 10 ns bekle ve devre sonuclari ile beklenen degerleri kontrol et
                $fscanf(fd, "%b,%b,%b,%b,%b,%b,%b,%b",a, b, op, sexp, nexp, zexp, vexp, cexp); #10;
                if (s !== sexp) begin
                    $display("s icin yanlis deger, op: %b, beklenen: %b, devre: %b", op, sexp, s);
                    $display("|--> a: %b, b: %b", a, b);
                end
                // carry bitini karsilastir.
                // TODO: geri kalan karsilastirmalari da eklemeniz gerekir. (nzv)
                if (c !== cexp) begin
                    $display("c icin yanlis deger, op: %b, beklenen: %b, devre %b", op, cexp, c);
                    $display("|--a: %b, b: %b, s: %b", a, b, s);
                end
				
				if (n !== cexp) begin
                    $display("n icin yanlis deger, op: %b, beklenen: %b, devre %b", op, nexp, n);
                    $display("|--a: %b, b: %b, s: %b", a, b, s);
                end
				
				if (z !== cexp) begin
                    $display("z icin yanlis deger, op: %b, beklenen: %b, devre %b", op, zexp, z);
                    $display("|--a: %b, b: %b, s: %b", a, b, s);
                end
				
				if (v !== cexp) begin
                    $display("v icin yanlis deger, op: %b, beklenen: %b, devre %b", op, vexp, v);
                    $display("|--a: %b, b: %b, s: %b", a, b, s);
                end
				
            end
        // acamazsa hata ver
        else
            $display("error with opening file");

        $fclose(fd);
        //$stop;
    end

endmodule
