#import "@preview/pointless-size:0.1.1": zh

#import "../fonts.typ": fonts
#import "../utils.typ": debug-margin

#let toc-page(outlined-depth: 3) = {
  set page(
    paper: "a4",
    numbering: none,
    margin: (x: 2cm, y: 2.5cm),
    header: none,
    footer: none,
  )

  outline(
    depth: outlined-depth,
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
