package registrarbeans;

import DbConnection.DbConnection;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.jsp.JspWriter;
import java.sql.*;

public class ShoppingCart {

    ArrayList<Item> itemlist = new ArrayList<Item>();  // list of Items in the cart
    java.text.DecimalFormat currency = new java.text.DecimalFormat("$ #,###,##0.00");

    public ShoppingCart() {

    }

    public void empty() {
        itemlist.clear();
    }

    //
    // add an item to the cart
    // if its there already, just update the upc
    // 
    public void add(Item anitem) {

        for (int i = 0; i < itemlist.size(); i++) {
            Item item = itemlist.get(i);
            if (anitem.id == item.id) // already in the cart?
            {
                item.quantity += anitem.quantity; // yes, just update the quantity
                return;
            }
        }
        itemlist.add(anitem); // no, add it as a new item
    }

    //
    // remove an item with a given id from the shopping cart
    //
    public void remove(int id) {

        for (int i = 0; i < itemlist.size(); i++) {
            Item item = itemlist.get(i);
            if (id == item.id) // item in the cart?
            {
                itemlist.remove(i); // remove it
                break;
            }
        }

    }
    //
    // Display the current contents of the cart as an html table
    //

//    public void display(JspWriter out) throws IOException {
//        //
//        // start the table and output the header row
//        //
//        out.println("<h3>Cart contents</h3>");
//        out.println("<table border=1>");
//        out.println("<tr><th>ID</th><th>Name</th><th>Price</th><th>Quantity</th><th>Total</th></tr>");
//
//        double total = 0;
//        //
//        // output one item at a time from the cart, one item to a row table
//        //
//        for (int i = 0; i < itemlist.size(); i++) {
//            Item item = (Item) itemlist.get(i);
//            out.println("<tr><td>" + item.id + "</td>"
//                    + "<td>" + item.name + "</td>"
//                    + "<td align=right>" + currency.format(item.price) + "</td>"
//                    + "<td align=right>" + item.quantity + "</td>"
//                    + "<td align=right>" + currency.format(item.price * item.quantity) + "</td>"
//                    + "<td align=center><A href='removeItemFromCart.jsp?id=" + item.id + "'>remove</A></TD></tr>");
//            total += item.price * item.quantity;
//        }
//        //
//        // add summary information (total, tax, grand total)
//        //
//        out.println("<tr><td colspan = 4>Total purchase</td>");
//        out.println("<td align=right>" + currency.format(total) + "</td></tr>");
//        out.println("<tr><td colspan = 4>Sales tax @6%</td>"
//                + "<td align=right>" + currency.format(total * .06) + "</td></tr>");
//        out.println("<tr><td colspan = 4>Amount due</td>"
//                + "<td align=right>" + currency.format(total * 1.06) + "</td></tr>");
//        out.println("</table>");
//        // out.println("<a href='findCourseWithAddToCart.jsp'><input type='Button' value='Add Products'/></A><br/>");
//        out.println("<a href='checkOut.jsp?totalamt=" + currency.format(total * 1.06) + "'>Proceed To Checkout</A><br/>");
//
//    }

    public void display(JspWriter out) throws IOException {
        //
        // start the table and output the header row with inline Bootstrap styling
        //
        out.println("<div class='container'>");
        out.println("<h3>Cart contents</h3>");
        out.println("<table class='table table-bordered table-striped' align =''>");
        out.println("<thead style='background-color: #343a40; color: white;'>"
                    + "<tr><th>ID</th><th>Name</th><th>Price</th><th>Quantity</th><th>Total</th><th>Action</th></tr></thead>");
        out.println("<tbody>");

        double total = 0;
        //
        // output one item at a time from the cart, one item to a row table
        //
        for (int i = 0; i < itemlist.size(); i++) {
            Item item = (Item) itemlist.get(i);
            out.println("<tr><td>" + item.id + "</td>"
                    + "<td>" + item.name + "</td>"
                    + "<td align=right>" + currency.format(item.price) + "</td>"
                    + "<td align=right>" + item.quantity + "</td>"
                    + "<td align=right>" + currency.format(item.price * item.quantity) + "</td>"
                    + "<td align=center><a class='btn btn-danger' href='removeItemFromCart.jsp?id=" + item.id + "'>Remove</a></td></tr>");
            total += item.price * item.quantity;
        }
        //
        // add summary information (total, tax, grand total) with inline Bootstrap styling
        //
        out.println("<tr><td colspan='4'>Total purchase</td>");
        out.println("<td align=right>" + currency.format(total) + "</td></tr>");
        out.println("<tr><td colspan='4'>Sales tax @6%</td>"
                + "<td align=right>" + currency.format(total * .06) + "</td></tr>");
        out.println("<tr><td colspan='4'>Amount due</td>"
                + "<td align=right>" + currency.format(total * 1.06) + "</td></tr>");

        out.println("</tbody></table>");
        out.println("<a class='btn btn-primary' href='checkOut.jsp?totalamt=" + currency.format(total * 1.06) + "'>Proceed To Checkout</a><br/>");
        out.println("</div>");
    }


    public int checkOut(String url, int studentid) {
        int result = 0; // tally the classes added
        try {

            Statement stmt = DbConnection.getConnection();
            int remainingQty = 0;
            for (int i = 0; i < itemlist.size(); i++) {
                Item item = itemlist.get(i);
                int iteid = item.getId();

                String iname = item.getName();
                double pprice = item.getPrice();
                int quan = item.getQuantity();

                System.out.println(iname + " " + pprice + " " + quan);

                ResultSet rs = stmt.executeQuery("Select * from product_items");
                int flag = 0;
                while (rs.next()) {
                    int itmid = rs.getInt("itemid");
                    String itmname = rs.getString("itemname");
                    String noOfqty = rs.getString("noOfQty");

                    int noqty = Integer.parseInt(noOfqty);

                    if (iteid == iteid && iname.equals(itmname)) {

                        remainingQty = noqty - quan;
                        flag = 1;
                    }

                }

                String rmgQty = Integer.toString(remainingQty);
                if (flag == 1 && rmgQty != null) {
                    result = stmt.executeUpdate("update product_items set noOfQty='" + rmgQty + "' where itemid='" + iteid + "' and itemname='" + iname + "'");
                    System.out.println(result);
                }
            }
            itemlist.clear(); //empty the cart
            stmt.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return result;
    }
}
