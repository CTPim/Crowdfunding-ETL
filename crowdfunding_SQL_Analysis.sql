-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id,backers_count , outcome
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC



-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id
FROM backers 
GROUP BY (cf_id)



-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT contacts.first_name,contacts.last_name,contacts.email,campaign.goal - campaign.pledged AS Remaining_Goal_Amount
INTO email_contacts_remaining_goal_amount
FROM campaign
INNER JOIN contacts
ON contacts.contact_id = campaign.contact_id			   
WHERE outcome = 'live' 
ORDER BY Remaining_Goal_Amount DESC




-- Check the table
SELECT *
FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT backers.email,backers.first_name,backers.last_name,backers.cf_id,campaign.company_name,campaign.description,
		campaign.end_date, (campaign.goal - campaign.pledged) AS Left_of_Goal
INTO email_backers_remaining_goal_amount
FROM campaign
LEFT JOIN backers
ON backers.cf_id = campaign.cf_id			   
WHERE campaign.outcome = 'live' 
GROUP BY backers.email,backers.first_name,backers.last_name,backers.cf_id,campaign.company_name,campaign.description,
		campaign.end_date, Left_of_Goal
ORDER BY backers.email DESC




-- Check the table
SELECT *
FROM email_backers_remaining_goal_amount

