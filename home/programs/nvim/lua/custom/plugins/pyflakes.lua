-- Filtra los avisos de pyflakes que no sirven para desarrollo de juegos:
--   'from ursina import *': used; unable to detect undefined names
--   'Entity' may be undefined, or defined from star imports
-- Ursina (y pygame) se usan casi siempre con `import *`, asi que estos dos
-- avisos aparecen en cada archivo y no aportan nada.
-- OJO: pylsp no manda el codigo (F403/F405) en los diagnosticos de pyflakes,
-- asi que hay que filtrar por el texto del mensaje.
local function is_star_import_warning(diagnostic)
  return diagnostic.source == 'pyflakes'
    and (
      diagnostic.message:match 'unable to detect undefined names' ~= nil
      or diagnostic.message:match 'may be undefined, or defined from star imports' ~= nil
    )
end

local publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics

vim.lsp.diagnostic.on_publish_diagnostics = function(_, params, ctx)
  if params.diagnostics then
    params.diagnostics = vim.tbl_filter(function(diagnostic)
      return not is_star_import_warning(diagnostic)
    end, params.diagnostics)
  end
  return publish_diagnostics(_, params, ctx)
end
