import { useCallback, useState } from "react";
import type { FormEvent, ChangeEvent } from "react";
import { Title } from "../components";
import { Input } from "../theme/daisyui";

type FormType = {
  name: string;
  email: string;
};

export default function ObjectState() {
  const [form, setForm] = useState<FormType>({ name: "", email: "" });
  const onSubmit = useCallback(
    (e: FormEvent<HTMLFormElement>) => {
      e.preventDefault(); // form태그 본래의 기능을 실행하지 않도록 변경
      // 서버로 전송할 폼 데이터 생성
      const formData = new FormData();
      formData.append("name", form.name); // state데이터 저장
      formData.append("email", form.email);
      // 데이터를 JSON 형식으로 변경(서버에서 JSON데이터를 읽기 때문)
      alert(JSON.stringify(form, null, 2));
    },
    [form],
  );
  const onChangeName = useCallback((e: ChangeEvent<HTMLInputElement>) => {
    // setForm((원본state)=>({name:값,email:값, name:변경할값}));
    setForm((state) => ({ ...state, name: e.target.value }));
  }, []);
  const onChangeEmail = useCallback((e: ChangeEvent<HTMLInputElement>) => {
    setForm((state) => ({ ...state, email: e.target.value }));
  }, []);
  return (
    <section className="mt-4">
      <Title>ObjectState</Title>
      <div className="flex justify-center mt-4">
        {/* form태그 실행 코드 */}
        <form onSubmit={onSubmit}>
          <div className="form-control">
            <label className="label" htmlFor="name">
              <span className="label-text">Username</span>
            </label>
            <Input
              value={form.name}
              onChange={onChangeName}
              id="name"
              type="text"
              placeholder="enter your name"
              className="input-primary"
            />
          </div>
          <div className="form-control">
            <label className="label" htmlFor="email">
              <span className="label-text">email</span>
            </label>
            <Input
              value={form.email}
              onChange={onChangeEmail}
              id="email"
              type="email"
              placeholder="enter your email"
              className="input-primary"
            />
          </div>
          <div className="flex justify-center mt-4">
            <input
              type="submit"
              value="SUBMIT"
              className="w-1/2 btn btn-sm btn-primary"
            />
            <input
              type="button"
              defaultValue="CANCEL"
              className="w-1/2 ml-4 btn btn-sm"
            />
          </div>
        </form>
      </div>
    </section>
  );
}
