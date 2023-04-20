#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "MA2116 Notes",
  authors: "junwu"
)

#let Var = math.op("Var")
#let Cov = math.op("Cov")
#let Bin = math.op("Bin")
#let Po = math.op("Po")
#let Exp = math.op("Exp")
#let vb(body) = math.upright(math.bold(body))

// We generated the example code below so you can see how
// your document will look. Go ahead and replace it with
// your own content!

#columns(2, gutter: 1.3em)[
== Definitions
$ E[X] = integral_Omega x f_X(x)dif x $
$ Var(X) = E[(X-mu)^2] = E[X^2] - E[X]^2 $
$ Cov(X,Y) = E[(X-mu_X)(Y-mu_Y)] = E[X Y] - E[X]E[Y] $
$ rho(X,Y) = frac(Cov(X,Y), sqrt(Var(X) Var(Y))) $
$ M_X(t) = E[e^(t X)] = integral_Omega e^(t x)f_X(x)dif x $

== Useful results

=== Independence

- $X,Y$ independent iff
  - $f_(X,Y)(x,y)=f_X(x)f_Y(y)$
  - $f_(X|Y)(x|y)=f_X(x)$ or vice versa
  - $F_(X,Y)(x,y)=F_X(x)F_Y(y)$
  - $M_(X,Y)(s, t) = M_X(s)M_Y(t)$

- Independent $=> Cov(X,Y) = 0$.

=== Sum of random variables

$ F_(X+Y)(x) = integral_(-oo)^(oo) F_X(x - y)f_Y(y)dif y $
$ f_(X+Y)(x) = integral_(-oo)^(oo) f_X(x - y)f_Y(y)dif y $

- Expectation and covariance are linear
  - $=>$ Variance is linear *when independent*

- Sum of *independent*
  - Normals is normal
  - Poissons is Poisson
  - Gammas with same $lambda$ is gamma
  - Binoms with same $p$ is binom

=== Density stretching theorem

Suppose $g: RR^n supset Omega -> RR^n$ is differentiable with global differentiable inverse, thought of as $Y_i = g_i(X_1, ..., X_n)$. Then
$ f_(Y_1, ..., Y_n)(y_1, ..., y_n) = abs(J(g))^(-1) f_(X_1, ..., X_n)(x_1, ..., x_n). $

=== Equations, inequalities, formulas
- Total expectation:
$ E[X]=E[E[X|Y]] $
- Total variance:
$ Var(X) = E[Var(X|Y)] + Var(E[X|Y]) $
- Markov's inequality (nonnegative $X$):
$ P(X>=alpha) <= E[X]/alpha $
- Chebyshev's inequalities:
$ P(|X-mu|>=alpha)<=Var(X)/a^2 $
$ P(X >= mu + alpha) <= Var(X)/(Var(X)+a^2) $
- Weak Law of Large Number ($X_n$ i.i.d.):
$ P(|overline(X)_n-mu|>=epsilon)-> 0 $
- Strong Law of Large Number ($X_n$ i.i.d.):
$ lim_(n->oo)overline(X)_n = delta(mu) $
- Central Limit Rheorem ($X_n$ i.i.d.):
$ sqrt(n)(overline(X)_n-mu) -> N(0,sigma^2) $
]
#pagebreak()
#page(flipped: false)[
#table(
  align: center + horizon,
  columns: (1.3fr, 1.5fr, 0.8fr, 1.2fr, 1.5fr),
  "Name", "pdf", $E[X]$, $Var(X)$, "mgf",
  
  $Bin(n, p)$, $ binom(n, k)p^k q^(n-k) $, 
    $n p$, $n p q$, $(q+p e^t)^n$,
    
  $op("Geo")(p)$, $p q^(k-1)$, $ 1/p $, $ q/p^2 $, $ (p e^t)/(1-q e^t) $,
  
  $op("HG")(n, m, N)$, $ (binom(N-m, n-m)binom(n, m))/binom(N, m) $,
    $n p$, $ n p q (N-n)/N $, $ * p = m/N $,
    
  $Po(lambda)$, $ e^(-lambda)lambda^k/(k!) $, $lambda$,
    $lambda$, $exp(lambda e^(t-1))$
)

#table(
  align: center + horizon,
  columns: (0.8fr, 1.9fr, 0.8fr, 0.8fr, 1.5fr),
  "Name", "pdf", $E[X]$, $Var(X)$, "mgf",
  
  $U(alpha, beta)$, $ 1/(beta - alpha) $, $ (alpha + beta)/2 $,
    $ 1/12 (beta-alpha)^2 $, $ (e^(beta t)-e^(alpha t))/((beta-alpha)t) $,
    
  $Exp(lambda)$, $ lambda e^(-lambda x) $,
    $ 1/lambda $, $ 1/lambda^2 $, $ lambda/(lambda - t) ", " t < lambda $,
    
  $N(mu, sigma^2)$, $ 1/(sigma sqrt(2pi))exp(-1/2((x-mu)/sigma)^2) $, $mu$,
    $sigma^2$, $ exp(mu t + (sigma^2 t^2)/2) $,
    
  $Gamma(alpha, lambda)$, 
    [$ frac(lambda e^(-lambda x)(lambda x)^(alpha - 1), Gamma(alpha)) $ $ *Gamma(alpha) = integral_0^oo e^(-y)y^(alpha - 1)dif y $],
    $ alpha/lambda $, $ alpha/lambda^2 $, $ (1-t/lambda)^(-alpha)", " t < lambda $
)
]