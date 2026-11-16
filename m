Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F618606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BEmTq9T7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bpPmJV/6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A3XeEqkaktNVQ51Yi0Y1kI4qohFni5uS6O7rkj9mTrM=; b=BEmTq9T7taQsRu
	fRLFXsj+dAxDUbn85343tbV0wmPTdv8yLWm0wXBjD+TMQlMhIgo8Jc6Xx4NuBmyDW+IGyEDWQP+zb
	MHBkn9B1oU7cgjVT3qc+ykMXmgRkeB3iojsbjuvZXLpY4vcPtMfI1MShbhqwMkHBaIDeaXgcn7Iod
	TJTrqo/mrOSKHUpPbsQRD2msp+4KMEqYI8EdjO47lNPQ7P7/uTORVh1xf7TLMNwUBp/e477F9T2n/
	0SbXf4CIfVuqbUxUY+LQR8sunqIhvBQJNj51UYiY5J/uJSQ5FLikqP1ctROuUqkZgGL21X1tKUMh4
	2O/CXSKBcCV6IGw/gqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUw-00000002miu-1sFJ;
	Mon, 16 Nov 2026 14:15:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUq-00000002meK-38kX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:15:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8221B43FA8;
	Mon, 16 Nov 2026 14:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C136E1F000CA;
	Mon, 16 Nov 2026 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838548;
	bh=A3XeEqkaktNVQ51Yi0Y1kI4qohFni5uS6O7rkj9mTrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bpPmJV/6+5iIIHaLH+cDa4neTY7WoEcq6D0g/jARxCM1h23PxuXhq2Jxrz8WBTp3J
	 1iSHvrPN340gh3f3CZy4gImAIDa9Ilf0eXcyqEwl8IryjtDTP8ACvV6g1wPncZ4ykI
	 lmnX6vyrayFR42nPYTa9pW2fyVsEZegNuS+XmGmCKSubLjxcL8Ed2menO3Ukiykjoq
	 1E9/JVnX5EDRCfrysbifqRwdEL10Ng4ika5oFfCkfXWwkso/2I8CeIhp6RWSYjDQmI
	 xHmAFVHCKrWXGhur9bCudeNlawezBINo/J10/3Q2fF4xca8Mv/lJdlLD2+vw88EMvC
	 wx7geXmBdk91w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 8/8] arm64: dts: synaptics: Enable Ethernet on SL2619 RDK
Date: Mon, 16 Nov 2026 21:54:42 +0800
Message-ID: <20261116135442.4827-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The SL2619 RDK uses the second MAC with an external RGMII PHY at MDIO
address 2. Enable the MAC, its pin configuration and the shared MDIO
selector. Describe the PHY reset GPIO and timing on the demultiplexed
bus selecting the second MDIO master.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts | 77 ++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
index 58901ac2a050..d10811e8436a 100644
--- a/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
+++ b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
@@ -13,4 +13,81 @@
 / {
 	model = "Synaptics SL2619 RDK";
 	compatible = "syna,sl2619-rdk", "syna,sl2619";
+
+	aliases {
+		ethernet0 = &ethernet1;
+		ethernet1 = &ethernet0;
+	};
+
+	mdio-demux {
+		compatible = "mdio-demux";
+		mdio-parent-bus = <&mdio1>;
+		mux-controls = <&mux1 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mdio@1 {
+			reg = <0x1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ethernet_phy1: ethernet-phy@2 {
+				compatible = "ethernet-phy-id001c.c916";
+				reg = <2>;
+				pinctrl-0 = <&eth1_phy_rst_pmux>;
+				pinctrl-names = "default";
+				realtek,clkout-disable;
+				reset-assert-us = <20000>;
+				reset-deassert-us = <100000>;
+				reset-gpios = <&portf 3 GPIO_ACTIVE_HIGH>;
+			};
+		};
+	};
+};
+
+&sm_pinctrl {
+	eth1_phy_rst_pmux: eth1_phy_rst-pmux {
+		groups = "SM_GPIO35";
+		function = "gpio";
+	};
+};
+
+&pinctrl {
+	eth_mdio_pmux: eth-mdio-pmux {
+		groups = "GPIO31", "GPIO32";
+		function = "rgmii";
+		drive-strength = <7>;
+	};
+
+	eth1_tx_pmux: eth1_tx-pmux {
+		groups = "GPIO48", "GPIO49", "GPIO50", "GPIO51", "GPIO57", "GPIO58";
+		function = "rgmii2";
+		drive-strength = <10>;
+		input-disable;
+		bias-disable;
+	};
+
+	eth1_rx_pmux: eth1_rx-pmux {
+		groups = "GPIO52", "GPIO53", "GPIO54", "GPIO55", "GPIO56", "GPIO59";
+		function = "rgmii2";
+		drive-strength = <7>;
+	};
+};
+
+&mux1 {
+	status = "okay";
+};
+
+&ethernet1 {
+	status = "okay";
+	pinctrl-0 = <&eth_mdio_pmux>, <&eth1_tx_pmux>, <&eth1_rx_pmux>;
+	pinctrl-names = "default";
+	phy-handle = <&ethernet_phy1>;
+	phy-mode = "rgmii-id";
+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
 };
-- 
2.55.0


