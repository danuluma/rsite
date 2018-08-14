module BlogsHelper
  def gravatar_helper user
    image_tag "https://www.gravatar.com/", width: 60
  end

  class CodeRayify < RedCarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language) 
    end
  end

  def markdown(text)
    coderayfied = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_codeblocks: true,
      no_intra_emphasis: true,
      autolinks: true,
      lax_html_blocks: true,
    }

    markdown_to_html = RedCarpet::Markdown.new(coderayfied, options)
    markdown_to_html.render(text).html_safe
  end
end
