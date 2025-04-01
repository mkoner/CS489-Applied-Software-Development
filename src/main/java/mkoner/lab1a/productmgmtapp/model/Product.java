package mkoner.lab1a.productmgmtapp.model;

import java.time.LocalDate;

public class Product {
    private long productId;
    private String name;
    private LocalDate dateSupplied;
    private int quantityInStock;
    private double unitPrice;
    public Product() {}
    public Product(long productId, String name, LocalDate dateSupplied, int quantityInStock, double unitPrice) {
        this.productId = productId;
        this.name = name;
        this.dateSupplied = dateSupplied;
        this.quantityInStock = quantityInStock;
        this.unitPrice = unitPrice;
    }
    public Product(long productId, String name) {
        this.productId = productId;
        this.name = name;
    }

    public long getProductId() {
        return productId;
    }

    public String getName() {
        return name;
    }

    public LocalDate getDateSupplied() {
        return dateSupplied;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDateSupplied(LocalDate dateSupplied) {
        this.dateSupplied = dateSupplied;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String toJson(){
        return "{ \"productId\":" + productId + ", \"name\":\"" + name + "\", \"dateSupplied\": \"" + dateSupplied + "\", \"quantityInStock\":" + quantityInStock + ", \"unitPrice\":" + unitPrice + "}";
    }

    public String toXML(){
        return "<product productId=\"" + productId + "\" name=\"" + name + "\" dateSupplied=\"" + dateSupplied +"\" quantityInStock=\"" + quantityInStock + "\" unitPrice=\"" + unitPrice + "\"/>";
    }

    public String toCVS(){
        return  productId + "," + name + "," + dateSupplied + "," + quantityInStock + "," + unitPrice;
    }
}
