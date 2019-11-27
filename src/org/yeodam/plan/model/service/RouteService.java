package org.yeodam.plan.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.yeodam.plan.model.vo.MakeRoute;
import org.yeodam.plan.model.vo.Node;
import org.yeodam.plan.model.vo.Pair;
import org.yeodam.plan.model.vo.Route;
import org.yeodam.common.JDBCTemplate;
import org.yeodam.plan.model.dao.RouteDao;

public class RouteService {

	public int insertRoute(String memberId, String plan) {
		int result = 0;
		Connection conn = JDBCTemplate.getConnection();
		JsonParser parser = new JsonParser();
		JsonArray resultInfo = (JsonArray) parser.parse(plan.toString());
		RouteDao dao = new RouteDao();

		System.out.println("resultInfo : " + resultInfo.toString());

		// 계획 번호를 먼저 알아내야함.
		int max = dao.checkPlanNo(conn);
		System.out.println(max);
		int planNo = max + 1;

		for (int i = 0; i < resultInfo.size(); i++) {
			JsonArray resultInfo2 = resultInfo.get(i).getAsJsonArray();
			int routeNo = i + 1;
			System.out.println("resultInfo2 : " + resultInfo2);
			for (int j = 0; j < resultInfo2.size(); j++) {
				JsonObject resultInfo3 = resultInfo2.get(j).getAsJsonObject();
				System.out.println("resultInfo3 : " + resultInfo3);
				String planTitle = resultInfo3.get("title").getAsString(); // 계획 이름 일단은 TITLE로 해놓고 나중에 변경
				int tourNo = j + 1;
				String routeAddr = resultInfo3.get("addr").getAsString();
				String routeName = resultInfo3.get("title").getAsString();

				SimpleDateFormat beforFormat = new SimpleDateFormat("yyyymmdd");
				SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
				java.util.Date tempDate = null;
				System.out.println("dd : " + resultInfo3.get("date").getAsString());
				System.out.println("dd2 : " + resultInfo3.get("date").toString());
				System.out.println("dd3 : " + resultInfo3.get("date"));

				java.sql.Date then2;
				try {
					then2 = new java.sql.Date(afterFormat.parse(resultInfo3.get("date").getAsString()).getTime());
					System.out.println("then2 : " + then2);
					Date routeDate = then2;

					double routeMapx = resultInfo3.get("mapx").getAsDouble();
					double routeMapy = resultInfo3.get("mapy").getAsDouble();
					String routeImg = resultInfo3.get("image").getAsString();
					System.out.println("routeDate : " + routeDate);

					Route route = new Route(planNo, planTitle, routeNo, tourNo, routeAddr, routeName, routeDate,
							routeMapx, routeMapy, null, null, routeImg, memberId);

					result = dao.insertRoute(conn, route);

					if (result == 0) {
						System.out.println("insertRoute-dao error 발생 확인 바람");
					}
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				/*
				 * System.out.println("before : " +resultInfo3.get("date").getAsString());
				 * System.out.println("tempDate : "+tempDate); String transDate =
				 * afterFormat.format(tempDate); System.out.println("transDate : " +transDate);
				 * Date d = Date.valueOf(transDate); Date routeDate = d;
				 */

			}
		}
		if (result > 0) {
			JDBCTemplate.commit(conn);
			JDBCTemplate.close(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;
	}
	
	
	
	

	public String[] check(String[] s, String a) {
		for (int i = 0; i < 11; i++) {
			if (s[i].equals(a)) {
				break;
			}
			if (s[i].equals(".")) {
				s[i] = a;
				break;
			}
		}
		return s;
	}
	
	  public int getParent(int parent[], int a) { if (parent[a] == a) { return a; }
	  return parent[a] = getParent(parent, parent[a]); }
	  
	  public void unionParent(int parent[], int a, int b) { a = getParent(parent,
	  a); b = getParent(parent, b); if (a < b) parent[b] = a; else parent[a] = b; }
	  
	  public boolean findParent(int parent[], int a, int b) { a = getParent(parent,
	  a); b = getParent(parent, b); if (a == b) return true; else return false; }

	public int maxx = 0;
	public int ans = 987654321;

	public boolean next_permutation(int[] a, int n) {
		int i = n - 1;
		while (i > 0 && a[i - 1] >= a[i])
			i -= 1;
		if (i <= 0)
			return false;
		int j = n - 1;
		while (a[j] <= a[i - 1])
			j -= 1;
		int temp = 0;
		temp = a[j];
		a[j] = a[i - 1];
		a[i - 1] = temp;
		j = n - 1;
		while (i < j) {
			int temp2 = 0;
			temp2 = a[i];
			a[i] = a[j];
			a[j] = temp2;
			i += 1;
			j -= 1;

		}
		return true;

	}


/*
	public String[] mstMain(JsonArray distanceArrJson, int size) {
		
		ArrayList<Node> nd = new ArrayList<>();
		String Sarr[] = new String[11];
		ArrayList<Pair> So[] = new ArrayList[10];
		
		for(int i =0; i<10; i++){
			 So[i]= new ArrayList<Pair>();
		}
		
		// int maxx = 0;
		for (int i = 0; i < 11; i++) {
			Sarr[i] = ".";
		}
		for (int i = 0; i < distanceArrJson.size(); i++) {
			String tour1 = distanceArrJson.get(i).getAsJsonArray().get(0).toString();
			String tour2 = distanceArrJson.get(i).getAsJsonArray().get(1).toString();
			int distance = Integer.parseInt(distanceArrJson.get(i).getAsJsonArray().get(2).toString());
			System.out.println("tour1 : " + tour1 + " tour2 : " + tour2 + " distance : " + distance);
			Sarr = check(Sarr, tour1);
			Sarr = check(Sarr, tour2);
			int idx1 = 0, idx2 = 0;
			for (int j = 0; j < 11; j++) {
				if (Sarr[j].equals(tour1)) {
					idx1 = j;
					break;
				}
			}
			for (int j = 0; j < 11; j++) {
				if (Sarr[j].equals(tour2)) {
					idx2 = j;
					break;
				}
			}
			if (maxx < idx1)
				maxx = idx1;
			if (maxx < idx2)
				maxx = idx2;
			// nd.add(new Node(idx1, idx2, distance));
			So[idx1].add(new Pair(idx2, distance));
			So[idx2].add(new Pair(idx1, distance));
		}
		
		int arr[] = new int[maxx + 1];
		for (int i = 0; i < maxx + 1; i++) {
			arr[i] = i;
		}
		
		int answer[] = new int[maxx + 1];
		int count = 0;

		
		do {
			int dist = 0;
			for (int i = 0; i < maxx; i++) {
				for (int j = 0; j < So[arr[i]].size(); j++) {
					if (So[arr[i]].get(j).getFirst() == arr[i + 1]) {
						dist += So[arr[i]].get(j).getSecond();
						break;
					}
				}
			}
			if (dist < ans) {
				ans = dist;
				answer = arr;
			}
			count++;
		}while(next_permutation(arr, maxx + 1));
		System.out.println("per_while : count : " + count);
		
		for(int q = 0; q < answer.length; q++) {
			System.out.println(q + " : " + Sarr[answer[q]]);
		}
		
		return Sarr;*/
		
		/*
		 * while (next_permutation(arr, maxx + 1)) { int dist = 0; for (int i = 0; i <
		 * maxx; i++) { for (int j = 0; j < So[arr[i]].size(); j++) { if
		 * (So[arr[i]].get(j).getFirst() == arr[i + 1]) { dist +=
		 * So[arr[i]].get(j).getFirst(); break; } } } if (dist > ans) { ans = dist;
		 * answer = arr; } count++; }
		 */
		
		
		/*
		 * ///mst 알고리즘 ArrayList<Node> nd = new ArrayList<>(); String Sarr[] = new
		 * String[11]; int maxx = 0; for (int i = 0; i < 11; i++) { Sarr[i] = "."; } for
		 * (int i = 0; i < distanceArrJson.size(); i++) { String tour1 =
		 * distanceArrJson.get(i).getAsJsonArray().get(0).toString(); String tour2 =
		 * distanceArrJson.get(i).getAsJsonArray().get(1).toString(); int distance =
		 * Integer.parseInt(distanceArrJson.get(i).getAsJsonArray().get(2).toString());
		 * System.out.println("tour1 : " + tour1 + " tour2 : " + tour2 + " distance : "
		 * + distance);
		 * 
		 * Sarr = check(Sarr, tour1); Sarr = check(Sarr, tour2); for(int j = 0; j < 11;
		 * j++) { System.out.println(Sarr[i]); } int idx1 = 0, idx2 = 0; for (int j = 0;
		 * j < 11; j++) { if (Sarr[j].equals(tour1)) { idx1 = j; break; } } for (int j =
		 * 0; j < 11; j++) { if (Sarr[j].equals(tour2)) { idx2 = j; break; } } if (maxx
		 * < idx1) maxx = idx1; if (maxx < idx2) maxx = idx2; nd.add(new Node(idx1,
		 * idx2, distance)); }
		 * 
		 * int parent[] = new int[11]; for (int i = 0; i < 11; i++) { parent[i] = i; }
		 * 
		 * Collections.sort(nd); ArrayList<MakeRoute> So = new ArrayList<>(); for (int i
		 * = 0; i < nd.size(); i++) { if (!findParent(parent, nd.get(i).getNode(),
		 * nd.get(i).getNode2())) { So.add(new MakeRoute(Sarr[nd.get(i).getNode()],
		 * Sarr[nd.get(i).getNode2()])); unionParent(parent, nd.get(i).getNode(),
		 * nd.get(i).getNode2()); } }
		 * 
		 * System.out.println("ND : "+nd.get(0).getNode());
		 * System.out.println("ND : "+nd.get(1).getNode());
		 * System.out.println("So : "+So.get(0));
		 * System.out.println("So 0번째 node0 : "+So.get(0).getNode0());
		 * System.out.println("So 0번째 node1 : "+So.get(0).getNode1());
		 * System.out.println("So 1번째 node0 : "+So.get(1).getNode0());
		 * System.out.println("So 1번째 node1 : "+So.get(1).getNode1());
		 * 
		 * String[] routeResult = new String[size]; //시작 여행지 저장
		 * 
		 * routeResult[0] = So.get(0).getNode0(); routeResult[1] = So.get(0).getNode1();
		 * for(int k = 1 ; k < So.size(); k++) { routeResult[k+1] =
		 * So.get(k).getNode1(); }
		 * 
		 * for(int i = 0 ; i < routeResult.length-1; i++) {
		 * System.out.println("--So 순회--"); System.out.println(So.get(i).getNode0());
		 * System.out.println(So.get(i).getNode1()); System.out.println(routeResult[i]);
		 * }
		 * 
		 * 
		 * String map[][] = new String[So.size()][2]; for(int i = 0; i < So.size(); i++)
		 * { map[i][0] = So.get(i).getNode0(); map[i][1] = So.get(i).getNode1(); }
		 * 
		 * System.out.println("map[0][0] : "+map[0][0]);
		 * System.out.println("map[0][1] : "+map[0][1]);
		 * System.out.println("map[1][0] : "+map[1][0]);
		 * System.out.println("map[1][1] : "+map[1][1]);
		 * System.out.println("map[2][0] : "+map[2][0]);
		 * System.out.println("map[2][1] : "+map[2][1]);
		 * System.out.println("map[3][0] : "+map[3][0]);
		 * System.out.println("map[3][1] : "+map[3][1]);
		 * 
		 * 
		 * 
		 * return routeResult;
		 */
		public String[] mstMain(JsonArray distanceArrJson, int size) {
			ArrayList<Node> nd = new ArrayList<>();
		      String Sarr[] = new String[11];
		      ArrayList<Pair> So[] = new ArrayList[10];
		      
		      for(int i =0; i<10; i++){
		          So[i]= new ArrayList<Pair>();
		      }
		      
		      // int maxx = 0;
		      for (int i = 0; i < 11; i++) {
		         Sarr[i] = ".";
		      }
		      for (int i = 0; i < distanceArrJson.size(); i++) {
		         String tour1 = distanceArrJson.get(i).getAsJsonArray().get(0).toString();
		         String tour2 = distanceArrJson.get(i).getAsJsonArray().get(1).toString();
		         int distance = Integer.parseInt(distanceArrJson.get(i).getAsJsonArray().get(2).toString());
		         System.out.println("tour1 : " + tour1 + " tour2 : " + tour2 + " distance : " + distance);
		         Sarr = check(Sarr, tour1);
		         Sarr = check(Sarr, tour2);
		         int idx1 = 0, idx2 = 0;
		         for (int j = 0; j < 11; j++) {
		            if (Sarr[j].equals(tour1)) {
		               idx1 = j;
		               break;
		            }
		         }
		         for (int j = 0; j < 11; j++) {
		            if (Sarr[j].equals(tour2)) {
		               idx2 = j;
		               break;
		            }
		         }
		         if (maxx < idx1)
		            maxx = idx1;
		         if (maxx < idx2)
		            maxx = idx2;
		         // nd.add(new Node(idx1, idx2, distance));
		         So[idx1].add(new Pair(idx2, distance));
		         So[idx2].add(new Pair(idx1, distance));
		      }
		      
		      int arr[] = new int[maxx + 1];
		      for (int i = 0; i < maxx + 1; i++) {
		         arr[i] = i;
		      }
		      
		      int answer[] = new int[maxx + 1];
		      int count = 0;

		      
		      do {
		         int dist = 0;
		         for (int i = 0; i < maxx; i++) {
		            for (int j = 0; j < So[arr[i]].size(); j++) {
		               if (So[arr[i]].get(j).getFirst() == arr[i + 1]) {
		                  dist += So[arr[i]].get(j).getSecond();
		                  //System.out.println(So[arr[i]].get(j).getSecond());
		                  break;
		               }
		            }
		         }
		         if (dist < ans) {
		            ans = dist;
		            for(int i = 0; i <= maxx; i++) {
		               answer[i] = arr[i];
		            }
		            //System.out.println(dist);
		            /*for(int i = 0; i <= maxx; i++) {
		               System.out.print(answer[i]+ " ");
		            }*/
		            //System.out.println();
		         }
		         //System.out.println(dist);
		         count++;
		      }while(next_permutation(arr, maxx + 1));
		      System.out.println("per_while : count : " + count);
		      String re[] = new String[maxx+1];
		      for(int q = 0; q < answer.length; q++) {
		         System.out.println(q + " : " + Sarr[answer[q]]);
		         re[q] = Sarr[answer[q]];
		      }
		      for(int q = 0; q < answer.length; q++) {
		    	  System.out.println(q + " : " + re[q]);
		      }
		      return re;
		      
		}
	}
