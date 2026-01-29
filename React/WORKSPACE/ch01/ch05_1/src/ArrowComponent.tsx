// import type { FC } from "react";
// export type ArrowComponentProps = {
//   href: string;
//   text: string;
// };
// const ArrowComponent: FC<ArrowComponentProps> = (props) => {
// const {href, text} = props;
// return (
//     <li>
//       <a href={href}>
//         <p>{text}</p>
//       </a>
//     </li>
//   );
// };

// export default ArrowComponent;

import type { ReactNode } from "react";

interface DataProps {
  href: string;
  text: string;
  children: ReactNode;
}
const ArrowComponent = ({ href, text, children }: DataProps) => {
  return (
    <li>
      <a href={href}>
        <p>{text}</p>
      </a>
      {children}
    </li>
  );
};
export default ArrowComponent;
