using QRCode
using Images

function generate_qr_code(text::AbstractString, size::Int)
    qr = qrcode(text)
    qr_matrix = Matrix(qr)
    qr_image = Gray.(qr_matrix)  
    qr_image_resized = imresize(qr_image, (size, size))
    return qr_image_resized
end

######

text = "Julia in 2023"
size = 256
qr_image = generate_qr_code(text, size)
save("qr_code.png", qr_image)
