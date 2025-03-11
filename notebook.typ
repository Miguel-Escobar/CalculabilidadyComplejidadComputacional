#import "./preamble.typ": *
#import "@preview/finite:0.4.1": automaton

#set text(
  font: "JetBrainsMono NF",
  fill: textcolors.at(0), 
  lang: "es")
#let up = sym.arrow.t
#let down = sym.arrow.b
#show emph: set text(textcolors.at(1))
#show strong: set text(textcolors.at(2))
#show: thmrules

#set page(fill: backgroundcolor)

// #show heading.where(level: 1): set text(headingcolors.at(0))
// #show heading.where(level: 2): set text(headingcolors.at(1))
// #show heading.where(level: 3): set text(headingcolors.at(2))
// #show heading.where(level: 4): set text(headingcolors.at(3))


#set math.equation(numbering: "(1)")
#set par(justify: true)
#set table(stroke: tablecolor)


#align(center, [#text(18.4pt)[
  Calculabilidad y Complejidad Computacional] \ #text(13pt)[Clase 1]
])

= Automatas finitos

#definición[Un alfabeto $Sigma$ es un conjunto finito (supongo que no vacío) cuyos elementos nombramos caracteres.]

#bloque[ Convenciones:
- $Sigma^* = union_(n in NN) Sigma^n$ donde $Sigma^0 = {epsilon}$ es la palabra vacía. Convención: $epsilon in.not Sigma$.
- A una tupla en $Sigma^n$ la podemos denotar $omega = omega_1 omega_2 omega_3 ... omega_n$. Tenemos en este caso que su largo $abs(w) = n$.
]

#definición[Un lenguaje $L$ sobre el alfabeto $Sigma$ es un subconjunto de $Sigma^*$]

Un lenguaje lleva asociado un problema de decisión, es decir, ver si esque está o no un elemento de $Sigma^*$ en $L$.

#definición("Automata finito")[Una 5-tupla $A = (Q, Sigma, delta, s, F)$ es un auomata finito determinista (AFD) si:
- $Q$ es un conjunto finito de _estados_.
- $Sigma$ es un _alfabeto_ (de entrada).
- $delta: Q times Sigma arrow.r Q$ es una _función de transición_.
- $s in Q$ es el _estado de partida_.
- $F subset Q$ son los _estados finales de aceptación_.]

Un automata finito se puede describir mediante un dibujito pero mi typst no es tan poderoso todavía. Mentira wajaja.

#automaton((
  q0: (q1:0, q0:"0,1"),
  q1: (q0:(0,1), q2:"0"),
  q2: (),
  ),
  style:(
    state:(fill: none, stroke: textcolors.at(2)),
    stroke: textcolors.at(2),
  )
)

Ok se ve horrible. Bueno pero la idea está. Las flechas me indican la función de transición, los nodos son los estados posibles (junto con uno que se subentiende que es el sumidero, a lo que va todo lo que no tenga flecha de salida), las posibles etiquetas de las flechas son el alfabeto. El punto de partida es el que se marca ahí con start, o la flecha que no viene de ningún lado.