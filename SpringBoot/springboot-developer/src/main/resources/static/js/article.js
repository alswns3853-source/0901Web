const deleteButton = document.getElementById('delete-btn');
if (deleteButton) {
    deleteButton.addEventListener('click', event => {
        let id = document.getElementById('article-id').value;
        // fetch(`주소`, { 데이터전송에 필요한 설정들 })
        fetch(`/api/articles/${id}`, {
            method: 'DELETE'
        })
            //fetch가 성공했을 때 실행되는 부분
            .then(() => {
                alert('삭제가 완료되었습니다.');
                // 목록 페이지 이동
                location.replace("/articles");
            })
            // fetch가 실패했을때 실행
            .catch(() => {
                alert("삭제에 실패했습니다.");
            })
    })
}
// fetch : catch 실행시 then에서 직접 처리를 해야함, json데이터 사용시 수동 변환이 필요
// axios : 에러 발생시 자동으로 catch 실행, json데이터를 자동으려 변환
const axiosDeleteBtn = document.getElementById('axios-delete-btn');
if (axiosDeleteBtn) {
    axiosDeleteBtn.addEventListener("click", event => {
        let id = document.getElementById('article-id').value;
        axios.delete(`/api/articles/${id}`)
            .then(() => {
                alert("삭제가 완료되었습니다.");
                location.replace("/articles");
            })
            .catch(error => {
                console.log(error);
                alert("삭제에 실패했습니다.");
            })
    })
}
const axiosDeleteBtn2 = document.getElementById('axios-delete-btn2');
if (axiosDeleteBtn2) {
    axiosDeleteBtn2.addEventListener("click", async (event) => {
        try {
            let id = document.getElementById('article-id').value;
            const response = await axios.delete(`/api/articles/${id}`);
            alert("삭제가 완료되었습니다.");
            location.replace("/articles");
        } catch (error) {
            console.log(error);
            alert("삭제에 실패했습니다.");
        }
    })
}
const modifyButton = document.getElementById('modify-btn');
if (modifyButton) {
    modifyButton.addEventListener('click', event => {
        // 주소의 데이터를 함수로 사용할 수 있도록 하는 객체
        let params = new URLSearchParams(location.search);
        let id = params.get('id');
        fetch(`/api/articles/${id}`, {
            method: 'PUT',
            headers: {
                // 데이터를 전송할시 반드시 설정
                "Content-Type": "application/json",
            },
            // JSON.stringify, key:value로 이루어진 데이터를 JSON형식으로 변경하여 body에 저장
            body: JSON.stringify({
                title: document.getElementById('title').value,
                content: document.getElementById('content').value
            })
        }).then(() => {
            alert('수정이 완료되었습니다.');
            // 정상 실행시 상세보기 화면으로 이동
            location.replace(`/articles/${id}`);
        })
    })
}
const modifyButton2 = document.getElementById('modify-btn2');
if (modifyButton2) {
    modifyButton2.addEventListener('click', async (event) => {
        let params = new URLSearchParams(location.search);
        let id = params.get('id');
        try {
            // axios는 기본 설정이 json통신이기 때문에
            // Content-Type, JSON.stringify 생략 가능
            await axios.put(`/api/articles/${id}`, {
                title: document.getElementById('title').value,
                content: document.getElementById('content').value
            })
            alert('수정이 완료되었습니다.');
            location.replace(`/articles/${id}`);
        } catch (error) {
        }
    })
}
const createButton = document.getElementById('create-btn');
if (createButton) {
    createButton.addEventListener('click', event => {
        fetch(`/api/articles`, {
            method: 'POST',
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                title: document.getElementById('title').value,
                content: document.getElementById('content').value,
                files: document.getElementById('files').value
            })
        }).then(() => {
            alert('등록이 완료되었습니다.');
            location.replace(`/articles`);
        })
    })
}
const createButton2 = document.getElementById('create-btn2');
if (createButton2) {
    createButton2.addEventListener('click', async (event) => {
        try {
            await axios.post(`/api/articles`, {
                title: document.getElementById('title').value,
                content: document.getElementById('content').value
            })
            alert('등록이 완료되었습니다.');
            location.replace(`/articles`);
        } catch (error) {
        }
    })
}
// 파일과 함께 업로드
const createButton3 = document.getElementById('create-btn3');
if (createButton3) {
    createButton3.addEventListener('click', event => {
        // 파일 데이터를 전송하기 위한 FormData객체 생성
        const formData = new FormData();
        // FormData에 title, content 데이터 저장
        formData.append("title", document.getElementById('title').value);
        formData.append("content", document.getElementById('content').value);
        // 파일 데이터의 경우 list형식임으로 반복문으로 데이터를 꺼내어 저장
        const fileInput = document.getElementById('files');
        if (fileInput.files.length > 0) {
            for (let i = 0; i < fileInput.files.length; i++) {
                formData.append('files', fileInput.files[i]);
            }
        }
        fetch(`/api/articles`, {
            method: 'POST',
            body: formData
        }).then(() => {
            alert('등록이 완료되었습니다.');
            location.replace(`/articles`);
        })
    })
}
if (modifyButton2) {

}

const modifyButton3 = document.getElementById('modify-btn3');
if (modifyButton3) {
    let params = new URLSearchParams(location.search);
    let id = params.get('id');
    modifyButton3.addEventListener('click', async(event)=>{
        // 파일 데이터를 전송하기 위한 FormData객체 생성
        let formData = new FormData();
        // FormData에 title, content 데이터 저장
        formData.append("title", document.getElementById('title').value);
        formData.append("content", document.getElementById('content').value);
        // 파일 데이터의 경우 list형식임으로 반복문으로 데이터를 꺼내어 저장
        let fileInput = document.getElementById('files');
        if(fileInput.files.length > 0){
            for(let i=0; i<fileInput.files.length; i++){
                formData.append('files', fileInput.files[i]);
            }
        }
        try{
            await axios.put(`/api/articles/${id}`, formData);
            alert('수정이 완료되었습니다.');
            location.href=`/articles/${id}`; // 상세보기 화면으로 이동
        }catch (error){
            console.log(error);
        }
    })
    document.querySelectorAll(".img-fluid").forEach(img=> {
        img.addEventListener('click'
        , async (event) => {
            event.preventDefault();
            event.stopPropagation();
            if (confirm('이미지를 삭제하시겠습니까? 되돌릴 수 없습니다.')) {
                try {
                    await axios.delete(`/api/img/${id}`, {
                        data: {uuid: event.target.dataset.src}
                    })
                    event.target.remove();
                } catch (error) {
                    console.log(error);
                }
            }
        })
    })
}




