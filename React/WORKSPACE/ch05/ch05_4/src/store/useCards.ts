import { useDispatch, useSelector } from "react-redux";
import { useCallback } from "react";
import type { AppState } from "./AppState";
import type { Card, UUID } from "./commonTypes";
import * as D from "../data";
import * as C from "../store/cardEntities";
import * as LC from "../store/listidCardidOrders";

export const useCards = (listid: UUID) => {
  const dispatch = useDispatch();
  const cards = useSelector<AppState, Card[]>(
    ({ cardEntities, listidCardidOrders }) =>
      listidCardidOrders[listid].map((uuid) => cardEntities[uuid]),
  );
  const onPrependCard = useCallback(() => {
    const card = D.makeRandomCard();
    dispatch(C.addCard(card));
    dispatch(LC.prependCardidToListid({ listid, cardid: card.uuid }));
  }, [dispatch, listid]);
  const onAppendCard = useCallback(() => {
    const card = D.makeRandomCard();
    dispatch(C.addCard(card));
    dispatch(LC.appendCardidToListid({ listid, cardid: card.uuid }));
  }, [dispatch, listid]);
  const onRemoveCard = useCallback(
    (uuid: UUID) => () => {
      dispatch(C.removeCard(uuid));
      dispatch(LC.removeCardidFromListid({ listid, cardid: uuid }));
    },
    [dispatch, listid],
  );
  return { cards, onPrependCard, onAppendCard, onRemoveCard };
};
