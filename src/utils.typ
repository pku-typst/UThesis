#let auto-default(val, default) = if val == auto {
  default
} else {
  val
}

#let debug = sys.inputs.at("x-debug", default: none) != none

#let debug-stroke = if debug {
  red + 0.2pt
} else {
  none
}

#let debug-margin = if debug {
  context {
    let margin = page.margin
    place(
      left + top,
      dx: -margin.left,
      line(length: 100% + margin.left + margin.right, angle: 0deg, stroke: debug-stroke),
    )
    place(
      left + top,
      dy: -margin.top,
      line(length: 100% + margin.top + margin.bottom, angle: 90deg, stroke: debug-stroke),
    )
    place(
      left + bottom,
      dx: -margin.left,
      line(length: 100% + margin.left + margin.right, angle: 0deg, stroke: debug-stroke),
    )
    place(
      right + top,
      dy: -margin.top,
      line(length: 100% + margin.top + margin.bottom, angle: 90deg, stroke: debug-stroke),
    )
  }
}
#let debug-v(inner) = if debug {
  place(center, line(length: inner.amount, angle: 90deg, stroke: debug-stroke))
  place(center, block(stroke: debug-stroke, inset: 2pt)[#inner.amount])
  inner
} else {
  inner
}

#let warn(msg) = {
  text(fill: red, weight: "bold", msg)
}

#let warn-auto(var, msg: "Variable is missing", f: it => it) = {
  if var == auto {
    warn(msg)
  } else {
    f(var)
  }
}
