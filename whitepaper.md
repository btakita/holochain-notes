# Holochain [Whitepaper](https://github.com/Holochain/holochain-proto/blob/whitepaper/holochain.pdf)

Two canoncial types of Distributed Systems (with overlap being common):

**agent centric**

Agents share independently evolving data realities.

* Holochain
* git
	
**data-centric**

Nodes gossip to create shared data reality.

* Bitcoin

## Formalism

*Ν* = {n<sub>1</sub>,n<sub>2</sub>,...n<sub>n</sub>}

*N* ***nodes*** or ***agents***

*S* ∋ {*σ*<sub>1</sub>,*σ*<sub>2</sub>...,*σ*<sub>*i*</sub> }

*S*<sub>n</sub> is the ***state*** of node *n*

∀*σ*<sub>*i*</sub> ∈ *S*<sub>n</sub> : *σ*<sub>i</sub> = {*X*<sub>i</sub>,*D*<sub>i</sub>}

*X*<sub>i</sub> is a ***hash-chain***

*D* is a set of non-hash chain ***data elements***

*H* is a cryptographically secure hash function

*t* is a ***transaction***

*τ* is a ***state transition function***

*τ*(*σ*<sub>*i*</sub>,*t*) = (*τ*<sub>*x*</sub>(*X*<sub>i</sub>,*t*), *τ*<sub>*D*</sub>(*D*<sub>i</sub>,*t*))

*τ*<sub>*x*</sub>(*X*<sub>*i*</sub>,*t*) = *X*<sub>*i*+1</sub>

*X*<sub>*i*+1</sub> = *X*<sub>*i*</sub> ∪ {*x*<sub>*i*+1</sub>} = {*x*<sub>1</sub>,...,*x*<sub>*i*</sub>,*x*<sub>*i*+1</sub>}

*x*<sub>1</sub> = {*h*,*t*}

*h* = {*H*(*t*),*y*}

*y* = {*H*(*x*<sub>*j*</sub>) | *j* < *i*}

*h* is a ***header***

*D*<sub>*i*+1</sub> = *τ*<sub>*D*</sub>(*σ*<sub>*i*</sub>, *t*)

*V* is a ***validation***

*V*(*t*,*v*) verifies the validity of *t* and only if valid calls a transition function, *τ*, for *t*. 

*v* is extra ***validation data***

*I* is the ***input*** or ***stimulus*** function

*I*(*t*) takes *t*, evaluates *t* using *V*, if valid, uses *τ* to transform *S*

*P* is a ***processing*** function

*P*(*x*) can create *t* and trigger *V* and *τ*; and *P* is triggered by state changes or passage of time.

*C* is a ***channel*** that allows all nodes in *N* to communicate,
where each *n* has a unique ***address*** *A*<sub>n</sub>

*A*<sub>n</sub> is a unique ***address*** for *n*

{*C*,*N*} is the ***network***

*E* is the ***evolution*** function

*E*(*i*) changes functions *V*,*I*,*P*