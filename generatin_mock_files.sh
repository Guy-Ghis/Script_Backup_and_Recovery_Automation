#!/bin/bash

# Step 1: Install Multipass (if not already installed)
if ! command -v multipass &> /dev/null; then
    echo "Installing Multipass..."
    sudo snap install multipass
else
    echo "Multipass is already installed."
fi

# Step 2: Launch a Multipass instance (Ubuntu)
INSTANCE_NAME="docker-instance"
echo "Launching Multipass instance: $INSTANCE_NAME..."
multipass launch --name $INSTANCE_NAME --cpus 2 --mem 4G --disk 10G

# Step 3: Install Docker inside the Multipass instance
echo "Installing Docker inside the Multipass instance..."
multipass exec $INSTANCE_NAME -- bash -c "sudo apt update && sudo apt install -y docker.io"

# Step 4: Create a directory with mock data files
echo "Creating a directory with mock data files..."
MOCK_DATA_DIR="mock_data"
mkdir -p $MOCK_DATA_DIR
for i in {1..10}; do
    echo "This is mock file $i." > $MOCK_DATA_DIR/file$i.txt
done

# Step 5: Copy the mock data directory to the Multipass instance
echo "Copying mock data directory to the Multipass instance..."
multipass transfer $MOCK_DATA_DIR $INSTANCE_NAME:/home/ubuntu/$MOCK_DATA_DIR

# Step 6: Run a Docker container with the mock data directory mounted
echo "Running a Docker container with the mock data directory mounted..."
multipass exec $INSTANCE_NAME -- bash -c "sudo docker run -d --name mock-data-container -v /home/ubuntu/$MOCK_DATA_DIR:/data busybox tail -f /dev/null"

# Step 7: Verify the container is running
echo "Verifying the container is running..."
multipass exec $INSTANCE_NAME -- bash -c "sudo docker ps"

echo "Setup complete! The Docker container is running with the mock data directory mounted."