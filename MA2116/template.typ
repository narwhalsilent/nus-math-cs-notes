// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(flipped: true, margin: 0.6in)
  set text(font: "Source Sans Pro", lang: "en")
  set par(justify: true)

  body
}