function Book(){
    let bookName = "리액트로 웹앱 만들기 with 타입 스크립트";
    let page = 677;
    return (
        <div>
            <p>현재 배우고 있는 책은 {bookName} 입니다.</p>
            <p>총 페이지 수는 {page} 입니다.</p>
        </div>
    );
}
export default Book;