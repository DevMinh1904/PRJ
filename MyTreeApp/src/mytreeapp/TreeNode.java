package mytreeapp;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ducmi
 */
public class TreeNode {
    private int info;
    private TreeNode left;
    private TreeNode right;

    public int getInfo() {
        return info;
    }

    public void setInfo(int info) {
        this.info = info;
    }

    public TreeNode getLeft() {
        return left;
    }

    public void setLeft(TreeNode left) {
        this.left = left;
    }

    public TreeNode getRight() {
        return right;
    }

    public void setRight(TreeNode right) {
        this.right = right;
    }

    public TreeNode(int info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "TreeNode{" + "info=" + info + ", left=" + left + ", right=" + right + '}';
    }
    
    
}
