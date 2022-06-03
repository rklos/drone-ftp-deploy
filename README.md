## drone-ftp-deploy
Yet another plugin for deploy to SFTP/FTP/FTPS server from Drone CI pipeline

## Usage
Create a new [step](https://docs.drone.io/yaml/docker/#the-step-object) inside your `.drone.yml`
file with `image` attribute set to `glxy/drone-ftp-deploy:latest`.

Full usage example in `.drone.yml`
```yaml
{...}

  - name: deploy
    image: glxy/drone-ftp-deploy:latest
    environment:
      PLUGIN_FTP_USERNAME:
        from_secret: ftp_login
      PLUGIN_FTP_PASSWORD:
        from_secret: ftp_password
      PLUGIN_FTP_HOSTNAME: ftp.example.com
      PLUGIN_FTP_PORT: 22
      PLUGIN_SECURE: true
      PLUGIN_SRC_DIR: /dist
      PLUGIN_DEST_DIR: /public_html/website
      PLUGIN_CLEAN_DIR: true
      PLUGIN_INCLUDE: "**/*.html,**/*.js,**/*.css"
      PLUGIN_EXCLUDE: ".secret/*"
    when:
      branch:
        - master
      event:
        - push

{...}
```
As you see, you can pass your envs as a hardcoded, or as a secret from Drone

## Environment variables
| **Variable**        	| **Type**  	| **Default** 	| **Description**                                                                                                                                                                  	  |
|---------------------	|-----------	|-------------	|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PLUGIN_FTP_USERNAME 	| _String_  	|             	| Login for FTP/SFTP account                                                                                                                                                       	  |
| PLUGIN_FTP_PASSWORD 	| _String_  	|             	| _Optional._ Password for FTP/SFTP account                                                                                                                                        	  |
| PLUGIN_FTP_HOSTNAME 	| _String_  	|             	| FTP/SFTP server network address (can be IP or domain)                                                                                                                            	  |
| PLUGIN_FTP_PORT     	| _Number_  	| `21`        	| _Optional._ FTP/SFTP server port                                                                                                                                                 	  |
| PLUGIN_SFTP         	| _Boolean_ 	| `false`     	| _Optional._ Determine whether to use SFTP                                                                                                                                        	  |
| PLUGIN_SECURE       	| _Boolean_ 	| `false`     	| _Optional._ Determine whether to use FTPS                                                                                                                                        	  |
| PLUGIN_SRC_DIR      	| _String_  	| `/`         	| _Optional._ Path to your local resources<br>Default `/` means your project root directory. If your app builds into `dist` directory, then you have to change this env to `/dist` 	  |
| PLUGIN_DEST_DIR     	| _String_  	| `/`         	| _Optional._ Path to remote destination (where to put your files on the server)                                                                                                   	  |
| PLUGIN_CLEAN_DIR    	| _Boolean_ 	| `false`     	| _Optional._ If true, delete ALL existing files at destination before uploading                                                                                                   	  |
| PLUGIN_INCLUDE      	| _String_  	| `**/*`      	| _Optional._ Determine which files want to upload ([minimatch globs](https://github.com/isaacs/minimatch) separated by a commas)                                                   	 |
| PLUGIN_EXCLUDE      	| _String_  	|             	| _Optional._ Determine which files don't want to upload ([minimatch globs](https://github.com/isaacs/minimatch) separated by a commas)                                 	             |

## License
Distributed under the MIT License. See `LICENSE` for more information.
