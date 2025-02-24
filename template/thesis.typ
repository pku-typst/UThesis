#import "@preview/PKU-UThesis:0.0.1": config

#show: config.with(
  logo: image("assets/logo.png"),
  ..yaml("info.yml"),
  title: [利用 Typst 进行本科毕业论文排版],
  title-en: [Typesetting Undergraduate Thesis with Typst],
  abstract: [
    抽象
  ],
  keywords: ("排版",),
  abstract-en: [
    Abstract
  ],
  keywords-en: ("Typesetting",),
)

= 引言

= 一级标题

== 二级标题

=== 三级标题

== 二级标题

= 图表示例

= 结论

// TODO: 参考文献
