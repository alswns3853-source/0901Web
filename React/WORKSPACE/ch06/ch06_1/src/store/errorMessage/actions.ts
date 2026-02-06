import type * as T from './types'

export const setErrorMessage = (payload: T.State): T.SetErrorMesssageAction => ({
  type: '@errorMessage/setErrorMessage',
  payload
})
