class Base
  def run(argv)
    @robot = Robot.new
    while input = gets.chomp
      command, args = input.split(' ').first
      args = args.split!(',') unless args.nil?
      if @robot.respond_to? command.to_sym
        @robot.send command, *args
        puts "Position: #{@robot.report}"
      else
        puts "Unknown command: #{command}"
      end
    end
  rescue SystemExit, Interrupt
    exit
  end
end