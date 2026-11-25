Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71047606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LD4WBTSm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WClvNEeu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FPW2O/CZksG07s1KEeo2I5JR2fFDL0AqSEPRwnJ+rAw=; b=LD4WBTSmu/CzN/fRABNZB0S+aF
	dVBEyWKW6eMOGzmrgMj2j8g0og/Xx5MGfg7csmhkUe2MT/DUjJu7JdBKAD7y8Q4UC3vjOvWJcCuL0
	ZZF8XD0MFAyaXang+/QX+GJUw1++ekvBtWNKTY2xdYrhy2UOs5pgbM++SQmmsN8vUM3Wtx6JNxKUa
	2mhmh3xzBnxyKBpDIVJ2ZLStmyrPhf96ZI+eKb/4moUIWyRAJvxMTbFdRTybtMvqvKkotnowCOUDh
	ngU1rJ5jS7tdHnAvAk6eHlS/IneTMlsmB1298kEt6qWGZ2xilz35U91eGxDGM+/MkprPqp8ReB6cL
	Mq5rBriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Ow-00000009Ijo-1wzs;
	Wed, 25 Nov 2026 09:34:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Or-00000009IhN-2SoC;
	Wed, 25 Nov 2026 09:34:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F39A62103;
	Wed, 25 Nov 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795599288;
	b=F6sSTVMoPwAuetQzUHUeTV1YZHKOkTB4OZvHvoAAuJ65SfY71FtGcLN/0E1mxBXjFzsd
	 6TP2gy1SVNV/bsUVWTgApXdswjc8sSkc/BzExp5dD+pRZgg2gJ1lyHPfvP0Y4KRjcweww
	 RGk4QHJlfhjyPwxOjNC+K4N3IYMvXgwI/3GUNvIwTqyVmAY6yyhaFAfVVwY5gb8R1reKo
	 Djuf3lBOShUxEqfK+BNf1/GQ42+x6M35zvd1F1uMnESnQWndWczjfV0QZEisna895DjOJ
	 6EyNZvSrsQk5AucqvzBXwnNG7sxjjzKOV2zc4qsI1uFIvynVmyTqfDs0ArF59gJQykg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795599288;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FPW2O/CZksG07s1KEeo2I5JR2fFDL0AqSEPRwnJ+rAw=;
	b=ABAyZ3YxknMTPTz+QL+MCbNcVh3oAlzL54tM8Vng7oFr73MTPAG6iQxDCyJmlSQX1yAj
	 GefpdTSelpfpngIEGIw/N8FJ7QKdDwZZlQJ28CsPTNcc43y5OxokvFKIvSibv2GhD7qQ2
	 qz7rwXEv4HuYufYIzZzjstnXAJ6V5aEBgJM9aOSrGvOYs6/SsD5yh08cH5lEXLnfHe3tO
	 U11AHC3q/lDT0sffH1ZBHucqH5SBthfDkYCB65sFW0sIdTztTYP5qDXK08wGCzG5ZubUu
	 sj4ju0BjvbvT4FX2/Zn2PcCjOYiX+vdNcOUAy70IpCkZSj6bzjC/iZgaOcMevVUqFgA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 369111F000D1;
	Wed, 25 Nov 2026 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599288;
	bh=FPW2O/CZksG07s1KEeo2I5JR2fFDL0AqSEPRwnJ+rAw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WClvNEeu4R4e79Exo+1TmvDr1NaEyRokfzKKYRko5BeGZjUKilF2+PWME/pL2QO7a
	 nFBc/8fjkeemYy+Yvmuo5FNPX6Nz9f7vM39XsjGL6jGtwKfLLWeKnQxblHnFFj718P
	 6vhA8WZk0S42AVOVYfoDZzKoJEFcQFwqRsgaoeUzNL6m9bicI0KEVsh3JK3Q1nQG+2
	 bhsUwBnNx91euH+WHS2E+812zGXTGqAxsR0weY/tRiBycwSRBwNU8wVzfAne5e7C0O
	 fXdvPj+9NZyypAvkNbWlA8hvXIJAa60gq7Gn4xzWhn8XcHFYVjTHikYaM3UCRed9FP
	 ufJR9/aOwKwVQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B4BFD4CDFE;
	Wed, 25 Nov 2026 09:34:36 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Nov 2026 10:33:46 +0100
Subject: [PATCH RFC v4 04/15] net: pcs: xpcs: allow a PCS to opt out of
 soft reset and EEE
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-s32g_serdes-v4-4-3bfe0589be8d@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599274; l=2142;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=XscJymCuOoPX6VkV4O1nIKYSBnUzCtjWiHRRdPqdbMk=;
 b=iE2FYHKkZBcU6n24n7zNpgnccWxNcvMAikDlY+jLN6198179BHbRw1XeT2teHMY9FSK6wFUv8
 dIL2U1KySspC9q2iEtKQHhV1fidG8GKop8Oba4PFSWj7J2idWFs6aFx
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

Add a quirks mask to struct dw_xpcs_desc, with two flags:

 - DW_XPCS_QUIRK_NO_SOFT_RESET: no soft reset in pcs_pre_config(). When
   the XPCS shares its PMA with another controller, the reset belongs
   to a bring-up sequence owned by the platform.

 - DW_XPCS_QUIRK_NO_EEE: VR_MII_EEE_MCTRL0/1 are not implemented and
   must not be written.

No entry sets a quirk yet, so there is no functional change.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/pcs/pcs-xpcs.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6466e0ff2a98..442c64a731b7 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -158,10 +158,20 @@ struct dw_xpcs_compat {
 	int (*pma_config)(struct dw_xpcs *xpcs);
 };
 
+/*
+ * The integration owns the PCS reset sequence: skip the soft reset in
+ * pcs_pre_config(). Only for PCS without Clause 73, whose fault recovery
+ * still resets.
+ */
+#define DW_XPCS_QUIRK_NO_SOFT_RESET	BIT(0)
+/* VR_MII_EEE_MCTRL0/1 are not implemented */
+#define DW_XPCS_QUIRK_NO_EEE		BIT(1)
+
 struct dw_xpcs_desc {
 	u32 id;
 	u32 mask;
 	const struct dw_xpcs_compat *compat;
+	unsigned int quirks;
 };
 
 static const struct dw_xpcs_compat *
@@ -729,6 +739,9 @@ static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
 		dev_err(&xpcs->mdiodev->dev, "switch interface failed: %pe\n",
 			ERR_PTR(ret));
 
+	if (xpcs->desc->quirks & DW_XPCS_QUIRK_NO_SOFT_RESET)
+		xpcs->need_reset = false;
+
 	if (!xpcs->need_reset)
 		return;
 
@@ -1318,6 +1331,9 @@ static void xpcs_disable_eee(struct phylink_pcs *pcs)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
+	if (xpcs->desc->quirks & DW_XPCS_QUIRK_NO_EEE)
+		return;
+
 	xpcs_config_eee(xpcs, false);
 }
 
@@ -1325,6 +1341,9 @@ static void xpcs_enable_eee(struct phylink_pcs *pcs)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
+	if (xpcs->desc->quirks & DW_XPCS_QUIRK_NO_EEE)
+		return;
+
 	xpcs_config_eee(xpcs, true);
 }
 

-- 
2.55.0



