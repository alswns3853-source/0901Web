import { useCallback, useState, type ChangeEvent, type FormEvent } from "react";
import { Title } from "../components";
import { Input } from "../theme/daisyui";

export default function BasicForm() {
  const [name, setName] = useState<string>("");
  const [email, setEmail] = useState<string>("");
  const [array, setArray] = useState([]);

  const onSubmit = useCallback(
    (e: FormEvent<HTMLFormElement>) => {
      e.preventDefault(); // form태그 본래의 기능을 실행하지 않도록 변경
      // 서버로 전송할 폼 데이터 생성
      const formData = new FormData();
      formData.append("name", name); // state데이터 저장
      formData.append("email", email);
      // 데이터를 JSON 형식으로 변경(서버에서 JSON데이터를 읽기 때문)
      alert(JSON.stringify(Object.fromEntries(formData), null, 2));
    },
    [name, email],
  );

  const onChangeName = useCallback((e: ChangeEvent<HTMLInputElement>) => {
    setName((notUsed) => e.target.value);
    // state의 경우 변경하려면 새로운 변수로 생성
    const array2 = array; // 얕은 복사 : 메모리주소만 저장
    array2[1] = 10; // 배열안의 내용을 변경
    setArray(array2); // state 변경 안됨
    // set기능 실행시 다름을 판단하는 기준이 메모리주소이기 때문에 변경불가
    const array3 = [...array]; // 깊은 복사 : 안의 데이터를 새로운 배열에 저장
    array3[1] = 20;
    setArray(array3); // state 변경됨
    // 깊은 복사는 새로운 배열을 생성하기 때문에 메모리 주소가 다름
  }, []);
  const onChangeEmail = useCallback((e: ChangeEvent<HTMLInputElement>) => {
    setEmail((notUsed) => e.target.value);
  }, []);
  return (
    <section className="mt-4">
      <Title>BasicForm</Title>
      <div className="flex justify-center mt-4">
        {/* form태그 실행 코드 */}
        <form onSubmit={onSubmit}>
          <div className="form-control">
            <label className="label" htmlFor="name">
              <span className="label-text">Username</span>
            </label>
            <Input
              value={name}
              onChange={onChangeName}
              id="name"
              type="text"
              placeholder="enter your email"
              className="input-primary"
            />
          </div>
          <div className="form-control">
            <label className="label" htmlFor="email">
              <span className="label-text">email</span>
            </label>
            <Input
              value={email}
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
