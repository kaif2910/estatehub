package com.realestate.service;

import com.realestate.dao.PreferenceDAO;
import com.realestate.dao.PropertyDAO;
import com.realestate.model.Preference;
import com.realestate.model.Property;
import com.realestate.model.RecommendationMatch;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class RecommendationService {

    private final PropertyDAO propertyDAO = new PropertyDAO();
    private final PreferenceDAO preferenceDAO = new PreferenceDAO();

    /**
     * Computes property recommendations for a given customer based on saved preferences.
     * Maximum score = 100.
     * Scoring:
     * - Location match = +40
     * - Price within preferred range = +30
     * - Property type match = +15
     * - Bedrooms match = +10
     * - Area within tolerance (±20%) = +5
     */
    public List<RecommendationMatch> getRecommendationsForUser(int userId, int limit) {
        Preference pref = preferenceDAO.findByUserId(userId);
        if (pref == null) {
            // Default preference if user hasn't set any yet
            pref = new Preference();
            pref.setMinPrice(BigDecimal.ZERO);
            pref.setMaxPrice(new BigDecimal("10000000"));
        }

        // Fetch all verified, available properties
        List<Property> allProperties = propertyDAO.findAllAdmin("VERIFIED", "AVAILABLE");
        List<RecommendationMatch> matches = new ArrayList<>();

        for (Property prop : allProperties) {
            RecommendationMatch match = calculateMatchScore(prop, pref);
            // Only include matches that have at least some compatibility (score >= 20)
            if (match.getMatchScore() >= 20) {
                matches.add(match);
            }
        }

        // Sort descending by match score
        Collections.sort(matches);

        if (matches.size() > limit) {
            return matches.subList(0, limit);
        }
        return matches;
    }

    public RecommendationMatch calculateMatchScore(Property property, Preference pref) {
        RecommendationMatch match = new RecommendationMatch(property);
        int score = 0;

        // 1. Location Match (+40 pts)
        if (pref.getPreferredCity() != null && !pref.getPreferredCity().trim().isEmpty()) {
            String targetCity = pref.getPreferredCity().trim().toLowerCase();
            String propCity = property.getCity() != null ? property.getCity().toLowerCase() : "";
            String propLoc = property.getLocation() != null ? property.getLocation().toLowerCase() : "";
            if (propCity.contains(targetCity) || propLoc.contains(targetCity) || targetCity.contains(propCity)) {
                score += 40;
                match.setLocationMatch(true);
                match.addReason("Location (" + property.getCity() + ")");
            }
        } else if (pref.getPreferredLocation() != null && !pref.getPreferredLocation().trim().isEmpty()) {
            String targetLoc = pref.getPreferredLocation().trim().toLowerCase();
            String propLoc = property.getLocation() != null ? property.getLocation().toLowerCase() : "";
            if (propLoc.contains(targetLoc)) {
                score += 40;
                match.setLocationMatch(true);
                match.addReason("Location match");
            }
        }

        // 2. Price within preferred range (+30 pts)
        if (property.getPrice() != null) {
            BigDecimal minP = pref.getMinPrice() != null ? pref.getMinPrice() : BigDecimal.ZERO;
            BigDecimal maxP = pref.getMaxPrice() != null ? pref.getMaxPrice() : new BigDecimal("999999999");
            if (property.getPrice().compareTo(minP) >= 0 && property.getPrice().compareTo(maxP) <= 0) {
                score += 30;
                match.setPriceMatch(true);
                match.addReason("Budget");
            }
        }

        // 3. Property Type match (+15 pts)
        if (pref.getCategoryId() != null && pref.getCategoryId() > 0) {
            if (property.getCategoryId() == pref.getCategoryId()) {
                score += 15;
                match.setTypeMatch(true);
                match.addReason("Property Type");
            }
        }

        // 4. Bedrooms match (+10 pts)
        if (pref.getPreferredBedrooms() != null && pref.getPreferredBedrooms() > 0) {
            if (property.getBedrooms() == pref.getPreferredBedrooms()) {
                score += 10;
                match.setBedroomMatch(true);
                match.addReason("Bedrooms (" + property.getBedrooms() + " BHK)");
            }
        }

        // 5. Area within tolerance (+5 pts: ±20% tolerance)
        if (pref.getPreferredAreaSqft() != null && pref.getPreferredAreaSqft().compareTo(BigDecimal.ZERO) > 0 && property.getAreaSqft() != null) {
            double targetArea = pref.getPreferredAreaSqft().doubleValue();
            double actualArea = property.getAreaSqft().doubleValue();
            double lowerBound = targetArea * 0.80;
            double upperBound = targetArea * 1.20;
            if (actualArea >= lowerBound && actualArea <= upperBound) {
                score += 5;
                match.setAreaMatch(true);
                match.addReason("Area (~" + Math.round(actualArea) + " sqft)");
            }
        }

        match.setMatchScore(Math.min(score, 100));
        return match;
    }
}
