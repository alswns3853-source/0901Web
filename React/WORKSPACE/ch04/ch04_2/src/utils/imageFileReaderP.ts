export const imageFileReaderP = (file: Blob) =>
  // 파일 데이터를 읽고 Promise형식으로 돌려주는 함수
  new Promise<string>((resolve, reject) => {
    // 파일 데이터를 조작하는 객체 FileReader생성
    const fileReader = new FileReader();
    // fileReader.onload(파일데이터) = (매개변수) => {onload가 끝난 후 실행하는 함수} ;
    fileReader.onload = (e: ProgressEvent<FileReader>) => {
      const result = e.target?.result;

      if (result && typeof result === "string") resolve(result);
      else reject(new Error(`imageFileReaderP: can't read image file`));
    };
    // fileReader에서 Base64 문자열로 변환
    fileReader.readAsDataURL(file);
  });
