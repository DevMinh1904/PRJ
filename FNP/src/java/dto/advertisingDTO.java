/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ducmi
 */
public class advertisingDTO {
    private int adsID;
    private String adsTitle, adsFile, adsURL, adsTarget;

    public advertisingDTO() {
    }

    public advertisingDTO(int adsID, String adsTitle, String adsFile, String adsURL, String adsTarget) {
        this.adsID = adsID;
        this.adsTitle = adsTitle;
        this.adsFile = adsFile;
        this.adsURL = adsURL;
        this.adsTarget = adsTarget;
    }

    public int getAdsID() {
        return adsID;
    }

    public void setAdsID(int adsID) {
        this.adsID = adsID;
    }

    public String getAdsTitle() {
        return adsTitle;
    }

    public void setAdsTitle(String adsTitle) {
        this.adsTitle = adsTitle;
    }

    public String getAdsFile() {
        return adsFile;
    }

    public void setAdsFile(String adsFile) {
        this.adsFile = adsFile;
    }

    public String getAdsURL() {
        return adsURL;
    }

    public void setAdsURL(String adsURL) {
        this.adsURL = adsURL;
    }

    public String getAdsTarget() {
        return adsTarget;
    }

    public void setAdsTarget(String adsTarget) {
        this.adsTarget = adsTarget;
    }

    @Override
    public String toString() {
        return "advertisingDTO{" + "adsID=" + adsID + ", adsTitle=" + adsTitle + ", adsFile=" + adsFile + ", adsURL=" + adsURL + ", adsTarget=" + adsTarget + '}';
    }
    
    
    
}
