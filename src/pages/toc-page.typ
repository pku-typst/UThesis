#import "@preview/pointless-size:0.1.1": zh

#import "../fonts.typ"
#import "../utils.typ": debug-margin

#let toc-page(outline-depth: 3) = {
  set page(
    paper: "a4",
    numbering: none,
    margin: (x: 2cm, y: 2.5cm),
    header: none,
    footer: none,
  )

  outline(
    depth: outline-depth,
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

  debug-margin
}
