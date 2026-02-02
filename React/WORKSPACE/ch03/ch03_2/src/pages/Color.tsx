export default function Color() {
  return (
    <div className="p-4 bg-sky-700">
      <p className="w-full p-4 text-3xl italic font-thin text-white">Color</p>
      <div className="mb-4">
        <p className="text-white">Email Address</p>
        <input type="email" className="text-gray-900 border border-sky-200-4" />
        <p className="text-rose-500">This field is required</p>
      </div>
    </div>
  );
}
