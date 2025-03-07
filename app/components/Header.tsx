import Link from "next/link"

export default function Header() {
  return (
    <header className="bg-gray-800 text-white py-6">
      <div className="container mx-auto px-4">
        <h1 className="text-3xl font-bold text-center mb-4">Aenzbi Software and Internet Company</h1>
        <nav>
          <ul className="flex flex-wrap justify-center space-x-4 md:space-x-6">
            <li>
              <Link href="#about" className="hover:text-gray-300">
                About Us
              </Link>
            </li>
            <li>
              <Link href="#services" className="hover:text-gray-300">
                Our Services
              </Link>
            </li>
            <li>
              <Link href="#dev-environment" className="hover:text-gray-300">
                Development Environment
              </Link>
            </li>
            <li>
              <Link href="#projects" className="hover:text-gray-300">
                Projects
              </Link>
            </li>
            <li>
              <Link href="#blog" className="hover:text-gray-300">
                Blog
              </Link>
            </li>
            <li>
              <Link href="#team" className="hover:text-gray-300">
                Our Team
              </Link>
            </li>
            <li>
              <Link href="#contact" className="hover:text-gray-300">
                Contact Us
              </Link>
            </li>
          </ul>
        </nav>
      </div>
    </header>
  )
}

