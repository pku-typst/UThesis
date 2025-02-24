#import "@preview/pointless-size:0.1.1": zh

#import "../fonts.typ": fonts
#import "../utils.typ": auto-default, debug-margin, debug-stroke, debug-v, warn-auto

#let pre-title-size = zh("-0")

#let logo-size = 2cm

#let style-title(t) = {
  set text(size: zh(1), font: fonts.黑体)
  pad(t, y: .3em)
}

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
  date: auto,
) = {
  set page(
    paper: "a4",
    numbering: none,
    margin: (x: 2cm, y: 2.5cm),
    header: none,
    footer: none,
  )
  set align(center)

  debug-margin

  // Logo
  let logo = warn-auto(logo, msg: "Logo is missing")
  place(
    center,
    block(stroke: debug-stroke)[
      #set image(height: logo-size)
      #logo
    ],
  )

  debug-v(v(logo-size))

  debug-v(v(logo-size / 3))

  // Pre-title
  place(
    center,
    block(stroke: debug-stroke)[
      #set text(size: pre-title-size, font: fonts.黑体)
      本科生毕业论文
    ],
  )

  debug-v(v(pre-title-size))

  debug-v(v(pre-title-size / 2))

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
        text(size: zh(2), font: fonts.宋体)[题目：], style-title(title),
        [], style-title(text(lang: "en", title-en)),
      )
    ],
  )


  // Info
  let name = warn-auto(name, msg: "Name is missing")
  let id = warn-auto(id, msg: "ID is missing")
  let faculty = warn-auto(faculty, msg: "Faculty is missing")
  let major = warn-auto(major, msg: "Major is missing")
  let tutor = warn-auto(tutor, msg: "Tutor is missing")
  place(
    center,
    {
      debug-v(v(9cm))
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
    },
  )


  // Date
  let date = auto-default(date, datetime.today())
  let year = (str(date.year()).clusters().map(d => cn-num.at(int(d)))).join()
  let month = cn-num.at(date.month())
  place(
    center + bottom,
    {
      block(stroke: debug-stroke)[
        #set text(size: zh(3), font: fonts.宋体)
        #year;年#month;月
      ]
      debug-v(v(2cm))
    },
  )

  pagebreak(weak: true)
}
