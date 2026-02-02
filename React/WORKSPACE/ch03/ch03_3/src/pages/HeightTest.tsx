import { Div, Title } from "../components";
export default function HeightTest() {
  return (
    <section className="mt-4">
      <Title>HeightTest</Title>
      {/* 1rem은 16px를 의미  */}
      {/* h-1 : height=0.25rem으로 설정 */}
      <Div className="h-40 mt-4 text-center bg-blue-500">
        {/* h-1/2 : h-50% = 80px */}
        <Div className="bg-blue-500 h-1/2">
          <p className="text-center text-red-50">h-1/2</p>
        </Div>
        {/* h-20 : h-0.25*20 = 80px */}
        <Div className="h-20 bg-red-500">
          <p className="text-center text-red-50">h-20</p>
        </Div>
      </Div>
    </section>
  );
}
