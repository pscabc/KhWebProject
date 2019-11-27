package org.yeodam.plan.model.vo;

public class Node implements Comparable<Node>{
   private int node[] = new int[2];
   private int Distance;

   public Node() {
      super();
      // TODO Auto-generated constructor stub
   }
   public Node(int node1, int node2, int distance) {
      super();
      this.node[0] = node1;
      this.node[1] = node2;
      Distance = distance;
   }

   public int getNode() {
      return node[0];
   }
   public int getNode2() {
      return node[1];
   }

   public void setNode(int[] node) {
      this.node = node;
   }

   public int getDistance() {
      return Distance;
   }

   public void setDistance(int distance) {
      Distance = distance;
   }

   @Override
   public int compareTo(Node arg0) {
      // TODO Auto-generated method stub
      if(this.Distance > arg0.getDistance())
         return 1;
      else return -1;
   }
}
