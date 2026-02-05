import type * as T from "./types";
import * as CT from "../commonTypes";

export const setListidCardids = (
  payload: CT.ListidCardidS,
): T.SetListidCardids => ({
  type: "@listidCardids/set",
  payload,
});
export const removeListid = (payload: string): T.RemoveListidAction => ({
  type: "@listidCardids/remove",
  payload,
});
export const prependCardidToListid = (
  payload: CT.ListidCardid,
): T.PrependCardidToListidAction => ({
  type: "@listidCardids/prependCardid",
  payload,
});
export const appendCardidToListid = (
  payload: CT.ListidCardid,
): T.AppendCardidToListidAction => ({
  type: "@listidCardids/appendCardid",
  payload,
});
export const removeCardidFromListid = (
  payload: CT.ListidCardid,
): T.RemoveCardidFromListidAction => ({
  type: "@listidCardids/removeCardid",
  payload,
});
