
Pod::Spec.new do |s|
    s.name = "YALField"
    s.version = "1.0.0"
    s.summary = "Custom Field component with validation for easier form-like ui creation from interface builder."

    s.homepage = "https://github.com/Yalantis/YALField"
    s.license = {
        :type => "MIT",
        :file => "LICENSE"
    }
    s.social_media_url = "https://twitter.com/yalantis"
    s.author = {
        "Igor Muzyka" => "igor.muzyka@yalantis.com"
    }
    s.source = {
        :git => "https://github.com/Yalantis/YALField.git", :tag => "1.0.0"
    }

    s.platform     = :ios, '8.0'
    s.requires_arc = true

    s.source_files = 'Pod/Classes/**/*'

    s.frameworks = 'UIKit'
end
