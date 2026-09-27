public class LatihanArray {
    public static void main(String[] args) {
        int[] data = {
            30, 87, 90, 3, 1,
            50, 23, 4, 25, 23,
            40, 35, 47, 2, 33
        };

        System.out.println("Data array:");

        for (int i = 0; i < data.length; i++) {
            System.out.print(data[i]);

            if (i < data.length - 1) {
                System.out.print(" ");
            }
        }

        System.out.println();
    }
}