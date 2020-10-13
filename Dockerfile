FROM node:14

RUN git clone "https://github.com/BoostIO/BoostNote.next" /opt/Boostnote.next
WORKDIR /opt/Boostnote.next

RUN touch .env
RUN npm i
# localhost以外からのアクセスも許可
RUN sed -i -e "s/host: 'localhost',/host: '0.0.0.0',/g" webpack.config.ts
ENV PORT=8000
CMD sed -i -e "s/3000/$PORT/g" webpack.config.ts && npm run dev
