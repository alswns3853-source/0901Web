import { useCallback } from "react";
import { useDispatch, useSelector } from "react-redux";
import type { List } from "./commonTypes";
import type { AppState } from "./AppState";
import * as LO from "./listidOrders";
import * as L from "./listEntities";
import * as C from "./cardEntities";
import * as LC from "./listidCardidOrders";
import type { DropResult } from "@hello-pangea/dnd";
import * as U from '../utils'
export const useLists = () => {
  const dispatch = useDispatch();

  const lists = useSelector<AppState, List[]>(
    ({ listidOrders, listEntities }) =>
      listidOrders.map((uuid) => listEntities[uuid]),
  );

  const listidCardidOrders = useSelector<AppState, LC.State>(
    ({ listidCardidOrders }) => listidCardidOrders,
  );

  const listidOrders = useSelector<AppState, LO.State>(
    ({ listidOrders }) => listidOrders,
  );

  const onCreateList = useCallback(
    (uuid: string, title: string) => {
      const list = { uuid, title };
      dispatch(LO.addListidToOrders(list.uuid));
      dispatch(L.addList(list));
      dispatch(LC.setListidCardids({ listid: list.uuid, cardids: [] }));
    },
    [dispatch],
  );
  const onRemoveList = useCallback(
    (listid: string) => () => {
      listidCardidOrders[listid].forEach((cardid) => {
        dispatch(C.removeCard(cardid));
      });
      dispatch(LC.removeListid(listid));
      dispatch(L.removeList(listid));
      dispatch(LO.removeListidFromOrders(listid));
    },
    [dispatch, listidCardidOrders],
  );
  const onMoveList = useCallback(
    (dragIndex: number, hoverIndex: number) => {
      const newOrders = listidOrders.map((item, index) =>
        index === dragIndex
          ? listidOrders[hoverIndex]
          : index === hoverIndex
            ? listidOrders[dragIndex]
            : item,
      );
      dispatch(LO.setListidOrders(newOrders));
    },
    [dispatch, listidOrders],
  );
  const onDragEnd = useCallback(
    (result: DropResult) => {
      console.log('onDragEnd result', result)
      const destinationListid = result.destination?.droppableId
      const destinationCardIndex = result.destination?.index
      if (destinationListid === undefined || destinationCardIndex === undefined) return

      const sourceListid = result.source.droppableId
      const sourceCardIndex = result.source.index

      if (destinationListid === sourceListid) {
        const cradidOrders = listidCardidOrders[destinationListid]

        dispatch(
          LC.setListidCardids({
            listid: destinationListid,
            cardids : U.swapItemsInArray(
              cradidOrders,
              sourceCardIndex,
              destinationCardIndex
            )
          })
        )
      } else {
        const sourceCardidOrders = listidCardidOrders[sourceListid]
        dispatch(
          LC.setListidCardids({
            listid: sourceListid,
            cardids: U.removeItemAtIndexInArray(sourceCardidOrders, sourceCardIndex)
          })
        )
        const destinationCardidOrders = listidCardidOrders[destinationListid]
        dispatch(
          LC.setListidCardids({
            listid: destinationListid,
            cardids: U.insertItemAtIndexInArray(
              destinationCardidOrders,
              destinationCardIndex,
              result.draggableId
            )
          })
        )
      }
    },
    [listidCardidOrders, dispatch]
  )
  return { lists, onCreateList, onRemoveList, onMoveList, onDragEnd };
};
