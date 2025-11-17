local function copyResource(file)
  local path = quarto.utils.resolvePath(file)
  quarto.doc.addFormatResource(path)
end

function Header(el)
  copyResource('header_jms2025.png')
  copyResource('logo_insee.png')

  if not el.attributes['background-image'] then
    el.attributes['background-image'] = 'header_jms2025.png'
    el.attributes['background-opacity'] = '0.1'

    -- --- Cover : image sur toute la slide ---
    if el.classes:includes("title-slide") then
      el.attributes['background-size'] = 'contain'
      el.attributes['background-position'] = 'center'
      el.attributes['background-repeat'] = 'no-repeat'

    -- --- Slides normales : bandeau en haut ---
    else
      el.attributes['background-size'] = 'contain'
      el.attributes['background-position'] = 'top center'
      el.attributes['background-repeat'] = 'no-repeat'
    end
  end

  return el
end
