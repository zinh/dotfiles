define :compile_remote, source: nil, config_flag: nil do
  remote_url = params[:source]
  folder_name = params[:name]
  config_flag = params[:config_flag]

  file_name = File.basename(remote_url)
  execute "curl -fSL -o #{file_name} #{remote_url}" do
    not_if "test -e #{file_name}"
    notifies :run, 'execute[decompress]'
  end

  execute 'decompress' do
    command "tar -xvf #{file_name}"
  end

  execute 'configure' do
    cwd folder_name
    command "./configure #{config_flag}"
  end

  execute 'make' do
    cwd folder_name
    command 'make'
  end

  execute 'make install' do
    cwd folder_name
    command 'make install'
  end
end
