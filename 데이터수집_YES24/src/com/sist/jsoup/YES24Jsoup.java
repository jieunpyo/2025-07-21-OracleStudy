package com.sist.jsoup;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.*;
import com.sist.vo.*;
public class YES24Jsoup {
   public void yes24DataCollection()
   {
	   YES24DAO dao=YES24DAO.newInstance();
	  try
	  {
	   String[] categories={"001","002","003","004","005","006","007"};
	   for(int i=0;i<categories.length;i++)
	   {
		   int r=1;
		   String url="";
		  for(int p=1;p<=2;p++)
		  {
		     if(i==0)
		     {
			    url="https://www.yes24.com/product/category/daybestseller?CategoryNumber="+p;
		     }
		     else
		     {
		    	 url="https://www.yes24.com/product/category/daybestseller?CategoryNumber="+categories[i]+"&PageNumber="+p;
		     }
		     
		     Document doc = Jsoup.connect(url).get();
             // 도서명
             Elements title = doc.select("div.info_row.info_name a.gd_name"); 
             // 저자
             Elements authors = doc.select("span.authPub.info_auth a"); 
             // 출판사
             Elements publishers = doc.select("span.authPub.info_pub a"); 
             // 이미지
             Elements images = doc.select("em.img_bdr img"); 
             // 가격
             Elements prices = doc.select("div.info_row.info_price em.yes_b"); 
		     
		     /*
		      *   HTML => 데이터 출력 
		      *   -----------------
		      *   <a>aaa</a> => text()
		      *   <img src="aaa"> => attr("src")
		      *   <a href="">
		      */
             // 순위, 상태, 변동폭는 페이지 구조상 없으면 기본값
             for (int j = 0; j < title.size(); j++) {
                 try {
                     YES24VO vo = new YES24VO();
                     vo.setCno(Integer.parseInt(categories[i]));
                     vo.setRank(r++);
                     vo.setTitle(title.get(j).text().trim());
                     vo.setAuthor(authors.size() > j ? authors.get(j).text().trim() : "");
                     vo.setPublisher(publishers.size() > j ? publishers.get(j).text().trim() : "");
                     vo.setImage(images.size() > j ? images.get(j).attr("src") : "");
                     vo.setPrice(prices.size() > j ? prices.get(j).text().trim() : "");

                     // 상태/등폭 기본값 (Yes24에는 별도 제공 안 함)
                     vo.setState("유지");
                     vo.setIdcrement(0);

                     dao.YES24Insert(vo);

                 } catch (Exception ex) {
                     ex.printStackTrace();
                 }
             }
         }
     }
     System.out.println("데이터 수집 완료!!");
 } catch (Exception ex) {
     ex.printStackTrace();
 }
}

	public static void main(String[] args) {
	 YES24Jsoup jsoup = new YES24Jsoup();
	 jsoup.yes24DataCollection();
		}
	}