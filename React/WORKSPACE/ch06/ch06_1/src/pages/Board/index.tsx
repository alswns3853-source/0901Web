import { useMemo } from "react";
import { Title } from "../../components";
import CreateListForm from "./CreateListForm";

import BoardList from "../BoardList";
import { useLists } from "../../store/useLists";
import { DragDropContext } from "@hello-pangea/dnd";

export default function Board() {
  const { lists, onCreateList, onRemoveList, onMoveList, onDragEnd } = useLists();
  const children = useMemo(
    () =>
      lists.map((list, index) => (
        <BoardList
          key={list.uuid}
          list={list}
          onRemoveList={onRemoveList(list.uuid)}
          index={index}
          onMoveList={onMoveList}
        />
      )),
    [lists, onRemoveList, onMoveList],
  );
  
  return (
    <section className="mt-4">
      <Title>Board</Title>
      <DragDropContext onDragEnd={onDragEnd}>
      <div className="flex p-2 mt-4 flex-warp">
        {children}
        <CreateListForm onCreateList={onCreateList} />
      </div>
      </DragDropContext>
    </section>
  );
}
