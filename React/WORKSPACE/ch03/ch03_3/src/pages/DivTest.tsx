import { Div, Icon, Subtitle, Title } from "../components";
export default function DivTest() {
  return (
    <section className="mt-4">
      <Title>DivTest</Title>
      {/* 테이윈드로 세로크기 설정 */}
      <div className="h-24 text-center text-blue-100 bg-blue-600">
        <Icon name="home" className="text-3xl" />
        <Subtitle>Home</Subtitle>
      </div>
      {/* 스타일로 크기 설정 */}
      <div
        className="text-center text-blue-100 bg-blue-600 "
        style={{ height: "6rem" }}
      >
        <Icon name="home" className="text-3xl" />
        <Subtitle>Home</Subtitle>
      </div>
      {/* Div컴포넌트로 크기 설정 : 크기가 자주 변경되는 컴포넌트의 경우 사용 */}
      <Div className="text-center text-blue-100 bg-blue-600" height="6rem">
        <Icon name="home" className="text-3xl" />
        <Subtitle>Home</Subtitle>
      </Div>
    </section>
  );
}
