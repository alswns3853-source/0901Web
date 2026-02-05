import { useMemo } from "react";
import { Title } from "../../components";
import CreateListForm from "./CreateListForm";

import BoardList from "../BoardList";
import { useLists } from "../../store/useLists";

export default function Board() {
  const { lists, onCreateList, onRemoveList } = useLists();
  const children = useMemo(
    () =>
      lists.map((list) => (
        <BoardList
          key={list.uuid}
          list={list}
          onRemoveList={onRemoveList(list.uuid)}
        />
      )),
    [lists, onRemoveList],
  );
  return (
    <section className="mt-4">
      <Title>Board</Title>
      <div className="mt-4">
        {children}
        <CreateListForm onCreateList={onCreateList} />
      </div>
    </section>
  );
}
