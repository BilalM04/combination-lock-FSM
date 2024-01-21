# Moore FSM Combination Lock for DE1-SOC Board

This project implements a Moore Finite State Machine (FSM) combination lock in Verilog specifically designed for the DE1-SOC Board. The combination lock operates based on a predefined 4-bit sequence of inputs, with added security features such as an alarm after two incorrect tries and the ability to change the combination.

## Overview

The combination lock is implemented using a Moore FSM model, where the output is solely determined by the current state. The DE1-SOC Board serves as the hardware platform for this Verilog implementation, ensuring compatibility and seamless integration.

## Features

- **Finite State Machine (FSM):** Utilizes a Moore FSM model for handling the combination lock's logic and transitions.

- **4-Bit Combination:** The combination lock operates on a secure 4-bit sequence, ensuring a broad range of possibilities for access control.

- **Alarm on Incorrect Tries:** In the event of two consecutive incorrect combination attempts, an alarm will be triggered, enhancing security measures.

- **Change Combination:** Users have the ability to change the combination, adding flexibility and customization to the access control system.

- **DE1-SOC Board Compatibility:** Designed specifically for the DE1-SOC Board to ensure proper hardware interaction.
