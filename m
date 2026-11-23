Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2320E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fVTGNIh+;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=G7pXD/Z/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=; b=fVTGNIh+iwvjc9
	cmjqe3G6El3zSdPL2cO3awEis9ZaSjzOO0Ov4QE6peLKTyEDvQ60dXkhA7vrVPzLtdF2rHXQnaKvu
	nL0bqBTd93qYKn9+Drsj489rXh8XXBJ9ik8CUcBMwXsjQd6ewRtMw7ezt3kp7GnfIHc9aYfv3eXCP
	ArfUyxEl5ewjWetPNKGa1UqW0SXCoX3xMUJQHofqzWumzJcLuBIeMgIgL5WuASX6pgZSG1Oa7r5Wz
	TvGDewJXPf2Kb+vhnwcXiJSWra/5qqYZs8BStUiWgR1zzh/zKDEWKQecLEo1ehCQyCfT03gdHyOUl
	wb7Z10/y5rfjGSd12lxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTe-00000003qLu-4A3g;
	Mon, 23 Nov 2026 14:57:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQf-00000003ocs-11kZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24543765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445639; x=1796050439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
        b=G7pXD/Z/0rNc25MgdCd2jkpCzv4s381yGAEl1LGq7JwRovUOPSGQlWQS3fqCxtVErb
         ROFUi+86fyulP6vzh//aoqGZmPi+blQkgCV4IT2lyi9w5lhANR5qpp5qpgRkmu37SAkH
         DIj4STAGML6dwaB1q2mpHXqewao7s2MyVuH+A2pDbb3yUvIiCc2PWImY3kiplNEc81Ld
         IvBT8vObMNjyelzT5NYKCHSgKaCpV6HiS/a74SSnAwComj95I3Ge238oxyCctpi2KL/R
         /K6EGgf0Q42D7wEqn4cnYcO9VXDQjDQhjuJi+rrWy6AqDICKX82CvLay4wX158YJmaU1
         YOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445639; x=1796050439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
        b=XF9NywiKpvY838UIQBY0opzuFZf9qGKr0ayiI7o0T7pNl/IEmMiOz3+ohWJKIacwtK
         FUhSvM8hbCjS0ZRPlXqjycgVB+JztJhdGccmwuh9bu2GHWCNKhcRh+nLF4SYOoCtoBDV
         IvI2Myq3XD8GVXeglKaRBxc6yhsx5+/M/iID6NH40RBcTjfg7PcKZqyQzZgCtjC6DdoJ
         SX2egsyg/vynwT+SziE4ndR1vMDRgj8wI6hgPkFP1A2sAB90VH0+H4QvbUKcWYKtrIsI
         4Oy0mhF2uZKQjTztlMp8wxH937i26HKz2Otc6tcF7GJ+4KZ08JV8Gk7xNl3p8Es14gA7
         FzrQ==
X-Forwarded-Encrypted: i=1; AL+hErGdybqT33JaqqRBVCuPHBQXtFpBPDSiK4L+Lj5yI3GXtzbJqLObliIHeRsgJIRJQ00AQxkohovyw+pWca/kNgHS@lists.infradead.org
X-Gm-Message-State: APuU4Z9q503nxcE/Ztkw7yRkJNaOG9XjffUpxtJwqTgNFj0HrlFdRpbK
	IbrPisDwbVMPm5YnJMyhFROpt+thfNFyxuBJxmq4e9nx+IBWyrmDfDMCrXPm32oV0cw=
X-Gm-Gg: AZFdTZeaU9ZkkgsuKIBrGtDIo5fnvdzwqCxRs4qGem/GziZVM9uF0HwtduH1+K5KAuk
	l5w8wNsR+nPKWxcCFSNu7F8vPamcfVcE89QmEr0Dkdma3in5RLCRuv2ae6Jfr8Ila7lX8jZjLag
	QNZ7th6C28E5LDBQ/anYv4+x2Zvmy5b2sN9S/EmYrs4o9T/iUK224FiDTMlhKrN+RRcWqM6xVgp
	WGeR13J1BCSJCMZIEmPpQ7Zw34HolzD2YW/HVKZgTZNyaEqaAkxUFw0TiUoB/ZIf9pmpSQ8S6Kb
	LRuuELadrYxiuaxitJaY2Mn4HS4EjUWPLhJxJPfMjdId07A+yb2w2O/pmq8ijiADXkzhz/+iqGH
	A5NJizO0wWBXJwDh/kVwe+0vy0yeXGt0DChSTkKH75wQ+RWniWMj+AU4tQSTqTYSojmz3fO0faY
	GZePZd58OLYakE846ue+VTunfGre0QNyqBZjhBpISmo9tyTDJ0i3geAigDKXjs7k/aJOGTCZVKP
	fMC/j/lkrdWPaHpqXqQArU8pyLEVUfUud2vSCEAdmfsx5kU9OvHL2ksm4Hb3AXXmWPPhEN0HJZ0
	taEobyEA928GyjuB69r7co5MxHAD
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr237377065e9.32.1795445639349;
        Mon, 23 Nov 2026 06:53:59 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm280462825e9.2.2026.11.23.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:59 -0800 (PST)
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
Subject: [PATCH v3 19/28] ARM: dts: broadcom: Describe the peripheral window in dma-ranges
Date: Mon, 23 Nov 2026 15:56:57 +0100
Message-ID: <20261123145728.29082-20-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065401_424593_AEE5DC9E 
X-CRM114-Status: GOOD (  15.80  )
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

The DMA controllers of the BCM283x family and of BCM2711 see the
peripherals at their VideoCore bus addresses, i.e. at the child
addresses of the soc bus. This translation is not described by the
dma-ranges property, which only covers the RAM, so that the DMA engine
driver cannot translate the CPU physical addresses of the peripheral
FIFOs and had to rely on its clients providing bus addresses instead.

Add the peripheral window to dma-ranges, mirroring the ranges property
(minus the ARM local peripherals, which are not reachable by the DMA
controllers), so that dma_map_resource() can do the translation.

This does not change the bus DMA limit of the devices on these buses,
which is still given by the RAM window except on BCM2835, where it is
raised from 0x5fffffff to 0x7fffffff without affecting the DMA mask
derived from it.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 8 ++++++--
 arch/arm/boot/dts/broadcom/bcm2835.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2836.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2837.dtsi | 3 ++-
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb39396..f475422796d8 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -41,8 +41,12 @@ soc {
 		ranges = <0x7e000000  0x0 0xfe000000  0x01800000>,
 			 <0x7c000000  0x0 0xfc000000  0x02000000>,
 			 <0x40000000  0x0 0xff800000  0x00800000>;
-		/* Emulate a contiguous 30-bit address range for DMA */
-		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>;
+		/*
+		 * Emulate a contiguous 30-bit address range for DMA, and
+		 * let the DMA controllers reach the peripherals
+		 */
+		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>,
+			     <0x7c000000  0x0 0xfc000000  0x03800000>;
 
 		/*
 		 * This node is the provider for the enable-method for
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


