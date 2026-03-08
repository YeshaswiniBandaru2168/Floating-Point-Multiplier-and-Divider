# Floating-Point-Multiplier-and-Divider

## **Project Overview**

This repository features a high-performance Verilog implementation of a 32-bit Floating-Point Multiplier and Divider. The design adheres to the **IEEE-754 Single-Precision** format, enabling precise multiplication and division of real numbers in hardware environments.

### **Core Specifications**

* **Standard**: IEEE-754 Single Precision.


* **Word Length**: 32 bits (1-bit Sign, 8-bit Exponent, 23-bit Mantissa) .


* **Functionality**: Multi-mode arithmetic unit (Mode 0: Multiplication, Mode 1: Division).



---

## **Technical Architecture**

The `floating_point_multi_div` module operates through a combinational logic path optimized for exponent manipulation and mantissa scaling:

### **1. Signal Extraction & Zero Detection**

* **Field Extraction**: The module decomposes inputs into sign bits, biased exponents, and fractional parts .


* **Implicit Bit Addition**: A leading `1` is added to the fractions to form 24-bit mantissas .


* **Zero Handling**: If either input operand is zero, the logic forces the result to zero immediately to prevent invalid arithmetic .



### **2. Multiplication Logic (Mode 0)**

* **Exponent Processing**: Adds exponents and subtracts the bias ($127$) to maintain correct IEEE-754 scaling.


* **Mantissa Product**: Multiplies the two 24-bit mantissas to generate a 48-bit intermediate product.


* **Normalization**: If the product overflows (bit 47), the module shifts the mantissa and increments the exponent .



### **3. Division Logic (Mode 1)**

* **Exponent Processing**: Subtracts the divisor exponent from the dividend and adds the bias ($127$).


* **Quotient Calculation**: Performs a 24-bit division after left-shifting the dividend to preserve precision.


* **Normalization**: Checks for the leading bit and adjusts the exponent and mantissa to ensure the result is normalized .
