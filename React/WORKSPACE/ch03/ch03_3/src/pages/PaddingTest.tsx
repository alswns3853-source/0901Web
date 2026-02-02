import { Title } from "../components";
import * as D from "../data";

const sentence = D.randomSentence(10);
export default function PaddingTest() {
  return (
    <section className="mt-4">
      <Title>PaddingTest</Title>
      <div className="p-8">
        <div className="text-white bg-sky-600">
          <p>{sentence}</p>
        </div>
        {/* p-숫자 : 전체 설정 */}
        {/* px-숫자 : 가로세로 설정 */}
        {/* py-숫자 : 위아래 설정 */}
        {/* pt-숫자 : 위 설정 */}
        {/* pb-숫자 : 아래 설정 */}
        {/* pl-숫자 : 왼쪽 설정 */}
        {/* pr-숫자 : 오른쪽 설정 */}
        <div className="px-20 text-white bg-orange-600">
          <p>{sentence}</p>
        </div>
      </div>
    </section>
  );
}
