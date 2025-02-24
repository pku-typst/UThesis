#import "@preview/pointless-size:0.1.1": zh

#import "../fonts.typ": fonts
#import "../utils.typ": warn-auto, debug-margin, debug-stroke, debug-v

#let title-size = zh(3)
#let title-inset = 10pt

#let kws-content(kws) = context {
  let (prompt, sep) = if text.lang == "zh" {
    ("关键词：", "，")
  } else {
    ("KEY WORDS: ", ", ")
  }
  prompt + kws.join(sep)
}

#let abstract-title = context {
  let title = if text.lang == "zh" {
    "摘要"
  } else {
    "ABSTRACT"
  }
  set text(font: fonts.黑体, size: title-size)
  title
}

#let abstract-page(
  abstract: auto,
  keywords: auto,
) = {
  set page(
    paper: "a4",
    numbering: none,
    margin: (x: 2cm, y: 2.5cm),
    header: none,
    footer: none,
  )

  debug-margin

  let abstract = warn-auto(abstract, msg: "Abstract is missing")
  let keywords = warn-auto(
    keywords,
    msg: "Keywords are missing",
    f: kws-content,
  )

  place(
    center + top,
    block(stroke: debug-stroke, inset: title-inset, abstract-title),
  )

  debug-v(v(title-size + 2 * title-inset))

  debug-v(v(1em))

  context {
    set par(
      justify: true,
      leading: 1.5em,
    )
    set par(first-line-indent: (amount: 2em, all: true)) if text.lang == "zh"

    abstract

    debug-v(v(2em))

    keywords

    pagebreak()
  }
}
