#! /usr/bin/ruby

# 信頼性を測るモジュール
module Relability
  # 1日の最大時間
  DAY_HOUR = 24.freeze

  class Measure
    # 初期コンストラクタ
    # Param:: 全運転日数
    # Param:: 故障合計時間
    # Param:: 故障回数
    def initialize(run_days, down_sum_time, down_num)
      # 全運転時間
      @run_time = DAY_HOUR * run_days unless run_days.zero?
      # 故障合計時間
      @down_sum_time = down_sum_time
      # 故障回数
      @down_num = down_num
      # 稼働時間
      capacity = @run_time - @down_sum_time unless @down_sum_time.zero? || @down_num.zero?
      @capacity = capacity.to_f unless capacity.zero?
    end

    # MTBFを返す
    def mtbf
      @capacity / @down_num unless @capacity.zero? || @down_num.zero?
    end

    # MTTRを返す
    def mttr
      @down_sum_time / @down_num unless @down_sum_time.zero? || @down_num.zero?
    end

    # 稼働率を返す
    def capacity_rate
      @capacity / @run_time unless @capacity.zero? || @run_time.zero?
    end
  end
end
