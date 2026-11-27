Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18676606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e44mL+Q/;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aaJOtSXM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FJiexXTSlxEVBWHHiNKT7/m3bjHZ5GMDcxr2m0W45pE=; b=e44mL+Q/lz4aV7
	G0o62UxWdflBCjdMYuroxjBZG3Xb3d6WP2cC9Z+n34D8orvPQr30TjxQIs8z/sD4YQcdAuNw91Ri3
	U42tENg2owOtBOGQtQeAc9A7p3PElHQYyNe3CdOU30Wef9CafwmJXJPWvUb7Vfe3bPf1XyjuJFmiD
	V/1GqYsmDwQFAILGX+7CWz/w98XRuGTMp7b+Nn1iTF0ucU0PqKdldHd/9miT9cNrhCM4ylfHZhlfW
	NtThFx1+wzVr5jjNQ6SxMkl5ushbBE94adaiu1r1V7xCCzW/cmQLKEFmnPXsPkRih5CaCK7z4JLMc
	LcCsaLDTUkg3Akis015Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWux2-0000000G4c2-0Lun;
	Fri, 27 Nov 2026 12:21:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuuz-0000000G3GX-46LY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4778669f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781948; x=1796386748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJiexXTSlxEVBWHHiNKT7/m3bjHZ5GMDcxr2m0W45pE=;
        b=aaJOtSXMk3/VUvQVoI3ANZ6IgiRRFMuRPZIGBrucd/xavorY8WYeF0pJpm8EEzXqhT
         Rnx6D7GyOcgTca9Dosb4kjyh/89qec6k9Dt7M2CXMkXE0DOp/sq5Hv11EAkfOQNGBMbE
         nTQhQWauGtjB0uSohmOZiH7KQ0cSMTf6dbWIS6znc3dQgArERrw7KiE/7VTXWtVtf44y
         sRyiKhJIYo6AAmjkErVQ350ZJBIesceZqOvdD3Uqgc+np/mAFRdxzO7q3JfnmaT8tuoF
         crfXghgMjDTIp8T/QOXTpDKomUpCayjdohP/QJKlIw4OjnrSJUQoyn43GaicaXRoJxGs
         +4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781948; x=1796386748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJiexXTSlxEVBWHHiNKT7/m3bjHZ5GMDcxr2m0W45pE=;
        b=FMkB+BtPfUMMvsaQZhQgC2AW1+PWSlOG3BGO4fMc/bO9YOOFXvNBWMShspUjZRkdJF
         2PndD/D74P4TG2RKvvYUGdx48r+BDoxpxnGSyaocE9C1I9jAWDxsjsqP+vilprwX8Faa
         aj3+RrDlvx4YTauUySrAmadgERTxmK/izQ5cJvjeIoKnQCcvy9fpARmjAkSzClGNYQTV
         IBFAQEZwPDqhhbWee895cHPXeU/mkkIsRnoP/SwYj+xxthsdrSjFN8i1RYjnkpSeWa2p
         a4RQQeCHmx1jovHD/X131Txseh9JtLTYQ51rBPXvT8PspaGoOmjwZyUmOvL+Hed3mKEC
         rVWQ==
X-Forwarded-Encrypted: i=1; AL+hErFmQOjwHYeT1JkQzViyrUaHQ91ANeNFJK9FSBkeWLEm6OvsxwD8bHls1+V2vBQziB04BzMv8ugOOIZrFTBa67hD@lists.infradead.org
X-Gm-Message-State: APuU4Z/yz7LswEZnZc1HMNPYPb5mVbi9NIy0Hza9MjTEg6tgyVzypuqh
	tUAnD5jGyfAtgNtawMn19ryKY43Raonbnmnecyqq5KPcmUIWt3wtWycrIQ1KZti7xjg=
X-Gm-Gg: AZFdTZfwMMSlYXJFWvh/Vqj27THgY4ZwHLy33gP5U4RbAjhptpi2gOU3LgEn7e8hyPI
	u59y5vJy/IjsW9Wwroe7HlZrZIK54DiMgcR3De1v1WrmzFHHJfn6l8S7MDlL3AF0uefW0OEnMAw
	TVMa3/cT78Iu7WgJXOjzT+Awso68983D1lwlzkZp6uSAmS91SqHxb4BhhNa9N8/a/ZZ15wFy3j6
	qoIkOK9NMCKzk29EbJl+kfFXUXJx56MWSjvnu13euJd8ossdDEYG2p4B7jLV70QJcCAxqrHYwSt
	KuaJD/RBRmjUzFnnilOtFzzi1s4HKo2Jte36thJ7s6TZM74jCNnWoqpbIb/te0BoCL82QN4L8Jy
	2AYBmfTRnDSm1gFqihusGcac8sBcdhYnTBidt8qCXiUp7nih35HGxiQXxgDu6C+hwZDBN8thMe4
	RKleODCUrKTSqkwEfTC8EQG8Od3OMRtG758CueEHWc2KmpBuBBLpD8gZ0JrOKnnqxLUKPf7Rm35
	fKW5wViulJURadz7HVMr0sRQAP5ojh9aeNoO1r3PR8V+91hzAkCYUwDqHFYypbpFSePq8lusujz
	CS+6KiiE0TUQNXwQ3AF6kNQQ7YXj
X-Received: by 2002:a5d:5d08:0:b0:4a6:4f91:284c with SMTP id ffacd0b85a97d-4abb83116bdmr54504811f8f.51.1795781948269;
        Fri, 27 Nov 2026 04:19:08 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm47947814f8f.3.2026.11.27.04.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:07 -0800 (PST)
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
Subject: [PATCH v4 19/28] ARM: dts: broadcom: Describe the peripheral window in dma-ranges
Date: Fri, 27 Nov 2026 13:22:09 +0100
Message-ID: <20261127122236.4976-20-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041910_050777_55EDC712 
X-CRM114-Status: GOOD (  16.93  )
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

The DMA controllers of the BCM283x family see the peripherals at their
VideoCore bus addresses, i.e. at the child addresses of the soc bus.
This translation is not described by the dma-ranges property, which only
covers the RAM, so that the DMA engine driver cannot translate the CPU
physical addresses of the peripheral FIFOs and had to rely on its
clients providing bus addresses instead.

Add the peripheral window to dma-ranges, mirroring the ranges property
(minus the ARM local peripherals, which are not reachable by the DMA
controllers), so that dma_map_resource() can do the translation.

This does not change the bus DMA limit of the devices on these buses,
which is still given by the RAM window except on BCM2835, where it is
raised from 0x5fffffff to 0x7fffffff without affecting the DMA mask
derived from it. On BCM2836/BCM2837 the highest CPU address covered by
dma-ranges grows from 0x3effffff to 0x3fffffff, which does not affect the
size of ZONE_DMA as there is no RAM above 0x3f000000.

BCM2711 is deliberately left alone: its peripherals sit at 0xfc000000 and
above, so describing them in the dma-ranges of the soc bus would raise
the highest CPU address reachable through it from 1 GiB to almost 4 GiB.
On arm64, of_dma_get_max_cpu_address() would then no longer be limited
by the soc bus, growing ZONE_DMA and the SWIOTLB buffer beyond the RAM
the legacy DMA masters can reach. The legacy DMA controller of BCM2711
keeps using the ranges fallback of the DMA engine driver, which yields
the same addresses.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2835.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2836.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2837.dtsi | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835.dtsi b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
index 15cb331febbb..3a9719e2fadc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
@@ -35,7 +35,8 @@ cpu@0 {
 
 	soc {
 		ranges = <0x7e000000 0x20000000 0x02000000>;
-		dma-ranges = <0x40000000 0x00000000 0x20000000>;
+		dma-ranges = <0x40000000 0x00000000 0x20000000>,
+			     <0x7e000000 0x20000000 0x02000000>;
 	};
 
 	arm-pmu {
diff --git a/arch/arm/boot/dts/broadcom/bcm2836.dtsi b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
index 783fe624ba68..4ab7769c056a 100644
--- a/arch/arm/boot/dts/broadcom/bcm2836.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
@@ -8,7 +8,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
diff --git a/arch/arm/boot/dts/broadcom/bcm2837.dtsi b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
index c281697142b1..ba44cfb07668 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
@@ -7,7 +7,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
-- 
2.51.0


