Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3960A2624
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sgWnQYXz;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=a/3diZie
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rz1/qhkmcsmA9m5Z10+lUebSsmx3tzNdOvRmL/aiPFk=; b=sgWnQYXzX9R77R
	f38zU5/8enuwk8+ys495ntKaAsNZh6K3gZrNnGdH61bA6JyEBuxwnIVtjIvTP+ZGPL7yLY+WjKl3Y
	wkfaNeZyD540Ckpbarr/J8WSH/td0Aqkv3S/JC5UfN7OW2H5ZmQ0YF4Zt7ZAJLIkmb1IZFdIT87pH
	KWv4dUhbvWAENhew4CN9aiwlHNX9hs0nonrlMTT6IxlHh8RsubJIRML0bK0vpRR2icUW4nS25AlgD
	n4lYG4ohIP2JkC2L6kFWc4pOs8VWZCJgaQb/9R8FV+O5wkJXCdgKtO374KgvPpQS9RfYWVow90qBx
	d44nCduMs4rclB8CLaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQixg-00000003R43-3E78;
	Tue, 10 Nov 2026 10:20:20 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQixZ-00000003QzG-2jQN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:20:16 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D7C0B202824;
	Tue, 10 Nov 2026 11:20:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794306010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rz1/qhkmcsmA9m5Z10+lUebSsmx3tzNdOvRmL/aiPFk=;
	b=a/3diZies+L7OwjjsfsbE8LX3ng1OFVyPADGuXGI3rFhRkLEElGZzpVpovhLlhadoLUgV5
	rxM3AqQ6D5Gi8QLLb/9R/ozdZXeHuJNyz56TJtRKGbTobJ+Jn7UAS0hNirXLFb8qXM8f0B
	5amSRP6OImcz4xh20ne6hkiIioo1S/iS8XyT+AIFHK+5kR5ph01wnPHn+mOqFCjR9zZ08d
	BSgruJLwQT2QBUlaGzwT19XyBjmzK/W1SJPFtkCgUDi3e6wsgIrT1M9r6Eu5kKeltuBbMK
	B5K+lpKMDk33+3EbVM3LKcgOBWoCcVgSvzDukcZbQyMYUwpXyvYzlu4pjXI71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794306010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rz1/qhkmcsmA9m5Z10+lUebSsmx3tzNdOvRmL/aiPFk=;
	b=IjJwOPMZbuVL5tlri60tzqV5WeNSWr3BeCIdYSZVYiCXa7DCs9ftTmd4Y/OkA8HPLHlgjZ
	rmf3oZkHUM59Q9k4xd8dHHOGMMoZNGrezbbWIT/aSHAn+iJ9OMojOMTV5FSwjYQsPFlBIx
	1ebVTmGPoINKbsK6Rxi0wn4QeeMbv7ofgylBNOxgHPn5QqUosBc54ssPlASgoLEvXmnNHP
	9StW/t+jettyH6kQaPCtgVL1nyTpsiPAR9i3fpOwEQwEkVsM+piLpblrEm50qilUGjU2Wx
	JKMncPYNPsxLpnZE0IISc53gSlvT2ubPfOBzQLsLcvexyBudRnY/0WNPLGXBpQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794306010; a=rsa-sha256;
	cv=none;
	b=ECBOLePp4BK6wswvmqBp+3O3Q7PicbfGnSaEg6jo+YtQx8crdCIvqjQFrT2xrQBo6t8fgG
	uHvFIc2qnXGjLXESapEqT43RHHhGe/UbOCOyeWuxVJEzggHnz9jYWSzA0PYvAtr/sMWF2b
	0oOgm74VMQxUUPYHId9MJcSOoZOBgwX0jzfZ4hrGrh9oyv2qAyLTpaqnSVM8KzbE8qZbvr
	uMWoFn4okAGJeySKv8GB1thC0SE4RHPhd3nmJovrpuOyU0DWgV7XcEgVxFTLsTZhrnq3kw
	zWCYhI174h08aswan8Etjpg39A4Sc3LStKGYWseiT7c5WQ7nDfDU4mzLuN1jlg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 10 Nov 2026 11:20:08 +0100
Subject: [PATCH net-next v4 4/4] net: phy: dp83867: support setting
 output-impedance
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-v7-2-topic-dp83867-v4-4-a268f83b1ec1@pengutronix.de>
References: <20261110-v7-2-topic-dp83867-v4-0-a268f83b1ec1@pengutronix.de>
In-Reply-To: <20261110-v7-2-topic-dp83867-v4-0-a268f83b1ec1@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@amd.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3665;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=Yz7CSZ8fq/VGSX0cp9pV2oHueA0A3/PfruOLUVGTgyA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9an9zfmp61fteqexrfyT3K3bk84IN1UeIH38p9tLAJiM
 Q+9DC+e6ihlYRDjYpAVU2RRWVjBJ+rxwTNymggXzBxWJpAhDFycAjCR7cEMf/i5Uj4t1I/JStx+
 rkA/cPMaQ9Hzxy890FtiVlfadbV9ZTPDX4nzly+bBmu//dicFMYtVq+oZKKsZiHs3OuzsvFYgdl
 3FgA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_022013_882562_26F5F1B2 
X-CRM114-Status: GOOD (  19.35  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently the dp83867 supports setting the io impedance to minimum,
maximum, default or a value from a nvmem cell. In situations where there
is no backend for a nvmem cell, the value can not be set to anything but
minimum, maximum or default.

Add support for the ti,output-impedance-ohms binding, allowing to
specify the impedance in ohms via the devicetree. The PHY has 32
settings between 35 and 70 ohms. The datasheet does not specify the
impedance of each setting, so the value is mapped linearly to the
nearest one.

With this mapping, 50 ohms results in 0x12. For non-OF devices, the
driver sets 0x0f (IO_IMPEDANCE_MIN / 2) as the 50 ohm default "per
datasheet", which would be 53 ohms with the linear mapping. As the
datasheet only gives the range, neither value can be checked against it.

The binding does not allow combining the new property with the nvmem
cell or the boolean properties. The driver still reads the nvmem cell
first, then ti,max-output-impedance, ti,min-output-impedance and
ti,output-impedance-ohms.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/net/phy/dp83867.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index a3cd5cb11ea0a..ca668e75f0c99 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -119,6 +119,9 @@
 #define DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK	0x1f
 #define DP83867_IO_MUX_CFG_IO_IMPEDANCE_MAX	0x0
 #define DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN	0x1f
+/* Output impedance at IO_IMPEDANCE_MIN and IO_IMPEDANCE_MAX (datasheet) */
+#define DP83867_IO_IMPEDANCE_MIN_OHMS		35
+#define DP83867_IO_IMPEDANCE_MAX_OHMS		70
 #define DP83867_IO_MUX_CFG_CLK_O_DISABLE	BIT(6)
 #define DP83867_IO_MUX_CFG_CLK_O_SEL_MASK	(0x1f << 8)
 #define DP83867_IO_MUX_CFG_CLK_O_SEL_SHIFT	8
@@ -542,7 +545,8 @@ static int dp83867_of_init_io_impedance(struct phy_device *phydev)
 	struct device *dev = &phydev->mdio.dev;
 	struct device_node *of_node = dev->of_node;
 	struct nvmem_cell *cell;
-	u8 *buf, val;
+	u8 *buf;
+	u32 val;
 	int ret;
 
 	cell = of_nvmem_cell_get(of_node, "io_impedance_ctrl");
@@ -553,12 +557,29 @@ static int dp83867_of_init_io_impedance(struct phy_device *phydev)
 						"failed to get nvmem cell io_impedance_ctrl\n");
 
 		/* If no nvmem cell, check for the boolean properties. */
-		if (of_property_read_bool(of_node, "ti,max-output-impedance"))
+		if (of_property_read_bool(of_node, "ti,max-output-impedance")) {
 			dp83867->io_impedance = DP83867_IO_MUX_CFG_IO_IMPEDANCE_MAX;
-		else if (of_property_read_bool(of_node, "ti,min-output-impedance"))
+		} else if (of_property_read_bool(of_node, "ti,min-output-impedance")) {
 			dp83867->io_impedance = DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN;
-		else
+		} else if (of_property_read_u32(of_node, "ti,output-impedance-ohms", &val) == 0) {
+			if (val < DP83867_IO_IMPEDANCE_MIN_OHMS ||
+			    val > DP83867_IO_IMPEDANCE_MAX_OHMS) {
+				phydev_err(phydev, "'ti,output-impedance-ohms' contents out of range\n");
+				return -ERANGE;
+			}
+			/*
+			 * 0x00 = 70 ohms ... 0x1f = 35 ohms. The datasheet
+			 * does not specify the settings in between, map the
+			 * range linearly to the nearest one.
+			 */
+			dp83867->io_impedance =
+				DIV_ROUND_CLOSEST((DP83867_IO_IMPEDANCE_MAX_OHMS - val) *
+						  DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK,
+						  DP83867_IO_IMPEDANCE_MAX_OHMS -
+						  DP83867_IO_IMPEDANCE_MIN_OHMS);
+		} else {
 			dp83867->io_impedance = -1; /* leave at default */
+		}
 
 		return 0;
 	}

-- 
2.56.0


