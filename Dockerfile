# Sử dụng image Node.js
FROM node:18

# Tạo thư mục làm việc
WORKDIR /app

# Sao chép package.json và package-lock.json trước để cache deps
COPY package*.json ./

RUN npm ci --only=production

# Cài đặt dependencies từ package.json (bao gồm express)
RUN npm install

# Sao chép toàn bộ mã nguồn vào container (bao gồm public/, scripts/, server.js)
COPY . .

# Mở cổng 8080
EXPOSE 8080

# Chạy ứng dụng với node server.js (sử dụng Express route)
CMD ["node", "server.js"]