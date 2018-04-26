package dao;

import java.sql.*;
import javax.sql.DataSource;
import java.util.LinkedList;
import java.util.List;

public class tapDao {
    private DataSource ds;
   
    public tapDao(DataSource ds) {
        this.ds = ds;
    }
}
