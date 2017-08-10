package com.hyunhye.taglib;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.stream.Stream;

import javax.servlet.jsp.JspWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.hyunhye.board.model.Category;
import com.hyunhye.board.service.CategoryService;

@SuppressWarnings("serial")
public class CategoryListTag extends RequestContextAwareTag {
	Logger logger = LoggerFactory.getLogger(CategoryListTag.class);

	@Override
	protected int doStartTagInternal() throws Exception {

		CategoryService categoryService = SpringBeanFactory.getBean(CategoryService.class);
		List<Category> category = categoryService.categorySelectList();

		if (Objects.isNull(category)) {
			return SKIP_BODY;
		}

		Stream<Category> stream = category.stream();

		JspWriter writer = this.pageContext.getOut();
		writer.write("<select name='categoryNo' id='category'>");
		stream.forEach(c -> {
			try {
				writer.write("<option value='" + c.getCategoryNo() + "'>");
				writer.write(c.getCategoryItem());
				writer.write("</option>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
		writer.write("</select>");

		return SKIP_BODY;
	}
}
