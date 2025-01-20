export default function DevEnvironment() {
  const features = [
    "Integrated Development Environment (IDE) with code completion and debugging tools",
    "Version Control System integration (Git)",
    "Containerization support with Docker",
    "CI/CD pipeline integration",
    "Scalable cloud storage solutions",
    "Database management systems (SQL and NoSQL)",
    "API development and testing tools",
    "Collaborative coding features",
  ]

  return (
    <section id="dev-environment" className="mb-12">
      <h2 className="text-2xl font-bold mb-4">Software Development Platform Environment and Storage</h2>
      <p className="mb-4">
        At Aenzbi, we provide a comprehensive software development platform that empowers developers to build, test, and
        deploy applications efficiently. Our environment includes:
      </p>
      <ul className="list-disc pl-6">
        {features.map((feature, index) => (
          <li key={index} className="mb-2">
            {feature}
          </li>
        ))}
      </ul>
      <p className="mt-4">
        Our platform is designed to streamline the development process, enhance collaboration, and ensure the highest
        quality of code output. With scalable storage solutions, your projects can grow without limitations.
      </p>
    </section>
  )
}

