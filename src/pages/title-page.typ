#import "@preview/pointless-size:0.1.1": zh

#import "../fonts.typ": fonts
#import "../utils.typ": debug-stroke, warn-auto

#let cn-num = (
  "〇",
  "一",
  "二",
  "三",
  "四",
  "五",
  "六",
  "七",
  "八",
  "九",
  "十",
  "十一",
  "十二",
)

#let grow(cont) = {
  block(stroke: debug-stroke, cont)
}

#let stroke-func(x, y) = {
  if x == 0 {
    return debug-stroke
  }
  return (
    x: debug-stroke,
    top: debug-stroke,
    bottom: (paint: black, thickness: .5pt),
  )
}

#let title-page(
  logo: auto,
  title: auto,
  title-en: auto,
  name: auto,
  id: auto,
  faculty: auto,
  major: auto,
  tutor: auto,
) = {
  set page(paper: "a4", margin: (x: 2cm, y: 2.5cm))
  set align(center)

  // Logo
  let logo = warn-auto(logo, msg: "Logo is missing")
  block(stroke: debug-stroke)[
    #set image(height: 2cm)
    #logo
  ]

  block(stroke: debug-stroke)[
    #set text(size: zh("-0"), font: fonts.黑体)
    本科生毕业论文
  ]

  // Title
  let title = warn-auto(title, msg: "标题缺失")
  let title-en = warn-auto(title-en, msg: "Title (English) is missing")
  place(
    center,
    block(stroke: debug-stroke, inset: (right: 2cm))[
      #set align(bottom)
      #grid(
        columns: (2.75cm, 10.16cm),
        rows: auto,
        stroke: stroke-func,
        text(size: zh(2), font: fonts.宋体)[题目：], grow(text(size: zh(1), font: fonts.黑体, title)),
        [], grow(text(lang: "en", size: zh(1), font: fonts.黑体, title-en)),
      )
    ],
  )

  v(10cm)

  // Info
  let name = warn-auto(name, msg: "Name is missing")
  let id = warn-auto(id, msg: "ID is missing")
  let faculty = warn-auto(faculty, msg: "Faculty is missing")
  let major = warn-auto(major, msg: "Major is missing")
  let tutor = warn-auto(tutor, msg: "Tutor is missing")
  block(stroke: debug-stroke, inset: (right: 2cm))[
    #let size-left = zh(-3)
    #let size-right = zh(3)
    #set align(left)
    #grid(
      align: (right + horizon, center + horizon),
      columns: (3.19cm, 7.63cm),
      rows: 1.10cm,
      stroke: stroke-func,
      text(size: size-left)[姓#h(2em)名：], text(size: size-right, font: fonts.仿宋, name),
      text(size: size-left)[学#h(2em)号：], text(size: size-right, font: fonts.仿宋, id),
      text(size: size-left)[院#h(2em)系：], text(size: size-right, font: fonts.仿宋, faculty),
      text(size: size-left)[专#h(2em)业：], text(size: size-right, font: fonts.仿宋, major),
      text(size: size-left)[导师姓名：], text(size: size-right, font: fonts.仿宋, tutor),
    )
  ]

  v(3cm)

  // Date
  let date = datetime.today()
  let year = (str(date.year()).clusters().map(d => cn-num.at(int(d)))).join()
  let month = cn-num.at(date.month())
  block(stroke: debug-stroke)[
    #set text(size: zh(3), font: fonts.宋体)
    #year;年#month;月
  ]

  pagebreak(weak: true)
}
