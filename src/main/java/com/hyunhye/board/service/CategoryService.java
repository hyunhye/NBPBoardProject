package com.hyunhye.board.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunhye.board.model.Category;
import com.hyunhye.board.repository.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	public CategoryRepository categoryRepository;

	/* 카테고리 추가 */
	public void categoryInsert(Category categoryModel) {
		categoryRepository.categoryInsert(categoryModel);
	}

	/* 카테고리 목록 가져오기 */
	public List<Category> categorySelectList() {
		List<Category> category = categoryRepository.categorySelectList();

		List<Category> list = category.stream()
			.parallel()
			.filter(s -> s.getCategoryEnabled() != 0)
			.collect(Collectors.toList());

		return list;
	}

	/* 카테고리를 가진 게시물 개수 구하기 */
	public int boardSelectCountOfCategory(Category categoryModel) {
		return categoryRepository.boardSelectCountOfCategory(categoryModel);
	}

	/* 카테고리 삭제 */
	public void categoryDelete(Category categoryModel) {
		categoryRepository.categoryDelete(categoryModel);
	}

	/* 카테고리 중복 체크 */
	public Integer categoryItemNameCheck(Category categoryModel) {
		return categoryRepository.categoryItemNameCheck(categoryModel);
	}

}
