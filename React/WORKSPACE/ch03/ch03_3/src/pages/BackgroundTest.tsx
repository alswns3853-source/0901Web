import { Div, Title, Subtitle } from "../components";
import * as D from "../data";

const src = D.randomImage(1200, 400);
export default function BackgroundImageTest() {
  return (
    <section className="mt-4">
      <Title>BackgroundImageTest</Title>
      {/* Div 컴포넌트에서 src를 background-image로 설정 */}
      <Div
        className="py-40 mt-4 bg-gray-300 bg-no-repeat bg-cover h-80"
        width="1200"
        height="400"
        src={src}
      >
        <Subtitle className="text-gray-500">Some Text here</Subtitle>
      </Div>
    </section>
  );
}
