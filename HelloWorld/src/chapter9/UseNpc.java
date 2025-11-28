package chapter9;

public class UseNpc {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		클래스명 인스턴스명 = new 생성자(); 
//		=> 객체를 생성한다. 혹은 인스턴스화 한다.
        Npc npc1 = new Npc();
//      맴버 변수에 name에 경비를 저장
        npc1.name = "경비";
//      맴버 변수 hp에 100을 저장
        npc1.hp = 100;
//        접근제한자를 private으로 설정하면 다른 클래스에서 사용할 수 없음
//        npc1.privateData = "이순신"; 
        System.out.println(npc1.name+":"+npc1.hp);
        npc1.say();
        
        Npc npc2 = new Npc();
        npc2.name = "요리사";
        npc2.hp = 90;
        System.out.println(npc2.name+":"+npc2.hp);
        npc2.say();
        
        Npc npc3 = new Npc("상점주인",80);
        System.out.println(npc3.name+":"+npc3.hp);
        npc3.say();
   }

}
