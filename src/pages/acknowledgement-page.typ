#import "@preview/pointless-size:0.1.1": zh

#import "../fonts.typ"
#import "../utils.typ": debug-margin, debug-stroke, debug-v

#let title-size = zh(3)
#let title-inset = 20pt

#let ack-title(title) = {
  set text(size: title-size, font: fonts.黑体)
  title
}

#let acknowledgement-page(doc) = {
  set page(
    paper: "a4",
    numbering: none,
    margin: (x: 2cm, y: 2.5cm),
    header: none,
    footer: none,
  )

  debug-margin

  place(
    center + top,
    block(stroke: debug-stroke, inset: title-inset)[#ack-title[致谢]],
  )

  debug-v(v(title-size + 2 * title-inset))

  doc
}
