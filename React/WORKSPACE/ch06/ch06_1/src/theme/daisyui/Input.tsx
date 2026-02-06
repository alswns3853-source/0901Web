import type {DetailedHTMLProps, InputHTMLAttributes} from 'react'
import {forwardRef} from 'react'

export type ReactInputProps = DetailedHTMLProps<
  InputHTMLAttributes<HTMLInputElement>,
  HTMLInputElement
>

export type InputProps = ReactInputProps & {}

export const Input = forwardRef<HTMLInputElement, InputProps>((props, ref) => {
  const {className: _className, ...inputProps} = props
  const className = ['input', _className].join(' ')
  return <input ref={ref} {...inputProps} className={className} />
})

// 이렇게 작성하면 Input ref 속성을 사용할 수 없다.
// export const Input: FC<InputProps> = ({className: _className, ...inputProps}) => {
//   const className = ['input', _className].join(' ')
//   return <input {...inputProps} className={className} />
// }
