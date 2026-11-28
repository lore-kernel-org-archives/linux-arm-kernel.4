Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9967606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X4qnZlq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=; b=X4qnZlq0fgTPOO
	XXKT+7BmrxQGazuHLPL2gmV7GLyClanA9OmS79cI/hGuqbzJfaOIXksea8EiQ8gMRb5jTmeoC+Xkm
	VKzxshVUsEco52JF2SgO6dsh0d/in2iGGYg2FYnqx8O8LjvEx9MJKpiZ46u6VL8viff1sd/xDx5sZ
	XlhQy3fotNjGAwwyyxVTbocv2f/PMubjky6JE4WWfAHk2IV3kFsE7ux54jeoIW71yun3AUTSqa9l9
	nkmT4+tYjc+cjLoc/zwq8owUVLxse2MxicH8xr5UCANeR5IPubxnL8B4w/HK/lsRWvXrRV8BElv4z
	SsrSUID9iRqYfQ4EAmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCgZ-00000000RaQ-3aVb;
	Sat, 28 Nov 2026 07:17:28 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCfR-00000000RKx-0Gau
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 07:16:20 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so82957695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 23:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850175; x=1796454975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
        b=k7VVzcrNavdXjyiR8mlMnZdnT7vGDQjLDE9H6n8iW+C6k66xY2xCaVGgf8/VJpGJme
         XmIlOj85wYbUiTlH5kQXLnZ3m1TUM5JX27U1mqoxI2trzioN+j0PVmQiM4nYF8SsCBpb
         +ge5TqKXFO6y0kLqaG3KQ6OrO/6fNM48Te19+NXE2e8W6r19GG58k5Ft0naVSbnCYprJ
         VgwJoyUJX9sWrRQuwr/sGu+6yP3SIlu7QRvXF86j5TGItRpcNmnq7KNASRshgiiol/+h
         ++3y7nyef2VizwnN93J29nOnrZ0PJPqRdK0snKuvikxjFyePTLIWOz5CdqQTxfmzLMlJ
         dzIA==
X-Forwarded-Encrypted: i=1; AL+hErFY7gP6vCYeDdFqG2nmcvyxtFXGAnK9uKCOnh8mndhcK9IV+8NWBI7yk/WTBDO9d7ea1eigYzNK5ztLNVPhuXUk@lists.infradead.org
X-Gm-Message-State: APuU4Z8j4cVNv+R4JJK6JsvEZ6xZPyPpRmw7pJLgkF9VomXPIN8BU2JT
	gIbiZUYtMUfLjtQa9QLogSv7gK36Zcplsf6DaQaUcIUDM49IB0RzvJW1
X-Gm-Gg: AZFdTZd5MLYVBr1SRTDjLduvI7Gf2HRNLty+A49gqPNLP7D4qJhv2771h1C+LFZXu1j
	/o5XPWMLJcY/98sqIQAJP1jgqeJyXWDFQrxs96Uyc+cf+mcTjo7xiAP4JG740teypQhy8xtmxOL
	HiLePh0GQnczxdgBctq6RjVq4rh3QhD1r53JWWkqwHKS2eUinKFwEgJnlleTkC7EJl2e3kIEjxZ
	kh3Hppa5bb4RtVxPrbZrUYr/wZhp8OsQRtB2A8pvBxiOYOveiS1rEf5fuXFR8vCwHkjN+4xFOib
	fAm7oxQweSRMfY4zpWJkqFi1Pcb0MR8RoSmV/8Rt/PAY7bPC5Ant3el5OlbvaopdF8idAiF3Ugg
	1cr8prYpiA0Qt/7/PAtB2lakNiWXnVM7f/YK9+e8/nR4vEuhk89gI4FJEOfuin0wJ3hhp+OPcMO
	dl+TCVMsQS+Xh23Q2NYZRKqwuGbZTz2UlwSxXe7wrNsJJDDwlQ+mAjr+ra6tmMAGgGj1MACDYy5
	B4Pc7B9r81nnveGaCBG6w3EKRN+b4ijCv2vEwvcxGSgVoreQt2vU6+6kHrqusLeL91jEtSHleGL
	v2WNxMei7IuDiE2A6x8bZP8GBBsaUjMU9JpiZgtEhPmPFrYb7xU2T1e2je2N3R+obqtz5qJCJvy
	58lDn/cIMDMChlb8WgzRU6jVC
X-Received: by 2002:a05:600d:1c:b0:4bb:9dbd:feb7 with SMTP id 5b1f17b1804b1-4bb9dbdff35mr278936495e9.9.1795850175157;
        Fri, 27 Nov 2026 23:16:15 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:14 -0800 (PST)
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
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 28 Nov 2026 07:16:09 +0000
Message-ID: <20261128071610.27855-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_231619_246792_52ACD195 
X-CRM114-Status: GOOD (  11.28  )
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


