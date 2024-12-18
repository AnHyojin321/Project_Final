package com.kh.ski.common.template;

import com.kh.ski.lostitem.model.vo.PageInfo;

public class Pagination1 {
    public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
        int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
    }
}
