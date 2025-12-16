import java.io.FileWriter;

public class Panic {
    public static void main(String[] args) throws Exception {
        FileWriter f = new FileWriter("/proc/sysrq-trigger");
        f.write("c");
        f.close();
    }
}

