//
//  HomeViewModel.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func usersLoadedSuccessfully()
    func usersFailedWithError(_ errorMessage: String)
    
    func postsLoadedSuccessfully()
    func postsFailedWithError(_ errorMessage: String)
}


class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    private var users: [User] = []
    private var posts: [Post] = []
    
    
    // MARK: Users methods
    func loadUsers() {
        UsersAPIManager.loadHomeUsers(success: { (response) in
            self.users = response.users ?? []
            self.delegate?.usersLoadedSuccessfully()
        }, failure: { (errorMessage) in
            self.delegate?.usersFailedWithError(errorMessage)
        })
    }
    
    func usersCount() -> Int {
        return users.count
    }
    
    func user(atIndex index: Int) -> User {
        return users[index]
    }
    
    
    // MARK: Posts methods
    func loadPosts() {
        PostsAPIManager.loadHomePosts(success: { (response) in
            self.posts = response.posts ?? []
            self.delegate?.postsLoadedSuccessfully()
        }, failure: { (errorMessage) in
            self.delegate?.postsFailedWithError(errorMessage)
        })
    }
    
    func postsCount() -> Int {
        return posts.count
    }
    
    func post(atIndex index: Int) -> Post {
        return posts[index]
    }
}
