const deleteButton = document.getElementById('delete-btn');
if(deleteButton){
    deleteButton.addEventListener('click', event=>{
        let id = document.getElementById('article-id').value;
        // fetch(`주소`, { 데이터전송에 필요한 설정들 })
        fetch(`/api/articles/${id}`,{
            method:'DELETE'
        })
            //fetch가 성공했을 때 실행되는 부분
            .then(()=>{
                alert('삭제가 완료되었습니다.');
                // 목록 페이지 이동
                location.replace("/articles");
            })
            // fetch가 실패했을때 실행
            .catch(()=>{
                alert("삭제에 실패했습니다.");
            })
    })
}
// fetch : catch 실행시 then에서 직접 처리를 해야함, json데이터 사용시 수동 변환이 필요
// axios : 에러 발생시 자동으로 catch 실행, json데이터를 자동으로 변환
const axiosDeleteBtn = document.getElementById('axios-delete-btn');
if(axiosDeleteBtn){
    axiosDeleteBtn.addEventListener("click", event=>{
        let id = document.getElementById('article-id').value;
        axios.delete(`/api/articles/${id}`)
            .then(()=>{
                alert("삭제가 완료되었습니다.");
                location.replace("/articles");
            })
            .catch(error=>{
                console.log(error);
                alert("삭제에 실패했습니다.");
            })
    })
}
const axiosDeleteBtn2 = document.getElementById('axios-delete-btn2');
if(axiosDeleteBtn2){
    axiosDeleteBtn2.addEventListener("click", async(event)=>{
        try {
            let id = document.getElementById('article-id').value;
            const  response = await axios.delete(`/api/articles/${id}`);
            alert("삭제가 완료되었습니다.");
            location.replace("/articles");
        }catch(error){
            console.log(error);
            alert("삭제에 실패했습니다.");
        }
    })
}