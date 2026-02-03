import {Title, Subtitle} from '../components'
import {Modal, ModalContent, ModalAction, Button} from '../theme/daisyui'
import * as D from '../data'
import {useState} from 'react'

export default function ModalTest() {
  const [open, setOpen] = useState(true)
  const closeClicked = () => setOpen(false)
  const acceptClicked = () => alert('acceptClicked')
  const openClicked = () => setOpen(true);
  return (
    <section className="mt-4">
      <Title>ModalTest</Title>
      <button className="btn btn-primary" onClick={openClicked}>Modal Open</button>
      <Modal open={open}>
        <ModalContent onCloseIconClicked={closeClicked}>
          <Subtitle>Modal</Subtitle>
          <p className="mt-4 text-justify">{D.randomParagraphs()}</p>
          <ModalAction>
            <Button
              className="w-24 normal-case btn-primary btn-sm"
              onClick={acceptClicked}>
              Accept
            </Button>
            <Button className="w-24 normal-case btn-sm" onClick={closeClicked}>
              Close
            </Button>
          </ModalAction>
        </ModalContent>
      </Modal>
    </section>
  )
}
