# rubocop:disable UnusedMethodArgument
# rubocop:disable MethodMissing
# rubocop:disable PerceivedComplexity
# rubocop:disable CyclomaticComplexity
# rubocop:disable AbcSize
# rubocop:disable Security/Eval
task :rc do
  RailsRemoteConsoleTask.new.call(ARGV[1])
end

class RailsRemoteConsoleTask
  def call(in_env)
    env = in_env || 'staging'
    eval File.read("#{Rails.root}/config/deploy/#{env}.rb")

    exec "ssh -l #{@server_user} #{@server_ip} -t \
'source ~/.bashrc && cd #{@deploy_to}/current && \
/home/#{@server_user}/.rbenv/shims/ruby bin/rails c #{env}'"
  end

  def method_missing(name, *args, &block)
    return self unless %I[server set].include?(name)
    @server_ip ||= if name == :server
                     args[0]
                   elsif name == :set && args[0] == :domain
                     args[1]
                   end
    @server_user ||= args[1] if name == :set && args[0] == :user
    @deploy_to ||= args[1] if name == :set && args[0] == :deploy_to
  end
end
