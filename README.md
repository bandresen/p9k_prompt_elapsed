# Prompt for the [powerlevel9k zsh theme](https://github.com/bhilburn/powerlevel9k)

Credit for humanize_duration goes to [fisherman](https://github.com/fisherman/humanize_duration)

![](https://raw.githubusercontent.com/bandresen/p9k_prompt_elapsed/master/screenshot.png)

## Installation

Use a plugin manager for zsh, for example Zplugin to load it in your `.zshrc`

```bash
zplugin load bandresen/p9k_prompt_elapsed
```

## Configuration

Add `elapsed` to for example `POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS`

```bash
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(... elapsed ...)
```

### Colors

Default values for colors:

```bash
P9K_ELAPSED_BG_COLOR=${DEFAULT_COLOR}
P9K_ELAPSED_FG_COLOR="black"
```
