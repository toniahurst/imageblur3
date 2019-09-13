def blur(image) #here image is a variable pased in from where blur is called at the bottom of the code
  blurred_image =   [[0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0]]

          total_elements = blurred_image.flatten.count
          rows = total_elements/blurred_image[0].count
          cells = total_elements/rows
          puts "Enter a positive integer between 0 and 3"
          distance = gets.chomp.to_i
       
      image.each_with_index do |row, row_count|
        row.each_with_index do |cell_contents, location|
          if image[row_count][location] == 1 
            blurred_image[row_count][location] = 1
            count = distance
            while count > 0 do
              if row_count - count >= 0 && row_count - count < rows #test for upper cell in bounds
                blurred_image[row_count - count][location] = 1
              end
              if row_count + count >= 0 && row_count + count < rows #test for lower cell in bounds
                blurred_image[row_count + count][location] = 1
              end
              if location - count >= 0 && location - count < cells #test for left cell in bounds
                blurred_image[row_count][location - count] = 1
              end
              if location + count >= 0 && location + count < cells #test for right cell in bounds
                blurred_image[row_count][location + count] = 1
              end 
                count = count - 1
            end 
          end 
        end 
      end
     return blurred_image
end

def output(image, label)
  puts ""
  puts "Label Is: #{label}"
  puts "_________"
  image.each do |row|
    puts row.join
  end
end

brock =    [[1, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 1, 1, 1, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 1]]

blurred_brock = blur(brock)
output(brock, "Brock")
output(blurred_brock, "Blurred Brock")

