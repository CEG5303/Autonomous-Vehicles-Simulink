<p align="center">
  <a href="" rel="noopener">
 <img src="https://logodix.com/logo/1729492.png" alt="Bot logo"></a>
</p>

<h3 align="center">Autonomous Vehicles on Simulink</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/CEG5303/Autonomous-Vehicles-Simulink?style=plastic)](https://github.com/CEG5303/Autonomous-Vehicles-Simulink/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/CEG5303/Autonomous-Vehicles-Simulink)](https://github.com/kylelobo/The-Documentation-Compendium/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> 🚗 Dynamic Modelling of Intelligent Autonomous Vehicles.
    <br> 
</p>

## 📝 Table of Contents

- [About](#about)
- [Demo / Working](#demo)
- [How it works](#working)
- [Usage](#usage)
- [Getting Started](#getting_started)
- [Deploying your own bot](#deployment)
- [Built Using](#built_using)
- [TODO](../TODO.md)
- [Contributing](../CONTRIBUTING.md)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)

## 🧐 About <a name = "about"></a>

Minilab for Autonomous Vehicles Simulation in Matlab:
<table style="width:100%">
  <tr></tr>
    <th>Item</th>
    <th>Description</th>
    <th>Weights</th>
  <tr>
    <td>i</td>
    <td>Basic Realization: the successful implementation of the task that includes building the basic dynamic formulation and model of the autonomous vehicles you choose and realize the position tracking task for specific input signal in MATLAB or Simulink.</td>
    <td>70%</td>
  </tr>
  <tr>
    <td>ii</td>
    <td>Optimized and More Accurate Dynamic Model: take different structure autonomous vehicles into consideration in your dynamic modeling and optimizing the ultimate control perf</td>
    <td>20%</td>
  </tr>
  <tr>
    <td>iii</td>
    <td>Realize different driving function: consider more complex driving environment (e.g. multiple vehicles or intersection left/right turn) and implement your desig</td>
    <td>10%</td>
  </tr>
</table>

## 🎥 Demo / Working <a name = "demo"></a>

<div class="tenor-gif-embed" data-postid="14176897" data-share-method="host" data-aspect-ratio="1.51095" data-width="50%">from <a href="https://tenor.com/search/car-gifs">Car GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>

## 💭 How it works <a name = "working"></a>

The bot first extracts the word from the comment and then fetches word definitions, part of speech, example and source from the Oxford Dictionary API.

If the word does not exist in the Oxford Dictionary, the Oxford API then returns a 404 response upon which the bot then tries to fetch results form the Urban Dictionary API.

The bot uses the Pushshift API to fetch comments, PRAW module to reply to comments and Heroku as a server.

The entire bot is written in Python 3.6

## 🎈 Usage <a name = "usage"></a>

To use the bot, type:

```
!dict word
```

The first part, i.e. "!dict" **is not** case sensitive.

The bot will then give you the Oxford Dictionary (or Urban Dictionary; if the word does not exist in the Oxford Dictionary) definition of the word as a comment reply.

### Example:

> !dict what is love

**Definition:**

Baby, dont hurt me~
Dont hurt me~ no more.

**Example:**

Dude1: Bruh, what is love?
Dude2: Baby, dont hurt me, dont hurt me- no more!
Dude1: dafuq?

**Source:** https://www.urbandictionary.com/define.php?term=what%20is%20love

---

<sup>Beep boop. I am a bot. If there are any issues, contact my [Master](https://www.reddit.com/message/compose/?to=PositivePlayer1&subject=/u/Wordbook_Bot)</sup>

<sup>Want to make a similar reddit bot? Check out: [GitHub](https://github.com/kylelobo/Reddit-Bot)</sup>

## 🏁 Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them.

```
Give examples
```

### Installing

A step by step series of examples that tell you how to get a development env running.

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo.

## 🚀 Deploying your own bot <a name = "deployment"></a>

To see an example project on how to deploy your bot, please see my own configuration:

- **Heroku**: https://github.com/kylelobo/Reddit-Bot#deploying_the_bot

## ⛏️ Built Using <a name = "built_using"></a>

- [PRAW](https://praw.readthedocs.io/en/latest/) - Python Reddit API Wrapper
- [Heroku](https://www.heroku.com/) - SaaS hosting platform

## ✍️ Authors <a name = "authors"></a>

- [@kylelobo](https://github.com/kylelobo) - Idea & Initial work

See also the list of [contributors](https://github.com/kylelobo/The-Documentation-Compendium/contributors) who participated in this project.

## 🎉 Acknowledgements <a name = "acknowledgement"></a>

- Hat tip to anyone whose code was used
- Inspiration
- References
