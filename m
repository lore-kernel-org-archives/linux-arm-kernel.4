Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A1A606A88E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nDG1aCpH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGMYvY2x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OOcLabl5ezZ1UkzwIkQf5ogcQm5sNSJAbcdcVxctfRc=; b=nDG1aCpHchY1/7IeiZnsOvt+LX
	N6dhmADnuqPXwUqm1Nj3HIfjoiffsuQLfUCoByVT3rO8NfudCvHxy4xSHrdmzPZ9/ZuDwzhC9xDD8
	154Iw8ZJsQG0WvDrpTC2PvHbQ4SLJNaUaIK3hFiGSi8VQ+PGETaNX+mzw42xCXmVwezJYVWmgfgRM
	/wc/q/EtZdVdkb3ox86JGuf1c+RZB6LEFipMJ9vzw0+nr5XyhEZ7zwXkF+ihvT3qFmUjKgF58INcF
	ZhR+RxU3cSytwRIcYtNjngrgFjNQezC8+r7c9L4g7dhnz4gP30r/H1NEUFCsxKyqvxwR9fsYO3ygG
	dt5yyn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS20L-0000000ExSd-49nu;
	Sat, 14 Nov 2026 00:52:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS20F-0000000ExPR-2a5f;
	Sat, 14 Nov 2026 00:52:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15B586279C;
	Sat, 14 Nov 2026 00:52:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794617542;
	b=poAyHHTDFArfk/EecSAL8HDiVs3DoJ5OHdzsgTm7AewqZ0ggSoL710OALjiRLKs9/LQH
	 RwOelAMTWf6HDoZwpl3fkFiMVUp+AIJnsbcTfVHJP2x0nKD2pST1ZXUpD9hFnveEbz0BZ
	 U/ZiR+dKu/J/mvxoEFF1eMPX3xiskJ5/eVrO5M5U3Yspz7hUjcktCX6E0CLlXJzLDPrKj
	 0qHbMLzSLwoJYitAz9i6nJqUHnDCRSR+lAbTP9Fwo3iEDP+etho1I3YgAAu1ElRQf2tyL
	 HgEpLT5KSNwdV25BTnB8CwHvnwgiFa2X/P4TeIS9Eb8zGQUX1ZAb2sdMa+bFymgkOiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794617542;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OOcLabl5ezZ1UkzwIkQf5ogcQm5sNSJAbcdcVxctfRc=;
	b=gDIW/0DfuaLgtMy7HPxMuBKHgMiS73DAMXEL0BSHW9A1VT0CVGt3UizRR1pc+6tK5tWy
	 3yzu/TYFv1KH+iFS41iKoImJXKczzATDTG1MO8iPyonBjKJ+4WH5dBhMF467zuyr1QHEe
	 nhVBhCGUC1wxBChJB0EmlOveNlrtHHa49y93vGI5gPoJLAEZ9i1SMS830bzn5bgesubit
	 rwA9synPXOusAzdpv3SWGRbDBU3sdTXlou4XEPp49+4qRJxNYij47c44iN2/kndAg40Iq
	 s9K/CZLIRzbMF6Yj3Prw0S1BBJ3wQ2+yEpwTTfosEWhTfvkbnwUL0vRCQtIT0YeyF4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C394F1F000C6;
	Sat, 14 Nov 2026 00:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794617542;
	bh=OOcLabl5ezZ1UkzwIkQf5ogcQm5sNSJAbcdcVxctfRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IGMYvY2xkAQZwBER6+kVUtf8PHuHLTPGtEdthaJTnrq311k/sJIR5vmbQkEBn2ZbF
	 GzmF815CzbqUlNAGP8QTvNYysMfPjCAJMazs/0RRH2SzXO0cxvxIkRqJAt5b6ywR2/
	 Ec90JtHFoUtFZWedsvaJFAhiC4TIR/qd/ZKl4XVs8naTxtXyoHuEodDP/6fH1Gz6HZ
	 w+Qj5ZxUnwtJmcanh3eG2r51WVESbikGl9vDzbHMWBl3HNAeLtOR/YyZCT2et16VpH
	 SebxzAtTUG2Mz967dcfQOPohP/TzGlR20hCgXreCw6EVsjHV2rs4c5zPw1CCSR5dxn
	 EL3h7XYe/1jbQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1769149BFC;
	Sat, 14 Nov 2026 00:52:21 +0000 (UTC)
From: Matt Thompson via B4 Relay <devnull+matt.boondocker.io@kernel.org>
Date: Fri, 13 Nov 2026 17:52:21 -0700
Subject: [PATCH RFC v2 3/3] PCI: rockchip-host: Recover downstream
 configuration access
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-rfc-b4-v2-3-d6b14f95c1d6@boondocker.io>
References: <20261113-rfc-b4-v2-0-d6b14f95c1d6@boondocker.io>
In-Reply-To: <20261113-rfc-b4-v2-0-d6b14f95c1d6@boondocker.io>
To: Shawn Lin <shawn.lin@rock-chips.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794617540; l=4966;
 i=matt@boondocker.io; s=rk3399-rfc-20261113; h=from:subject:message-id;
 bh=t7P6yz1ZPt577IkVoaPXVx7wOD2MZniq6qTtpmWpQv0=;
 b=jziTXeF5pImkNcRBXi1/XuWIcxKWxvHLp+DYHF8WdmNM8X8Lb2cTRE0wor/brvEoVKj4LVlMt
 duqShSJl3stBp9I4FbyY4nwfWMJoIdj0bfe4icOSvGYFNWEdAW+7orW
X-Developer-Key: i=matt@boondocker.io; a=ed25519;
 pk=WMnh3kwFFRkrqamL/FbDcdl1/9rBF2uT03VdvGGP40k=
X-Endpoint-Received: by B4 Relay for matt@boondocker.io/rk3399-rfc-20261113
 with auth_id=1517
X-Original-From: Matt Thompson <matt@boondocker.io>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: matt@boondocker.io
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Matt Thompson <matt@boondocker.io>

The link status can change between the readiness check and a downstream
PCI configuration read. A link that reports up can also fail to return
a usable completion.

On arm64, annotate downstream loads for all three access widths so a
synchronous external abort returns PCIBIOS_DEVICE_NOT_FOUND with all-ones
data. Keep little-endian conversion and I/O read ordering on success.

After retraining, the controller can continue to block configuration
traffic until its AXI link-down latch is cleared. Clear the latch before
downstream config reads and writes once the link readiness checks pass.

Link: https://lore.kernel.org/linux-pci/20261024-rockchip-pcie-resume-v1-2-58e54a5cf5f1@iav.lv/

Signed-off-by: Matt Thompson <matt@boondocker.io>
---
 drivers/pci/controller/pcie-rockchip-host.c | 62 +++++++++++++++++++++++++++--
 drivers/pci/controller/pcie-rockchip.h      |  1 +
 2 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 35105c1..64ac6f4 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -29,6 +29,10 @@
 #include "../pci.h"
 #include "pcie-rockchip.h"
 
+#ifdef CONFIG_ARM64
+#include <asm/asm-extable.h>
+#endif
+
 static void rockchip_pcie_enable_bw_int(struct rockchip_pcie *rockchip)
 {
 	u32 status;
@@ -149,16 +153,36 @@ static bool rockchip_pcie_downstream_ready(struct rockchip_pcie *rockchip)
 	       PCIE_LINK_TRAINING_DONE(rockchip_pcie_read(rockchip, PCIE_CORE_CTRL));
 }
 
+#ifdef CONFIG_ARM64
+/*
+ * An absent completion can raise a synchronous external abort even when
+ * the link status indicated up immediately before the config transaction.
+ */
+#define rockchip_pcie_cfg_load(insn, addr, val)			\
+	({								\
+		int err = 0;					\
+		asm volatile("1: " #insn " %w0, [%2]\n"			\
+			     "2:\n"					\
+			     _ASM_EXTABLE_MMIO_READ_ERR_ZERO(1b, 2b,	\
+							    %w1, %w0)	\
+			     : "=&r" (val), "+r" (err)			\
+			     : "r" (addr) : "memory");			\
+		err;							\
+	})
+#endif
+
 static int rockchip_pcie_rd_other_conf(struct rockchip_pcie *rockchip,
 				       struct pci_bus *bus, u32 devfn,
 				       int where, int size, u32 *val)
 {
 	void __iomem *addr;
+#ifdef CONFIG_ARM64
+	u32 data;
+	int err;
+#endif
 
-	if (!rockchip_pcie_downstream_ready(rockchip)) {
-		*val = ~0U;
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
+	if (!rockchip_pcie_downstream_ready(rockchip))
+		goto absent;
 
 	addr = rockchip->reg_base + PCIE_ECAM_OFFSET(bus->number, devfn, where);
 
@@ -174,6 +198,28 @@ static int rockchip_pcie_rd_other_conf(struct rockchip_pcie *rockchip,
 		rockchip_pcie_cfg_configuration_accesses(rockchip,
 						AXI_WRAPPER_TYPE1_CFG);
 
+	/* Clear the AXI link-down latch before downstream config traffic. */
+	rockchip_pcie_write(rockchip, 0, PCIE_CORE_AXI_LINK_DOWN);
+
+#ifdef CONFIG_ARM64
+	if (size == 4) {
+		err = rockchip_pcie_cfg_load(ldr, addr, data);
+		*val = le32_to_cpu((__force __le32)data);
+	} else if (size == 2) {
+		err = rockchip_pcie_cfg_load(ldrh, addr, data);
+		*val = le16_to_cpu((__force __le16)data);
+	} else if (size == 1) {
+		err = rockchip_pcie_cfg_load(ldrb, addr, data);
+		*val = data;
+	} else {
+		*val = 0;
+		return PCIBIOS_BAD_REGISTER_NUMBER;
+	}
+	if (err)
+		goto absent;
+	/* Preserve the I/O read ordering of readl/readw/readb. */
+	__io_ar(*val);
+#else
 	if (size == 4) {
 		*val = readl(addr);
 	} else if (size == 2) {
@@ -184,7 +230,12 @@ static int rockchip_pcie_rd_other_conf(struct rockchip_pcie *rockchip,
 		*val = 0;
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 	}
+#endif
 	return PCIBIOS_SUCCESSFUL;
+
+absent:
+	*val = ~0U;
+	return PCIBIOS_DEVICE_NOT_FOUND;
 }
 
 static int rockchip_pcie_wr_other_conf(struct rockchip_pcie *rockchip,
@@ -208,6 +259,9 @@ static int rockchip_pcie_wr_other_conf(struct rockchip_pcie *rockchip,
 		rockchip_pcie_cfg_configuration_accesses(rockchip,
 						AXI_WRAPPER_TYPE1_CFG);
 
+	/* Clear the AXI link-down latch before downstream config traffic. */
+	rockchip_pcie_write(rockchip, 0, PCIE_CORE_AXI_LINK_DOWN);
+
 	if (size == 4)
 		writel(val, addr);
 	else if (size == 2)
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index b5da156..1cc3621 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -164,6 +164,7 @@
 #define MIN_AXI_ADDR_BITS_PASSED		8
 #define PCIE_ADDR_MASK			GENMASK_ULL(63, MIN_AXI_ADDR_BITS_PASSED)
 #define PCIE_CORE_AXI_CONF_BASE		0xc00000
+#define PCIE_CORE_AXI_LINK_DOWN		(PCIE_CORE_AXI_CONF_BASE + 0x824)
 #define PCIE_CORE_OB_REGION_ADDR0	(PCIE_CORE_AXI_CONF_BASE + 0x0)
 #define   PCIE_CORE_OB_REGION_ADDR0_NUM_BITS	0x3f
 #define   PCIE_CORE_OB_REGION_ADDR0_LO_ADDR	PCIE_ADDR_MASK

-- 
Git-155)



