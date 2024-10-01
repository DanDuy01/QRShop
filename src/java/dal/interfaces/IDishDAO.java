/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dal.interfaces;

import java.util.List;
import models.Dish;

/**
 *
 * @author ThinkPro
 */
public interface IDishDAO {

    public List<Dish> filterPaging(int index, int record_per_page, String searchKey, String categoryId, String type, String value);

    public int countDishByCondition(String searchKey, String categoryId);

    public List<Dish> getAll();
    
}
