import type {FC, DetailedHTMLProps, HTMLAttributes, PropsWithChildren} from 'react'
import type {WidthHeight} from './WidthHeight'
import type {LeftRightTopBottom} from './LeftRightTopBottom'
import type {MinMaxWidthHeight} from './MinMaxWidthHeight'

export type ReactDivProps = DetailedHTMLProps<
  HTMLAttributes<HTMLDivElement>,
  HTMLDivElement
>
export type DivProps = ReactDivProps &
  PropsWithChildren<WidthHeight> &
  LeftRightTopBottom &
  MinMaxWidthHeight & {
    src?: string
  }

/* 
  CSS의 backgroundImage: url(src)에서 src에는 다양한 값들이 들어갈 수 있습니다. 여기에는 다음과 같은 값들이 포함됩니다:
  URL: 웹상의 이미지 주소나 파일 경로를 직접 지정할 수 있습니다. 예를 들어, backgroundImage: url('https://example.com/image.png')처럼 사용할 수 있습니다1.
  상대 경로: 현재 파일 위치를 기준으로 한 상대적인 경로를 사용할 수 있습니다. 예를 들어, backgroundImage: url('../images/background.png')와 같이 사용할 수 있습니다2.
  절대 경로: 서버의 루트 디렉토리에서부터 시작하는 전체 경로를 사용할 수 있습니다. 예를 들어, backgroundImage: url('/images/background.png')와 같이 사용할 수 있습니다2.
  데이터 URI: 이미지 데이터를 Base64 인코딩 문자열로 직접 포함시킬 수도 있습니다. 예를 들어, backgroundImage: url('data:image/png;base64,iVBORw0KGgo...')와 같이 사용할 수 있습니다.
  그라디언트: CSS 그라디언트를 생성하여 배경 이미지로 사용할 수 있습니다. 예를 들어, backgroundImage: linear-gradient(to right, red, orange)와 같이 사용할 수 있습니다1.
  이 외에도 여러 이미지를 쉼표로 구분하여 동시에 사용할 수도 있습니다. 예를 들어, backgroundImage: url('image1.png'), url('image2.png')와 같이 여러 이미지를 배경으로 설정할 수 있습니다1.
  이러한 값들을 사용하여 원하는 배경 이미지를 설정할 수 있으며, 이미지가 로드되지 않을 경우를 대비하여 background-color 속성을 함께 사용하는 것이 좋습니다1.
*/
// prettier-ignore
export const Div: FC<DivProps> = ({
  width, height, 
  style: _style, 
  src, 
  className: _className, 
  left, right, top, bottom,
  minWidth, maxWidth, minHeight, maxHeight,
  ...props
}) => {
  const style = {
    ..._style, 
    width, height, 
    backgroundImage: src && `url(${src})`,
    left, right, top, bottom,
    minWidth, maxWidth, minHeight, maxHeight
  }
  const className = ['box-border', src && 'bg-gray-300', _className].join(' ')
  return <div {...props} className={className} style={style} />
}
