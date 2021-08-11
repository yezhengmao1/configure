import configparser
import os

class iniParser(configparser.ConfigParser):
    def __init__(self, defaults=None):
        configparser.ConfigParser.__init__(self, defaults=defaults)
 
    def optionxform(self, optionstr):
        return optionstr

config = iniParser()
config.read("./config.ini")
arch=config["config"]["arch"]
pkg_cache=config["config"]["pkg_cache"]
uid=config["config"]["uid"]
gid=config["config"]["gid"]

class config_item_t():
    def __init__(self, item, value):
        self.item  = item
        self.value = value 

def parse_config(data):
    config_item_list = [
        config_item_t("{uid}",                  uid                                    ),
        config_item_t("{gid}",                  gid                                    ),
        config_item_t("{pkg-cache}",            config["config"]["pkg_cache"]          ),
        config_item_t("{ubuntu-pkg}",           config["ubuntu"]["apt"]                ),
        config_item_t("{pyenv-name}",           config["pyenv-src"]["name"]            ),
        config_item_t("{pyenv-compile-args}",   config["pyenv-src"]["args"]            ),
        config_item_t("{python-name}",          config["python-src"]["name"]           ),
        config_item_t("{python-ver}",           config["python-src"]["version"]        ),
        config_item_t("{cmake-name}",           config["cmake-src"]["name"]            ),
        config_item_t("{vim-name}",             config["vim-src"]["name"]              ),
        config_item_t("{vim-compile-args}",     config["vim-src"]["args"]              ),
        config_item_t("{insight-name}",         config["cppinsight-src"]["name"]       ),
        config_item_t("{insight-compile-args}", config["cppinsight-src"]["args"]       ),
        config_item_t("{absl-name}",            config["abseil-src"]["name"]           ),
        config_item_t("{absl-compile-args}",    config["abseil-src"]["args"]           ),
        config_item_t("{fzf-name}",             config["fzf-"+arch+"-pkg"]["name"]     ),
        config_item_t("{llvm-name}",            config["llvm-"+arch+"-pkg"]["name"]    ),
        config_item_t("{go-name}",              config["go-"+arch+"-pkg"]["name"]      ),
    ]
    for item in config_item_list:
        data = data.replace(item.item, item.value)
    return data

def parse_vim_plugin(data):
    vAutoLoad = ""
    for autoload in config["vim-autoload"]:
        vAutoLoad = vAutoLoad + autoload + " "
    vBundles = ""
    for bundle in config["vim-bundle"]:
        vBundles = vBundles + bundle + " "

    vim_config_item = config["vim-config"]
    data = data.replace("{vim-config}", vim_config_item["config"])
    data = data.replace("{vim-plugins}", vim_config_item["plugins"])
    data = data.replace("{vim-autoloads}", vAutoLoad)
    data = data.replace("{vim-bundles}", vBundles)
    return data

if __name__ == "__main__":
    template_data = open("./Dockerfile_template", "r", encoding="utf-8").read()
    template_data = parse_config(template_data)
    template_data = parse_vim_plugin(template_data)
    print(template_data)
    cmd = "cp ./plugin/* " + pkg_cache + "/"
    os.system(cmd)
