package chapter17;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Random;

class Person implements Comparable {
	private String name;
	private int age;

	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	@Override
	public int compareTo(Object o) {
//		Object인 name이나 age를 사용하기 위한 캐스팅
		Person p = (Person) o;
//		이름을 사전순으로 정렬 오름차순 정렬
//		int num = this.name.compareTo(p.name);
//		이름을 사전순으로 정렬 내림차순 정렬
//		int num = p.name.compareTo(this.name);
//		return num;
//		나이순 정렬 오름차순
//		if (this.age > p.age) {
//			return 1;
//		} else if (this.age < p.age) {
//			return -1;
//		} else {
//			return 0;
//		}
//	나이순 내림차순 정렬
	if (p.age > this.age) {
		return 1;
	} else if (p.age < this.age) {
		return -1;
	} else {
		return 0;
	}
 }
	@Override
	public String toString() {
		return name + ":" + age;
	}

}

public class Ex17_ArraysObjSort {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Integer[] intArr = new Integer[10];
		Random random = new Random(1);
		for (int i = 0; i < intArr.length; i++) {
			intArr[i] = random.nextInt(100);
		}
		System.out.println(Arrays.toString(intArr));
		Arrays.sort(intArr); // 오름차순 정렬
		System.out.println(Arrays.toString(intArr));
		// 내림차순, 래퍼클래스로된 자료형만 실행 가능
		Arrays.sort(intArr, Collections.reverseOrder());
		System.out.println(Arrays.toString(intArr));

		// 문자열 정렬하기
		String[] strArr = { "kiwi", "apple", "melon", "banana" };
		System.out.println(Arrays.toString(strArr));
		Arrays.sort(strArr); // 사전순으로 오름차순
		System.out.println(Arrays.toString(strArr));
		Arrays.sort(strArr, Collections.reverseOrder()); // 사전순 내림차순
		System.out.println(Arrays.toString(strArr));
		// 글자 수 순으로 정렬하기
		String[] strArr2 = { "a", "ab", "abcde", "abcd", "ab" };
		System.out.println(Arrays.toString(strArr2));
//		글자 수가 작은수에서 큰수로 오름차순 정렬
		Arrays.sort(strArr2, Comparator.comparingInt(String::length));
		System.out.println(Arrays.toString(strArr2));
//		글자 수가 큰수에서 작은수로 내림차순 정렬
		Arrays.sort(strArr2, Comparator.comparingInt(String::length).reversed());
		System.out.println(Arrays.toString(strArr2));

		Person[] arr = new Person[3];
		arr[0] = new Person("홍길동", 29);
		arr[1] = new Person("전우치", 15);
		arr[2] = new Person("손오공", 37);
		Arrays.sort(arr);
		for (Person p : arr) {
			System.out.println(p);
		}
	}

}
