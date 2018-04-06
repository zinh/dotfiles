include_recipe 'resources/compile_remote'

version = "2.2.4"
file_name = "gnupg-#{version}"
gnupg_url = "https://www.gnupg.org/ftp/gcrypt/gnupg/#{file_name}.tar.bz2"
# check if already downloaded
execute "curl -fSL -o #{file_name}.tar.bz2 #{gnupg_url}" do
  not_if "test -e #{file_name}.tar.bz2"
  notifies :run, "execute[decompress gnupg]"
end

execute "decompress gnupg" do
  command "tar -xvf #{file_name}.tar.bz2" 
  action :nothing
end

# download dependency
execute "curl -fSL -o libgpg-error-1.28.tar.bz2 https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.28.tar.bz2" do
  cwd file_name
  not_if "test -e libgpg-error-1.28"
  notifies :run, "execute[decompress libgpg-error]"
end

execute "decompress libgpg-error" do
  cwd file_name
  command "tar -xvf libgpg-error-1.28.tar.bz2" 
  action :nothing
  notifies :run, "execute[configure libgpg-error]"
end

execute "configure libgpg-error" do
  cwd "#{file_name}/libgpg-error-1.28"
  command "./configure --prefix=$HOME/Programs/libgpg-error-1.28"
  action :nothing
  notifies :run, "execute[make libgpg-error]"
end

execute "make libgpg-error" do
  cwd "#{file_name}/libgpg-error-1.28"
  command "make"
  notifies :run, "execute[make install libgpg-error]"
end

execute "make install libgpg-error" do
  cwd "#{file_name}/libgpg-error-1.28"
  command "make install"
end

compile_remote "libgcrypt-1.8.2" do
  source 'https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.2.tar.bz2'
  config_flag '--with-libgpg-error-prefix=$HOME/Programs/libgpg-error-1.28'
end
