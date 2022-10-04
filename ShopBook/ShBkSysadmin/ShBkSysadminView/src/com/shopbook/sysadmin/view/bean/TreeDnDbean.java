package com.shopbook.sysadmin.view.bean;

import oracle.adf.view.rich.dnd.DnDAction;
import oracle.adf.view.rich.event.DropEvent;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.faces.component.ContextCallback;
import javax.faces.component.UIComponent;
import javax.faces.component.UIViewRoot;
import javax.faces.context.FacesContext;

import oracle.adf.model.bean.DCDataRow;
import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.component.rich.data.RichTree;
import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.datatransfer.DataFlavor;
import oracle.adf.view.rich.datatransfer.Transferable;
import oracle.adf.view.rich.dnd.DnDAction;
import oracle.adf.view.rich.event.DropEvent;

import oracle.jbo.Key;
import oracle.jbo.Row;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

import org.apache.myfaces.trinidad.event.PollEvent;
import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;
import org.apache.myfaces.trinidad.model.RowKeySetImpl;

public class TreeDnDbean {

    public TreeDnDbean() {
    }

    public DnDAction dropHandler(DropEvent dropEvent) {
        RichTable table = (RichTable) dropEvent.getDragComponent();
        RichTree tree = (RichTree) dropEvent.getDropComponent();

        //memorize current row key to restore the original selection state
        //of the tree to avoid issues with context menus or similar. Note
        //that this step is important and should never be omitted when you 
        //programmatically change the row key for trees, tables and tree
        //tables
        Object currentRowKey = tree.getRowKey();
        
        //the drop site tells us about the node that received the frop 
        //event. In this use case we only allow the department node to 
        //handle the drop. For others we show a user information in a 
        //popup
        List dropRowKey = (List) dropEvent.getDropSite();
 //       System.out.println("drop row key is : "+dropRowKey.toString());
        //if no dropsite then drop area was not a data area
        if(dropRowKey == null){
          return DnDAction.NONE;
        }
        
        //make row current so we can access it. This line of code is 
        //the reason why we needed to keep track of the original tree
        //selection state. Here we programmatically change the row
        //currency without telling the undetlying ADF binding layer.
        //If we don't set the row selection back to the original value
        //we would risk the binding layer (model) and the client tree
        //state to go out of synch
        tree.setRowKey(dropRowKey);
        
        JUCtrlHierNodeBinding dropNode = (JUCtrlHierNodeBinding) tree.getRowData();

 //       System.out.println("drop node is : "+dropNode.toString());

        String dropNodeVO = dropNode.getHierTypeBinding().getStructureDefName();

        //The ADF Binding layer tells us about the structure definition name of 
        //a node. If you select a node in the binding editor then a string like
        //shown below is displayed for each node. Using this information you can 
        //tell what type the node is of. In our case if the type is department, the
        //drop is allowed
        //        if (dropNodeVO.equalsIgnoreCase("model.vo.CategoryTreeV")) {
        //
               Row treeRow = dropNode.getRow();
      //  System.out.println("tree drop node row is : "+treeRow.toString());
           Transferable t = dropEvent.getTransferable();
            DataFlavor<RowKeySet> df =  DataFlavor.getDataFlavor(RowKeySet.class, "rowmove");
            RowKeySet rks = t.getData(df);
            Iterator iter = rks.iterator();
        //
        //            //we allow multi-row drag and drop so that multiple employees can
        //            //be relocated at the same time
            while (iter.hasNext()) {
                //get next selected row key
                List key = (List)iter.next();              
                table.setRowKey(key);
                //the table model represents its row by the ADF binding class, which is
                //JUCtrlHierNodeBinding
                JUCtrlHierNodeBinding rowBinding = (JUCtrlHierNodeBinding)table.getRowData();
                //DCDataRow is the generic row class representation in in ADF. It is
                //the super class of oracle.jbo.Row, which you use with ADF BC services
                Row tableRow = (Row)rowBinding.getRow();
                //to relocate employees, just change the department ID
        // System.out.println("two nodes are : "+tableRow.getAttribute("ChildCategory")+ "--"+treeRow.getAttribute("ParentCategory"));
                if (tableRow.getAttribute("ChildCategory").equals(treeRow.getAttribute("ParentCategory"))) {
        //                   System.out.println("Invalid : You are making cross reference");
                tree.setRowKey(dropRowKey);
              } 
               else if (tableRow.getAttribute("ChildCategory")==treeRow.getAttribute("ChildCategory")) {
        //                   System.out.println("You can't drop category on itself");
                 tree.setRowKey(dropRowKey);
              } 
                else if (tableRow.getAttribute("ChildCategory")!=treeRow.getAttribute("ParentCategory")) {
                tableRow.setAttribute("ParentCategory", treeRow.getAttribute("ChildCategory")); 
        tableRow.setAttribute("CatTreeCode", treeRow.getAttribute("ChildCategory").
                      toString().concat(tableRow.getAttribute("ChildCategory").toString()));
               tree.setRowKey(dropRowKey);
              }
        }
        tree.setRowKey(dropRowKey);
        //            //set current row key back
        //           tree.setRowKey(currentRowKey);
        //
        //           //Show the employees in their new department by expanding the target
        //           //department node. For this we need to
        //           // 1. get access to the ADF tree binding
        //           // 2. iteratively get all parent nodes
        //           // 3. get the child nodes (employees) of the drop node
        //
        //           //1. get access to the ADF tree binding. We get this from the tree
        //           //instance we obtained from the dropEvent target
        //           CollectionModel treeModel = (CollectionModel) tree.getValue();
        //           JUCtrlHierBinding treeBinding = (JUCtrlHierBinding) treeModel.getWrappedData();
        //
        //           //create a new row key set
        //           RowKeySetImpl rksImpl = new RowKeySetImpl();
        //           rksImpl.add(dropRowKey);
        //
        //           //2. Get all parent nodes node path information to add to the
        //           //row key set to disclose the node
        //           JUCtrlHierNodeBinding treeDropNode = treeBinding.findNodeByKeyPath(dropRowKey);
        //        System.out.println("tree Drop node is :"+treeDropNode.toString());
        //          JUCtrlHierNodeBinding rootNode = treeBinding.getRootNodeBinding();
        //        System.out.println("Root node is :"+rootNode.toString());
        //           JUCtrlHierNodeBinding dropNodeParent = treeDropNode.getParent();
        //        System.out.println("Drop node Parent is :"+dropNodeParent.toString());
        //
        //           //walk up the tree to expand all parent nodes
        //           while(dropNodeParent != null && dropNodeParent != rootNode){
        //               rksImpl.add(dropNodeParent.getKeyPath());
        //               dropNodeParent = dropNodeParent.getParent();
        //           }
        //
        //           //3. get all employee nodes in a tree to disclose them too
        //           ArrayList<JUCtrlHierNodeBinding> childList = (ArrayList<JUCtrlHierNodeBinding>) treeDropNode.getChildren();
        //           for(JUCtrlHierNodeBinding nb : childList){
        //               rksImpl.add(nb.getKeyPath());
        //           }
        //
        //           //ready to disclose
        //           tree.setDisclosedRowKeys(rksImpl);
        //
        //           AdfFacesContext.getCurrentInstance().addPartialTarget(tree.getParent());
        //           AdfFacesContext.getCurrentInstance().addPartialTarget(table);
        //
        //           return DnDAction.MOVE;
        //        }
        ////        //set current row key back
        ////        tree.setRowKey(currentRowKey);
        ////
        ////        RichPopup userInfo = (RichPopup) findComponentOnPage("p2");
        ////        RichPopup.PopupHints hints = new RichPopup.PopupHints();
        ////        userInfo.show(hints);
        
        return DnDAction.MOVE;
    }
}
