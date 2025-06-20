#!/bin/bash

# Lab 12 阿里云服务器快速配置脚本
# 服务器IP: 39.105.7.134

echo "=================================="
echo "Lab 12 服务器配置脚本"
echo "服务器: 39.105.7.134"
echo "=================================="

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_step() {
    echo -e "${GREEN}[步骤]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[警告]${NC} $1"
}

print_error() {
    echo -e "${RED}[错误]${NC} $1"
}

# 检查是否为root用户
if [ "$EUID" -ne 0 ]; then
    print_error "请使用root用户运行此脚本"
    exit 1
fi

print_step "1. 更新系统包..."
yum update -y

print_step "2. 安装基础工具..."
yum install -y curl wget git vim htop

print_step "3. 安装Docker..."
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -aG docker root

print_step "4. 安装Docker Compose..."
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose

print_step "5. 配置防火墙..."
# 对于Alibaba Cloud Linux，通常使用firewalld
if command -v firewall-cmd &> /dev/null; then
    systemctl start firewalld
    systemctl enable firewalld
    firewall-cmd --permanent --add-port=8080/tcp
    firewall-cmd --permanent --add-port=8081/tcp
    firewall-cmd --permanent --add-port=8082/tcp
    firewall-cmd --permanent --add-port=80/tcp
    firewall-cmd --permanent --add-port=443/tcp
    firewall-cmd --reload
    print_step "防火墙规则已配置"
else
    print_warning "firewalld未找到，请手动配置防火墙"
fi

print_step "6. 验证安装..."
echo "Docker版本: $(docker --version)"
echo "Docker Compose版本: $(docker-compose --version)"

print_step "7. 创建项目目录..."
cd /root
if [ ! -d "lab12-final-project" ]; then
    print_warning "请手动克隆您的GitHub仓库:"
    echo "git clone https://github.com/YOUR_USERNAME/lab12-final-project.git"
    echo "cd lab12-final-project"
    echo "./deploy.sh"
else
    print_step "项目目录已存在，开始部署..."
    cd lab12-final-project
    chmod +x deploy.sh
    ./deploy.sh
fi

echo ""
echo "=================================="
echo -e "${GREEN}✅ 服务器配置完成！${NC}"
echo "=================================="
echo "🌐 访问地址："
echo "  - Todo应用: http://39.105.7.134:8081/"
echo "  - 高级Todo: http://39.105.7.134:8082/"
echo "  - 个人网站: http://39.105.7.134:8080/"
echo ""
echo "📋 下一步："
echo "  1. 克隆您的GitHub仓库"
echo "  2. 运行 ./deploy.sh"
echo "  3. 配置GitHub Actions Secrets"
echo "" 