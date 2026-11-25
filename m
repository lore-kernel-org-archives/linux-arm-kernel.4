Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211DA606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N56i8ov6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=I51CxM4O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xglW8T96bsTqZ7MOn8d+MXE4QegXY8HP78O6Dzb9eys=; b=N56i8ov6Ta2Q4k
	EVMuVGDHJGpcNZnYbEK1YM5BYnnM79Sn8TaBBC8l5MTf+uOSrxgZjZ6GdAYcDwzKvanLr+SC3ktl6
	PqSTpb7i48uO94GkCMqonltfNWxOm7CbzlmfG0E0FdnYxG9O2c1SnyMGSU5YdkAJgpH9LZOSlIgoz
	Qw5brqN153hIQeIxo+iIexYSqCxM38LSUhy4jqMVlEIDPzjCHoyaXu/H2TBkUKrSkOIwQXRlu+Xlb
	dMzEV13UyWqrd7qlyya9eLHS44agpyPnZUhj8EpvB17Qf9ppSI+kEwnudGKUMZwE8EPYUp+JjZSuy
	8W40Hsq4Cm8c0mTZy7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RM-00000008su0-1m1t;
	Wed, 25 Nov 2026 07:29:16 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RB-00000008smv-0h5L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xglW8T96bsTqZ7MOn8d+MXE4QegXY8HP78O6Dzb9eys=; b=I51CxM4OG/j1cia8aUqKz3SsuX
	AThQal0B6j8DGYEBKQedByKuPc5SVHQktOIOpRuIukT9t6zN+zkZB11DW/Ze1wFclSLJnv7PjotpC
	RkjK+C75R8/ZyUOgVsgW0tGFJHuLEN5+6w3bPE+sxQgtBOgkAxKLeZ4vTSYDf0LnwIErGN/zeLGZA
	oeuBdsyf4h3MIVawwcacdQv0CA9Sb2s43LtMmNzgGP0kGTlMtrokle0EKCADM+qP5UWm6AXQhJOIo
	ozFJ2HVusuRj5JMKJ1/n1ilqSfqsnVIaJyxD2OgQHS2Ef2FltB5cIT9mDdM52thBwwVe8G6ivh2R7
	ywk3fyTA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R5-000FiD-0V;
	Wed, 25 Nov 2026 08:28:59 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R5-0007YA-0o;
	Wed, 25 Nov 2026 08:28:58 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: specify Ethernet PHY reset GPIOs
Date: Wed, 25 Nov 2026 08:28:49 +0100
Message-ID: <20261125072851.3379079-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
References: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232905_345294_25409F1E 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Correctly describe the PHY resets.

While the TI DP83867 requires only a 1us reset pulse in RGMII mode, 2.5ms
are needed for SGMII, where series capacitors would result in incorrect
sampling of strap pins if they don't have enough time to discharge.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index 46a9fdc92bb56..687fd0d62235d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -106,36 +106,59 @@ &dpmac18 {
 	phy-connection-type = "rgmii-id";
 };
 
+/*
+ * Assert reset for 2.5ms on SGMII PHYs to let capacitors discharge before
+ * strap pin sampling
+ */
+
 &emdio1 {
 	status = "okay";
 
 	dp83867_1_1: ethernet-phy@1 {
 		reg = <1>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 1 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_2: ethernet-phy@2 {
 		reg = <2>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 2 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_3: ethernet-phy@3 {
 		reg = <3>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 3 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_4: ethernet-phy@4 {
 		reg = <4>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 4 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_5: ethernet-phy@5 {
 		reg = <5>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 5 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_6: ethernet-phy@6 {
 		reg = <6>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 6 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 };
@@ -145,16 +168,25 @@ &emdio2 {
 
 	dp83867_2_1: ethernet-phy@1 {
 		reg = <1>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 7 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_2_2: ethernet-phy@2 {
 		reg = <2>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 8 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_2_3: ethernet-phy@3 {
 		reg = <3>;
+		reset-assert-us = <1>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 9 GPIO_ACTIVE_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
@@ -162,6 +194,9 @@ dp83867_2_3: ethernet-phy@3 {
 
 	dp83867_2_4: ethernet-phy@4 {
 		reg = <4>;
+		reset-assert-us = <1>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 10 GPIO_ACTIVE_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
-- 
2.55.0


