# BSc KT-verkfrøði Notes

Study notes and exam aids from the BSc in Software Engineering (KT-verkfrøði) at Setur, University of the Faroe Islands. One folder per course; each document is a LaTeX source with a ready-built PDF next to it.

| Course | Document | |
|---|---|---|
| Diskret støddfrøði (Discrete Mathematics, 005019.23), autumn 2026 | **Discrete Mathematics: Exam Companion** (Kolman chapters 1 to 7 with exam methods and worked examples; built to bring to the MC exams) | [PDF](discrete-math/exam-companion.pdf) · [source](discrete-math/exam-companion.tex) |

## Found a mistake?

Please [open an issue](../../issues) with the document, the section number and what is wrong, or send a pull request against the `.tex` file. These are unofficial study aids written by a student and may contain errors. Check anything important against the course material and the textbook.

## Building

You need a LaTeX distribution (TeX Live or MiKTeX) with `latexmk`. From the repo root:

```
latexmk -r latexmkrc -outdir=.build/discrete-math discrete-math/exam-companion.tex
```

The PDF appears in `.build/discrete-math/`. The class and style files are in `latex/`.

## License

[CC BY-NC-SA 4.0](LICENSE): share and adapt with credit, not for commercial use, under the same license. Course slides and textbooks used as sources belong to their authors and publishers. Not an official Setur document.
