Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969FF606A685
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iQvPx3/+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WvOETUsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iuNi0U87BKz/2WbFki1kVDGDkTecmSYTtLyfcIq6jsg=; b=iQvPx3/+zX33mgaRxDRGaI+KGu
	MQKxj0VsMxvCuvTMRLxaKCKYQf0FgKA2Ve73Bcu0lVriz81keWDtYaB3dR/ZbjK4W2YF67oKh0ywT
	oOw49v24HM14g31CvuZBaRsiDpvwYrG8JaETNy72J4nf+5Qa9w5fy5LJo5U8JNVMnmv7EizUrmo/K
	EYmItwrtZqgyR0EO3wgFw55okM4aWbtsWF2Bieh/pvBUTB/s6iuTVwB6lX3+6Tv11IIjkIMU/cMiQ
	NXvU6dHVwEhwQjtwkVh0WCzE7kPv1R31tEJJ/+aD8KuyVg+nYPAF4fJn4b+XVaX1yHS4pwjBGwHLu
	caS3f40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Ow-00000009Ikq-3G4o;
	Wed, 25 Nov 2026 09:34:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Ov-00000009Iiq-0Mpj;
	Wed, 25 Nov 2026 09:34:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1EEC4385B;
	Wed, 25 Nov 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795599292;
	b=OyTCpfXhqDrfVVpWgcNnlGWPN6BzYLZ04qIjwXqx0rm0kh8NLBeCuf71Rpn81p/mSX+X
	 wuiRkqpKZ0Py96S9muyIbshRElcIm1oDDpYYMAdJZKUt6IrbBtwXcg2EUhHIPalPn+ivU
	 aI/F5TIvUjohsIHu0ltV24bBa3izCb8lpk7hzVJIZnwmeZMkWdk5h+90hGq5FrgAFAMit
	 5OidjHXJbfQI+OY/0G8OCxfpfQoQgG6U+9kuYY/BxENwb4kHLc2cjm+ZMNgk531a6BGLH
	 J/hYaIChf3Ap7oCwEqISen1oqdlGDz6HV5TbKZpKaF12yby82t/UY3XelO8kaenNj9Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795599292;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iuNi0U87BKz/2WbFki1kVDGDkTecmSYTtLyfcIq6jsg=;
	b=uScNYOnPodLtEH7Tqulk6Y+oeQ7ewZEY3ezojtE0v6sCL2ZcSI2fF/w1GtEUyWzipOqd
	 jet39nF7DogtfCWjLKLlKTEM1WB1vVf+e+iGFp9cekV7Y1S31rr+4cHBaEbJP4Bb5Vb6W
	 54E8kpgBqjDaHL7T/g9I+N3n4Z1DMGo9fVhYjQRSCCw11bUPPjlVLx2xf0wcAc46RJ1sO
	 S1w2A93mI4QSUdtx4BXt7Sl8U20toRIn3/hMvwG60k9anklcdaOfxr1aYUAu0zPyFVGS9
	 EZXUYW2LFTxoPzCmY2Wgbdwbc7UKVyS0hW94O1I6iTOfD1DDI5P+JOeyGc62XPEoMZw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC82A1F000C4;
	Wed, 25 Nov 2026 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599292;
	bh=iuNi0U87BKz/2WbFki1kVDGDkTecmSYTtLyfcIq6jsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WvOETUsyGn0+zMrOeJ5dPvmjwX06qwNJHczQr/dnyrcvph8rwhN2zmOkBqlaxpbZl
	 KmYLBC3CgFMUkqR+qAm16nfRa97MAchP35gMwhHvIapSc3jjNQOieqTLVkAJwuphQR
	 nuh7VmONdKpBGpznRNSDt4fLCbJBHim/81rrmkEEGLI8BuLUfkXZn2zvm27h1dk/q5
	 /18tcsJSEuKsE14yjtwCvvavoR6TMAFLDS8yyTqjB4GrjuKcBIaF7sogzsl/zLq9zg
	 h/YP18bLX6Y2pnicf0svOP/T0X4DyyF8pC9EC1eynmmLX8CrCP22UioEmegsgVgx1Z
	 CkIsfXk7qyo7Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 56F1D4CDCB;
	Wed, 25 Nov 2026 09:34:36 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Nov 2026 10:33:43 +0100
Subject: [PATCH RFC v4 01/15] dt-bindings: phy: Add NXP S32G SerDes
 subsystem
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-s32g_serdes-v4-1-3bfe0589be8d@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599274; l=6931;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=pFftY5ppzmA4Tf+cdOjE2ihm8f1VwzEk/60Lo7i4qIc=;
 b=3bbfmg5c+OccNyS5LG7aiWzBtkz3ffrgYWf1bz6LgNqobSpPjIII0BxLOhGI4WGU8p53GT5j2
 qgJ69HhmkMqBBh/mo0uRkTkydQRVj6DUsFHSHSpqfMVkDzSq1f8AbqX
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

The S32G SerDes subsystem multiplexes two lanes between a PCIe PHY and
two DesignWare XPCS instances. Describe it with one node per SerDes,
which is a four-cell PHY provider: <lane type instance max-speed>.

There is no mode property. SS_RW_REG_0[SUBSYS_MODE] follows from the
phys references of the consumers: a PCIe root port references its
lanes with PHY_TYPE_PCIE, an Ethernet controller references its lane
with PHY_TYPE_SGMII, the XPCS instance it is wired to and the highest
speed the lane is wired for, and takes the PCS from the SerDes node
through pcs-handle. Each mode described here has a unique lane mux. A
lane that no consumer references takes the function it has in the
first matching mode.

The XPCS instance is a cell rather than derived from the MAC: the mux
is programmed at SerDes probe, before any MAC exists, and "XPCS0 alone
on lane 1" (mode 1 with the PCIe lane idle) and "XPCS1 alone on lane 1"
(mode 2) are different routings of the same pins. The cell layout is
final.

The speed is a cell for the same reason. The 3.125 Gbit/s
configurations select other SUBSYS_MODE values, reference clocks and
PCIe speeds, all decided at SerDes probe, and the MAC's phy-mode does
not tell: an in-band SGMII link to a 2.5G PHY is "sgmii" and moves to
2500BASE-X at runtime. Only the 1.25 Gbit/s modes are described, so
1000 is the only accepted speed; 2500 comes with the 3.125 Gbit/s
modes without a change of #phy-cells.

The mode tables differ per SoC and per SerDes instance, so S32G2 and
S32G3 have no common fallback, and each instance has its own compatible
with the per-SoC one as fallback.

Co-developed-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../devicetree/bindings/phy/nxp,s32g-serdes.yaml   | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
new file mode 100644
index 000000000000..a06becfcc4e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nxp,s32g-serdes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xxx/S32G3xxx SerDes PHY subsystem
+
+maintainers:
+  - Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+  - Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+  - Jan Petrous <jan.petrous@oss.nxp.com>
+
+description: |
+  The SerDes subsystem multiplexes two lanes between one PCIe controller PHY
+  and two Synopsys DesignWare XPCS (Ethernet PCS) instances, behind a shared
+  2-lane combo PHY. The routing is selected by SS_RW_REG_0[SUBSYS_MODE].
+  The 1.25 Gbit/s modes are:
+
+  Mode  Lane0   Lane1   PHY refclk (MHz)  Description
+  ------------------------------------------------------------
+  0     PCIe    PCIe    100               PCIe x2
+  1     PCIe    XPCS0   100               PCIe x1 + SGMII
+  2     PCIe    XPCS1   100               PCIe x1 + SGMII
+  3     XPCS0   XPCS1   100 or 125        dual SGMII, 1.25 Gbit/s
+
+  The mode is not a property. It follows from the phys references of the
+  consumers: each one names the lane, the PHY type and, for an XPCS lane,
+  the XPCS instance and the highest speed the lane is wired for. Each mode
+  has a unique lane mux. A lane that no consumer references takes the
+  function it has in the first matching mode of the table.
+
+  A PCIe root port references one lane per link width. An Ethernet MAC
+  references its lane with phys and takes its PCS from the same SerDes
+  node through pcs-handle.
+
+  Which MAC an XPCS instance feeds is fixed by the SoC integration. On S32G3
+  SerDes_0, XPCS0 feeds GMAC0 and XPCS1 feeds PFE_MAC2; on SerDes_1 they feed
+  PFE_MAC0 and PFE_MAC1.
+
+  The mode tables differ per SoC and per SerDes instance: on S32G3 the
+  3.125 Gbit/s dual-XPCS mode exists on SerDes_1 only, and on S32G2 only
+  SerDes_1 reaches 3.125 Gbit/s. S32G2 and S32G3 therefore have no common
+  fallback, and each instance has its own compatible, with the per-SoC one
+  as fallback.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nxp,s32g2-serdes0
+              - nxp,s32g2-serdes1
+          - const: nxp,s32g2-serdes
+      - items:
+          - enum:
+              - nxp,s32g3-serdes0
+              - nxp,s32g3-serdes1
+          - const: nxp,s32g3-serdes
+
+  reg:
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: ss-pcie
+      - const: pcie-phy
+      - const: xpcs0
+      - const: xpcs1
+
+  clocks:
+    minItems: 4
+    maxItems: 5
+
+  clock-names:
+    minItems: 4
+    items:
+      - const: axi
+      - const: aux
+      - const: apb
+      - const: ref
+      - const: ext
+    description:
+      The combo PHY reference can be taken from the internal reference
+      clock ("ref") or from the external reference pad ("ext"). A board
+      that routes the external pad lists both; the external reference is
+      then the one used.
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: serdes
+      - const: pcie
+
+  '#phy-cells':
+    const: 4
+    description: |
+      The first cell is the lane, 0 or 1. The second cell is the PHY type,
+      PHY_TYPE_PCIE or PHY_TYPE_SGMII from dt-bindings/phy/phy.h. The third
+      cell is the XPCS instance, 0 or 1, and the fourth the highest
+      Ethernet speed the lane is wired for, in Mbit/s: 1000 for a 1.25
+      Gbit/s lane, 2500 for a 3.125 Gbit/s one. Both are 0 for
+      PHY_TYPE_PCIE.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  # Consumers select the mode. PCIe x1 on lane 0 plus 1G SGMII on lane 1 via
+  # XPCS0 (mode 1) is, on the PCIe root port and the MAC:
+  #   phys = <&serdes0 0 PHY_TYPE_PCIE 0 0>;
+  #   phys = <&serdes0 1 PHY_TYPE_SGMII 0 1000>; pcs-handle = <&serdes0>;
+  - |
+    serdes0: serdes@40480000 {
+        compatible = "nxp,s32g3-serdes0", "nxp,s32g3-serdes";
+        reg = <0x40480000 0x108>,
+              <0x40483008 0x10>,
+              <0x40482000 0x800>,
+              <0x40482800 0x800>;
+        reg-names = "ss-pcie", "pcie-phy", "xpcs0", "xpcs1";
+        clocks = <&clks 1>, <&clks 2>, <&clks 3>, <&clks 4>;
+        clock-names = "axi", "aux", "apb", "ref";
+        resets = <&scmi_reset 1>, <&scmi_reset 0>;
+        reset-names = "serdes", "pcie";
+        #phy-cells = <4>;
+    };

-- 
2.55.0



