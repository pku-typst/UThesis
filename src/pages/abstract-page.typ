#import "../utils.typ": warn, warn-auto

#let abstract-page(
  abstract: auto,
  keywords: auto,
) = {
  let abstract = warn-auto(abstract, msg: "Abstract is missing")
  let keywords = warn-auto(
    keywords,
    msg: "Keywords are missing",
    f: it => context { it.join(if text.lang == "zh" { "，" } else { ", " }) },
  )
  warn("TODO: 摘要页")

  abstract

  keywords

  pagebreak()
}
