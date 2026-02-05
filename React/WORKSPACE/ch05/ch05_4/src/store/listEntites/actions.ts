import type * as T from "./types";

export const addListidToOrders = (payload: T.List): T.AddListAction => ({
  type: "@listEntities/add",
  payload,
});
export const removeListidFromOrders = (
  payload: string,
): T.RemoveListAction => ({
  type: "@listEntities/remove",
  payload,
});
