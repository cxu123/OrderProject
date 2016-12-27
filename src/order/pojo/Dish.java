package order.pojo;

public class Dish {
    private Integer id;

    private String dishname;

    private String dishtype;

    private Double price;

    private Integer num;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDishname() {
        return dishname;
    }

    public void setDishname(String dishname) {
        this.dishname = dishname == null ? null : dishname.trim();
    }

    public String getDishtype() {
        return dishtype;
    }

    public void setDishtype(String dishtype) {
        this.dishtype = dishtype == null ? null : dishtype.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}