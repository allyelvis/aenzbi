import Header from "./components/Header"
import Footer from "./components/Footer"
import About from "./components/About"
import Services from "./components/Services"
import Repository from "./components/Repository"
import Contact from "./components/Contact"
import DevEnvironment from "./components/DevEnvironment"
import ProjectsShowcase from "./components/ProjectsShowcase"
import BlogPreview from "./components/BlogPreview"
import Team from "./components/Team"

export default function Home() {
  return (
    <div className="flex flex-col min-h-screen">
      <Header />
      <main className="flex-grow container mx-auto px-4 py-8">
        <About />
        <Services />
        <DevEnvironment />
        <ProjectsShowcase />
        <BlogPreview />
        <Team />
        <Repository />
        <Contact />
      </main>
      <Footer />
    </div>
  )
}

