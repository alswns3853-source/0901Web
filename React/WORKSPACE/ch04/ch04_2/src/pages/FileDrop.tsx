import {
  useCallback,
  useMemo,
  useRef,
  useState,
  type ChangeEvent,
  type DragEvent,
} from "react";
import { useToggle } from "../hooks/useToggle";
import { imageFileReaderP } from "../data";
import { Div, Title } from "../components";
import { Button } from "../theme/daisyui";

export default function FileDrop() {
  const [imageUrls, setImageUrls] = useState<string[]>([]);
  const [error, setError] = useState<Error | null>(null);
  const [loading, toggleLoding] = useToggle(false);

  const inputRef = useRef<HTMLInputElement>(null);
  // div영역 클릭시 inputRef가 클릭되도록 설정하는 함수
  const onDivClick = useCallback(() => inputRef.current?.click(), []);
  // 파일을 읽어서 imageUrl에 이미지 주소를 저장
  const makeImageUrls = useCallback(
    (files: File[]) => {
      // map을 이용하여 여러개의 파일 주소를 저장
      const promises = Array.from(files).map(imageFileReaderP);
      toggleLoding();
      Promise.all(promises)
        .then((urls) => setImageUrls((imageUrls) => [...urls, ...imageUrls]))
        .catch(setError)
        .finally(toggleLoding);
    },
    [toggleLoding],
  );
  // inputRef에 파일이 설정되었을때 실행
  const onInputChange = useCallback(
    (e: ChangeEvent<HTMLInputElement>) => {
      setError(null);
      const files = e.target.files;
      files && makeImageUrls(Array.from(files));
    },
    [makeImageUrls],
  );
  // onDragOver기능 비활성화
  const onDivDragOver = useCallback((e: DragEvent) => e.preventDefault(), []);
  // div영역에 drop이벤트 실행
  const onDivDrop = useCallback(
    (e: DragEvent) => {
      e.preventDefault();
      setError(null);
      // DragEvent의 경우 파일을 꺼낼때 dataTransfer를 사용해야함
      const files = e.dataTransfer?.files;
      files && makeImageUrls(Array.from(files));
    },
    [makeImageUrls],
  );

  const images = useMemo(
    () =>
      imageUrls.map((url, index) => (
        <Div
          key={index}
          src={url}
          className="m-2 bg-transparent bg-center bg-no-repeat bg-contain"
          width="5rem"
          height="5rem"
        />
      )),
    [imageUrls],
  );

  return (
    <section className="mt-4">
      <Title>FileDrop</Title>
      {error && (
        <div className="p-4 mt-4 bg-red-200">
          <p className="text-3xl text-red-500 text-bold">{error.message}</p>
        </div>
      )}

      <div
        onClick={onDivClick}
        className="w-full mt-4 bg-gray-200 border border-gray-500"
      >
        {loading && (
          <div className="flex items-center justify-center">
            <Button className="btn-circle loading"></Button>
          </div>
        )}
        <div
          onDragOver={onDivDragOver}
          onDrop={onDivDrop}
          className="flex flex-col items-center justify-center h-40 cursor-pointer"
        >
          <p className="text-3xl font-bold">drop images or click me</p>
        </div>
        <input
          ref={inputRef}
          onChange={onInputChange}
          multiple
          className="hidden"
          type="file"
          accept="image/*"
        />
      </div>
      <div className="flex flex-wrap justify-center">{images}</div>
    </section>
  );
}
