SmtAda is an Ada package that provides a common Smt-Lib 2 frontend, with
support for several Smt provers in the backend. The provers currently
supported are :
 * Z3 
 * Yices 1 
 * CVC3 
 * CVC4

Support for MathSat is under development. Future plans include a binding
for the Alt-Ergo provers.

The SmtAda library is still in its first stage of development. Essentially,
the components which are more mature are the provers backends. These are 
just thin bindings for the corresponding C APIs. A common wrapper for a
set of commun, core constructions is still under development.


