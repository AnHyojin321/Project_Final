package com.kh.ski.notice.model.vo;

public class PageInfo {
    private int listCount;    // 총 게시글 수
    private int currentPage;  // 현재 페이지
    private int pageLimit;    // 하단에 표시될 페이지 번호 갯수
    private int boardLimit;   // 한 페이지에 표시될 게시글 수
    private int maxPage;      // 전체 페이지 중 가장 마지막 페이지
    private int startPage;    // 하단에 표시될 페이지 시작 번호
    private int endPage;      // 하단에 표시될 페이지 끝 번호

    public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit,
                    int maxPage, int startPage, int endPage) {
        this.listCount = listCount;
        this.currentPage = currentPage;
        this.pageLimit = pageLimit;
        this.boardLimit = boardLimit;
        this.maxPage = maxPage;
        this.startPage = startPage;
        this.endPage = endPage;
    }

    // Getters and Setters
    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getListCount() {
        return listCount;
    }

    public void setListCount(int listCount) {
        this.listCount = listCount;
    }

    public int getPageLimit() {
        return pageLimit;
    }

    public void setPageLimit(int pageLimit) {
        this.pageLimit = pageLimit;
    }

    public int getBoardLimit() {
        return boardLimit;
    }

    public void setBoardLimit(int boardLimit) {
        this.boardLimit = boardLimit;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
}
