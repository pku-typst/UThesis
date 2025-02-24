#import "@preview/numbly:0.1.0": numbly
#import "@preview/pointless-size:0.1.1": zh

#import "fonts.typ": fonts
#import "pages/abstract-page.typ": abstract-page
#import "pages/title-page.typ": title-page

#let text-part-header-footer = (
  header: context document.title,
  footer: align(center)[
    第#context counter(page).get().at(0);页
  ],
)

#let config(
  doc,
  title: auto,
  title-en: auto,
  abstract: auto,
  keywords: auto,
  abstract-en: auto,
  keywords-en: auto,
  name: auto,
  id: auto,
  faculty: auto,
  major: auto,
  tutor: auto,
  logo: auto,
) = {
  // Styles

  set text(lang: "zh")

  set heading(numbering: numbly("第{1:一}章"))
  show heading.where(level: 1): it => pagebreak(weak: true) + it
  show heading.where(level: 1): set align(center)
  show heading.where(level: 1): set text(
    font: fonts.黑体,
    size: zh(3),
  )
  show heading.where(level: 2): set text(
    font: fonts.宋体,
    size: zh(3),
  )
  show heading.where(level: 3): set text(
    font: fonts.宋体,
    size: zh(4),
  )
  show heading.where(level: 3): block.with(inset: (left: 2em))


  // Document

  title-page(
    logo: logo,
    title: title,
    title-en: title-en,
    name: name,
    id: str(id),
    faculty: faculty,
    major: major,
    tutor: tutor,
  )

  abstract-page(
    abstract: abstract,
    keywords: keywords,
  )
  {
    set text(lang: "en")
    abstract-page(
      abstract: abstract-en,
      keywords: keywords-en,
    )
  }

  outline(
    title: align(
      center,
      block(
        width: 100%,
        text(font: fonts.黑体, size: zh(-2))[
          目#h(1em)录
        ],
      ),
    ),
    indent: 1em,
  )

  pagebreak()
  counter(page).update(1)
  set page(..text-part-header-footer)

  doc
}
