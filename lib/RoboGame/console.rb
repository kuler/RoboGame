module RoboGame

  class Console

    def run(argv)

      @robot = Robot.new
      puts "Your robot is ready at position #{@robot.report}. Use commands move/left/right/place/report to look around. Board is #{@robot.board}"

      while input = gets.chomp
        begin
          command, args = input.split(' ')
          args = args.split(',').map(&:strip) unless args.nil?

          @robot.send command.downcase.to_sym, *args unless command.nil?
          puts "Position: #{@robot.report}"
        rescue Exception => e
          puts "Can't invoke: #{input}, beacuse of #{e}"
        end
      end
    rescue SystemExit, Interrupt
      exit
    end

  end

end