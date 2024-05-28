from selenium import webdriver
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
import argparse

import time

parser = argparse.ArgumentParser(description='Set download directory for Firefox in Selenium.')
parser.add_argument('--download_dir', type=str, required=True, help='Path to the download directory')
parser.add_argument('--url', type=str, required=True, help='Url of the illias folder')
parser.add_argument('--username', type=str, required=True, help='illias username')
parser.add_argument('--password', type=str, required=True, help='illias password')

args = parser.parse_args()
download_dir = args.download_dir
folder = args.url
username = args.username
password = args.password

# Create a Firefox profile
profile = webdriver.FirefoxProfile()

# Set preferences for the download directory
profile.set_preference('browser.download.folderList', 2)  # Use for custom location
profile.set_preference('browser.download.dir', download_dir)
profile.set_preference('browser.helperApps.neverAsk.saveToDisk', 'application/pdf')  # Add MIME types as needed
profile.set_preference('pdfjs.disabled', True)  # Disable the built-in PDF viewer if dealing with PDFs

# Create a Firefox Options instance
options = Options()

# Set the profile to the options
options.profile = profile

# Enable headless mode
options.add_argument('--headless')

# Initialize the WebDriver with the customized profile
print("STARTTING DOWNLOADER ...")
driver = webdriver.Firefox(options=options)

def main():

    driver.get("https://ovidius.uni-tuebingen.de/ilias3/login.php")

    login = driver.find_element(by=By.ID, value="shib_login_link")

    login.click()

    username_field = driver.find_element(by=By.ID, value="username")

    username_field.send_keys(username)

    password_field = driver.find_element(by=By.ID, value="password")

    password_field.send_keys(password)

    submit = driver.find_element(by=By.CLASS_NAME, value="form-button")

    submit.click()

    time.sleep(5)

    DowloadFiles(folder)
    time.sleep(5)
    driver.quit

def DowloadFiles(link):

    driver.get(link)

    list_elements = driver.find_elements(by=By.CLASS_NAME, value="il_ContainerItemTitle")

    file_links = []
    folder_links = []

    for list_element in list_elements:
        possible_link = (list_element.get_attribute("href"))
        if possible_link != None:
            if "download" in possible_link:
                file_links.append(possible_link)
            else:
                folder_links.append(possible_link)

    print("Dowloading files...")

    for link in file_links:
        driver.execute_script("window.open('" + link  + "', '_blank');")

    for link in folder_links:
        DowloadFiles(link)
        time.sleep(5)


if __name__ == "__main__":
    main()
