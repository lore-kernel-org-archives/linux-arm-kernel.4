Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A67606A6BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bmTn/zpK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0ozc40m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HWRMjyr4aTvyFi5GN7IakCtRgzjaHqdEoK8cA44KoW8=; b=bmTn/zpKxzdYFxd8ZU0j1jkMU0
	4+4kU70hmCbGCMCRzWpxxzG5lTyIFWRVyYajjf5znPYCHUOCDXPhFpuSXnhk5pGEVpsqlo28r5Mt8
	4ROUe8Up+jbH50rVr/4TAtmu1HpLYDnOvsozH+EV8iP6zH5PeHykrl92J13LSnqxwoLZYlvOWasHf
	6RukhaXkBQcrLVSrEcDPllouALs6nLM2Yy+g+ZBmB/i9QaS/1apbvOACs/2g2VirlbUcSJ9Ohyyz+
	621e0oWqwT9X3ALfEN+9PGIQ8g9KI3LeOTRygHE6aaOF70zDVTh8LOmJ8P7E33JKN5IF6cjW8YoHI
	36j0fNDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9PH-00000009J4I-4Ayo;
	Wed, 25 Nov 2026 09:35:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9P0-00000009Iog-3vS4;
	Wed, 25 Nov 2026 09:34:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 481E96261E;
	Wed, 25 Nov 2026 09:34:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795599298;
	b=sat5UDWXkGJTQcsVa6++G2sEeYHbnfMJytpd34gc2wyW94KtsvA7GCW41oLjMHX93oSs
	 6s8gAPm1ISRVJZ25SQnUUjTWs1ek7LOa4IfFVbTxbdEY+7dUgLeXL87bhkrCuzo1/T8W0
	 NInHLbeOZlRWb2wuGB9BsRL/251CFq36eLRWhcog9TpDNCKSrhQ02+BosRk0BM2EmBNAH
	 KAiecgSHoX/ykYwjd/He+w0q4Ij+V2pDH0uX5HJ3OujDHjwqGywOr3N/mM+7f7mOYtqSx
	 fSF6KBK4Op0aloDqSW7em6BhEvFjeih+4ZMN1ODR2UNRuo7EfO08NFjQubLfAG+/yhQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795599298;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HWRMjyr4aTvyFi5GN7IakCtRgzjaHqdEoK8cA44KoW8=;
	b=FQoU7N22c4/FnlGY73gl95eCw21lWm5fI7tNQUDKDTDdwXP0vHDrJ+yxDO5vw3xb52I8
	 Mtnzn54ptkCISWGPxDwIFFvC4wSfEX4gXwJDIHy6No4KVx6z3S+RkFJGE+y4VIJsU0wue
	 7KJRQmdgdXc9J6MrNNelp3aIQ/6MFF00K38dQYBjnayfPFC0Aio+FtvxEd4jlEVpsggWL
	 39HPJ5Pl2FDG+hz40CqaAV+r0seEKatmuJe8EMgzBhR5GtMIR1Pv8KIrbIm2C//QUdnLq
	 ec0tAt9YywrN8RcB8WhuWyLUmU3qvI2anYiAhZBS3+gwtpNDQ7/9VroBieeDH4TqBxA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 410091F000E0;
	Wed, 25 Nov 2026 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599298;
	bh=HWRMjyr4aTvyFi5GN7IakCtRgzjaHqdEoK8cA44KoW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=m0ozc40mX3AJRm+v4BGwRwdGwKLcFj2pvT37QMzuGh5eDWiyWBENml8B5qfDua3NH
	 Eiqxv3grx7mBbGbMJCVP6sw+aZpGLf4Rg2iOnzsc+h1HOH82LjcqjbM3pIgAQFNiWq
	 WoPOaQhoRH9RKbmsYoQYGj2h7I9HGvYRV/W+Z6lI0dt5NxPgq8yO8spMSjVKfm2/I8
	 7yz+I6zq0F+0lK7qW/xpHNV1L23sWy5NewGee0JwXDUQ7cuTRYJb2bOVb7jG3bQ14G
	 6mBIfTjJ4uA466r/Aed1vMUYN6E8TPER4Vtt4elFrymPazloargLWZ0OxYxuOc1TFD
	 MnynckoheZ3XA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DA9054CE02;
	Wed, 25 Nov 2026 09:34:36 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Nov 2026 10:33:47 +0100
Subject: [PATCH RFC v4 05/15] net: pcs: xpcs: let a glue driver declare the
 PCS and PMA IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-s32g_serdes-v4-5-3bfe0589be8d@oss.nxp.com>
References: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
In-Reply-To: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
 Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599274; l=8166;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=zziN4zs/7ymNjszoLkejUNsWyE3XxA4CiFWejqEcbqo=;
 b=scXVFDYUJxKNAR4oSt+ORbnE77rK6LcKU2QkpL+LI6Bu5ZW8rWDeu9fvBSbtIPStTKlooa+lc
 RFs/CL67YSpD7/vhrJt/vK16qaUyu2WdE6o5xcWP76wAefCzLFzKiqW
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

pcs-xpcs selects its description entry by the PCS ID read from the
device. An XPCS integrated with a vendor PMA reports the generic
DesignWare PCS ID, so the entry cannot tell such an integration from a
plain XPCS. Glue drivers have answered this so far by returning a
synthetic PCS ID from their MDIO bus emulation.

The core already takes declared IDs through struct dw_xpcs_info, which
pcs-xpcs-plat passes for PMA generations it cannot read from the
device, but only from the platform data of an MDIO device the creator
registered itself.

Let a glue driver declare them instead:

 - xpcs_create_pcs_mdiodev_info() creates the PCS like
   xpcs_create_pcs_mdiodev() and takes a struct dw_xpcs_info;

 - with both IDs declared, no ID register is read. A glue whose
   register window is not clocked when it creates the PCS needs that;

 - a description entry may name a PMA ID. It then matches only that
   PMA, and takes precedence over an entry for the same PCS ID that
   matches any PMA.

No entry names a PMA yet and no existing caller declares both IDs, so
there is no functional change.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/pcs/pcs-xpcs.c   | 95 ++++++++++++++++++++++++++++++++++----------
 include/linux/pcs/pcs-xpcs.h |  2 +
 2 files changed, 75 insertions(+), 22 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 442c64a731b7..3b5857dc44f3 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -170,6 +170,8 @@ struct dw_xpcs_compat {
 struct dw_xpcs_desc {
 	u32 id;
 	u32 mask;
+	/* Match only this PMA ID; 0 matches any PMA */
+	u32 pma;
 	const struct dw_xpcs_compat *compat;
 	unsigned int quirks;
 };
@@ -1366,6 +1368,11 @@ static int xpcs_read_ids(struct dw_xpcs *xpcs)
 	int ret;
 	u32 id;
 
+	/* Both IDs declared by the creator, nothing to read */
+	if (xpcs->info.pcs != DW_XPCS_ID_NATIVE &&
+	    xpcs->info.pma != DW_XPCS_PMA_ID_NATIVE)
+		return 0;
+
 	/* First, search C73 PCS using PCS MMD 3. Return ENODEV if communication
 	 * failed indicating that device couldn't be reached.
 	 */
@@ -1530,22 +1537,36 @@ static const struct phylink_pcs_ops xpcs_phylink_ops = {
 
 static int xpcs_identify(struct dw_xpcs *xpcs)
 {
+	const struct dw_xpcs_desc *match = NULL;
 	int i, ret;
 
 	ret = xpcs_read_ids(xpcs);
 	if (ret < 0)
 		return ret;
 
+	/* An entry for the PMA ID takes precedence over one for any PMA */
 	for (i = 0; i < ARRAY_SIZE(xpcs_desc_list); i++) {
 		const struct dw_xpcs_desc *entry = &xpcs_desc_list[i];
 
-		if ((xpcs->info.pcs & entry->mask) == entry->id) {
-			xpcs->desc = entry;
-			return 0;
+		if ((xpcs->info.pcs & entry->mask) != entry->id)
+			continue;
+
+		if (entry->pma) {
+			if (entry->pma == xpcs->info.pma) {
+				match = entry;
+				break;
+			}
+		} else if (!match) {
+			match = entry;
 		}
 	}
 
-	return -ENODEV;
+	if (!match)
+		return -ENODEV;
+
+	xpcs->desc = match;
+
+	return 0;
 }
 
 static struct dw_xpcs *xpcs_create_data(struct mdio_device *mdiodev)
@@ -1602,11 +1623,10 @@ static void xpcs_clear_clks(struct dw_xpcs *xpcs)
 	clk_bulk_put(DW_XPCS_NUM_CLKS, xpcs->clks);
 }
 
-static int xpcs_init_id(struct dw_xpcs *xpcs)
+static int xpcs_init_id(struct dw_xpcs *xpcs, const struct dw_xpcs_info *info)
 {
-	const struct dw_xpcs_info *info;
-
-	info = dev_get_platdata(&xpcs->mdiodev->dev);
+	if (!info)
+		info = dev_get_platdata(&xpcs->mdiodev->dev);
 	if (!info) {
 		xpcs->info.pcs = DW_XPCS_ID_NATIVE;
 		xpcs->info.pma = DW_XPCS_PMA_ID_NATIVE;
@@ -1617,7 +1637,8 @@ static int xpcs_init_id(struct dw_xpcs *xpcs)
 	return xpcs_identify(xpcs);
 }
 
-static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
+static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
+				   const struct dw_xpcs_info *info)
 {
 	struct dw_xpcs *xpcs;
 	int ret;
@@ -1630,7 +1651,7 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
 	if (ret)
 		goto out_free_data;
 
-	ret = xpcs_init_id(xpcs);
+	ret = xpcs_init_id(xpcs, info);
 	if (ret)
 		goto out_clear_clks;
 
@@ -1653,16 +1674,8 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
 	return ERR_PTR(ret);
 }
 
-/**
- * xpcs_create_mdiodev() - create a DW xPCS instance with the MDIO @addr
- * @bus: pointer to the MDIO-bus descriptor for the device to be looked at
- * @addr: device MDIO-bus ID
- *
- * Return: a pointer to the DW XPCS handle if successful, otherwise -ENODEV if
- * the PCS device couldn't be found on the bus and other negative errno related
- * to the data allocation and MDIO-bus communications.
- */
-struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr)
+static struct dw_xpcs *xpcs_create_mdiodev_info(struct mii_bus *bus, int addr,
+						const struct dw_xpcs_info *info)
 {
 	struct mdio_device *mdiodev;
 	struct dw_xpcs *xpcs;
@@ -1671,7 +1684,7 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr)
 	if (IS_ERR(mdiodev))
 		return ERR_CAST(mdiodev);
 
-	xpcs = xpcs_create(mdiodev);
+	xpcs = xpcs_create(mdiodev, info);
 
 	/* xpcs_create() has taken a refcount on the mdiodev if it was
 	 * successful. If xpcs_create() fails, this will free the mdio
@@ -1683,6 +1696,20 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr)
 
 	return xpcs;
 }
+
+/**
+ * xpcs_create_mdiodev() - create a DW xPCS instance with the MDIO @addr
+ * @bus: pointer to the MDIO-bus descriptor for the device to be looked at
+ * @addr: device MDIO-bus ID
+ *
+ * Return: a pointer to the DW XPCS handle if successful, otherwise -ENODEV if
+ * the PCS device couldn't be found on the bus and other negative errno related
+ * to the data allocation and MDIO-bus communications.
+ */
+struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr)
+{
+	return xpcs_create_mdiodev_info(bus, addr, NULL);
+}
 EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
 
 struct phylink_pcs *xpcs_create_pcs_mdiodev(struct mii_bus *bus, int addr)
@@ -1697,6 +1724,30 @@ struct phylink_pcs *xpcs_create_pcs_mdiodev(struct mii_bus *bus, int addr)
 }
 EXPORT_SYMBOL_GPL(xpcs_create_pcs_mdiodev);
 
+/**
+ * xpcs_create_pcs_mdiodev_info() - create a DW xPCS PCS with declared IDs
+ * @bus: MDIO bus of the PCS
+ * @addr: MDIO address of the PCS
+ * @info: PCS and PMA IDs; an ID left native is read from the device
+ *
+ * For a glue driver that knows the integration of its XPCS. With both IDs
+ * declared, no ID register is read. @info is copied.
+ *
+ * Return: the phylink PCS, or an ERR_PTR() as for xpcs_create_mdiodev().
+ */
+struct phylink_pcs *xpcs_create_pcs_mdiodev_info(struct mii_bus *bus, int addr,
+						 const struct dw_xpcs_info *info)
+{
+	struct dw_xpcs *xpcs;
+
+	xpcs = xpcs_create_mdiodev_info(bus, addr, info);
+	if (IS_ERR(xpcs))
+		return ERR_CAST(xpcs);
+
+	return &xpcs->pcs;
+}
+EXPORT_SYMBOL_GPL(xpcs_create_pcs_mdiodev_info);
+
 /**
  * xpcs_create_fwnode() - Create a DW xPCS instance from @fwnode
  * @fwnode: fwnode handle poining to the DW XPCS device
@@ -1719,7 +1770,7 @@ struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode)
 	if (!mdiodev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	xpcs = xpcs_create(mdiodev);
+	xpcs = xpcs_create(mdiodev, NULL);
 
 	/* xpcs_create() has taken a refcount on the mdiodev if it was
 	 * successful. If xpcs_create() fails, this will free the mdio
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 36073f7b6bb4..f46434958383 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -58,6 +58,8 @@ struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode);
 void xpcs_destroy(struct dw_xpcs *xpcs);
 
 struct phylink_pcs *xpcs_create_pcs_mdiodev(struct mii_bus *bus, int addr);
+struct phylink_pcs *xpcs_create_pcs_mdiodev_info(struct mii_bus *bus, int addr,
+						 const struct dw_xpcs_info *info);
 void xpcs_destroy_pcs(struct phylink_pcs *pcs);
 
 #endif /* __LINUX_PCS_XPCS_H */

-- 
2.55.0



