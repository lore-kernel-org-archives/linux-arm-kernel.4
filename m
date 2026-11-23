Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B19606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K6JaWefH;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CWOT6uhJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=; b=K6JaWefHKRxjt6
	oNQni1xMLWOlo1BkgxDxWPCZwTpRt3iefguHCBPl485VI+HZqoAp4P286Fg46i4WtCkCB4U7p6nxD
	CoIWnKIxxLgynjgxQVB8uTixWpPKYaqwXnSgE/hxI7ff+hikgG+rFiI/oCMRupcSJxLAOC97gARfz
	Qk/V7kUPCKoDrPDbnI2J7h+EzhB+1J0kMfcfcp9T1Kzn9hCctgJuh+KCe8+61mD/7Tz9/Ks3acJk/
	8OyvkuY65QMjpJBV2sPIAdLDa7BkMqy4qxzeTc5JSiOhRXlhvAtRtfpqGsBgkoQPUDuw/s8LAh4lC
	Xd2Z3eT8wn/hcMo+yPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTf-00000003qMJ-0YGT;
	Mon, 23 Nov 2026 14:57:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQk-00000003ohD-0F4M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so42643345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445644; x=1796050444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
        b=CWOT6uhJg/RNWEHp7lTgyCiBZAsqii8BUpbwHow99yPGr24RfjtHKdxUnYSa0b5WtX
         PSEOEjtMQ7HsziDKPJqx65VhAb0jw4hFmeKQZpRyLFFZOk0ol8sHApyCsf4sirc7lsXp
         dOH07Fg/FmIL+RieCj6gaGxV/Antv/MAncIA1fdMvlZLWP2uNGEVjv8BN6mwBrnjhrL1
         gfif3RGZduaNNoByO+mLDigJLRw2jOHu9t21WSDnvmCz8eMUefTN6UiCsMhpEW2VfN5u
         cF+dLOYoHmATuIph99Z+5/3rLRxfkSJ1Ao3tYJjm6Ne+6OPwBw799c/07VoKnwnKJu4l
         Oj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445644; x=1796050444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
        b=095BdnHXvhD6xUgU4Gsry9/IvRQcpwiuLNj8jP3Ga22XNk240oOU6eW3Ly3FjY8DTQ
         0pjS90hrOaA1xpO37QtkqhSSVkWRVfj31Gl7W26h9AFrAdbHAqKDXmw3lEBSTvJyhQsO
         xj3NBM/WLMku0s6KuS/V3blV52CbGYQ6m/EEMxiGb2FEPTC7QYUVfKQkZ6p+oEWQyjP8
         Iitf4tQ/v/OYNcC+ibXuPgXVjgQ8oScZbcVPpBv/tRqurPpqczd9QSHsQDY6QAJiLy6I
         pAX7O0sGJM/ecB6VakrcEYYV4TvvQc7+LnH042kiw8F5ZmqlFNkKMM1LgGA72Zn6OS1x
         oO5g==
X-Forwarded-Encrypted: i=1; AL+hErFWE4dOI0y5pyMvS+JcVIUKIXQjjqE5OULfhb/dRG3IaCRvRBdQGGOv0wsLTVnE56vFzuJMEqO/hhX2pBAMFhKx@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZCvZuvEUGlq+Bae9w5L087yesG/O2tXvPc8+002k5QqcfCCcD
	aA24MsTa0IXOdlnXJqPhPq4Eovl7yXhVDmf5yWM3p7RhKZlD4+lsClA5z0zCg9QA9bw=
X-Gm-Gg: AZFdTZcQ8hd4sshhS0SYw5VSY7Y6vZxGYFzImecBIIublteqNHDy9HHV5yVRw0n5Dyi
	rEWRXaf43forpMD//dyGzm8YRXt4Q1t50L+LPsStBWD5TzThXb50G5KBh0lDlpota6V8Jd9qSwY
	BOCH6pNGdx5H2yhHimoLgNF9/bjwAei+o05Xfawhr/z3QuXt851nnb+JDWCBbACGZAtBFZgyvOT
	xwkYcve6YAao9cE5+SiolUocRlBTiJEOd2hqAXnSGiRPdxRiTSvTuVLmVZivTTQIzxvl9uDjIJV
	Je+UDlNEqFFMEiNb4TMHqISkoBiUFL6t8vyUWSZjn9qS+7nbJ65d9ko5YB9D8y93t4hJgUDQipv
	JelPHCi04uymYHh+t9Vkzz1B8XzVDCA29HEj0k8Duzes+nWo4dd9OD4+LLssWglxh3LAL+Gwubs
	AaucsH5GpYTuO2jGd3vJCfNeB4VGrhShx4sjk2+kCCGesiFUQZzkCQjFth/FItunmlo2HJdNVkl
	UpYJueCXLqAItkgkkWfhITYPfARYrq6Gh1ROBbM3bpacieROKMWN6oS5GWnGZF8gyP1cNrtdtGj
	rbcWBP8/Uvrj0R2fAscekT7WlL0=
X-Received: by 2002:a05:600c:46d3:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4bb88812c9dmr247790145e9.25.1795445644387;
        Mon, 23 Nov 2026 06:54:04 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663264955e9.4.2026.11.23.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:04 -0800 (PST)
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
Subject: [PATCH v3 23/28] ARM: dts: bcm2711: Add the 40-bit DMA controller
Date: Mon, 23 Nov 2026 15:57:01 +0100
Message-ID: <20261123145728.29082-24-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065407_790706_72757F3E 
X-CRM114-Status: GOOD (  14.99  )
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
index f475422796d8..d152edc069bc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -436,6 +436,38 @@ emmc2: mmc@7e340000 {
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


