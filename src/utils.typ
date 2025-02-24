#let debug = sys.inputs.at("x-debug", default: none) != none

#let debug-stroke = if debug {
  red + 0.2pt
} else {
  none
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
