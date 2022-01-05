package com.koreait.mooda.manager.member;

public class MemberSearch {
   private String searchKey;//m_hp
   private String searchValue;//1
   
   public String getSearchKey() {
      return searchKey;
   }
   public void setSearchKey(String searchKey) {
      this.searchKey = searchKey;
   }
   public String getSearchValue() {
      return searchValue;
   }
   public void setSearchValue(String searchValue) {
      this.searchValue = searchValue;
   }
   @Override
   public String toString() {
      return "MemberSearch [searchKey=" + searchKey + ", searchValue=" + searchValue + "]";
   }
   
   
}