import { useCallback, useEffect, useState } from "react";
import * as D from "../data";
import { useToggle } from "../hooks/useToggle";
import { Avatar, Icon, Title } from "../components";
import { Button } from "../theme/daisyui";

export default function FetchTest() {
  // 페이지가 로딩되어있는지 확인하는 state
  const [loading, toggleLoading] = useToggle();
  // 출력할 유저 state
  const [randomUser, setRandomUser] = useState<D.IRandomUser | null>(null);
  // error 발생시의 state
  const [error, setError] = useState<Error | null>(null);
  // 랜덤한 유저 데이터를 저장하는 함수
  const getRandomUser = useCallback(() => {
    toggleLoading(); //loading이 끝났기 때문에 true변경
    D.axiosRandomUser()
      .then(setRandomUser)
      .catch(setError)
      .finally(toggleLoading);
  }, []);
  // 제일 처음 컴포넌트 생성시 랜덤 유저 생성 함수를 실행
  useEffect(getRandomUser, [getRandomUser]);
  return (
    <section className="mt-4">
      <Title>FetchTest</Title>
      <div className="flex justify-center mt-4">
        <Button className="btn-sm btn-primary" onClick={getRandomUser}>
          <Icon name="get_app" />
          <span>get random user</span>
        </Button>
      </div>
      {loading && (
        <div className="flex items-center justify-center">
          <Button className="btn-circle loading"></Button>
        </div>
      )}
      {error && (
        <div className="p-4 mt-4 bg-red-200">
          <p className="text-3xl text-red-500 text-bold">{error.message}</p>
        </div>
      )}
      {randomUser && (
        <div className="flex justify-center p-4 mt-4">
          <Avatar src={randomUser.picture.large} />
          <div className="ml-4">
            <p className="text-xl text-bold">
              {randomUser.name.title}&nbsp;
              {randomUser.name.first}&nbsp;
              {randomUser.name.last}
            </p>
            <p className="italic text-gray-600">{randomUser?.email}</p>
          </div>
        </div>
      )}
    </section>
  );
}
