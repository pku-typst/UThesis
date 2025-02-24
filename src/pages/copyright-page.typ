#import "@preview/pointless-size:0.1.1": zh

#import "../fonts.typ": fonts
#import "../utils.typ": debug-margin, debug-stroke, debug-v

#let title-size = zh(3)
#let title-inset = 20pt

#let claim-title(title) = {
  set text(size: title-size, font: fonts.黑体)
  title
}

#let copyright-page = {
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
    block(stroke: debug-stroke, inset: title-inset)[#claim-title([版权声明])],
  )

  debug-v(v(title-size + 2 * title-inset))

  set par(
    first-line-indent: (amount: 2em, all: true),
    justify: true,
    leading: 1.5em,
  )

  [
    #set text(font: fonts.宋体, size: zh(-4))
    任何收存和保管本论文各种版本的单位和个人，未经本论文作者同意，不得将本论文转借他人，亦不得随意复制、抄录、拍照或以任何方式传播。否则，引起有碍作者著作权之问题，将可能承担法律责任。
  ]
}
