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

*S* ∋ {*σ*<sub>1</sub>,*σ*<sub>2</sub>...,*σ<sub>i</sub>* }

*S*<sub>n</sub> is the ***state*** of node *n*

∀*σ<sub>i</sub>* ∈ *S*<sub>n</sub> : *σ*<sub>i</sub> = {*X*<sub>i</sub>,*D*<sub>i</sub>}

*X*<sub>i</sub> is a ***hash-chain***

*D* is a set of non-hash chain ***data elements***

*H* is a cryptographically secure hash function

*t* is a ***transaction***

*τ* is a ***state transition function***

*τ*(*σ<sub>i</sub>*,*t*) = (*τ<sub>x</sub>*(*X<sub>i</sub>*,*t*), *τ<sub>D</sub>*(*D*<sub>i</sub>,*t*))

*τ<sub>x</sub>*(*X<sub>i</sub>*,*t*) = *X<sub>i+1</sub>*

*X<sub>i*+1</sub> = *X<sub>i</sub>* ∪ {*x<sub>i*+1</sub>} = {*x*<sub>1</sub>,...,*x<sub>i</sub>*,*x<sub>i*+1</sub>}

*x*<sub>1</sub> = {*h*,*t*}

*h* = {*H*(*t*),*y*}

*y* = {*H*(*x<sub>j</sub>*) | *j* < *i*}

*h* is a ***header***

*D<sub>i+1</sub>* = *τ<sub>D</sub>*(*σ<sub>i</sub>*, *t*)

*V* is a ***validation***
; and 
*V*(*t*,*v*) verifies the validity of *t* and only if valid calls a *state transition function*, *τ*, for *t*. 

*v* is extra ***validation data***

*I* is the ***input*** or ***stimulus*** function

*I*(*t*) takes *t*, evaluates *t* using *V*, if valid, uses *τ* to transform *S*

*P* is a ***processing*** function

*P*(*x*) can create *t* and trigger *V* and *τ*; and *P* is triggered by state changes or passage of time.

*C* is a ***channel*** that allows all nodes in *N* to communicate,
where each *n* has a unique ***address*** *A<sub>n</sub>*

*A*<sub>n</sub> is a unique ***address*** for *n*

{*C*,*N*} is the ***network***

*E* is the ***evolution*** function

*E*(*i*) changes functions *V*,*I*,*P*

### Formalism Usage

Model separately key aspects of agents.

1. Separate agent's state into {*X*,*D*}. Part *X* (cryptographically secured hash-chain) and part *D* (arbitrary data)
1. *V(*t*,*v*)* - Validate *V* new transactions *t*
1. *τ<sub>X</sub>* and *τ<sub>D</sub>* to change internal *S* or {*X*,*D*} of the agent

Distinguish between:

1. *τ*(*t*,*v*) triggered by external events, stimuli, received through *I*(*t*)
1. node's internal processing *P*(*x*) ∴ (*V* || *τ*) called with *t* being internally created

### Key Properties of Distributed Systems

*A<sub>n</sub>* is the ***address*** for Node *n*

*pk<sub>n</sub>* is the ***public key*** for Node *n*

1. ***trusted*** — Call *N* for which any function *T*, *V*, *P*, *E* are reliably known and known to be identical for *N*
1. ***secure*** — Call channel *C* where messages in transit can be trusted to arrive exactly as sent
1. ***authenticated*** — *A*<sub>n</sub> = *H*(*pk*<sub>n</sub>) — all messages include a digital signature of the message signed by sender
1. ***content addressable*** — data element accessible by it's hash

***trustless system*** — Assume untrusted nodes, use cryptography, *H*, to verify, *V*, trust

***intrinsic data integrity*** — locus of trust is on state data instead of other nodes 