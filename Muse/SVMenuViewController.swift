/*
 Copyright (c) 2016 Sachin Verma
 
 SVMenuViewController.swift
 SVSlidingPanel
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
import UIKit

class SVMenuViewController: UIViewController {
    @IBOutlet var headerView: UIView!
    
    @IBOutlet weak var contentTableView: UITableView!
    
    let cellID = "MenuOptionTableViewCell"
    let menuItems = [SVMenuOptions.Home, SVMenuOptions.Castings, SVMenuOptions.Information, SVMenuOptions.Settings]
    var menuSelectionClosure: ((SVMenuOptions, Bool)-> Void)!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
}

//MARK: UITableViewDelegate

extension SVMenuViewController:UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let menuItem = self.menuItems[indexPath.row]
        self.menuSelectionClosure(menuItem, true)
    }
    
}


//MARK: UITableViewDataSource

extension SVMenuViewController:UITableViewDataSource
{
  //
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let menuItem = self.menuItems[indexPath.row]
        cell.backgroundColor = UIColor.init(colorLiteralRed: 186/255, green: 223/255, blue: 255/255, alpha: 1.0)
        cell.textLabel?.text = menuItem.menuTitle
        return cell
    }
    
}

