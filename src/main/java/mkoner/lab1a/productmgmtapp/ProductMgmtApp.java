package mkoner.lab1a.productmgmtapp;

import mkoner.lab1a.productmgmtapp.model.Product;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Comparator;

public class ProductMgmtApp {

    public static void main(String[] args) {
        Product[] products = new Product[]{
                new Product(3128874119L, "Banana", LocalDate.of(2023, 1,24), 124, 0.55),
                new Product(2927458265L, "Apple", LocalDate.of(2022, 12,9), 18, 1.09),
                new Product(9189927460L, "Carrot", LocalDate.of(2023, 3,31), 89, 2.99),
        };
        printProducts(products);
    }


    public  static void printProducts(Product[] products){
        Arrays.sort(products, Comparator.comparingDouble(Product::getUnitPrice).reversed());
        System.out.println("Products in JSON format:");
        System.out.println("[");
        for (Product product : products) {
            System.out.println(product.toJson());
        }
        System.out.println("]");
        System.out.println("Products in XML format:");
        System.out.println("<products>");
        for (Product product : products) {
            System.out.println(product.toXML());
        }
        System.out.println("</products>");
        System.out.println("Products in CSV format:");
        for (Product product : products) {
            System.out.println(product.toCVS());
        }
    }
}
