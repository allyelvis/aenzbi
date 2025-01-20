export default function Contact() {
  return (
    <section id="contact" className="mb-12">
      <h2 className="text-2xl font-bold mb-4">Contact Us</h2>
      <p>If you have any questions, feedback, or inquiries, feel free to reach out to us:</p>
      <ul className="mt-2">
        <li className="mb-2">
          Email:{" "}
          <a href="mailto:contact@aenzbi.com" className="text-blue-600 hover:underline">
            contact@aenzbi.com
          </a>
        </li>
        <li className="mb-2">
          Website:{" "}
          <a
            href="https://www.aenzbi.com"
            target="_blank"
            rel="noopener noreferrer"
            className="text-blue-600 hover:underline"
          >
            www.aenzbi.com
          </a>
        </li>
      </ul>
    </section>
  )
}

