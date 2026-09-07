package com.realestate.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class RecommendationMatch implements Serializable, Comparable<RecommendationMatch> {
    private static final long serialVersionUID = 1L;

    private Property property;
    private int matchScore; // 0 to 100
    private boolean locationMatch;   // +40
    private boolean priceMatch;      // +30
    private boolean typeMatch;       // +15
    private boolean bedroomMatch;    // +10
    private boolean areaMatch;       // +5
    private List<String> matchReasons = new ArrayList<>();

    public RecommendationMatch() {}

    public RecommendationMatch(Property property) {
        this.property = property;
    }

    public Property getProperty() { return property; }
    public void setProperty(Property property) { this.property = property; }

    public int getMatchScore() { return matchScore; }
    public void setMatchScore(int matchScore) { this.matchScore = matchScore; }

    public boolean isLocationMatch() { return locationMatch; }
    public void setLocationMatch(boolean locationMatch) { this.locationMatch = locationMatch; }

    public boolean isPriceMatch() { return priceMatch; }
    public void setPriceMatch(boolean priceMatch) { this.priceMatch = priceMatch; }

    public boolean isTypeMatch() { return typeMatch; }
    public void setTypeMatch(boolean typeMatch) { this.typeMatch = typeMatch; }

    public boolean isBedroomMatch() { return bedroomMatch; }
    public void setBedroomMatch(boolean bedroomMatch) { this.bedroomMatch = bedroomMatch; }

    public boolean isAreaMatch() { return areaMatch; }
    public void setAreaMatch(boolean areaMatch) { this.areaMatch = areaMatch; }

    public List<String> getMatchReasons() { return matchReasons; }
    public void setMatchReasons(List<String> matchReasons) { this.matchReasons = matchReasons; }

    public void addReason(String reason) {
        this.matchReasons.add(reason);
    }

    @Override
    public int compareTo(RecommendationMatch o) {
        return Integer.compare(o.matchScore, this.matchScore); // Descending order
    }
}
