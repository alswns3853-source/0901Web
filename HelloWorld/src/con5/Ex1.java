package con5;

class Song{
	// title필드
	String title;
	// 생성자
	Song(String title) {
		this.title = title;
	}
	// getitle()
	public String getTitle() {
		return title;
	}
}

public class Ex1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Song mySong = new Song("Nessum Dorma");
		Song yourSong = new Song("공주는 잠 못 이루고");
		System.out.println("내 노래는 " + mySong.getTitle());
		System.out.println("너 노래는 " + yourSong.getTitle());
		
	}

}
