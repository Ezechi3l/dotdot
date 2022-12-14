local M = {
    tips = {
        "Aie une poignée de main ferme.",
        "Regarde les gens dans les yeux.",
        "Chante sous la douche.",
        "Dans une bagarre, tape la premier et tape fort.",
        "N’abandonne jamais. Les miracles arrivent tous les jours.",
        "Accepte toujours l’aide qu’on peut t’apporter.",
        "Sois brave. Et même si tu ne l’es pas, prétend l’être. Personne ne verra la différence.",
        "Siffle.",
        "Ignore les remarques sarcastiques.",
        "Choisis ton partenaire de vie avec précaution. Cette décision va définir à 90% ton bonheur ou ton malheur.",
        "Prends l’habitude de faire des choses biens pour des gens qui ne le sauront jamais.",
        "Prête seulement les livres dont tu te fiches qu’ils te reviennent ou pas.",
        "Ne prive jamais quelqu’un de son espoir; c’est peut-être tout ce qui lui reste dans la vie.",
        "Quand tu joues à un jeu avec des enfants, laisse-les gagner.",
        "Donne aux gens une seconde chance, mais pas une troisième.",
        "Sois romantique.",
        "Deviens la personne la plus positive et enthousiaste que tu connaisses.",
        "Décoince-toi. Relax. À part quelques rares moments de vie ou de mort, rien n’est aussi important qu’il n’y parait.",
        "Sois un bon perdant.",
        "Sois un bon gagnant.",
        "Quand quelqu’un te fait un câlin, laisse-le être le premier à te lâcher.",
        "Sois humble. Beaucoup de choses ont été accompli alors que tu n’étais même pas né.",
        "Reste simple.",
        "Méfie-toi des gens qui n’ont rien à perdre.",
        "Ne détruis pas les ponts. Tu seras surpris de voir combien de fois tu devras traverser la même rivière.",
        "Vis ta vie pour que ton épitaphe puisse lire : Aucun regret",
        "Sois audacieux et courageux. Quand tu te remémores les choses du passé, tu regrettes ce que tu n’as pas fait assez.",
        "Ne loupe jamais l’opportunité de dire à quelqu’un que tu l’aimes.",
        "Souviens-toi que personne ne peut faire tout tout seul. Aie un coeur reconnaissant et remercie ceux qui t’ont aidé.",
        "Sois responsable de ton attitude. Ne laisse personne d’autre la choisir pour toi.",
        "Visite tes amis et tes proches lorsqu’ils sont à l’hôpital ; tu as juste à y rester quelques minutes.",
        "Commence chaque jour avec tes musiques préférées.",
        "De temps en temps, prends une route panoramique.",
        "Réponds au téléphone avec une voix énergique et enthousiaste.",
        "Garde un cahier de notes et un stylo sur ta table de chevet. Les idées qui valent des millions peuvent te frapper à 3h du matin.",
        "Montre du respect pour toute personne qui travaille pour vivre, qu’importe la banalité de son métier.",
        "Envoie des fleurs à tes proches. Tu réfléchiras à la raison plus tard.",
        "Sois le héros de quelqu’un.",
        "Compte tes bénédictions.",
        "Marie-toi seulement par amour.",
        "Complimente le repas que te propose la personne qui t’a invité chez elle.",
        "Souviens-toi que 80% de ton succès au travail est basé sur ton abilité à gérer les gens.",
        "N’espère pas que la vie soit juste.",
        "La vie n’est pas juste, mais c’est toujours une belle aventure.",
        "En cas de doute, passez simplement à l’étape suivante.",
        "La vie est trop courte pour ne pas en profiter.",
        "Votre travail ne prendra pas soin de vous lorsque vous serez malade, contrairement à votre famille et vos amis.",
        "N’achetez pas ce dont vous n’avez pas besoin.",
        "Vous n’avez pas besoin d’avoir toujours raison. Restez honnête avec vous-même.",
        "Pleurez accompagné. C’est plus édifiant que de pleurer seul.",
        "Il est normal d’être en colère contre la vie. Elle peut vous la reprendre.",
        "Économisez pour les choses qui comptent.",
        "Concernant le chocolat, inutile de résister.",
        "Faites la paix avec le passé pour ne pas manquer le présent.",
        "Ce n’est pas grave si vos enfants vous voient pleurer.",
        "Ne comparez pas votre vie avec celle des autres. Leur chemin est différent du vôtre.",
        "Si une relation doit être secrète, vous ne devriez pas en faire partie.",
        "Tout peut changer en un clin d’œil.",
        "Respirez profondément. Cela apaise l’esprit.",
        "Débarrassez-vous de tout ce qui n’est pas utile. Le poids supplémentaire vous ralentit de plusieurs façons.",
        "Ce qui ne vous tue pas vous rend vraiment plus fort.",
        "Il n’est jamais trop tard pour être heureux, mais c’est votre responsabilité et celle de personne d’autre.",
        "Quand il s’agit de poursuivre les amours de votre vie, ne prenez pas non pour une réponse.",
        "Préparez-vous à toutes les éventualités, mais lorsque vous commencez quelque chose, suivez le courant.",
        "Faites des choses folles en ce moment. N’attendez pas de vieillir pour porter du violet.",
        "L’organe sexuel le plus important est le cerveau.",
        "Personne n’est responsable de votre bonheur à part vous-même.",
        "Étiquetez tout ce que vous appelez un désastre avec l’étiquette « Cela importera-t-il dans cinq ans? »",
        "Pardonnez, mais n’oubliez pas.",
        "Ce que les autres pensent ne vous n’est pas votre problème.",
        "Le temps guérit presque tout. Donnez du temps au temps.",
        "Peu importe qu’une situation soit bonne ou mauvaise, elle changera.",
        "Ne vous prenez pas trop au sérieux.",
        "Faites ce qui peut être fait maintenant, maintenant et pas plus tard, et ce qui reste à faire plus tard.",
        "Vos enfants n’auront qu’une seule enfance.",
        "Vieillir, c’est mieux que l’autre alternative – mourir jeune.",
        "Ce qui compte le plus à la fin, c’est d’avoir aimé.",
        "Sortez de chez vous tous les jours. Des miracles vous attendent partout.",
        "Si nous jetions tous nos problèmes, nous verrions les problèmes des autres et reprendrions les nôtres.",
        "L’envie est une perte de temps. Acceptez ce que vous avez déjà, pas ce dont vous pensez avoir besoin.",
        "Le meilleur reste à venir…",
        "Peu importe comment vous vous sentez, levez-vous, habillez-vous et montrez-vous.",
        "Bougez.",
        "La vie ne vient pas enveloppée dans un ruban, mais c’est toujours un cadeau.",
    }
}

local function window_config()
    --Get the current UI
    local ui = vim.api.nvim_list_uis()[1]

    local function round(float)
        return math.floor(float + .5)
    end

    local width = 80
    local height = 4

    if ui then
        width = round(ui.width * 0.5)
    end

    local config = {
        relative = "editor",
        width = width,
        height = height,
        col = width - 4,
        row = 2,
        style = 'minimal',
        focusable = true,
        noautocmd = false,
    }

    if vim.api.nvim_call_function('has', { 'nvim-0.5.0' }) == 1 then
        local border = vim.g.workbench_border or "double"
        config.border = border
    end

    return config
end

M.show_tip = function(tip)
    local tip = M.tips[math.random(#(M.tips))]
    local branch_workbench_bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(branch_workbench_bufnr, true, window_config())

    vim.api.nvim_command("setlocal wrap")
    vim.api.nvim_command(string.format("norm i%s", tip))
end


return M
