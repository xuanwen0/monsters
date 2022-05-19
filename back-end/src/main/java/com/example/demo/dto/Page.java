package com.example.demo.dto;

public class Page {
	private static final int INFINITE = -1;
	private int page;
	private int count;

	private Page(int page, int count) {
		this.page = page;
		this.count = count;
	}

	public static Page create(int page, int count) {
		return new Page(page, count);
	}

	public static Page infinite() {
		return new Page(INFINITE, INFINITE);
	}

	public int getFirstResultIndex() {
		return (page - 1) * count;
	}

	public boolean isInfinite() {
		return page == INFINITE && count == INFINITE;
	}

	public int getPage() {
		return page;
	}

	public int getCount() {
		return count;
	}
}
