#import "@preview/PKU-UThesis:0.0.1": *

#let title = [利用 Typst 进行本科毕业论文排版]
#let title-en = [Typesetting Undergraduate Thesis with Typst]

#show: config.with(title: title)

#title-page(
  title: title,
  title-en: title-en,
  logo: image("assets/logo.png"),
  // 删除 date 使用编译日期
  date: datetime(year: 2024, month: 1, day: 23),
  ..yaml("info.yml"),
)

#copyright-page

#abstract-page(
  abstract: [
    Typst 是一款新兴的排版工具，旨在提供简单、高效、且强大的排版功能。它结合了传统排版系统的优点，同时简化了用户的操作流程，使得用户可以更加专注于内容创作而不是排版细节。

    Typst 的核心优势在于其直观的语法和强大的排版引擎。用户可以使用类似编程的方式来定义文档结构、样式和内容，这使得复杂文档的排版变得更加简便。此外，Typst 支持实时预览功能，用户可以在编辑过程中即时看到排版效果，从而提高了工作效率。

    Typst 还具备高度的可扩展性和灵活性。通过插件和模板系统，用户可以自定义排版规则，满足不同的需求。不论是学术论文、商业报告还是个人项目，Typst 都能提供专业级的排版效果。

    总的来说，Typst 是一款兼具易用性和专业性的排版工具，适合各种类型的文档创作需求。它的出现，为用户提供了一种全新的排版体验，让排版过程变得更加愉快和高效。

    这篇文章提供了一个北大本科生毕业论文模板。
  ],
  keywords: ("排版", "本科毕业论文", "Typst"),
)

#{
  set text(lang: "en")
  abstract-page(
    abstract: [
      Typst is an emerging typesetting tool designed to offer simple, efficient, and powerful typesetting capabilities. It combines the strengths of traditional typesetting systems while simplifying user operations, allowing users to focus more on content creation rather than typesetting details.

      The core advantage of Typst lies in its intuitive syntax and powerful typesetting engine. Users can define document structures, styles, and content using a programming-like approach, making the typesetting of complex documents more straightforward. Additionally, Typst supports real-time preview functionality, enabling users to see the typesetting effects immediately during the editing process, thereby improving work efficiency.

      Typst also boasts high extensibility and flexibility. Through a system of plugins and templates, users can customize typesetting rules to meet various needs. Whether it’s academic papers, business reports, or personal projects, Typst can deliver professional-grade typesetting results.

      In summary, Typst is a user-friendly yet professional typesetting tool suitable for a wide range of document creation needs. Its introduction provides users with a new typesetting experience, making the typesetting process more enjoyable and efficient.

      This paper offers a template for undergraduate thesis in Peking University.
    ],
    keywords: ("Typesetting", "Undergraduate Thesis", "Typst"),
  )
}

#toc-page(outlined-depth: 3)

#show: main-content

= 基本功能 <intro>

请注意，你正在使用 #sys.version 版本的 Typst，请留意可能的差异。

#let example(code) = table(
  align: center,
  columns: (1fr, 1fr),
  table.header([代码], [渲染结果]),
  {
    import "@preview/zebraw:0.4.3": zebraw, zebraw-themes
    show: zebraw.with(lang: false, ..zebraw-themes.zebra)
    code
  },
  eval(
    if code.func() == figure {
      code.body.text
    } else { code.text },
    mode: "markup",
  ),
)

== 标题

Typst 中的标题使用 `=` 表示，其后跟着标题的内容。`=` 的数量对应于标题的级别。

除了这一简略方式，也可以通过 `heading` 函数自定义标题的更多属性。具体可以参考#link("https://typst.app/docs/reference/meta/heading/", [文档中的有关内容])。

下面是一个示例：

#example(```typ
#heading(level: 2, numbering: none, outlined: false, "二级标题")
#heading(level: 3, numbering: none, outlined: false, "三级标题")
#heading(level: 4, numbering: none, outlined: false, "四级标题")
#heading(level: 5, numbering: none, outlined: false, "五级标题")
```)

需要注意的是，这里的样式经过了本模板的一些定制，并非 Typst 的默认样式。

=== 三级标题

==== 四级标题

本模板目录的默认最大深度为 3，即只有前三级标题会出现在目录中。如果需要更深的目录，可以更改 `outlinedepth` 设置。

== 粗体与斜体

与 Markdown 类似，在 Typst 中，使用 `*...*` 表示粗体，使用 `_..._` 表示斜体。下面是一个示例：

#example(```typ
*bold* and _italic_ are very simple.
```)

由于绝大部分中文字体只有单一字形，这里遵循 `PKUTHSS` 的惯例，使用#strong[黑体]表示粗体，#emph[楷体]表示斜体。但需要注意的是，由于语法解析的问题， `*...*` 和 `_..._` 的前后可能需要空格分隔，而这有时会导致不必要的空白。 如果不希望出现这一空白，可以直接采用 `#strong` 或 `#emph`。

#example(```typ
对于中文情形，*使用 \* 加粗* 会导致额外的空白，#strong[使用 \#strong 加粗]则不会。
```)

== 脚注

从 v0.4 版本开始，Typst 原生支持了脚注功能。本模板中，默认每一章节的脚注编号从 1 开始。

#example(```typ
Typst 支持添加脚注#footnote[这是一个脚注。]。
```)

== 图片

在 Typst 中插入图片的默认方式是 `image` 函数。如果需要给图片增加标题，或者在文章中引用图片，则需要将其放置在 `figure` 中，就像下面这样：

#example(```typ
#figure(
  image("./figs/1-writing-app.png", width: 100%),
  caption: "Typst 网页版界面",
) <web>
```)

@web 展示了 Typst 网页版的界面。更多有关内容，可以参考 @about。@developers 中介绍了 Typst 的主要开发者。代码中的 `<web>` 是这一图片的标签，可以在文中通过 `@web` 来引用。


== 表格

在 Typst 中，定义表格的默认方式是 `table` 函数。但如果需要给表格增加标题，或者在文章中引用表格，则需要将其放置在 `figure` 中，就像下面这样：

#example(
  figure(
    ```typ
    #figure(
      table(
        columns: (auto, auto, auto, auto),
        inset: 10pt,
        align: horizon,
          [*姓名*],[*职称*],[*工作单位*],[*职责*],
          [李四],[教授],[北京大学],[主席],
          [王五],[教授],[北京大学],[成员],
          [赵六],[教授],[北京大学],[成员],
          [钱七],[教授],[北京大学],[成员],
          [孙八],[教授],[北京大学],[成员],
      ),
      caption: "答辩委员会名单",
    ) <table>
    ```,
    caption: [默认表格],
  ),
)

== 公式

@eq 是一个公式。代码中的 `<eq>` 是这一公式的标签，可以在文中通过 `@eq` 来引用。

#example(```typ
$ E = m c^2 $ <eq>
```)

@eq2 是一个多行公式。

#example(```typ
$
  sum_(k=0)^n k & = 1 + ... + n \
  & = (n(n+1)) / 2
$ <eq2>
```)

@eq3 到 @eq6 中给出了更多的示例。

#example(```typ
$ frac(a^2, 2) $ <eq3>
$ vec(1, 2, delim: "[") $
$ mat(1, 2; 3, 4) $
$ lim_x = op("lim", limits: #true)_x $ <eq6>
```)

== 代码块

像 Markdown 一样，我们可以在文档中插入代码块：

#example(````typ
```c
int main() {
  printf("Hello, world!");
  return 0;
}
```
````)

如果想要给代码块加上标题，并在文章中引用代码块，可以使用 `figure` 函数结合标签来实现：

#example(````typ
#figure(
  ```c
  int main() {
    printf("Hello, world!");
    return 0;
  }
  ```,
  caption: "Hello, world!",
) <code>
@code 是 C 语言的一个示例。
````)

== 参考文献

Typst 支持 BibLaTeX 格式的 `.bib` 文件，同时也新定义了一种基于 YAML 的文献引用格式。要想在文档中引用参考文献，需要在文档中通过调用 `bibliography` 函数来引用参考文献文件。下面是一个示例：

#example(```typ
可以像这样引用参考文献： @wang2010guide 和 @kopka2004guide。

#bibliography(
  "ref.bib",
  title: none,
  style: "ieee"
)
```)

注意代码中的 `"ref.bib"` 也可以是一个数组，比如 `("ref1.bib", "ref2.bib")`。

= 理论

== 理论一 <theory1>

让我们首先回顾一下 @intro 中的部分公式：

$ frac(a^2, 2) $
$ vec(1, 2, delim: "[") $
$ mat(1, 2; 3, 4) $
$
  lim_x =
  op("lim", limits: #true)_x
$

== 理论二

在 @theory1 中，我们回顾了 @intro 中的公式。下面，我们来推导一些新的公式：

#lorem(30)

#lorem(120)

#lorem(70)

= 展望

= 结论

= 关于 Typst <about>

== Typst 的开发者 <developers>

// TODO: 参考文献
