\name{getKGMLurl}
\alias{getKGMLurl}
\alias{retrieveKGML}
\alias{getCategoryIndepKGMLurl}
\alias{kgmlNonmetabolicName2MetabolicName}
\title{ Get KGML file (url) with KEGG PATHWAY ID and (optional) organism }
\description{
  The function simply returns the KGML file url given KEGG PATHWAY
  ID. If the KEGG PATHWAY ID contains no organism prefix, user can
  specify the 'organism' parameter. Otherwise the 'organism' option is
  ignored.

  retrieveKGML is a simple wrapper to getKGMLurl, which downloads the
  KGML file with \code{download.file} in utils package.
}
\usage{
getKGMLurl(pathwayid, organism = "hsa")
retrieveKGML(pathwayid, organism, destfile,method="auto", ...)
kgmlNonmetabolicName2MetabolicName(destfile)
getCategoryIndepKGMLurl(pathwayid, organism="hsa", method="auto", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pathwayid}{ KEGG PATHWAY ID, e.g. 'hsa00020'}
  \item{organism}{ three-alphabet organism code, if pathwayid contains
    the ocde this option is ignored}
  \item{destfile}{Destination file, to which the remote KGML file should
    be saved}
  \item{method}{Method to be used for downloading files, passed to \code{download.file} function. Currently supports "internal", "auto" and
    "lynx"}
  \item{...}{Parameters passed to download.file}
}
\details{
  The function \code{getKGMLurl} takes the pathway identifier (can be in the form of
  'hsa00020' or with 'pathway' prefix, for example 'path:hsa00020'), and
  returns the url to download KGML file.

  The mapping between pathway identifier and pathway name can be found
  by KEGGPATHNAME2ID (or reversed mappings) in KEGG.db package. See
  vignette for example.

  \code{retrieveKGML} calls \code{download.file} to download the KGML
  file from KEGG REST API remotely.

  Before July 2017, KEGG FTP server was used to download the KGML files. Since
  then the REST API service of KEGG is used instead.

}
\value{
  KGML File URL of the given pathway.
}
\author{ Jitao David Zhang \url{mailto:jitao_david.zhang@roche.com} }
\references{
  Plea from KEGG (available as of Aug 2011) \url{https://www.genome.jp/kegg/docs/plea.html}
}
\note{ 
  So far the function does not check the correctness of the
  'organism' prefix, it is the responsibility of the user to garantee
  the right spelling.

  There were a period when the metabolic and non-metabolic pathways were
  saved separately in different directories, and \code{KEGGgraph} was
  able to handle them. \code{kgmlNonmetabolicName2MetabolicName} is used to translate
  non-metabolic pathway KGML URL to that of metabolic
  pathway. \code{getCategoryIndepKGMLurl} determines the correct URL to
  download by attempting both possibilities. They were mainly called
  internally. Now since the KGML file is to be downloaded in each
  pathway's main page instead from the FTp server, these functions are
  no more needed and will be removed in the next release.
}
\examples{
getKGMLurl("hsa00020")
getKGMLurl("path:hsa00020")
getKGMLurl("00020",organism="hsa")
getKGMLurl(c("00460", "hsa:00461", "path:hsa00453", "path:00453"))

hasConnection <- RCurl::url.exists(getKGMLurl("cel00010"))
if(hasConnection) {
  tmp <- tempfile()
  retrieveKGML(pathwayid='00010', organism='cel', destfile=tmp, method="auto")
} else {
  warnings("No connection to KEGG webservice")
}
}
\keyword{ IO }
