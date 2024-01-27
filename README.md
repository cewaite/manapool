<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
<!--     <img src="images/logo.png" alt="Logo" width="80" height="80"> -->
  </a>

  <h3 align="center">Manapool</h3>

  <p align="center">
    Fight the Dark and bring the magic back to the city
    <br />
    <a href="https://github.com/cewaite/manapool"><strong>Explore the docs »</strong></a>
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
      <ul>
        <li><a href="#spells">Spells</a></li>
        <li><a href="#modular-stat-components">Modular Stat Components
</a></li>
        <li><a href="#hitbox-and-hurtboxes">Hitbox and Hurtboxes</a></li>
        <li><a href="#globals">Globals</a></li>
      </ul>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#downloading-the-project">Downloading The Project</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Manapool, battle the Dark as a wizard surviving a magic dystopian city in this 2D isometric, souls-like, bullet hell. 

- Explore and fight through a level of enemies who drop Moonlight, the soulslike currency in the city.
- The wizard can carry a melee weapon and have memorized spells for their journey, both viable on their own but can be interweaved in combat. All the while, balancing health, mana used to cast magic and stamina. (Two ranged spells, two AOE spells equipped at all times. Melee attacks and dashing cost stamina, which recovers shortly after an attack or dodge. Successive melee attacks regain small amounts of mana).
- Levels are linear but can offer a more challenging or hidden path that reward (or punish) the player for taking.
- Enemies placed throughout the level provide challenge and Moonlight when defeated.
- Players rest at Manapools under the magic granting moonlight. Restores the players health and mana. Players can fast travel to other manapools, swap out equipped spells and use Moonlight to upgrade spells, weapons and wizard stats.
- Levels end in bosses, operating like a bullet hell with magic and like a souls like as the boss attacks players with melee.
- The wizard can dash to avoid attacks. (Holding to extent or tap for quick dash, allowing precise movement for the player).
- The wizard must weave their magic casting and melee attacking into their evasive movement to survive and purge the Dark.
- When the wizard dies, he drops all his Moonlight and respawns at their last Manapool. They can retrieve it or lose it if they fail to before they die again.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

Godot 4 Game Engine

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

I'm going to use this to explain architecture and organization in hopes that good foundations can make for an easily scalable game. This stuff is tentative; open to additions, improvements and refactoring, need be.

### Spells

Spells are structured in a hierarchy of inheritance, layed out at such:

- SpellParent
  - RangedSpell
    - Firebolt...
  - AOESpell
    - Whirlpool...

Each Spell has an associated SpellEffect, which is the actual projectile that is spawned when the spell is cast.

### Modular Stat Components

The Health, Mana and Stamina Components can got on any entity in any combination. You can overwrite their values in the inspector, but currently, these components look to their parent script (such as Player or Enemy, to determine and overwrite their attributes)

### Hitbox and Hurtboxes

Hitboxes collide with Hurtboxes to register damage. Pass a HealthComponent into a Hurtboxes inspector variable to connect them,

There is a third hitbox: SpellHitbox. Used for SpellEffects, they have two additional variables: is_players (Checked upon collision with a Hurtbox to negate frendly spell damage) and destroy_on hit (I hope, self explanatory).

### Globals

- SpellManager = Manages the spells the Ppayer has discovered, equipped and casts
- StatManager = Useless rn but may be needed to better UI implementation and/or stat upgrades for the player

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

A tentative list that should be refined and granularized as we progress.

Needs:
- [X] Marked finished tasks
- [ ] Add another ranged spell
- [ ] Add another AOE spell
- [ ] Spell Effects
    - [ ] "pull"/slow effect for whirlpool
    - [ ] firebolt sets enemies on fire
- [ ] Add melee attacks
    - [ ] 3 hit combo
    - [ ] Successive melee regains mana
- [ ] "Inventory"
    - [ ] Keep track of known/equipped spells
- [ ] Better Player UI
- [ ] Manapools
    - [ ] Checkpointing
    - [ ] Recover stats
    - [ ] Upgrades
    - [ ] Swapping spells
- [ ] Design a level
    - [ ] incorporate a trap/ambush
    - [ ] incorporate a secret/hidden path
    - [ ] Have at least two branching paths
- [ ] Enemy design
    - [ ] Basic enemy, melee only
    - [ ] 2 spell casting and melee enemies
    - [ ] Final boss

Wants:
- [ ] Improved Enemy AI
- [ ] Items
    - [ ] Health/Mana potions
    - [ ] Damage buffs
- [ ] Teleporting for Manapools
- [ ] More Spells
- [ ] More enemies
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- PULLING -->
## Downloading the Project

1. Create a folder in your Godot project directory; whereever you want to store the game

2. https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository

3. Import the project into Godot and you're set

Up to you if you want to fork off onto other branches, just remember to oull before working and push when you've made enough progress. If we run into merge errors, we can try sorting it out but ultimately it would be easier if we kept our workflow linear. We can communicate when we'll be working and when we've pushed. 

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [Img Shields](https://shields.io)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [React Icons](https://react-icons.github.io/react-icons/search)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
