//
//  GitHubRepo.swift
//  iOSTask
//
//  Created by Ghalii on 12/10/19.
//  Copyright © 2019 Ghalii. All rights reserved.
//

import Foundation
import UIKit


// MARK: - Repo

struct UserRepoElement: Codable {
    let id: Int?
    let node_id, name, full_name: String?
    let repoprivate: Bool?
    let owner: Owner?
    let html_url: String?
    let description: String?
    let fork: Bool?
    let url, forks_url: String?
    let keys_url, collaborators_url: String?
    let teams_url, hooksURL: String?
    let issueEventsURL: String?
    let eventsURL: String?
    let assigneesURL, branchesURL: String?
    let tagsURL: String?
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    let statusesURL: String?
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    let subscriptionURL: String?
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    let contentsURL, compareURL: String?
    let mergesURL: String?
    let archiveURL: String?
    let downloadsURL: String?
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    let labelsURL, releasesURL: String?
    let deploymentsURL: String?
    let created_at, updated_at, pushed_at: String?
    let gitURL, sshURL: String?
    let cloneURL: String?
    let svnURL: String?
    let homepage: String?
    let size, stargazersCount, watchersCount: Int?
    let language: String?
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool?
    let hasPages: Bool?
    let forksCount: Int?
    let mirrorURL: String?
    let archived, disabled: Bool?
    let openIssuesCount: Int?
    let license: License?
    let forks, openIssues, watchers: Int?
    let defaultBranch: String?
}

// MARK: - License
struct License : Codable {
    let key, name, spdxID: String?
    let url: String?
    let nodeID: String?
}

// MARK: - Owner
struct Owner : Codable {
    let login: String?
    let id: Int?
    let node_id: String?
    let avatar_url: String?
    let gravatar_id: String?
    let url, html_url, followers_url: String?
    let following_url, gists_url, starred_url: String?
    let subscriptions_url, organizations_url, repos_url: String?
    let events_url: String?
    let received_events_url: String?
    let type: String?
    let site_admin: Bool?
}
