import { useCallback, useMemo, type FC } from "react";
import type { List } from "../../store/commonTypes";
import { Icon } from "../../theme/daisyui";
import { useCards } from "../../store/useCards";
import ListCard from "../ListCard";
import { Div, ListDraggable } from "../../components";
import type { MoveFunc } from "../../components";
import { CardDroppable } from "../../components/CardDroppable";
import { useNavigate } from "react-router-dom";

export type BoardListProps = {
  list: List;
  onRemoveList?: () => void;
  index: number;
  onMoveList: MoveFunc;
};
const BoardList: FC<BoardListProps> = ({
  list,
  onRemoveList,
  index,
  onMoveList,
  ...props
}) => {
  const { cards, onPrependCard, onAppendCard, onRemoveCard } = useCards(
    list.uuid,
  );

  const navigate = useNavigate()
  const cardClicked = useCallback(
    (cardid: string) => () => {
      navigate(`/board/card/${cardid}`)
    },
    [navigate]
  )
  const children = useMemo(
    () =>
      cards.map((card, index) => (
        <ListCard
          key={card.uuid}
          card={card}
          onRemove={onRemoveCard(card.uuid)}
          index={index}
          draggableId={card.uuid}
          onClick={cardClicked(card.uuid)}
        />
      )),
    [cards, onRemoveCard],
  );
  return (
    <ListDraggable id={list.uuid} index={index} onMove={onMoveList}>
      <Div {...props} className="p-2 m-2 border border-gray-300 rounded-lg">
        <div className="flex flex-col mb-2 juestify-between ">
          <p className="w-32 text-sm font-bold underline line-clamp-1">
            {list.title}
          </p>
          <div className="flex justify-between ml-2">
            <Icon
              name="remove"
              className="btn-error btn-xs"
              onClick={onRemoveList}
            />
            <div className="flex">
              <Icon
                name="post_add"
                className="btn-success btn-xs"
                onClick={onPrependCard}
              />
              <Icon
                name="playlist_add"
                className="btn-success btn-xs"
                onClick={onAppendCard}
              />
            </div>
          </div>

          <CardDroppable droppableId={list.uuid}>
            <div className="flex flex-col p-2">{children}</div>
          </CardDroppable>
        </div>
      </Div>
    </ListDraggable>
  );
};
export default BoardList;
