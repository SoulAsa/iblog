package ren.ayane.iblog.action;

import java.io.File;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import ren.ayane.core.action.BaseAction;
import ren.ayane.core.exception.ActionException;
import ren.ayane.core.page.PageResult;
import ren.ayane.core.utils.QueryHelper;
import ren.ayane.iblog.entity.Article;
import ren.ayane.iblog.entity.ArticleTag;
import ren.ayane.iblog.entity.Category;
import ren.ayane.iblog.service.IArticleService;
import ren.ayane.iblog.service.ICategoryService;
import ren.ayane.iblog.service.ITagService;

/**
 * 控制器
 * 文章管理
 * @author SoulAsa
 */
public class ArticleAction extends BaseAction {

	@Resource
	private IArticleService articleService;
	@Resource
	private ICategoryService categoryService;
	@Resource
	private ITagService tagService;
	private Article article;
	private Map<String,Object> json_map;
	List<Integer> selectedRows;
	
	// 文件上传
	private File iconCover;
	private String iconCoverFileName;
	private String iconCoverContentType;
	
	private Integer[] articleTagIds;
	
	// 列表页面
	public String listUI() {
		return "listUI";
	}
	
	public String list() throws ActionException {
		try {
			// 创建查询助手对象
			QueryHelper queryHelper = new QueryHelper(Article.class, "a");
			if (article != null) {
				if (StringUtils.isNotBlank(article.getTitle())) {
					article.setTitle(URLDecoder.decode(article.getTitle(),"utf-8"));
					queryHelper.addCondition("a.title like ?", "%" + article.getTitle() + "%");
				}
			}
			if (getPage() == 0 || "".equals(getPage())) {
				setPage(1);
			}
			if (getRows() == 0 || "".equals(getRows())) {
				setRows(DEFAULT_ROWS);
			}
			pageResult = articleService.getPageResult(queryHelper, getPage(), getRows());
			json_map = new LinkedHashMap<String, Object>();
			json_map.put("total", articleService.findObjects().size());
			json_map.put("rows", pageResult.getItems());
		} catch (Exception e) {
			// 捕获service层异常，根据异常信息判断是否影响本次操作结果
			throw new ActionException("请求操作失败。"+e.getMessage());
		}
		return SUCCESS;
	}
	
	// 跳转到添加页面
	public String addUI() {
		// 加载信息分类集合
		ActionContext.getContext().getContextMap().put("cateList", categoryService.findObjects());
		// 加载信息标签集合
		ActionContext.getContext().getContextMap().put("tagList", tagService.findObjects());
		article = new Article();
		article.setCreateTime(new Timestamp(new Date().getTime()));
		return "addUI";
	}
	
	// 保存新增
	public String add() throws Exception {
		if(article != null) {
			if (iconCover != null) {
				/******拿到上传的文件，进行处理******/
				// 把文件上传到upload/article目录
				
				// 获取上传的目录路径
				String path = ServletActionContext.getServletContext().getRealPath("/upload/article");
				// 创建目标文件对象
				File destFile = new File(path,iconCoverFileName);
				// 把上传的文件，拷贝到目标文件中
				FileUtils.copyFile(iconCover, destFile);
				
				article.setIconCover("upload/article/" + iconCoverFileName);
			} else {
				article.setIconCover("images/article/article.png");
			}
			articleService.saveArticleAndTag(article, articleTagIds);
		}
		return "listUI";
	}
	
	// 跳转到编辑页面
	public String editUI() {
		// 加载信息分类集合
		ActionContext.getContext().getContextMap().put("cateList", categoryService.findObjects());
		// 加载信息标签集合
		ActionContext.getContext().getContextMap().put("tagList", tagService.findObjects());
		if (article != null && article.getArtId() != null) {
			article = articleService.findObjectById(article.getArtId());
			//处理角色回显
			List<ArticleTag> list = articleService.getArticleTagsByArtId(article.getArtId());
			if(list != null && list.size() > 0){
				articleTagIds = new Integer[list.size()];
				for(int i = 0; i < list.size(); i++){
					articleTagIds[i] = list.get(i).getId().getTag().getTagId();
				}
			}
		}
		return "editUI";
	}
	
	// 修改
	public String edit() throws Exception {
		if(article != null) {
			if (iconCover != null) {
				/******拿到上传的文件，进行处理******/
				// 把文件上传到upload/article目录
				
				// 获取上传的目录路径
				String path = ServletActionContext.getServletContext().getRealPath("/upload/article");
				// 创建目标文件对象
				File destFile = new File(path,iconCoverFileName);
				// 把上传的文件，拷贝到目标文件中
				FileUtils.copyFile(iconCover, destFile);
				
				article.setIconCover("upload/article/" + iconCoverFileName);
			} else {
				article.setIconCover("images/article/article.png");
			}
			article.setModifyTime(new Timestamp(new Date().getTime()));
			articleService.updateArticleAndTag(article, articleTagIds);
		}
		return "listUI";
	}
	
	// 删除
	public String delete(){
		if (article != null && article.getArtId() != null) {
			articleService.delete(article.getArtId());
		}
		return "list";
	}
	
	// 批量删除
	public String deleteSelected(){
		if (selectedRows != null) {
			for (int id : selectedRows) {
				articleService.delete(id);
			}
		}
		return "listUI";
	}
	
	// 预览页面
	public String preview() {
		if (article != null) {
			if (article.getArtId() != null) {
				article = articleService.findObjectById(article.getArtId());
			}
		}
		return "preview";
	}
	
	// 改变文章推荐状态
	public void recommend() {
		if (article != null) {
			if (article.getArtId() != null) {
				article = articleService.findObjectById(article.getArtId());
				article.setIsFlag(!article.getIsFlag());
				articleService.update(article);
			}
		}
	}
	
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public Map<String, Object> getJson_map() {
		return json_map;
	}
	public void setJson_map(Map<String, Object> json_map) {
		this.json_map = json_map;
	}
	public List<Integer> getSelectedRows() {
		return selectedRows;
	}
	public void setSelectedRows(List<Integer> selectedRows) {
		this.selectedRows = selectedRows;
	}
	public void setIconCover(File iconCover) {
		this.iconCover = iconCover;
	}
	public void setIconCoverFileName(String iconCoverFileName) {
		this.iconCoverFileName = iconCoverFileName;
	}
	public void setIconCoverContentType(String iconCoverContentType) {
		this.iconCoverContentType = iconCoverContentType;
	}
	public Integer[] getArticleTagIds() {
		return articleTagIds;
	}
	public void setArticleTagIds(Integer[] articleTagIds) {
		this.articleTagIds = articleTagIds;
	}
	
}
