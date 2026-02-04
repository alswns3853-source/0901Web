import * as D from "../../data"
import { Avatar, Title } from "../../components";
import { useState } from "react";

export default function Test() {
  const headTexts = ["NO", "NAME", "JOB TITLE", "EMAIL ADDRESS"];
  const users = D.makeArray(100).map(D.makeRandomUser);
  const head = headTexts.map((text) => <th key={text}>{text}</th>);
  const body = users.map((user, index) => (
    <tr key={user.uuid}>
      <th>{index + 1}</th>
      <td className="flex items-center">
        <Avatar src={user.avatar} size="1.5rem" />
        <p className="ml-2">{user.name}</p>
      </td>
      <td>{user.jobTitle}</td>
      <td>{user.email}</td>
    </tr>
  ));
  const [count, setCount] = useState(0);
  const handlePlus = () => {
    setCount(count + 1);
  };
  return (
    <div className="mt-4">
      <Title>test</Title>
      <p>
        {count}
        <button className="btn btn-primary" onClick={handlePlus}>
          더하기
        </button>
      </p>
      <div className="p-4 mt-4 overflow-x-auto">
        <table className="table w-full table-zebra table-compact">
          <thead>
            <tr>{head}</tr>
          </thead>
          <tbody>{body}</tbody>
        </table>
      </div>
    </div>
  );
}
