\name{getSubtype-methods}
\docType{methods}
\alias{getSubtype}
\alias{getSubtype-methods}
\alias{getSubtype,graph-method}
\alias{getSubtype,KEGGEdge-method}
\title{Get subtype}
\description{
  KEGG stores sub-type of interactions between entities in the KGML
  files, which can be extracted with this method. The descriptions for
  the subtypes can be explored at the KGML document manual in the references.

  See \code{\link{KEGGEdge-class}} for examples. The method for graphs
  is a wrapper to extract all subtype information from one graph.
}
\references{ KGML Document manual \url{https://www.genome.jp/kegg/docs/xml/} }
\author{ Jitao David Zhang \url{mailto:jitao_david.zhang@roche.com} }
\section{Methods}{
\describe{
\item{object = "graph"}{ A graph object of KEGGgraph. The method returns
  a list of subtypes in the same order of edges}
\item{object = "KEGGEdge"}{ An object of KEGGEdge, which stores the
  subtype information }
}}
\examples{
sfile <- system.file("extdata/hsa04010.xml",package="KEGGgraph")
pathway <- parseKGML(sfile)

edges <- edges(pathway)
subtype <- getSubtype(edges[[1]])
subtype

}
\keyword{methods}

