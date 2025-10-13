require 'ruby2d'

hero = Sprite.new(
  'images/sprite.png',
  width: 78,
  height: 99,
  clip_width: 130,
  time: 300,
  loop: true
)

on :mouse_down do |event| 
  case event.button
  when :left
    hero.play 
  when :right
    close
  end
end

show