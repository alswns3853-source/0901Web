import { Subtitle, Title } from "../components";
import { useWindowResize } from "../hooks/useWindowResize";

export default function WindowResizeTest() {
  // 커스텀 훅을 이용하여 가로세로 크기를 구할 수 있도록 설정
  const [width, height] = useWindowResize();

  return (
    <section className="mt-4">
      <Title>WindowResizeTest</Title>
      <Subtitle className="mt-4">
        width: {width}, height:{height}
      </Subtitle>
    </section>
  );
}
