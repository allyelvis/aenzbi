import { FaTwitter, FaLinkedin, FaGithub } from "react-icons/fa"

export default function Footer() {
  return (
    <footer className="bg-gray-800 text-white py-8">
      <div className="container mx-auto px-4 text-center">
        <p className="mb-4">&copy; 2023 Aenzbi Software and Internet Company. All rights reserved.</p>
        <div className="flex justify-center space-x-4">
          <a
            href="https://twitter.com/aenzbi"
            target="_blank"
            rel="noopener noreferrer"
            className="hover:text-gray-300"
          >
            <FaTwitter size={24} />
            <span className="sr-only">Twitter</span>
          </a>
          <a
            href="https://www.linkedin.com/company/aenzbi"
            target="_blank"
            rel="noopener noreferrer"
            className="hover:text-gray-300"
          >
            <FaLinkedin size={24} />
            <span className="sr-only">LinkedIn</span>
          </a>
          <a href="https://github.com/aenzbi" target="_blank" rel="noopener noreferrer" className="hover:text-gray-300">
            <FaGithub size={24} />
            <span className="sr-only">GitHub</span>
          </a>
        </div>
      </div>
    </footer>
  )
}

