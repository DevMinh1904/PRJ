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
public class MyTree {
    
    private TreeNode root;
   
    public void initTreeSample(){
        
        TreeNode node1 = new TreeNode(1);
        TreeNode node2 = new TreeNode(2);
        TreeNode node3 = new TreeNode(3);
        TreeNode node4 = new TreeNode(4);
        TreeNode node5 = new TreeNode(5);
        
        node1.setLeft(node2);
        node1.setRight(node3);
        node5.setLeft(node1);
        node5.setRight(node4);
        
        root = node5;
        
    }
    
    public void visit(TreeNode node){
        
        System.out.print(node.getInfo()+" ");
        
    }
    
    public void preOrder(TreeNode node){
        if(node != null){
            visit(node);
             preOrder(node.getLeft());
             preOrder(node.getRight());
        }
    }
    
    public void traversePreOrder(){
        preOrder(root);
    }
    
    public void postOrder(TreeNode node){
        if(node != null){
            postOrder(node.getLeft());
            postOrder(node.getRight());
            visit(node);
        }
    }
    
    public void traversePostOrder(){ 
        postOrder(root);
    }
    
    public void inOrder(TreeNode node){
        if(node != null){
            postOrder(node.getLeft());
            visit(node);
            postOrder(node.getRight());
        }
    }
    
    public void traverseInOrder(){
        inOrder(root);
    }
}
