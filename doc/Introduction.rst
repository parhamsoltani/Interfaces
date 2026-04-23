Introduction
############

Naming Convention
*****************

Types
=====

:``***_Interface``:    All IC internal interface records are suffixed with ``_Interface``.
:``***_PcbInterface``: All IC external interface records are suffixed with ``_PcbInterface``.
:``***_Vector``:       All arrays are suffixed with ``_Vector`` following the IEEE Std. 1076 naming scheme. |br|
                       An array of an interface is ``_Interface_Vector``.
:``***_***View``:      All mode views are suffixed with ``_***View``, where \*\*\* is describing the point of view.

Generics
========

:``***_BITS``:         The number of bits.
:``***_COUNT``:        The number of items.


Packages
********



Member Data Types
*****************

* For IC internal interfaces, unresolved data types are used:

  * ``std_ulogic``,
  * ``std_ulogic_vector``,
  * ``unresolved_unsigned``,
  * ``unresolved_signed``,
  * ...

* For IC external interfaces, resolved data types are used:

  * ``std_logic``,
  * ``std_logic_vector``,
  * ``unsigned``,
  * ``signed``,
  * ...

* Data and control signals are implemented using ``std_(u)logic`` or ``std_(u)logic_vector`` data types.
* Addresses, counters, ... signals (with arithmetic/numeric meaning) are implemented using ``(unresolved_)unsigned`` or
  ``(unresolved_)signed`` data types.
* Integer and real data types shouldn't be used in interfaces.
* Arrays of fixed sizes should use a previously defined constrained array subtype.
* Commands, status codes, return codes, ... where binary mapping is predefined, are implemented as constrained arrays. |br|
  Each code should declare a set of constants.
* Status codes, return codes, ... where no binary mapping is defined by the standard, are implemented using
  enumeration types.
