// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set text(font: "Source Sans Pro", lang: "en", size: 9pt)
  set par(justify: true)
  set page(flipped: true, margin: 0.6in)

  show: columns.with(3, gutter: 1.3em)
  body
}