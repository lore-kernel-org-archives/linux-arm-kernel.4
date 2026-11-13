Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6889E606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rzg0I0zx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HSXWYiHf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k8LUINT1uPJGcPtj79NOLQhhl8W2gjYoDk+VmjrsPuU=; b=rzg0I0zxYQOYYh
	iHgvYoNK4K6ugw4dGzhRwrZFr3aV6j5qKaquUpUSOlII2wurfoFROBSnY0axFZZoB4UfmLQYJED4s
	S7oA1omGDZpoSQIVBUVWHBAwaOmwQVvxGLn+hmweJhjv4R3xdj9MyEfrl3BafA8AgCBZoMmH8DzhP
	2vKz2+NXJhO8IFGQKUds41J+I05FokNAvzfxWQQWfFAcHDJX58IIjteHhVz+CEkiqkyySLX1Jkh+U
	rogGCiFzbMjUYcsscsAuooL36SdUs6DxyAv22DkX6IwQfyj6A4sbOp5sUnUBdf9m+mFSLc9IDaPB3
	P+VYgVV62JRBdYlUry6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFd-0000000ChQM-1I7N;
	Fri, 13 Nov 2026 12:19:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFH-0000000ChCm-1yi6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k8LUINT1uPJGcPtj79NOLQhhl8W2gjYoDk+VmjrsPuU=; b=HSXWYiHfsB6/jxftK3iMd3uOPZ
	EGDU6b48N6CcAhtnEQ4T1Ic6gG+I3/onky7WiSlAqnC5dcHr92zhq9NZ5U+NNLy87pp+m1dq4eyas
	+T/PxED7Jib52O0nNTwIBTcCxLfP6kbyijf9bKPCp5EKTg52ZxAx+azt0KtaCxQBZFH/1q8MIEehC
	XXG2wUlthk7hW6a4kVdDJyPihmiJ8/bISsTvbec3lfbG5ntcvW5g61XtYvD6in5MEc9No8Ldtj2/2
	BHu7WB3/BCsEGo+dMJp9jZVxXAg5TRBwU37GBBCn307gWndiqgzFhchG9lbNxhcgL7E9Diw8JLdFn
	Dz+MbaFw==;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFA-0000000BEKL-3FM2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:06 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so372983f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572339; x=1795177139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8LUINT1uPJGcPtj79NOLQhhl8W2gjYoDk+VmjrsPuU=;
        b=duqlRAogC+tilGyhP2Nc7Mcx5Em2iwWbc0tUEEUUMGHo20fBAsV3bux9gwd+2DR6OX
         DCKnjlCTlxOsxzLkK4v6WnepK00qePIC6cstYFsow44laforgHbIZLBikAJP4pR7gYSD
         7zcMiVyVrLxNvxYVn9SZn9jdqMB0RBmxCiWvnXMFod5jdaYjhPFyVw+1PfN/ndJMIraY
         XLIAUqQW5F6y1At6L/uJGVC2YESw/8E0IQNvv5lkzOyul6r0XRITOZBXjgZ6jEThyKm9
         axDx4FWCmaICIYe4m3e+fqPn9jQoI0itjnjW3Px05VaYXc6RS2qewrPSJP38A1yiS/66
         LUYQ==
X-Forwarded-Encrypted: i=1; AL+hErF8/jhoI2kin4PwfETifrqED8X/IkBkCGl43wRtaZU4xGpszCEKhVtjsLLajVK8ZQi/A8+tmrrnAtZrOJ2JIo8l@lists.infradead.org
X-Gm-Message-State: APuU4Z+fbD+EGNP37YCtB2X6elVqXk9EWIhhbckBbVhcMT5H5i76CLkt
	Or58F2aGeCmRtLOQerZdN/RhH5KjRarrjYEE3bMEKKXmzeY9FYaMRoor
X-Gm-Gg: AYBFou0IuUE5PHOD7sqDkTu1LnPZj9ar2znju+qO02SWZtad8/t6nX55cE2I+0jS/MO
	bpNUqucSK+K8bG15O+8sosAqDGsRHcNN2Dk9+QxUtlloHPoMjFFZlreh3uL2chY2TStrjDxvQbi
	GFmwjZ1b3duiJlbt0Algl2ZYdRYWPqwTRMC6aG33oZ+C0ZPXnyWJp3i8ekTrsMuX9RzL8kNSXIT
	tLvVIUHCLuI9RAdRc6fk06ah0+TzCP1MefgxHRdRa3+/3q24m+P2MzD94dtgJYMstNeBL62TRnQ
	m53aaKaA20qFj5v/TZs16r2OmJPbxcwcaePgf0BfRr2IvkaOTcrOrDED2l+oFfbTpSYXkfzL2Qr
	psJ8iYaktwMXiZJqc0Mmyyut7GOnB0uVPgTcH+bZoxpZh1RqzlbHGIaodquqFk6ytvuYfLq7Pb+
	BAzje/MDE9aL70qQY5K2+o85vFGJXz9Vri1pS1SxyD85jgwxPu3RBQsZTz7VP4YsORhxgXSsMrD
	60MKBDYWWNowGTeLdCkql2SSaUkrmT4F0mvbq9432TL2yZd4lgWRCbLICF50ZG74AM6jlpixdW0
	m+gDohq8z06FHyqTZY/J1LMfroHc39pvsiziSgz0yTANm6RH6qRXN2wdJG4+Ont8BzCSXfWTAVC
	aNE5B4VH4yI7doXR1g0zmK5iU
X-Received: by 2002:a05:6000:18a9:b0:498:88f:14c8 with SMTP id ffacd0b85a97d-49c73259e2bmr5745745f8f.9.1794572339177;
        Fri, 13 Nov 2026 04:18:59 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:58 -0800 (PST)
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
Subject: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Fri, 13 Nov 2026 12:18:51 +0000
Message-ID: <20261113121852.334604-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121900_738126_6F13841D 
X-CRM114-Status: GOOD (  12.65  )
X-Spam-Score: 1.1 (+)
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
index 7bd53ec16607..c6797688805b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
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
@@ -645,6 +670,39 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,g12a-mdio-mux";
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


