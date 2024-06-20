# frozen_string_literal: true

directories = Dir
              .glob('*')
              .map(&File.method(:expand_path))
              .reject(&File.method(:file?))

directories.each do |directory_in_dotfiles|
  location_of_folder =
    if File.exist?("#{directory_in_dotfiles}/.location")
      path = File.read("#{directory_in_dotfiles}/.location").gsub("\n", '')
      if path == 'exclude'
        puts "#{directory_in_dotfiles} Ignored"
        next
      else
        path
      end
    else
      '~'
    end

  puts directory_in_dotfiles
  symlinked_folder = File.expand_path(location_of_folder)

  unless File.exist?(symlinked_folder)
    File.symlink(directory_in_dotfiles, symlinked_folder)
    next
  end

  if File.symlink?(symlinked_folder)
    File.unlink(symlinked_folder)
    File.symlink(directory_in_dotfiles, symlinked_folder)
  else
    children_dir = Dir.children(directory_in_dotfiles)
    children_dir.each do |file|
      complete_path = "#{symlinked_folder}/#{file}"
      file_expanded = File.expand_path("#{directory_in_dotfiles}/#{file}")
      File.unlink(complete_path) if File.symlink?(complete_path)
      File.symlink(file_expanded, complete_path)
    end
  end
end
