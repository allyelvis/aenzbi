export default function Services() {
  const services = ["Web Development", "Mobile Application Development", "Cloud Services", "Internet Solutions"]

  return (
    <section id="services" className="mb-12">
      <h2 className="text-2xl font-bold mb-4">Our Services</h2>
      <p>We specialize in:</p>
      <ul className="list-disc pl-6 mt-2">
        {services.map((service, index) => (
          <li key={index} className="mb-2">
            {service}
          </li>
        ))}
      </ul>
    </section>
  )
}

