Dir[Rails.root.join('lib/monkey_patches/**/*.rb')].sort.each(&method(:require))
