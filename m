Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A913606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 14:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vQl4Z8Wb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKChQhQF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=he4/rKCDgbdZk3ll2x91Vj1rujh0RIHLy9dZg3Zrwz0=; b=vQl4Z8WbwNz0z4
	9DsI11TRZy9qBa+wwrmgy3SyVzheHvVmRLdORU+UqrA5B1+avP2V7dotcOXOd2jNzQm09TZMZJwoh
	GpYbjpkH4y2NUCRGrRvz7NLjhZuf7Y2sBQI2lvW+cB1yE63Dd/4BxlAbWbXgGQD4ic4H9w2rKpkv4
	TA2XQt7XDa54K27fnv/8h1KWeKuIfmx8WdBgVXlua6AfoUw2lTR8xT3PNgJgndYwTq/HZNpB/2kYF
	CQIkye/DZIlXqfqE74t2OXrGY2cxnRVQyDSGr/fSpZPr4D2qYvs7r9nyVHEzo4avl05KgMI8qOUVq
	I2gWgBAzf1GUGYitUjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJD1-00000000p9K-4C74;
	Sat, 28 Nov 2026 14:15:24 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJCz-00000000p7R-2Iv4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 14:15:23 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3282db206d3so7906993eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 06:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875320; x=1796480120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=he4/rKCDgbdZk3ll2x91Vj1rujh0RIHLy9dZg3Zrwz0=;
        b=nKChQhQFoWn8kRHou3V4Ap9y/r3X1eWTGYmFDiZznZudKvptM5enfg9zEev0DU0+sx
         DCXaAMu6K1KDT6q1pzelyg/BVJ8aQHUiXp2gunh7ezK3rE4hXtsh/2G1PnD+zXqDRb02
         8S4QKo45I3keFFaNERFrj5DJ3iTA0aDekSqqz960APRn55DASNfaZ2iHbW22meEnXxvk
         WYaZYhroHm1WV8H8/LRJgyySpFtABfVPhCbuqvg4wJUzSOAhdCZcm3AOLo2+A3I1lVOE
         iqaSGsNUFFGuhUAOR6JunTKi/A1j/d4RFfGhCJNBpmTScudKHe9ymhJSMbLbAlUy3fAi
         yVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875320; x=1796480120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=he4/rKCDgbdZk3ll2x91Vj1rujh0RIHLy9dZg3Zrwz0=;
        b=APwPST2gKfmJ4c/DUjaF0XAGvLRV7b7ssGimyBOqAqIicmZ1m6A12MsxIvdLzUkvSG
         8LlOoEX0ld955GSXLCNdGW84lqkqTNV8Xoq58d5Sp2dvOaJAQtE/1p8Oy9MAn+ScSfZA
         Eq/Gidl2yRtHL4y/+pxUrV+WSaGjf3Ob1FjIiwshWvZ4tnqf4hRdCtWT3ZCvZ+qNBmxD
         iqImpv2STcwvJVHqi5OvB5bmme+FDpn34P8bmF7/GhDACCGmJzpHBm5teXJTnIkQF6g8
         L9E5g3VVEs5kqkTTOS1h54fqH+SzcBPENqPyYnwXzh8hpFvTnxq57uB5z0IusGpSCKK4
         VqAQ==
X-Forwarded-Encrypted: i=1; AL+hErEklUE7Q0rPH7iRyg+k7PJ3WaLhX2O7B8SN/gyKpyN6lYYfMdMKIu0fcTGNqlfsO1jRi63gCZ97z0dNsr1+IINm@lists.infradead.org
X-Gm-Message-State: APuU4Z89+RvVs0hkVsbgvxnDMumZ4K0oOjaBqDqe4Jb7Uu5WgJM+RzR8
	mv8hf/AnJ0YZI5IZS7eHZ/jwxPRaxtknwcxVzr9Cnwfneq+PClDQZvAw
X-Gm-Gg: AZFdTZfyVEaYvDkSM2IBe2SS/Zcmsx7HgcKHzztalj+pWl0hiGpb2qQ02lcCPiKEKma
	XAXvrOn24F8OQpD3Csv4C8VYTHtQt/SA1R3/oRmyMOk+SUPWKJfm6s/Gc7fx0n5ketOo9REmPeS
	m9fncc/jVeQfsCNrj/3KisP7VBAUs+BcPA/GPnI+optRg0HJCN73b88Ts/BLLlBh12Z03kWIEZj
	mpzag6QH3rTRKrauxrKTnk2nfYSubxLcjrEsqQWjqjOEghTO3bl2y3SIVxHqR2+vA3zoc9LRKI7
	1WpOvaAK7gF3fg6pqflC0uwx5SbRL4PcI2RkZUFytIstUNS9CLozMTCSkjbjRU2Rwm/q6yXVDzw
	hGj0NbKy6AsmgTmOUoYZNPCNE/T+oGJD6X0xFn55MwuFIVGKwkziOH35+aFexCsCiSJd0fhlDa0
	z6P03kiPrZiGgWMG9Gyrk5/aZL8yqjax05YhbP7VE+O6cz9bWukg7Fo35VnE9VYJRpMGQyCG5v5
	MSOzw/X+Im4P9ivKaDjt8E0sFNsCAC/dKZ6N96F7sy63NgCyGhu81usefe4HhCNfO0kPPGgUKeS
	iRS/2HAQaPl3dAfoNjj1+dHMLgG0kVhO5PQkpScbQFGvuMVWEdO0/GyzanyZ5hkdDb6JgHB0wyl
	/EMNUixh/u1Kh1ASVppSoP4Vg/6cr
X-Received: by 2002:a05:693c:8859:b0:386:b826:3f9 with SMTP id 5a478bee46e88-386b82605b9mr16717778eec.7.1795875319705;
        Sat, 28 Nov 2026 06:15:19 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:19 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 2/6] arm64: dts: mediatek: mt8189: Add SPI controllers
Date: Sat, 28 Nov 2026 19:44:26 +0530
Message-ID: <20261128141443.13065-3-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061521_912100_1BA4E841 
X-CRM114-Status: GOOD (  10.46  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MT8189 has six SPI controllers. Add them, disabled, so boards can enable
the ones they use. Chromebooks need this for the EC, which sits on SPI0.

The nodes follow the downstream ChromeOS kernel's mt8189.dtsi, with the
clock providers renamed to match this file.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8189.dtsi | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
index b64882a93..e0883da15 100644
--- a/arch/arm64/boot/dts/mediatek/mt8189.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
@@ -484,6 +484,90 @@ uart3: serial@11004000 {
 			status = "disabled";
 		};
 
+		spi0: spi@11010800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11010800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI0_SEL>,
+				 <&peri_ao CLK_PERAO_SPI0_B>,
+				 <&peri_ao CLK_PERAO_SPI0_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi1: spi@11011800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11011800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI1_SEL>,
+				 <&peri_ao CLK_PERAO_SPI1_B>,
+				 <&peri_ao CLK_PERAO_SPI1_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi2: spi@11012800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11012800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI2_SEL>,
+				 <&peri_ao CLK_PERAO_SPI2_B>,
+				 <&peri_ao CLK_PERAO_SPI2_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi3: spi@11013800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11013800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI3_SEL>,
+				 <&peri_ao CLK_PERAO_SPI3_B>,
+				 <&peri_ao CLK_PERAO_SPI3_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi4: spi@11014800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11014800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI4_SEL>,
+				 <&peri_ao CLK_PERAO_SPI4_B>,
+				 <&peri_ao CLK_PERAO_SPI4_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi5: spi@11015800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11015800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI5_SEL>,
+				 <&peri_ao CLK_PERAO_SPI5_B>,
+				 <&peri_ao CLK_PERAO_SPI5_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		auxadc: adc@11019000 {
 			compatible = "mediatek,mt8189-auxadc", "mediatek,mt8173-auxadc";
 			reg = <0 0x11019000 0 0x1000>;
-- 
2.46.0


