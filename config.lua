-- @author syeq
-- @discord https://discord.gg/....
-- @version 1.0

Config = {}

-- Configurations du texte
Config.text = {
    offset = 0.8,           -- Hauteur pour afficher le texte au-dessus de la tête
    letterSpacing = 0.02,   -- Espacement entre chaque lettre
    heightOffset = 0.2,     -- Distance en hauteur par rapport à la tête
    opacity = 215,          -- Opacité du texte
    fontSize = 0.35         -- Taille de la police d'écriture
}

-- Configurations de couleur et du glow
Config.colors = {
    text = {255, 255, 255, Config.text.opacity}, -- Couleur du texte (blanche)
    glow = {0, 255, 0, 150}                      -- Couleur du glow (blanche)
}

-- Historique de couleurs (rouge, orange, jaune, vert, bleu, indigo, violet, noir et blanche)
Config.colorHistory = {
    Red = {255, 0, 0, Config.text.opacity},
    Orange = {255, 165, 0, Config.text.opacity},
    Yellow = {255, 255, 0, Config.text.opacity},
    Green = {0, 255, 0, Config.text.opacity},
    Blue = {0, 0, 255, Config.text.opacity},
    Indigo = {75, 0, 130, Config.text.opacity},
    Violet = {148, 0, 211, Config.text.opacity},
    Black = {0, 0, 0, Config.text.opacity}
}