import { useCallback } from "react";
import { useDispatch, useSelector } from "react-redux";
import type { List } from "./commonTypes";
import type { AppState } from "./AppState";
import * as LO from "./listidOrders";
import * as L from "./listEntities";
import * as C from "./cardEntities";
import * as LC from "./listidCardidOrders";
export const useLists = () => {
  const dispatch = useDispatch();

  const lists = useSelector<AppState, List[]>(
    ({ listidOrders, listEntities }) =>
      listidOrders.map((uuid) => listEntities[uuid]),
  );

  const listidCardidOrders = useSelector<AppState, LC.State>(
    ({ listidCardidOrders }) => listidCardidOrders,
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
  return { lists, onCreateList, onRemoveList };
};
