package org.yeodam.plan.model.vo;

public class MakeRoute {
   private String node0;
   private String node1;
   public MakeRoute() {
      super();
      // TODO Auto-generated constructor stub
   }
   public MakeRoute(String node0, String node1) {
      super();
      this.node0 = node0;
      this.node1 = node1;
   }
   
	public String getNode0() {
		return node0;
	}
	public void setNode0(String node0) {
		this.node0 = node0;
	}
	public String getNode1() {
		return node1;
	}
	public void setNode1(String node1) {
		this.node1 = node1;
	}
}