Pod::Spec.new do |spec|

  spec.name         = "BubblesSelection"
  spec.version      = "0.0.3"
  spec.summary      = "SDK to add selection interface"
  spec.description  = "A framework to implement nice and comfortable SpriteKit selection interface similar to Apple Music genre's one"
  spec.homepage     = "https://github.com/AJIJIi/BubblesSelectionExampleApp"
  spec.author       = { "Aleksei Bochkov" => "bochkov.alexej@gmail.com" }
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/AJIJIi/Bubbles-selection.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources", "Sources/*.{swift}"
end
