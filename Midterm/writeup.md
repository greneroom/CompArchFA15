# CompArch 2015 Midterm
##### David Abrahams

## Specification Document

### Operational Modes

There are four operational modes for the bike light. They are, in order:

* Off -- The LED stays `LOW`.
* On -- The LED stays `HIGH`.
* Blinking -- The LED flickers between `LOW` and `HIGH`. This is a relatively slow flicker; the LED holds state for many clock cycles before changing. We will assume that the Blinking stage has a period of 1 second, meaning that for a 32,768 Hz clock, the state changes every 16,384 clock cycles.
* Dim -- The LED stays on, but is dimmed. We achieve this through PWM. In order for the LED to be dim, on every clock positive edge, the LED will change states. Therefore, it will flicker so quickly it will appear dim to a human eye.

### Input

This bike light has a single input button. This input button causes the current state to shift forward.
