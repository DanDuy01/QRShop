/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import context.DBContext;
import dal.interfaces.IUserDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.User;

public class UserDAOImpl extends context.DBContext implements IUserDAO {

    Connection connection = null;
    DBContext dBContext = new DBContext();

    @Override
    public User login(String email, String passWord) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "SELECT * FROM [User] WHERE (email like ? or phone like ?) AND password = ? AND active = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, email);
            ps.setString(3, passWord);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("fullName"));
                user.setDob(rs.getDate("dob"));
                user.setGender(rs.getString("gender"));
                user.setAvatar(rs.getString("avatar"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                user.setActive(rs.getBoolean("active"));

                return user;
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return null;
    }

    @Override
    public int changePassword(int id, String newPassword) {
        int numberOfChange = 0;
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "UPDATE [User] SET password = ? WHERE userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setInt(2, id);
            numberOfChange = st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return numberOfChange;
    }

    @Override
    public void updateProfile(User user) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "UPDATE [User] SET fullName = ?, dob = ?, gender = ?, avatar = ?, phone = ?, email = ?, address = ? WHERE userId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getFullName());
            int count = 1;
            st.setDate(++count, user.getDob());
            st.setString(++count, user.getGender());
            st.setString(++count, user.getAvatar());
            st.setString(++count, user.getPhone());
            st.setString(++count, user.getEmail());
            st.setString(++count, user.getAddress());
            st.setInt(++count, user.getUserId());
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            }
        }

    }

    @Override
    public int SaveUser(String action, User user) {
        int numberOfChange = 0;
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "";
        if (action.equals("add")) {
            sql = "Insert into [User](fullName,gender,dob,phone,address, password, email, role, active) values(?,?,?,?,?,?,?,?,?);";
        } else {
            sql = "Update [User] set fullName = ?, gender=?, dob = ?, phone = ?, address = ?, email = ? where userId = ?";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int count = 0;
            st.setString(++count, user.getFullName());
            st.setString(++count, user.getGender());
            st.setDate(++count, user.getDob());
            st.setString(++count, user.getPhone());
            st.setString(++count, user.getAddress());
            st.setString(++count, user.getEmail());
            if (action.equals("edit")) {

            } else {
                st.setString(++count, user.getPassword());
                st.setString(++count, user.getRole());
                st.setBoolean(++count, user.isActive());
            }

            numberOfChange = st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return numberOfChange;
    }

    @Override
    public User checkExist(String column, String value, int userid) {

        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "";
        if (userid == -1) {
            sql = "select * from  [User] where " + column + " = ? ";
        } else {
            sql = "select * from  [User] where " + column + " = ? and userId <> ?";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, value);
            if (userid != -1) {
                ps.setInt(2, userid);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("fullName"));
                user.setDob(rs.getDate("dob"));
                user.setGender(rs.getString("gender"));
                user.setAvatar(rs.getString("avatar"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                user.setActive(rs.getBoolean("active"));
                return user;
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return null;
    }

    @Override
    public int DeleteUser(int userId) {
        int numberOfChange = 0;
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "UPDATE [User] SET active = 0 WHERE userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            numberOfChange = st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return numberOfChange;
    }

    @Override
    public User getUserById(int userId) {
        User user = null;
        try {
            connection = dBContext.openConnection();
            String sql = "SELECT * FROM [User] WHERE userId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("fullName"));
                user.setDob(rs.getDate("dob"));
                user.setGender(rs.getString("gender"));
                user.setAvatar(rs.getString("avatar"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                user.setActive(rs.getBoolean("active"));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return user;
    }

    @Override
    public void registerProfile(User user) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "INSERT INTO [User] (password, fullName, dob, gender, avatar, phone, email, address, role, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int count = 0;
            st.setString(++count, user.getPassword());
            st.setString(++count, user.getFullName());
            st.setDate(++count, user.getDob());
            st.setString(++count, user.getGender());
            st.setString(++count, user.getAvatar());
            st.setString(++count, user.getPhone());
            st.setString(++count, user.getEmail());
            st.setString(++count, user.getAddress());
            st.setString(++count, user.getRole());
            st.setBoolean(++count, true);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            }
        }

    }

}
