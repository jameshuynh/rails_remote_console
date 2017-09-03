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
    eval File.read("#{Rails.root}/config/deploy.rb")
    eval File.read("#{Rails.root}/config/deploy/#{env}.rb")

    @port ||= 22

    cmd = "ssh -l #{@server_user} #{@server_ip} -p#{@port} -t \
'source ~/.bashrc && cd #{@deploy_to}/current && \
/home/#{@server_user}/.rbenv/shims/ruby bin/rails c #{env}'"

    exec cmd
  end

  def method_missing(name, *args, &block)
    if name == :fetch
      if %w[application stage deploy_user full_app_name].index(args[0].to_s)
        return instance_variable_get("@#{args[0]}")
      end
    end

    return self unless %I[server set].include?(name)
    @server_ip ||= if name == :server
                     args[0]
                   elsif name == :set && args[0] == :domain
                     args[1]
                   end
    @server_user ||= args[1] if name == :set && args[0] == :user
    if name == :set && args[0] == :deploy_user
      @deploy_user ||= args[1]
      @server_user = @deploy_user
    end

    @deploy_to ||= args[1] if name == :set && args[0] == :deploy_to
    @port ||= args[1] if name == :set && args[0] == :port

    @application ||= args[1] if name == :set && args[0].to_s == 'application'
    @stage ||= args[1] if name == :set && args[0].to_s == 'stage'
    @full_app_name ||= args[1] \
      if name == :set && args[0].to_s == 'full_app_name'
  end
end
