package com.cafedal.webapp.dao;


import java.util.List;

import com.cafedal.webapp.entity.Member;
import com.cafedal.webapp.entity.MyDcInfoView;
import com.cafedal.webapp.entity.Mypage;


public interface MypageDao {

   Mypage get(String id);
   
   Mypage getCafe(String id);

   List<Mypage> getUseListCafe(String id);
   
   List<MyDcInfoView> myDcInfoList(int page, String field, String query, String id);
}
