# CompArch 2015 Midterm
##### David Abrahams

## Specification Document

### Operational Modes

There are four operational modes for the bike light. They are, in order:

* Off -- The LED stays `LOW`.
* On -- The LED stays `HIGH`.
* Blinking -- The LED flickers between `LOW` and `HIGH`. This is a relatively slow flicker; the LED holds state for many clock cycles before changing. We will assume that the Blinking stage has a period of 1 second, meaning that for a 32,768 Hz clock, the state changes every 16,384 clock cycles.
* Dim -- The LED stays on, but is dimmed. We achieve this through PWM. In order for the LED to be dim, on every clock positive edge, the LED will change states. Therefore, it will flicker so quickly it will appear dim to a human eye.

### Specification Summary

* Clock speed -- 32,768 Hz
* Period of Blinking state -- 1 second
* Frequency of Dim state -- 16,384 Hz. This is half the clock speed because it takes two clock cycles to cycle through all Dim states: 1 cycle for `HIGH`, 1 cycle for `LOW`.

### Input

This bike light has a single input button. The button has two states, `HIGH` when pressed and `LOW` otherwise. The input button causes the current state to shift forward on its negative edge (and in the case of the button being pressed while the state is Dim, the state is reset to Off). We increment the state on the negative edge because the light switches state when the button is released. This is a design decision that we make.

### Output

Our output is a single LED which can either be on or off. The following is a graph of LED output for each operational mode. Note that the LED can only be `HIGH` or `LOW`, so for the Dim state, we use PWM to simulate dimming.

![](images/led_states,jpg)

### FSM

Shown below is an FSM representation of our bike light. There are six different states for the FSM:

* Off -- The light is off. This state transitions to On on a button release.
* On -- The light is on. This state transitions to Blink_On on a button release.
* Blink_On -- The light is in the Blinking operational mode. The light is currently on. It stays in this FSM state for 16,384 clock cycles, and then transitions to Blink_Off. On a button release, this state transitions to Dim_On.
* Blink_Off -- The light is currently off. It stays in this FSM state for 16,384 clock cycles, and then transitions to Blink_On. On a button release, this state transitions to Dim_On.
* Dim_On -- The light is in the Dim operational mode. The light is currently on. It transitions to Dim_Off every clock cycle, unless there is a button release, in which case this state transitions to Off.
* Dim_Off -- The light is in the Dim operational mode. The light is currently off. It transitions to Dim_On every clock cycle, unless there is a button release, in which case this state transitions to Off.
