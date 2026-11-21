Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B681606A685
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T/mAHy4m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=; b=T/mAHy4mtMFcnX
	JUirjzR5uaA58lM4//T38UuaGLt/UesldS0ruos3FpZ988GlUfmz7II62DUfQowyT2rOXd6riwoPN
	02o2BcIbdW9u9ZG1qy1IVhNC4cuJ5y1OGXC509CHhOt5v89Y4bM0O6GHbsesMKsTyZ2LEbckSez5u
	PZtjEAN0YJuQPmP12cjrjN/SmYIjRj33uDKXGZfcUHPeYUA2EkYN74BEtphIdjB9L11n5ngSWZvBg
	1n0swz9nzkmoi9m6LCS8JvGLjFllNpgMvzzUyl7psWjD8wkF/q249LICG9VTjVY6uL+PG9zYxGZMc
	8wdpJUuq7T7jF+p5ZaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsgK-00000000Ln9-1BKC;
	Sat, 21 Nov 2026 21:31:36 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfv-00000000LV4-1zHY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:31:12 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so1908678f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296670; x=1795901470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
        b=ORMyXe35zJRZgEoy9CwUm2UNI3pHqoSPGUMs2xEKqLb62oROobsdPr2rH+Gtm3H3qP
         s3K1tAb4oqxZiLghuOPJnwHvcsaUiAyhMbWc8EbiF2Hhlc/Lz3pjXEQcWud4gBGaWaDO
         fLm0t59hwdxW7Y/qaIYUogPvTYpRB+IIi1UA3+I2bKYYKYbNyiEU0ZB/QclSb5LexLCn
         waDHI0qIRZVbAJQK8mRVMk6mDpn8EjOJPP9lIraP/W/i6Y1zumCXS9oY7Ev/5UBo8bpG
         8JFDlvsop8WNexF45W+83hL0DYu5p1dywuoaW5zqtLxEydxUSijHBDoZVf6SUkiX3aJr
         Bvjw==
X-Forwarded-Encrypted: i=1; AL+hErEe41hiJBnfKnaYiFwmzM39gD1rPY83hoNkPVCv9sF6CYCLVGT2N1X3QBnY6CD+ftsM7yRmggn9BoQw7e6OVKNA@lists.infradead.org
X-Gm-Message-State: APuU4Z9cocl0JMK+iEWdbfOzgBxQY56xp55gvoZVCdaFA4E+3NUx1zXM
	pZg4IAMhlWzqrOHO+97znPvaJUHgAJfyQFuGwZExR0KY+a5bgiGIctbR
X-Gm-Gg: AZFdTZdxToA3ejwP43QUXf8/kM8o3Um5JfP/HTDd9HCYXjjyraKOTJl6QrQTIBc6uAY
	+TpohsCHOG/XU9tmGlL1FH3D1XRYy6BtNYMm49ljzLWeqBwjzFg+u3aF00bNxJQK+rSRoKg2wOF
	lJr19TKsMAGoUu2+kFU/05phN/DdP8xZ67ugWIID4GecXR8P5OjEmnDRB9IsjC1FocMiXEKCPkj
	OmBKlifC2M6URyyiGefuy/tdxir+RrMQVKb370NdCPTfHUXU6ioEk+/AXZBBwgpKFM9/sgH3VGO
	fWsNOb3AtUZJyTw02b46gqGBgFxEWCHardeQosImKstvfnyrba2JWky8efc3/ybgsQRlmv1/DgQ
	pR56VffJPLzX7BiB2/J5G1u9uISVDqq6Pwr8FKAQLuPto4dK1m5gQ/0gi3L6r3l2i0yCZbEzt+I
	MKUNGJgZZf+etsUNAQw2yHMRhIVNkjyq4pHxMqg8pdLVPqZ5JjL6ZMgx7FRiXZNqSFaUBDLrpj7
	KuK156r4aHeaHjoIhZF/0GX+PBHiL8gIC9lRHkrYzpmuL3Tmh/PCC5HySigxlx37PjyYyvNFycF
	+Hm9fbyDOEB3oxd8XACdNU/AqmALa7/5Cg1vfa2i/lQoisWrP8oYyLDOUZQzYVtx/MguSkP1lb/
	XFbTx7DaiN2AgksnLOvypjms=
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr13243799f8f.9.1795296669533;
        Sat, 21 Nov 2026 13:31:09 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:09 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 21 Nov 2026 21:31:01 +0000
Message-ID: <20261121213102.143130-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_133111_526894_1867FBD8 
X-CRM114-Status: GOOD (  11.69  )
X-Spam-Score: -0.8 (/)
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

The SoC has a Synopsys gigabit MAC, glue registers for the interface
type and clock timing, and a multiplexer that points the management bus
at the on-chip 100M PHY or the external pins. None of it was described.

The controller reaches memory through a pipeline stage with a gate
nothing else claims, so it is switched off as unused. The
glue registers share a clock with the multiplexer, which probes after
the controller has programmed them: unless the controller holds that
clock, the writes are lost and the port keeps the
bootloader's delays.

The multiplexer and the on-chip PHY bus start disabled: a board enables
the multiplexer with the controller, and the on-chip bus only when it
uses that PHY.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..eb7f46c98b0b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";
+			reg = <0x0 0xfdc00000 0x0 0x10000>,
+			      <0x0 0xfe024000 0x0 0x8>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc_periphs CLKID_SYS_ETH>,
+				 <&scmi_clk CLKID_FCLK_DIV2>,
+				 <&mpll CLKID_MPLL2>,
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+				 <&clkc_periphs CLKID_SYS_ETHPHY>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline",
+				      "pclk";
+			power-domains = <&pwrc PWRC_T7_ETH_ID>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		apb4: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
@@ -645,6 +670,39 @@
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x28000 0x0 0xa4>;
+				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				ext_mdio: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				int_mdio: mdio@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+
+					internal_ephy: ethernet-phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.1


