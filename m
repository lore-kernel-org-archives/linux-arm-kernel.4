Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08061606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hhbYXCFj;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O2v2vwEF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jTT7ZQT/IeZuZXnF5eJK7WIKxpNbB7mlhkfRnq9M/Fg=; b=hhbYXCFjAa7lHG
	rJNFRBXZzkMawiClXQs5b8HQaaQGnATnjYYXXcX4HAUjo7CiTab5TEttleaogui/QxPOZVsRqmoh8
	4cYNRsv/IeSyTQgwDjtzvJD1PErOc/4BgkQKWfDQerkz2L+3cQCU5kQWzQE9WBtsEvA/NX7gLdocE
	0b8VRFF63A2DUyHuYlKx3P/qAB47hSemE+lINsDKLvx5lS2S1IvEtsEOLDTKLsL1Ec+iqejiXW63A
	8nUzU7IHgscY+DQpTcaU0joEbEiDrH9iCFyxEPCdo3bi4Kgpu/XaJ1b8jaFoBLW4xW343iuUuPjDr
	y8SjNi4LgH/AjQBkOzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOxv-0000000FAb4-31tD;
	Fri, 20 Nov 2026 13:47:47 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOxs-0000000FAaK-2e60
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795182465; x=1826718465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kP2SPO5/6lORcTqOAcqARY5ZCI7i60ffA/JZ/vM2yOo=;
  b=O2v2vwEFfcj6tH++svvvT5+bQOEfg/MmQ5nlwm7sYSf8kagiy/rmchnm
   jFP+Yc3tF3kEGzrkFqJxdJbvfKbpluxQFjmKRiCaD3sFcFiCQzQDd3VW3
   wSbY4bLE3Q4TdizrBHZosfXphMBX/nwlDfBhI1kKE5ktIDGbObJU2okZA
   +hdkL49k0rnfU6qiWP3qVhcYH/Yi3gapAOWDWKslDFoETN4f9vh+k7YoA
   sScN2QsA98Wc5RwjPM9fyBpTc7bydDZZ9mscCmKSl2TJvTjyJanTPoDE7
   q478OpGbQt1fbsK3oHnmDYjXGMTWV8D1SmCRZJAOmjq+iVQ19azw5gO5W
   g==;
X-CSE-ConnectionGUID: AONVwMTGTR+Yl4MMNOn94w==
X-CSE-MsgGUID: U4JupFQJSw26M1INRwqBpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4052857"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4052857"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:47:43 -0800
X-CSE-ConnectionGUID: DGbbw3DBQwm7faPJizsrJA==
X-CSE-MsgGUID: jGL/RBZuTbOQudBjx7Vs5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11277400"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:47:34 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Len Brown <lenb@kernel.org>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 01/16] PCI: Add pci_bus_size_and_assign_resources()
Date: Fri, 20 Nov 2026 15:46:56 +0200
Message-ID: <20261120134716.3027-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120134716.3027-1-ilpo.jarvinen@linux.intel.com>
References: <20261120134716.3027-1-ilpo.jarvinen@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054744_750875_83EF34DF 
X-CRM114-Status: GOOD (  14.48  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bridge window sizing and resource assignment must not run concurrently
with another sizing and assignment pass or with device removal.
Preventing that requires holding locks across both phases. Many callers
outside of PCI core call pci_bus_size_bridges() immediately followed by
pci_bus_assign_resources() and cannot hold the PCI core internal locks
across the two calls.

Add pci_bus_size_and_assign_resources() into PCI core which combines
these two operations and convert the callers that call them back to
back.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm/kernel/bios32.c           | 5 ++---
 arch/m68k/coldfire/pci.c           | 3 +--
 arch/mips/pci/pci-legacy.c         | 5 ++---
 arch/sh/drivers/pci/pci.c          | 3 +--
 drivers/parisc/lba_pci.c           | 7 ++-----
 drivers/pci/hotplug/acpiphp_glue.c | 3 +--
 drivers/pci/setup-bus.c            | 7 +++++++
 drivers/pcmcia/cardbus.c           | 3 +--
 include/linux/pci.h                | 1 +
 9 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index ac0e890510da..555bfb091d30 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -510,15 +510,14 @@ void pci_common_init_dev(struct device *parent, struct hw_pci *hw)
 		/*
 		 * We insert PCI resources into the iomem_resource and
 		 * ioport_resource trees in either pci_bus_claim_resources()
-		 * or pci_bus_assign_resources().
+		 * or pci_bus_size_and_assign_resources().
 		 */
 		if (pci_has_flag(PCI_PROBE_ONLY)) {
 			pci_bus_claim_resources(bus);
 		} else {
 			struct pci_bus *child;
 
-			pci_bus_size_bridges(bus);
-			pci_bus_assign_resources(bus);
+			pci_bus_size_and_assign_resources(bus);
 
 			list_for_each_entry(child, &bus->children, node)
 				pcie_bus_configure_settings(child);
diff --git a/arch/m68k/coldfire/pci.c b/arch/m68k/coldfire/pci.c
index 5afb207ccc51..dd21c77c43a6 100644
--- a/arch/m68k/coldfire/pci.c
+++ b/arch/m68k/coldfire/pci.c
@@ -250,8 +250,7 @@ static int __init mcf_pci_init(void)
 	rootbus->resource[0] = &mcf_pci_io;
 	rootbus->resource[1] = &mcf_pci_mem;
 
-	pci_bus_size_bridges(rootbus);
-	pci_bus_assign_resources(rootbus);
+	pci_bus_size_and_assign_resources(rootbus);
 	pci_bus_add_devices(rootbus);
 	return 0;
 }
diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index dae6dafdd6e0..ec0e42d9a895 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -129,15 +129,14 @@ static void pcibios_scanbus(struct pci_controller *hose)
 	/*
 	 * We insert PCI resources into the iomem_resource and
 	 * ioport_resource trees in either pci_bus_claim_resources()
-	 * or pci_bus_assign_resources().
+	 * or pci_bus_size_and_assign_resources().
 	 */
 	if (pci_has_flag(PCI_PROBE_ONLY)) {
 		pci_bus_claim_resources(bus);
 	} else {
 		struct pci_bus *child;
 
-		pci_bus_size_bridges(bus);
-		pci_bus_assign_resources(bus);
+		pci_bus_size_and_assign_resources(bus);
 		list_for_each_entry(child, &bus->children, node)
 			pcie_bus_configure_settings(child);
 	}
diff --git a/arch/sh/drivers/pci/pci.c b/arch/sh/drivers/pci/pci.c
index 878a27a1acfb..c91ca8f4cb1c 100644
--- a/arch/sh/drivers/pci/pci.c
+++ b/arch/sh/drivers/pci/pci.c
@@ -81,8 +81,7 @@ static void pcibios_scanbus(struct pci_channel *hose)
 		need_domain_info = 1;
 	}
 
-	pci_bus_size_bridges(hose->bus);
-	pci_bus_assign_resources(hose->bus);
+	pci_bus_size_and_assign_resources(hose->bus);
 	pci_bus_add_devices(hose->bus);
 }
 
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 5197a3c93c70..39ab93ba458b 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1639,11 +1639,8 @@ lba_driver_probe(struct parisc_device *dev)
 	if (is_pdc_pat()) {
 		/* assign resources to un-initialized devices */
 
-		DBG_PAT("LBA pci_bus_size_bridges()\n");
-		pci_bus_size_bridges(lba_bus);
-
-		DBG_PAT("LBA pci_bus_assign_resources()\n");
-		pci_bus_assign_resources(lba_bus);
+		DBG_PAT("LBA pci_bus_size_and_assign_resources()\n");
+		pci_bus_size_and_assign_resources(lba_bus);
 
 #ifdef DEBUG_LBA_PAT
 		DBG_PAT("\nLBA PIOP resource tree\n");
diff --git a/drivers/pci/hotplug/acpiphp_glue.c b/drivers/pci/hotplug/acpiphp_glue.c
index 78e3effbb32d..632344f34cae 100644
--- a/drivers/pci/hotplug/acpiphp_glue.c
+++ b/drivers/pci/hotplug/acpiphp_glue.c
@@ -465,8 +465,7 @@ static void acpiphp_native_scan_bridge(struct pci_dev *bridge)
 		max = pci_scan_bridge(bus, dev, max, 1);
 		if (dev->subordinate) {
 			pcibios_resource_survey_bus(dev->subordinate);
-			pci_bus_size_bridges(dev->subordinate);
-			pci_bus_assign_resources(dev->subordinate);
+			pci_bus_size_and_assign_resources(dev->subordinate);
 		}
 	}
 }
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index ed16ef7c26fa..29ec9ba59d92 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -2492,3 +2492,10 @@ void pci_assign_unassigned_bus_resources(struct pci_bus *bus)
 	__pci_bus_assign_resources(bus, &add_list, NULL);
 }
 EXPORT_SYMBOL_GPL(pci_assign_unassigned_bus_resources);
+
+void pci_bus_size_and_assign_resources(struct pci_bus *bus)
+{
+	pci_bus_size_bridges(bus);
+	__pci_bus_assign_resources(bus, NULL, NULL);
+}
+EXPORT_SYMBOL_GPL(pci_bus_size_and_assign_resources);
diff --git a/drivers/pcmcia/cardbus.c b/drivers/pcmcia/cardbus.c
index 5e5cf2c3e2c8..19df3f9228a7 100644
--- a/drivers/pcmcia/cardbus.c
+++ b/drivers/pcmcia/cardbus.c
@@ -81,8 +81,7 @@ int __ref cb_alloc(struct pcmcia_socket *s)
 	/*
 	 * Size all resources below the CardBus controller.
 	 */
-	pci_bus_size_bridges(bus);
-	pci_bus_assign_resources(bus);
+	pci_bus_size_and_assign_resources(bus);
 	cardbus_config_irq_and_cls(bus, s->pci_irq);
 
 	/* socket specific tune function */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index aa3765a20a96..d89aeb7c9ff7 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1569,6 +1569,7 @@ resource_size_t pcibios_retrieve_fw_addr(struct pci_dev *dev, int idx);
 void pci_bus_assign_resources(const struct pci_bus *bus);
 void pci_bus_claim_resources(struct pci_bus *bus);
 void pci_bus_size_bridges(struct pci_bus *bus);
+void pci_bus_size_and_assign_resources(struct pci_bus *bus);
 int pci_claim_resource(struct pci_dev *, int);
 int pci_claim_bridge_resource(struct pci_dev *bridge, int i);
 void pci_assign_unassigned_resources(void);
-- 
2.47.3


