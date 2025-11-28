package chapter21;

import java.util.TreeSet;

public class Ex08_TreeSet {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TreeSet<String> tree = new TreeSet<>();
//		중복 제거, 글자의 경우 사전순으로 오름차순 정렬임
		tree.add("홍길동");
		tree.add("전우치");
		tree.add("손오공");
		tree.add("멀린");
		tree.add("손오공");
		
		System.out.println("객체 수:" + tree.size());
		
		for(String t: tree) {
			System.out.println(t);
		}   
		TreeSet<Integer> numTree = new TreeSet<>();
//		중복 제거, 숫자는 크기순으로 오름차순 정렬임
		numTree.add(5);
		numTree.add(2);
		numTree.add(3);
		numTree.add(1);
		numTree.add(4);
		numTree.add(5);
		numTree.add(2);
		numTree.add(3);
		numTree.add(1);
		numTree.add(4);
		
		System.out.println("객체 수:" + numTree.size());
		
		for(int t: numTree) {
			System.out.println(t);
		}   
	}

}
