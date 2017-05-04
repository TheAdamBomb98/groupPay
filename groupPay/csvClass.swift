//
//  csvClass.swift
//  groupPay
//
//  Created by FORD, ADAM on 5/3/17.
//  Copyright © 2017 FORD, ADAM. All rights reserved.
//

import Foundation

class CSV {
    var fileData: String = ""
    var dataArray: [[String]] = [[]]
    
    
    init(input: [[String]])
    {
        dataArray = input
        arrayToData()
    }
    
    /*
     *   returns the data array
     */
    func getDataArray() -> [[String]]
    {
        return dataArray
    }
    
    /*
     *
     */
    func getDataString() -> String
    {
        return fileData
    }
    
    
    func arrayToData()
    {
        fileData = ""
        for x in 0...dataArray.count - 1
        {
            for y in 0...dataArray[x].count - 1
            {
                fileData += dataArray[x][y]
                if y != dataArray[x].count - 1
                {
                    fileData += ","
                }
            }
            fileData += "\n"
        }
    }
    /*
     *   puts a raw string into an array
     */
    /*
    func dataToArray()
    {
        var lastPos = 0
        var lineArray: [String] = []
        Swift.print(fileData)
        for x in 0...fileData.characters.count  //divide raw string into separate lines
        {
            if(fileData.substring(x, end: x) == "\r") //or /n
            {
                lineArray.append(fileData.substring(lastPos, end: x - 1))
                lastPos = x + 1;
            }
            if lastPos > fileData.characters.count - 1
            {
                break
            }
        }
        Swift.print(lineArray)
        
        for x in 0...lineArray.count - 1
        {
            lastPos = 0
            let divString = lineArray[x]
            var tempDiv: [String] = []
            if x != 0
            {
                dataArray.append(Array<String>())
            }
            
            let lastIndex = divString.characters.count - 1
            for i in 0...lastIndex     //divide lines into items
            {
                if(divString.substring(i, end: i) == ",")
                {
                    tempDiv.append(divString.substring(lastPos, end: i - 1))
                    lastPos = i + 1;
                }
                if lastPos > lastIndex
                {
                    break
                }
            }
            tempDiv.append(divString.substring(lastPos, end: lastIndex))
            
            for i in 0...tempDiv.count - 1  //put all into array
            {
                dataArray[x].append(tempDiv[i])
            }
        }
    */
}
