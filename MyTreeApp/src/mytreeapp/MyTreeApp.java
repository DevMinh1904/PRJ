/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mytreeapp;

/**
 *
 * @author ducmi
 */
public class MyTreeApp {
    public static void main(String[] args) {
        MyTree tree = new MyTree();
        tree.initTreeSample();
        tree.traversePreOrder();
        System.out.println("");
        tree.traversePostOrder();
        System.out.println("");
        tree.traverseInOrder();
        System.out.println("");
    }
}
