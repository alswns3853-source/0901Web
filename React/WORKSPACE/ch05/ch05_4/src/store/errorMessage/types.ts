import type {Action} from 'redux'

export type State = string

export type SetErrorMesssageAction = Action<'@errorMessage/setErrorMessage'> & {
  payload: State
}

export type Actions = SetErrorMesssageAction
