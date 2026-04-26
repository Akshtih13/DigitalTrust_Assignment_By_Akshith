
# DigitalTrust_Assignment_By_Akshith

## Overview

This project is an iOS assignment developed as part of the DigitalTrust interview task. The application is built using Swift and UIKit, following clean architecture principles and reusable UI components.

The goal of this assignment is to demonstrate iOS development skills including:

1. Clean UI implementation from Figma design
2. Reusable custom views and cells
3. Programmatic UI constraints
4. MVVM architecture
5. Efficient table view and collection view handling
6. Smooth animations and layout updates
7. Proper memory management and performance optimization


## Project Structure

DigitalTrust_Akshith/
│
├── Application/
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
│
├── Presentation/
│   ├── CommonViews/                         # Reusable custom UI components
│   │
│   ├── Home/
│   │   ├── Model/                          # Data models for Home module
│   │   ├── View/                           # ViewControllers, ReusableCells
│   │   └── ViewModel/                      # Business logic and UI state handling
│   │
│   └── Utils/
│       ├── Extension/                      # Swift helper extensions
│       ├── Observable.swift                # Custom binding helper for MVVM
│       └── StoryboardInstantiable.swift    # Storyboard instantiation helper
│                                           
├── Resources/
│   ├── MockJson/
│   │   └── UserData.json                   # Local mock response data
│   ├── Assets.xcassets                     # Images, icons, colors
│   ├── Info.plist
│   └── LaunchScreen.storyboard
│
├── DigitalTrust_Akshith.xcodeproj
└── README.md


# Architecture Explanation

This project follows the MVVM (Model-View-ViewModel) architecture pattern.

## Why MVVM?

MVVM helps in maintaining clean and scalable code by separating UI logic from business logic.

## Layer Breakdown

### Model

Responsible for handling the data structure and raw data used inside the application.

## View

###Includes UI components such as:

• UIView
• UIViewController
• UITableViewCells
• UICollectionViewCells
• Custom reusable views

The View is only responsible for displaying data and handling UI interactions.

## ViewModel

Acts as a bridge between View and Model.

###Responsibilities include:

• Data preparation for UI
• Business logic handling
• State management
• data binding logic 

###This improves:

• Code readability
• Testability
• Reusability
• Maintainability
• Benefits Used in This Project
• Cleaner ViewControllers
• Reusable UI components
• Better separation of concerns
• Easy debugging and scaling

### Features

• UI Implementation
• Pixel-perfect UI based on provided Figma design
• Custom reusable views
• Rounded corners, gradients, shadows, and page control customization
• Dynamic collection view and table view layouts

### Architecture

• MVVM (Model-View-ViewModel)
• Better code maintainability and testability

### Performance

• Optimized cell reuse
• Smooth batch updates without unwanted animations
• Proper memory handling using weak references
• Avoiding retain cycles and memory leaks

## Development Environment

• Xcode 15
• iOS 15
• Swift 5
• UIKit

# Technologies Used

• Swift
• UIKit
• Auto Layout
• UICollectionView
• UITableView
• MVVM Architecture
• Git & GitHub


# How to Run

###Clone the repository

• git clone https://github.com/Akshtih13/DigitalTrust_Assignment_By_Akshith.git

###Open the project

• cd DigitalTrust_Assignment_By_Akshith
• open DigitalTrust_Akshith.xcodeproj
• Build and run using Xcode on simulator or physical device.
