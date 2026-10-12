# Discrete Mathematics: Exam Companion

A printable exam companion for **Diskret støddfrøði** (Discrete Mathematics, 005019.23), Setur, autumn 2026. It follows Kolman, Busby & Ross, *Discrete Mathematical Structures*, 6th ed., chapter by chapter, and is meant to be brought to the MC exams, where notes are allowed.

**[Download the PDF](exam-companion.pdf)** (or see the latest [Release](../../releases/latest)).

## What is in it

- The lecture material (slides DM_1_1 to DM_8_1, Esther Chen) merged with the textbook into one document, ordered by Kolman chapter, with one index.
- **Exam method** subsections: step-by-step recipes for the typical MC question types, each with worked examples (counting, recurrences, relations, functions, growth, posets and lattices, Boolean algebras, circuits and Karnaugh maps, trees, spanning trees).
- A multiplication table and a list of primes up to 2500.
- Yellow shading marks rules, laws and theorems. "Slide erratum" marks a mistake on a slide, with the textbook's correct version.

## Found a mistake?

Please [open an issue](../../issues) with the section number and what is wrong, or send a pull request against `exam-companion.tex`. This is an unofficial study aid written by a student and it may contain errors. Check anything important against the textbook.

## Building it yourself

You need a LaTeX distribution (TeX Live or MiKTeX) with `latexmk`:

```
latexmk exam-companion.tex
```

The PDF is written to `.build/exam-companion.pdf`.

## License

[CC BY-NC-SA 4.0](LICENSE): share and adapt with credit, not for commercial use, under the same license. The lecture slides this builds on belong to their author; the textbook is Kolman, Busby & Ross (Pearson).

Not an official Setur document.
