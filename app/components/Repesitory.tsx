export default function Repository() {
  const contents = [
    "Source code for our software projects",
    "Documentation for our products and services",
    "Resources for developers and users",
  ]

  return (
    <section id="repository" className="mb-12">
      <h2 className="text-2xl font-bold mb-4">Repository Contents</h2>
      <p>This repository contains:</p>
      <ul className="list-disc pl-6 mt-2">
        {contents.map((content, index) => (
          <li key={index} className="mb-2">
            {content}
          </li>
        ))}
      </ul>
    </section>
  )
}

