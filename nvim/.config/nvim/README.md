# Configuration Neovim Modulaire avec Lazy.nvim

Configuration Neovim moderne, modulaire et performante utilisant lazy.nvim.

## 📁 Structure des fichiers

```
~/.config/nvim/
├── init.lua                          # Point d'entrée principal (minimaliste)
│
├── lua/
│   ├── config/                       # Configuration générale
│   │   ├── options.lua              # Options Neovim (set, opt, g)
│   │   ├── lazy.lua                 # Configuration lazy.nvim
│   │   ├── autocmds.lua             # Autocommands
│   │   └── keymaps.lua              # Tous les keymaps globaux
│   │
│   └── plugins/                      # Spécifications des plugins (lazy loading)
│       ├── ui.lua                   # Theme, statusline, zen mode
│       ├── editor.lua               # Navigation, file explorer, fuzzy finder
│       ├── coding.lua               # Completion, linting, formatting, treesitter
│       ├── git.lua                  # Fugitive, gitsigns, neogit, diffview
│       ├── languages.lua            # Support Python, Markdown, LaTeX, Terraform
│       ├── tools.lua                # Terminal (floaterm, vimux)
│       └── ai.lua                   # Sidekick AI assistant
```

## 🚀 Installation

### 1. Sauvegarde de l'ancienne configuration

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

### 2. Installation de la nouvelle configuration

```bash
# Copier tous les fichiers dans ~/.config/nvim/
cp -r nvim-config/* ~/.config/nvim/

# Ou cloner depuis un repo
git clone <votre-repo> ~/.config/nvim
```

### 3. Premier lancement

```bash
nvim
```

Au premier lancement :
- Lazy.nvim se télécharge automatiquement
- Une fenêtre s'ouvre pour installer tous les plugins
- Appuyez sur `I` pour installer ou attendez l'installation automatique

### 4. Post-installation

```bash
# Vérifier la santé de Neovim
:checkhealth

# Mettre à jour les plugins
:Lazy update

# Synchroniser Treesitter
:TSUpdate
```

## 📦 Organisation des plugins

### UI (`plugins/ui.lua`)
- **Theme** : Nord
- **Statusline** : Airline
- **Focus** : Goyo, Limelight
- **Helpers** : vim-signature, indentLine

### Editor (`plugins/editor.lua`)
- **File Explorer** : nvim-tree
- **Navigation** : flash.nvim
- **Fuzzy Finder** : fzf.vim, telescope
- **Search** : ripgrep
- **Structure** : tagbar, undotree

### Coding (`plugins/coding.lua`)
- **Completion** : nvim-cmp + LuaSnip
- **Linting** : ALE (ruff, yamllint, etc.)
- **Formatting** : ALE, neoformat
- **Syntax** : Treesitter
- **Folding** : SimpylFold, FastFold

### Git (`plugins/git.lua`)
- **Core** : vim-fugitive
- **Visual** : gitsigns, vim-gitgutter
- **Interface** : Neogit, vimagit, gina.vim
- **History** : gv.vim, diffview
- **Conflicts** : git-conflict.nvim

### Languages (`plugins/languages.lua`)
- **Python** : pydocstring, pythonsense, pep8-indent
- **IaC** : ansible-vim, vim-terraform
- **Markdown** : vim-markdown, pandoc, preview
- **LaTeX** : vimtex

### Tools (`plugins/tools.lua`)
- **Terminal** : floaterm, vimux

### AI (`plugins/ai.lua`)
- **Assistant** : Sidekick (Claude/Gemini)

## ⚡ Lazy Loading

Tous les plugins utilisent le lazy loading pour optimiser le temps de démarrage :

- `lazy = false` : Chargé au démarrage (theme uniquement)
- `event = "VeryLazy"` : Après le démarrage
- `event = "InsertEnter"` : En mode insertion
- `ft = "python"` : Pour un filetype spécifique
- `cmd = "CommandName"` : À l'exécution d'une commande
- `keys = "<leader>x"` : À l'utilisation d'un keymap

## 🔧 Personnalisation

### Ajouter un nouveau plugin

Créer ou modifier un fichier dans `lua/plugins/` :

```lua
return {
  {
    'author/plugin-name',
    event = 'VeryLazy',  -- ou cmd, ft, keys, etc.
    config = function()
      -- Configuration du plugin
    end,
  },
}
```

### Modifier les options

Éditer `lua/config/options.lua`

### Ajouter des keymaps

Éditer `lua/config/keymaps.lua`

### Ajouter des autocommands

Éditer `lua/config/autocmds.lua`

## 🎯 Keymaps principaux

### Leader
- Leader : `,`

### Navigation
- `s` : Flash jump
- `ff` : Find files (FZF)
- `<leader>ff` : Find files (Telescope)
- `<leader>fg` : Live grep
- `<leader>e` : Toggle file explorer

### Git
- `gi` : Magit
- `<leader>gg` : Neogit
- `gl` : Git log (GV)
- `gs` : Git status

### Coding
- `<leader>c` : Toggle Tagbar
- `<leader>u` : Undotree
- `;ap` / `;an` : ALE previous/next error

### Python
- `<leader>pd` : Generate docstring
- `<leader>pr` : Run file
- `<leader>pt` : Run pytest
- `<F5>` : Run python file

### AI
- `<leader>ai` : Toggle AI assistant

### Terminal
- `,t` : Open floaterm
- `,tg` : Open lazygit
- `,td` : Open lazydocker

## 🔍 Commandes utiles

```vim
" Lazy.nvim
:Lazy              " Ouvrir l'interface Lazy
:Lazy update       " Mettre à jour les plugins
:Lazy clean        " Supprimer les plugins non utilisés
:Lazy sync         " Install + update + clean

" Treesitter
:TSUpdate          " Mettre à jour les parsers
:TSInstall python  " Installer un parser

" Mason (si ajouté)
:Mason             " Installer LSP, formatters, linters
```

## 🐛 Dépannage

### Les plugins ne se chargent pas
```bash
# Supprimer le cache et réinstaller
rm -rf ~/.local/share/nvim
nvim
```

### Erreurs au démarrage
```vim
:messages          " Voir les messages d'erreur
:checkhealth       " Vérifier la configuration
```

### Plugin spécifique ne fonctionne pas
```vim
:Lazy load plugin-name    " Forcer le chargement
:Lazy log                  " Voir les logs
```

## 📚 Ressources

- [Lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [Neovim Documentation](https://neovim.io/doc/)
- [TinyVim (inspiration)](https://github.com/NvChad/tinyvim)

## ✨ Avantages de cette structure

✅ **Modulaire** : Chaque type de plugin dans son propre fichier
✅ **Performant** : Lazy loading agressif (~50-100ms de démarrage)
✅ **Maintenable** : Facile de trouver et modifier un plugin
✅ **Évolutif** : Ajout de plugins simple et propre
✅ **Organisé** : Configuration logique et claire

---

**Enjoy coding! 🚀**
