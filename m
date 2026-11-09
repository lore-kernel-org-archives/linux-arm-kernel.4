Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908DF606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eNk+OV+K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8L9S03m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w/CDc/ekChpK1MEr5fDIpNGu1oRamZM5e+eEMVQj/7E=; b=eNk+OV+KFQEsFpx9UsBIjtlJ9P
	hJrEz1yew/+8nDbW3sIdsoLpZp7GwWFdtX86TktBE6mh/B424UoCenPrv+89sPRwRrkmYRgbBSEOH
	jYCH3yZbJa9u69VkUes0nhoDCS05zDEQq9Sv3re9WNk+HwOf8YZVLgco+RzCRHbrAZG2ryciX3ST7
	I5c1Sqv/LPV9YsLUAJoOpi7sDMo3LciMbG5zRYbBi7ntdtDa2S0GwVD3DtRTI+zpu+lfT32i4bqEt
	iKCXHSMZFncFYQSw7eiV8C+51AbKkMxLxX7y6XwuDeE8m3KJXsrSKxNJeJTqVWVgVlFNOV33+soet
	Yg2ir+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDhr-0000000H0Ur-0CJX;
	Mon, 09 Nov 2026 00:57:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDhp-0000000H0Ud-2HV0;
	Mon, 09 Nov 2026 00:57:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01DD46182A;
	Mon,  9 Nov 2026 00:57:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794185872;
	b=oFtotlonBixhADIUAaRFb/R9eMIbYHB68t5Dp9YdKn8p035HsN5/CVVW1cl1Vi0VnmdO
	 hxr2ZDGnNLu06Jy0tDHCr2okQEt97Wks6bw7SukTgqRuKyGCy+MS6kWLnIuezzXYIFvRx
	 XbLOUX16ehdd1aDSMy0eavAlhe7qZOu/0j4pGoqq+yZpx8297RSPYUaXcTlAC8/wrEszR
	 TKiZnB1nMhOyGQSzMeMyFAg86C/rxHiQcQVfbWneYh9dzvSNOujiH4o0NSVtWoCIc4Oqg
	 RXIjlii04MQBATfn1e2W8KGsnN/zPFkxOQhK9h2THfDb6kc8uHu/Slk55PaXmPLlH6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794185872;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=w/CDc/ekChpK1MEr5fDIpNGu1oRamZM5e+eEMVQj/7E=;
	b=dV1A4t9XuKShgiXAc+9Ewo1uXYNMlPMZMg2W1DH+56FUCKuPuQxTgKLCFQEBOTbC7AKf
	 sAaceBnQMilESeUG7ecZppQIaYIs8R5ZyOW4Q/D5k+Eaxz7ZwBBAJUdUXRL5b43ELVpse
	 6vH/g564dYZj1tAVTC/XTn71ngv9HxdrDltXPwWZ1jWZjaXaSzt9ettwZfjQpSDiV/oa0
	 9QZzrej2hnIFud6TwhJhWuR9bLwD8Zt8zkV/nmRRjHQl8KUcAojheJAXSDgZlz/zwUcf4
	 rxL+zmb7VCGi9JHfaoENTZEWPjDeP6KEIU2/qxk8nDCP+UCQp5aCN3r+ZVfdf19Py6A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3954B1F0089F;
	Mon,  9 Nov 2026 00:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185872;
	bh=w/CDc/ekChpK1MEr5fDIpNGu1oRamZM5e+eEMVQj/7E=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=k8L9S03m3BDqv8PczotWE3y1CXKgKWUtkn2VvTC3249n2qgohy+rBLEDsFkOvVj/7
	 CPc6bkKvRtY3uT/YqDKFtGbDY5FkODbAWC54f53saPt/vj2DU7yBzouDml+Puu5B3Q
	 56zCjPFefmzNgooLepmCgqPxPnRpeqUs20OMlc7AXfoCM/54N3J2iJSx4LLwx/rf1p
	 13uIUQF58KpRSf210pruj6kk41tF6ZU1aM3g6F8Gv78gyu/rdEUluLXGgZ0ZxWz54g
	 a3ovwriD7g0Z1S94keHCjHW2Huj7j6k653L1IG678tGn6CPsdvf0jgRJ5vzxkGRZGf
	 ioCuA20uyFoxQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A9A7E4075E;
	Mon,  9 Nov 2026 00:57:51 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 09 Nov 2026 00:57:49 +0000
Subject: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: mark the Ethernet
 PHY as a wakeup source
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-hc4-phy-wakeup-v1-1-d98784ecac88@iav.lv>
X-B4-Tracking: v=1; b=H4sIAIwa8WoC/x3MSQqAMAxA0atI1gYaJ6hXERe1RhsELS1OiHe3u
 HyL/x+IHIQjtNkDgQ+Jsq0JlGdgnVlnRhmToVBFQ6Q0OluhdzeeZuHdo7ZU82BMScSQIh94kus
 fdv37flgHcaZgAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=th9XEIxslt9+U3iOsvDowXn3pt6YXgBXd1xZpRrr4n4=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkfpfry3jIbvs9Z9Uatelmny21OjdLSH79fPbD2nPIzI
 mF67HyGjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjCRMCOGf7ofCvuMDwa/vHVx
 zlTZbeVOSdWZE/2Nv/j83z819/luTRuG/6VWdbxz7a99TLhh3Ngh/o//ywEJu7TgQx/uaf9m9Wi
 sZgMA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

The RTL8211F interrupt is wired to GPIOZ_14 and described in the PHY
node, but the node does not declare that it can wake the board. Without
wakeup-source the Realtek driver does not make the PHY wakeup capable,
so phylink leaves Wake-on-LAN to the MAC, and a magic packet does not
wake the board from s2idle.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on ODROID-HC4 with Linux 7.4-rc1 and the U-Boot and .config of
Armbian: s2idle, Wake-on-LAN set with ethtool after the link is up. With
this change a magic packet woke the board 5 of 5 times, in 8 s, with
pm_wakeup_irq pointing at the PHY. Without it, 0 of 2: the RTC alarm
woke the board.

The test DTB had two other changes: the RTC alarm interrupt [1] and PCIe
disabled. With PCIe enabled the board did not resume 2 of 2. In the one
console capture resume starts when the packet is sent, then a hard LOCKUP
and a panic follow while pci_pm_resume_noirq() of the root port runs;
pci-meson has no system PM. So on the HC4 with its stock DT this property
alone does not give working Wake-on-LAN yet.

Not tested on ODROID-C4, which shares this node.

[1] https://lore.kernel.org/r/20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index e6f02d738a21..9a4684dfbde3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -277,6 +277,7 @@ external_phy: ethernet-phy@0 {
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
 		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
+		wakeup-source;
 	};
 };
 

---
base-commit: 81e55899e134541583a4e611ff750e1868671c67
change-id: 20261109-hc4-phy-wakeup-9c15ebaa311e

Best regards,
-- 
Igor Velkov <iav@iav.lv>



