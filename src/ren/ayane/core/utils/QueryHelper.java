package ren.ayane.core.utils;

import java.util.ArrayList;
import java.util.List;
/**
 * 查询助手
 * @author SoulAsa
 */
public class QueryHelper {

	// from子句
	private String fromClause = "";
	// where子句
	private String whereClause = "";
	// order by子句
	private String orderByClause = "";
	
	// where子句中?对应的参数值
	private List<Object> parameters;
	
	// order by常量值
	public static String ORDER_BY_ASC = "ASC"; // 升序
	public static String ORDER_BY_DESC = "DESC"; // 降序
	
	/**
	 * 利用构造方法构造from子句
	 * @param clazz 实体类
	 * @param alias 别名
	 */
	public QueryHelper(Class clazz, String alias) {
		fromClause = "FROM " + clazz.getSimpleName() + " " + alias;
	}
	
	/**
	 * 组装where子句
	 * @param condition 条件
	 * @param params 条件中?对应的参数值
	 * @return QueryHelper
	 */
	public QueryHelper addCondition(String condition, Object...params) {
		if (whereClause.length() > 0) {
			whereClause += " AND " + condition;
		} else {
			whereClause = " WHERE " + condition;
		}
		if (parameters == null) {
			parameters = new ArrayList<Object>();
		}
		for (Object param : params) {
			parameters.add(param);
		}
		return this;
	}

	/**
	 * 构建order by子句
	 * @param property 排序的属性
	 * @param order 升序(asc)或是降序(desc)
	 * @return QueryHelper
	 */
	public QueryHelper addOrderByProperty(String property, String order) {
		if (orderByClause.length() > 0) {
			orderByClause += "," + property + " " + order;
		} else {
			orderByClause = " ORDER BY " + property + " " + order;
		}
		return this;
	}
	
	// 返回列表查询hql语句
	public String getListQueryHql() {
		return fromClause + whereClause + orderByClause;
	}
	
	// 返回查询总记录数的hql
	public String getCountHql() {
		return "SELECT COUNT(*) " + fromClause + whereClause;
	}
	
	public String getFromClause() {
		return fromClause;
	}
	public void setFromClause(String fromClause) {
		this.fromClause = fromClause;
	}
	public String getWhereClause() {
		return whereClause;
	}
	public void setWhereClause(String whereClause) {
		this.whereClause = whereClause;
	}
	public String getOrderByClause() {
		return orderByClause;
	}
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}
	public List<Object> getParameters() {
		return parameters;
	}
	public void setParameters(List<Object> parameters) {
		this.parameters = parameters;
	}
	
}
