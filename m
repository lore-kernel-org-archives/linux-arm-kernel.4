Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E652B606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xUz5nMkm;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EHWCvpmX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=; b=xUz5nMkmMtpICQ
	xBnCs/xcXwtBtj6rU98x0zfTJjfADbEwgg2T6PfZ5pwu+GIjMEyIR5fxEnYYe2Oss2hYuthnfG8XP
	mg/gLM2zXOGizRXHZZ09IC37VklDlVbEt8u8G2JqUBXm0YkmXXeJ6uy6Dg2AHbd4greb4n5cghSSd
	/PdH3AVn8oNtZ1GJL3MK4hXcXJ3+ggWtcJAs3l78yNipXY/DQ34PH9BE17WBjka930ujDxdulfrqI
	iADXbNa5JTm2/BUxXYKFjJw1jMSgOU1L/bMf0h0M0hdWJeMyxQdgAMPjuNANsMgiATzr0GZBi/lO/
	YOwxI3OupKK0K1RzQOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuxG-0000000G4jw-2jls;
	Fri, 27 Nov 2026 12:21:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuv5-0000000G3N0-2lLi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so64998465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781954; x=1796386754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
        b=EHWCvpmX4PSDt3IpL0XviyPZg9BfKq8lu/2vMELZfBUxvMc0IgiwrTxXKyanTplbcW
         m/X0d3C5LQ97GJSNR+PgqVVgU57K39Juyo9Hh2JMzPdxmf2kOQ4SNtFAebDBHcbMVV66
         TA8YtyqXDhYu9Tzg8W2Sa+ho7k3vpTbsK7i2Gm43QVCjDh8ZoIuk8ZDdW7ciRk1IpKXH
         P9Fxjt+zmQTsg9bHr02QFDIylmrmgnIA4wuQCkEUKKcnQhOVg6MyxknHBojirOk618nm
         uR1nQ53qqqVzEnRHYjwQkni1986xHMrxuByUt9a84X+DdrHVZo/r62F5ng1lObOGVSjJ
         a9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781954; x=1796386754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
        b=N1RPDyDIyq9XHGl4qQNZ/9XsLRcocbWHpv2tBbbACRrgpEe9/97aKA9g4iguc6a9gU
         F1eTsUPZkazxmi09EHO8M0m5eiu7LTv1uSWeUnOWVXKlHUWAX65Abq/SYYvIxTSd9l0I
         lmJN2yY/NllgWaAa/eSrz8wmRWXJkx8Mob+vgvVRxGAthl5ggNnVVwkGSbasn8kEjxwC
         fq9ej3ZgKUxbVh2lIm99llyUjMRjmhVbYsmMry8ZkyGI56puYy9qBCRl3/MDGpeaIhFy
         LChZqVU8fcI+FGsVDRUDmldhpEtN/YygD3+wwCVrXNJpcWqu/RVNlO9Fib28dMXjW3AB
         QOnw==
X-Forwarded-Encrypted: i=1; AL+hErEnek5QzmeBj27msyfe8NwLa3LaHFU3q6vzo4GQ+CFRgd7FJn6Y7M8q8Id6HcYCZW5UbrhKFpvUmd2JW8ahvKki@lists.infradead.org
X-Gm-Message-State: APuU4Z8ReIZd6euRrNaVHDUiHbuGs+S1v3IfD9k0WSJDQ19RZq7j+x9I
	oXfiQQyuXNco5mXScQWOthQcUXow2UCPV+mGfdeYymNVCp6x6099CRlFeCSjhWCWY8M=
X-Gm-Gg: AZFdTZclaPs1yj0KDRxNN4UxYLyhhhqRBMMKqCq4dRNMaFmgiPY3jbvNfEvHLww0vRN
	RxKftXOoCwAYBIZoUqxNx1VERREkRl50GCTqo5yN1KVFQGPc2NK75O7wZmQFQfPVv67wRY1ON5W
	h2qGdW9IsSVFPXBWn+wdsSheVhYPtdavvHZKvqcFrUtdTZz6MSpPiTtTeX72u0mfoi6HH9h2Ltp
	wW5BqFdcxzOmIKQw88ImjHB4rw9RXjPzuHwfWDUuTH+2t8x9ZrKql5f1UR/qO1UtF2xqryKVNpv
	eknSl9RpYWMOOav+TDY4AO9maLnrxH2/93KvNrnVSn4NOxXKzb9rxqBJ1p3lr8plgZzssqzXawQ
	B0AbCviCSAkyEc+m037A4X2Azw4u1n65gPUq7tXMMru/oCg18pCm0y/wjxJB1b0edFta24xe33X
	jjfDlzO3zWBC95xlel1gWC/KD9eCQxFxqcxXGWa8fP8GuLmILOLiwM4L6nJj0178xVk2llIu+GA
	+nW6JjO06kefPUQZFtLUdjSdZuz5kSuyEAIO9rkzeytfL9EEbqyEKeO5Wrs21WgBGxTBvC+882t
	QvgOGCnopci5i4xe9904yz71hPN+
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr459954025e9.4.1795781954018;
        Fri, 27 Nov 2026 04:19:14 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm746847685e9.12.2026.11.27.04.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:13 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 23/28] ARM: dts: bcm2711: Add the 40-bit DMA controller
Date: Fri, 27 Nov 2026 13:22:13 +0100
Message-ID: <20261127122236.4976-24-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041915_747032_3F1EECA5 
X-CRM114-Status: GOOD (  15.16  )
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

BCM2711 has 4 DMA channels with a 40-bit address range, allowing them
to access the whole memory of a Pi 4. Add a node describing them.

The 40-bit channels see the RAM at its CPU physical address and the
peripherals at 0x4_7c000000. Describe this through the dma-ranges of a
dedicated bus, rather than adding them to the scb bus, as the latter
would change the DMA configuration of the PCIe and Ethernet controllers
too. The RAM window skips the peripheral window of the CPU address map,
so that the peripheral FIFOs are not translated 1:1.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb39396..390b8853696f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -432,6 +432,38 @@ emmc2: mmc@7e340000 {
 		};
 	};
 
+	/*
+	 * The 40-bit DMA channels see the RAM at its CPU physical address,
+	 * and the peripherals in the upper part of their address space. Give
+	 * them their own bus, so as to not affect the other devices.
+	 */
+	dma40-bus@fe007b00 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x0 0x7e007b00  0x0 0xfe007b00  0x0 0x00000400>;
+		dma-ranges = <0x0 0x00000000  0x0 0x00000000  0x0 0xfc000000>,
+			     <0x1 0x00000000  0x1 0x00000000  0x3 0x00000000>,
+			     <0x4 0x7c000000  0x0 0xfc000000  0x0 0x03800000>;
+
+		dma40: dma-controller@7e007b00 {
+			compatible = "brcm,bcm2711-dma";
+			reg = <0x0 0x7e007b00  0x0 0x400>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, /* dma4 11 */
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>, /* dma4 12 */
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>, /* dma4 13 */
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>; /* dma4 14 */
+			interrupt-names = "dma11",
+					  "dma12",
+					  "dma13",
+					  "dma14";
+			#dma-cells = <1>;
+			/* The VPU firmware uses DMA channel 11 for VCHIQ */
+			dma-channel-mask = <0x7000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a72-pmu";
 		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.51.0


