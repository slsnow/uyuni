# Copyright (c) 2023 SUSE LLC
# Licensed under the terms of the MIT license.

Feature: Synchronize products in the products page of the Setup Wizard

@scc_credentials
  Scenario: Let the products page appear
    Given I am authorized for the "Admin" section
    When I follow the left menu "Admin > Setup Wizard > Products"
    And I wait until I see "Product Description" text
    Then I should see a "Arch" text
    And I should see a "Channels" text

@scc_credentials
@susemanager
  Scenario: Add SLES 15 SP4 product with recommended sub-products, including SUMA Client Tools
    When I follow the left menu "Admin > Setup Wizard > Products"
    And I wait until I do not see "Loading" text
    And I enter "SUSE Linux Enterprise Server 15 SP4" as the filtered product description
    And I wait until I see "SUSE Linux Enterprise Server 15 SP4 x86_64" text
    And I open the sub-list of the product "SUSE Linux Enterprise Server 15 SP4 x86_64"
    And I open the sub-list of the product "Basesystem Module 15 SP4 x86_64"
    And I open the sub-list of the product "Desktop Applications Module 15 SP4 x86_64"
    And I select "SUSE Linux Enterprise Server 15 SP4 x86_64" as a product
    Then I should see the "SUSE Linux Enterprise Server 15 SP4 x86_64" selected
    And I should see the "Basesystem Module 15 SP4 x86_64" selected
    And I should see the "Server Applications Module 15 SP4 x86_64" selected
    And I should see the "SUSE Manager Client Tools for SLE 15 x86_64" selected
    When I select "Containers Module 15 SP4 x86_64" as a product
    Then I should see the "Containers Module 15 SP4 x86_64" selected
    When I click the Add Product button
    And I wait until I see "SUSE Linux Enterprise Server 15 SP4 x86_64" product has been added
    Then the SLE15 SP4 product should be added

@scc_credentials
@uyuni
  Scenario: Add SLES 15 SP4 product with recommended sub-products
    When I follow the left menu "Admin > Setup Wizard > Products"
    And I wait until I do not see "Loading" text
    And I enter "SUSE Linux Enterprise Server 15 SP4" as the filtered product description
    And I wait until I see "SUSE Linux Enterprise Server 15 SP4 x86_64" text
    And I open the sub-list of the product "SUSE Linux Enterprise Server 15 SP4 x86_64"
    And I open the sub-list of the product "Basesystem Module 15 SP4 x86_64"
    And I open the sub-list of the product "Desktop Applications Module 15 SP4 x86_64"
    And I select "SUSE Linux Enterprise Server 15 SP4 x86_64" as a product
    Then I should see the "SUSE Linux Enterprise Server 15 SP4 x86_64" selected
    And I should see the "Basesystem Module 15 SP4 x86_64" selected
    And I should see the "Server Applications Module 15 SP4 x86_64" selected
    When I select "Containers Module 15 SP4 x86_64" as a product
    Then I should see the "Containers Module 15 SP4 x86_64" selected
    When I click the Add Product button
    And I wait until I see "SUSE Linux Enterprise Server 15 SP4 x86_64" product has been added
    Then the SLE15 SP4 product should be added

@uyuni
  Scenario: Enable SLES15 SP4 Uyuni client tools for creating bootstrap repositories
    When I use spacewalk-common-channel to add channel "sle-product-sles15-sp4-pool-x86_64 sles15-sp4-uyuni-client" with arch "x86_64"
