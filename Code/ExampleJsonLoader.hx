package code;

import sys.io.File;
import tjson.TJSON;

/**
 * a simple json file parser, using tjson
 * @since Version_0.1
**/
class JsonLoader {

  /**
   * simple function to parse an inputted json file
   * @param File the file to look for, remember to include full path EG: assets/folder/file.json
   * @since Version_0.1
  **/
  public function parseJson(File:String) {
    try{
      return TJSON.parse(File.getContent(File), null);
    }catch(e){
      trace('An error has ocurred while reading the json.\n\n${e.message}');
      return null;
    }
  }
}
