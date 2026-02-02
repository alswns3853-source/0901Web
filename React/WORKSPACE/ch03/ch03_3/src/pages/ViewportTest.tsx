import { Title } from "../components";
export default function ViewportTest() {
  return (
    // w-screen, h-screen : width 100vw, height 100vh 설정
    // w-full, h-full : width 100%, height 100% 설정
    <section className="w-screen h-screen mt-4 bg-indigo-900">
      <Title className="text-white">ViewportTest</Title>
    </section>
  );
}
