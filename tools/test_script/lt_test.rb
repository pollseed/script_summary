#! /usr/bin/ruby

class Lt
  def initialize
  end

  def self.run
    padding { "" }
  end

  protected
    def self.padding
      p LINE
      yield block_given?
      p LINE
    end

    def self.title(name)
      p name unless name.nil?
      p LINE
    end

  private
    LINE = "------------------------------------------------------"
end

module LtTips
  class LtRubyGrammer < Lt
    def initialize
    end

    def self.run
      padding { lt_1_loop }
      padding { lt_2_regex }
      padding { lt_3_if_unless }
      padding { lt_4_rescue }
      padding { lt_5_block }
    end

    private
      # 添字
      def self.lt_1_loop
        title "1. ループの添字"

        p "(1..10).include?(10)", (1..10).include?(10)
        p "('a'...'z').include?('z')", ('a'...'z').include?('z')
      end

      # 正規表現
      def self.lt_2_regex
        title "2. 正規表現"
        p "domain_name = 'pollseed.hatenablog.jp'",
          "case 'https://pollseed.hatenablog.jp/'",
          'when %r<http(s*)://#{domain_name}>'

        domain_name = 'pollseed.hatenablog.jp'
        case 'https://pollseed.hatenablog.jp/'
        when %r<http(s*)://#{domain_name}>
          p "found"
        else
          p "not found"
        end
      end

      # if/unlessについて
      def self.lt_3_if_unless
        title "3. if/unlessについて"
        p "hoge = 2", "if hoge.nil?", "elsif hoge == 2 => 2"

        hoge = 2
        unless hoge.nil?
          p hoge == 2 ? hoge : 0
        else
          p nil
        end

        p "hoge unless hoge.nil?", hoge unless hoge.nil?
      end

      # 例外処理
      def self.lt_4_rescue
        title "4. 例外処理"
        p "1/0", "rescue => e"

        begin
          1/0
        rescue => e
          p e.class, e.message
        else
          p "success"
        end
      end

      # 共通の処理だが、途中の処理だけ違う場合
      def self.lt_5_block
        title "5. 共通の処理だが、途中の処理だけ違う場合"
        p "def get_time(&block)", "block.call if block"

        def self.get_time(&block)
          p Time.now
          block.call if block
          p Time.now
        end

        p "get_time { sleep 2 }"
        get_time { sleep 2 }
        p "get_time { p 'hoge' }"
        get_time { p "hoge" }
      end
  end
end

LtTips::LtRubyGrammer.run
