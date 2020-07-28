module WordsHelper
  # 公開ステータスを返す
  def status(status)
    if status
      '公開中'
    else
      '下書き'
    end
  end
end
