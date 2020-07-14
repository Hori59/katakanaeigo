module WordsHelper

  # 公開ステータスを返す
  def status(status)
    if status
      '公開中'
    else
      '下書き'
    end
  end

  def change_display_by_current_location
    url = request.url
    if url = ''

    end
  end
end
