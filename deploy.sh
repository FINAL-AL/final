#!/bin/bash

# Lab 12 Final Project Deployment Script
# Author: Rushford (Student ID: 20232066)

echo "=============================================="
echo "  Lab 12 Final Project Deployment Script"
echo "  Author: Rushford (Student ID: 20232066)"
echo "=============================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    print_error "Docker is not installed, please install Docker first"
    echo "Visit: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check if Docker Compose is available
if ! docker compose version &> /dev/null; then
    print_error "Docker Compose is not available, please ensure Docker is properly installed"
    exit 1
fi

print_status "Docker and Docker Compose check passed"

# Create necessary directories
print_step "Creating necessary directories..."
mkdir -p logs
mkdir -p data

# Stop existing containers
print_step "Stopping existing containers..."
docker compose down 2>/dev/null || true

# Pull latest images
print_step "Pulling latest images..."
docker compose pull

# Build and start services
print_step "Building and starting all services..."
docker compose up -d --build

# Wait for services to start
print_step "Waiting for services to start..."
sleep 15

# Check service status
print_step "Checking service status..."
docker compose ps

# Verify services are running
print_step "Verifying services..."

# Check if containers are running
PROFILE_STATUS=$(docker compose ps -q profile-app)
TODO_STATUS=$(docker compose ps -q todo-app)
VIKUNJA_STATUS=$(docker compose ps -q vikunja-app)

if [ -n "$PROFILE_STATUS" ]; then
    print_status "✅ Profile application is running"
else
    print_error "❌ Profile application failed to start"
fi

if [ -n "$TODO_STATUS" ]; then
    print_status "✅ Todo application is running"
else
    print_error "❌ Todo application failed to start"
fi

if [ -n "$VIKUNJA_STATUS" ]; then
    print_status "✅ Advanced Todo application is running"
else
    print_error "❌ Advanced Todo application failed to start"
fi

# Test connectivity
print_step "Testing application connectivity..."
sleep 10

# Test profile app
if curl -s http://localhost:8080 > /dev/null; then
    print_status "✅ Profile app is accessible"
else
    print_warning "⚠️  Profile app may not be fully ready yet"
fi

# Test todo app
if curl -s http://localhost:8081 > /dev/null; then
    print_status "✅ Todo app is accessible"
else
    print_warning "⚠️  Todo app may not be fully ready yet"
fi

# Test vikunja app
if curl -s http://localhost:8082 > /dev/null; then
    print_status "✅ Advanced Todo app is accessible"
else
    print_warning "⚠️  Advanced Todo app may not be fully ready yet"
fi

echo ""
echo "=============================================="
echo -e "${GREEN}✅ Deployment Complete! Access URLs:${NC}"
echo "=============================================="
echo "🌐 Personal Profile Website: http://localhost:8080"
echo "📝 Todo Application:         http://localhost:8081"
echo "🔧 Advanced Todo App:        http://localhost:8082"
echo ""
echo "📋 Useful Commands:"
echo "  View logs:        docker compose logs"
echo "  View logs (live): docker compose logs -f"
echo "  Stop services:    docker compose down"
echo "  Restart services: docker compose restart"
echo "  Rebuild:          docker compose up -d --build"
echo ""
echo "📊 Container Status:"
docker compose ps --format "table {{.Service}}\t{{.Status}}\t{{.Ports}}"
echo ""
echo "🎯 Lab 12 Requirements Completed:"
echo "✅ Personal website created"
echo "✅ Docker containerization"
echo "✅ Docker Compose deployment"
echo "✅ Todo applications integrated"
echo "✅ Multi-service architecture"
echo ""
print_status "Deployment completed successfully!"

# Optional: Show resource usage
echo ""
echo "📈 Resource Usage:"
docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}" 