import {Input} from '../../theme/daisyui'

export default function Basic() {
  return (
    <section className="mt-4">
      <h2 className="font-bold text-3xl text-center">Basic</h2>
      <div className="flex mt-4 justify-evenly">
        <input className="input input-primary" />
        <Input className="input-primary" />
      </div>
    </section>
  )
}
