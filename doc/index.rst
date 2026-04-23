VHDL Interfaces
===============

.. grid:: 3

   .. grid-item::
      :columns: 8

      This repository provides generic VHDL-2019 **Interfaces** (*mode views*) descriptions of commonly used interfaces
      like UART, I²C, ..., AXI, WishBone, Avalon, ..., MII, GMII, SGMII, ...

      Interfaces are defined in 2 stages (see example to the right):

      1. Define all necessary signals in a VHDL record type. If interfaces are more complicated and grouped in
         sub-interfaces, records can be nested. If a record sub-element is an array, usually these sub-elements are
         unconstrained, thus they can be constrained later.
      2. Define a ``view``, which defines *directions* (modes) for each record sub-element. Usually, the reverse
         view is created by creating an alias using the ``'converse`` attribute.

   .. grid-item::
      :columns: 4

      .. code-block:: vhdl

         library IEEE;
         use     IEEE.std_logic_1164.all;

         package JTAG is
            type JTAG_Interface is record
               TCK  : std_logic;  -- Test Clock
               TRST : std_logic;  -- Test Reset
               TMS  : std_logic;  -- Test Mode Select
               TDI  : std_logic;  -- Test Data In
               TDO  : std_logic;  -- Test Data Out
            end record;

            view JTAG_DeviceView of JTAG_Interface is
               TCK  : in;
               TRST : in;
               TMS  : in;
               TDI  : in;
               TDO  : out;
            end view;
            alias JTAG_TesterView is JTAG_DeviceView'converse;
         end package;


Supported Interfaces
********************

.. grid:: 4

   .. grid-item-card:: AMBA
      :columns: 3

      * :doc:`AXI`:

        * :ref:`AXI4/Full`
        * :ref:`AXI4/Lite`
        * :ref:`AXI4/Stream`

   .. grid-item-card:: Avalon
      :columns: 3

      * :ref:`Avalon/MM`
      * :ref:`Avalon/ST`

   .. grid-item-card:: WishBone
      :columns: 3

      * :ref:`WB/OpenCores`

        * :ref:`WB/OpenCores/B3`
        * :ref:`WB/OpenCores/B4`

      * :ref:`WB/FOSSi`

        * :ref:`WB/FOSSi/WB`

   .. grid-item-card:: PoC Library
      :columns: 3

      * :ref:`POC/CSE`
      * :ref:`POC/FIFO`

   .. grid-item-card:: I/O
      :columns: 3

      * :ref:`IO/BiSS`
      * :ref:`IO/I2C`
      * :ref:`IO/I2S`
      * :ref:`IO/JTAG`
      * :ref:`IO/SPI`
      * :ref:`IO/UART`

   .. grid-item-card:: PCI Express
      :columns: 3

      * :ref:`PCIE`

   .. grid-item-card:: Network
      :columns: 3

      * Ethernet

        * MII
        * RMII
        * GMII
        * RGMII
        * SGMII

      * Cages:

        * SFP
        * QSFP

   .. grid-item-card:: Video
      :columns: 3

      * MIPI:

        * :ref:`VIDEO/MIPI/CPHY`
        * :ref:`VIDEO/MIPI/DPHY`
        * :ref:`VIDEO/MIPI/MPHY`

      * VESA

        * :ref:`VIDEO/VESA/VGA`


.. _ADOPTERS:

Adopters
********

* `Paebbels/BigDesign <https://github.com/Paebbels/BigDesign>`__
* ... (*Contact the maintainer to get listed.*)


.. _TESTS:

Tests
*****

* VHDL-2019 syntax checked by `NVC <https://github.com/nickg/nvc>`__. |br|
  See :ref:`test results <RPT/Unittests>`.


.. _CONTRIBUTORS:

Contributors
************

* `Patrick Lehmann <https://github.com/Paebbels>`__ (Maintainer)
* `Parham Soltani <https://github.com/parhamsoltani>`__
* `and more... <https://GitHub.com/VHDL/Interfaces/graphs/contributors>`__


.. _LICENSE:

License
*******

This VHDL library (source code) is licensed under :doc:`Apache License 2.0 <Code-License>`. |br|
The accompanying documentation is licensed under :doc:`Creative Commons - Attribution 4.0 (CC-BY 4.0) <Doc-License>`.


.. # ===========================================================================
   # Table of Contents
   # ===========================================================================

.. toctree::
   :caption: Overview
   :hidden:

   Introduction
   Usage

.. toctree::
   :caption: Interfaces
   :hidden:

   AXI
   Avalon
   IO
   Network
   PCIe
   PoC
   Video
   WishBone

.. toctree::
   :caption: Appendix
   :hidden:

   tests/index
   Code-License
   Doc-License
   genindex
