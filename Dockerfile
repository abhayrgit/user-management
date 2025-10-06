# Stage 1 — Build
FROM node:20-slim AS builder

# Set working directory
WORKDIR /app

# Use faster npm registry (optional but helpful on slow networks)
RUN npm config set registry https://registry.npmmirror.com

# Install only dependencies first to leverage Docker cache
COPY package*.json ./
RUN npm ci

# Copy source code and build
COPY . .
RUN npm run build

# Stage 2 — Runtime
FROM node:20-slim AS runner

WORKDIR /app
ENV NODE_ENV=production

# Use faster npm registry again (optional)
RUN npm config set registry https://registry.npmmirror.com

# Copy only what's needed for production
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./

# Install only production dependencies
RUN npm ci --omit=dev

EXPOSE 3000
CMD ["node", "dist/main.js"]