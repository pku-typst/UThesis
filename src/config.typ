#import "@preview/numbly:0.1.0": numbly
#import "@preview/pointless-size:0.1.1": zh

#import "fonts.typ"
#import "pages/abstract-page.typ": abstract-page
#import "pages/title-page.typ": title-page

#let text-part-header-footer = (
  header: context document.title,
  footer: align(center)[
    第#context counter(page).get().at(0);页
  ],
)

#let chapter-numbering(pat) = (.., n) => context numbering(pat, counter(heading.where(level: 1)).get().at(0), n)

#let config(
  doc,
  title: auto,
) = {
  // Styles

  set text(lang: "zh")

  set par(first-line-indent: (amount: 2em, all: true))

  show strong: it => text(font: fonts.黑体, weight: "semibold", it.body)
  show emph: it => text(font: fonts.楷体, style: "italic", it.body)

  set heading(numbering: numbly("第{1:一}章"))
  show heading: set text(font: fonts.宋体)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set align(center)
    set text(
      font: fonts.黑体,
      size: zh(3),
    )
    block(inset: (top: .5em, bottom: .5em), it)
    counter(footnote).update(())
  }
  show heading.where(level: 2): set text(
    font: fonts.宋体,
    size: zh(3),
  )
  show heading.where(level: 3): it => {
    set text(
      font: fonts.宋体,
      size: zh(4),
    )
    block(inset: (left: 2em), it)
  }

  set math.equation(numbering: chapter-numbering("(1.1)"))
  set figure(numbering: chapter-numbering("1.1"))
  show figure.where(kind: table): set figure.caption(position: top)
  set footnote(numbering: "①")
  show link: it => {
    set text(font: fonts.代码) if it.body.has("text") and it.body.text == it.dest
    it
  }
  show raw: set text(font: fonts.代码)

  show <ref-title>: set heading(numbering: none)

  doc
}

#let main-content(doc) = {
  pagebreak(weak: true)
  counter(page).update(1)
  set page(..text-part-header-footer)
  set text(font: fonts.宋体, size: zh(-4))

  doc
}

#let appendix(doc) = {
  pagebreak(weak: true)
  counter(heading).update(0)
  set heading(numbering: numbly("附录 {1:A}", "附录 {1:A}.{2}", "附录 {1:A}.{2}.{3}"))

  doc
}
