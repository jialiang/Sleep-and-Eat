# Sleep and Eat

![Preview screenshot](https://github.com/jialiang/Sleep-and-Eat/blob/master/preview.png?raw=true)

This is a mod for the game Kingdom Come: Deliverance 2 that increases Henry's exhaustion and digestion rates by 67%.

Inspired by [Rebalanced Hunger (PTF)](https://www.nexusmods.com/kingdomcomedeliverance2/mods/649) by bulhaneul.

## Configuration

To change the exhaustion and digestion rates, edit the `buff_params` attribute in `Data/Libs/Tables/rpg/buff__sleep_and_eat.xml`. Current value is `exh%1.67,dig%1.67`.

## Building

Run `Build.ps1` with PowerShell. This will:

1. Pack `Data/` into `sleep_and_eat.pak`
2. Pack `Localization/` into `English_xml.pak`
3. Bundle everything with `mod.manifest` into `sleep_and_eat.zip`

## Installation

Extract `sleep_and_eat.zip` into your KCD2 mods directory (`D:\SteamLibrary\steamapps\common\KingdomComeDeliverance2\Mods\`). If the `Mods` folder doesn't exist, create it.

## Verification

To confirm that the mod is working:

- You will see a perk called Sleep and Eat under Player > Stats > Main Level
- You will see a buff called Sleep and Eat under Player > Buffs
