Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8729B606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nXmK7Vy/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a+qRzA9A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2By4B2DmE6jOQ+T2SsshaYG24+i1LcC/o8XIi2KFjfQ=; b=nXmK7Vy/UUaiocP/mLuM6V1nM3
	1890tbQwkbCihWVBXY2y6zIwYj82kcW4XkxNHXSfelUoyGXqedpkZGiF7X4rtr3tQhsteEImpK0sV
	jbiZmkGLvsLvGh8LBXYJeFrrZX/RrH6qbg0KxgPPgbv55bjvk8SJ1Zw9uI3/fkvBYh0qpQSS3cYL1
	j/stNSiPTz3oGEwqrQv6f0CD9DpSIsMTe/+cTSj1bd3EQRzC7hr6nK+IxWwNWckC5YyP0ETjKbs5V
	7OQ0m/Ay4P518Pv49caUO98xp4d9eIRQqE2DXzrazWjzSA3MpQXfn1NQV9LcO6YjUK0fTt9+PmHH5
	5vCXeXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdHB-00000008d2c-2fHz;
	Wed, 18 Nov 2026 10:52:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdHA-00000008d0x-26Ts
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:52:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2866945FF5;
	Wed, 18 Nov 2026 10:52:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794999148;
	b=UV4d4i3hc8uJKj89x1fS/OabbwHwW9pgpqtKosQgEHG0bwrNrvTciyddWCPPQHmVNf8k
	 pJefJGpSnHUoddWcwvPkCPkiNjCEDc1g++HW4JdgMOxFPl16XzhdX3ohAC+xlfAAt9e8N
	 D3BjGUA6JKgoOziEjTwDE83JIK97bPHDAr3kzQ4faLfrUbVP4XuyKT5+SrI7I6hjwix64
	 1EPH+itMxWgH50iBVueqx2fvJGaSAPm3EMuh2Xriis2roSfCG45PX2M6T0EqVNDRWWuKP
	 IhGN6r4e+yUfQoKbTTa+bnjsB1DAX+0Zx/4qjzDoy8tr4gIP+hE2pbm4Qby2bd6aihg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794999148;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2By4B2DmE6jOQ+T2SsshaYG24+i1LcC/o8XIi2KFjfQ=;
	b=JX+NIHr45DW3P8igOXGLVwG75m9zPmQcsSSo8t2JXO7EWhKux5XqqOSNOIT+GzO1YlLD
	 rQmPyd821AJDVTqBMOZeiF6znkgnC54PBuoF2d8NV80F+5LvZZsqsi88SkR46JgtmroPm
	 HHMUoiI5FCXeJz+YYO0CSYMcydgaL8qniAb1E/apzFoQUJd/brpgyKrLFY2UB+R8CsEVR
	 2Gkbsq/GLRkwf1JevasC5IplF1yIhzoTyIOOZ6aHdv4MAFIiYba18rfVfs839XFoW+x+x
	 Vm3DjTxDS5weHxWgzO9WzLt9+XlCkZRtvMbG32jXxzM0VaefKt1n9vgBWtLkomVo8HA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 428DE1F000D0;
	Wed, 18 Nov 2026 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794999148;
	bh=2By4B2DmE6jOQ+T2SsshaYG24+i1LcC/o8XIi2KFjfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=a+qRzA9A9YDM+wVMDvTkzUD2OyvwOr/Sj3B0nOfhHr7Ai/qyqNBTg8XmqLpB5gxnn
	 Cl5gxxcRJ4YGi5+QW233inzZGvgY4fV/d33ehBhvYv3Xt4hSfPs3G1vTf9W1Vaopvr
	 j50WErYjLJuJ+Qyign3v3twPmZnMem/lhQJZajrAuv8R0TwSglIk9t/tvUxC1gwpn1
	 2AWefvqYnDTVrol1vwy/zKzp9soTmLZE++2ixNhmuU5YV/6uqhhqi6ur9Pr04ImrHr
	 c43dRJGnZUQ3zAme6OTheS0Sfaj6lQ7qMdUf89dCo0vdEDI+5SMNMj2f53hZnymFXG
	 eZ1yI8BYSc7UA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D4B664AD24;
	Wed, 18 Nov 2026 10:52:25 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 04:52:29 -0600
Subject: [PATCH v2 6/6] arm64: dts: allwinner: a133: Use the A133 CPU OPP
 table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-a133-series-v2-6-8bcec9c9aadf@gmail.com>
References: <20261118-a133-series-v2-0-8bcec9c9aadf@gmail.com>
In-Reply-To: <20261118-a133-series-v2-0-8bcec9c9aadf@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Alexander Sverdlin <alex@sverdlin.org>, 
 Cody Eksal <masterr3c0rd@epochal.quest>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794999144; l=3568;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=9RwtNBE54nzjhJKSSd9WvjqDW6S0SKtsSGS0h60Ibhk=;
 b=RYaCsVy1CxE3WsdfOmFeUTfltmC5+noQeaqGmatT6wD6gN9vhvPy7TVRCmJgDFipyIzA7JAyj
 JmqGaudtNgCCC9jenEkNs1zsg71Gdo3pElxwH8rN/tuM6AMILFtMQNl
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
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
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

Switch the three A133 boards in mainline (Baijie Helperboard A133,
Liontron H-A133L and Teclast P80) from the A100 OPP table to the A133
one, so the speed grade is selected as the vendor does it.

What changes depends on the chip:
- revision A-E parts with a normal marking ID get a0-a2 from the bin
  field, as they get speed0-2 today, with the same voltages; only
  1080 MHz becomes 1008 MHz. The exception is a part whose ICPU and
  PCPU values are in the range for which the BSP forces a0.
- revision F and later parts with a normal marking ID get the a3-a6
  voltages: higher at 408 and 600 MHz, equal or lower from 1008 MHz,
  and 1008 instead of 1080 MHz.
- "high speed" parts get the b grades, with 1416 and 1512 MHz instead
  of 1464 MHz; revision A-E ones (b0 and b1) also get 1608 MHz.
- if the firmware does not provide SMCCC SOC_ID, the driver keeps the
  A100 selection, adds the BSP's a0 rule for normal parts and warns at
  boot.

All three boards supply the CPUs from AXP803 DCDC2 with a 0.81-1.2 V
range, which covers every new voltage. Without the A133 support in
sun50i-cpufreq-nvmem the A100 fallback applies. The Teclast P80 also
needs "cpufreq: sun50i: Handle boards with the allwinner,sun50i-a133
compatible" to get cpufreq at all.

Claude Code (Anthropic) drafted this change and its message; I
reviewed it. I tested the A133 table on a KickPi K5C; I cannot test
these three boards.

Suggested-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Tested-by: Alexander Sverdlin <alex@sverdlin.org>
Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

---
Changes in v2:
- Commit message: revision A-E high speed parts also get 1608 MHz.
---
 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts  | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
index 545972d2324..3a89d3f74b3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
@@ -7,7 +7,7 @@
 /dts-v1/;
 
 #include "sun50i-a100.dtsi"
-#include "sun50i-a100-cpu-opp.dtsi"
+#include "sun50i-a133-cpu-opp.dtsi"
 
 /{
 	model = "Baijie A133 HelperBoard Core";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
index 90a50910f07..1b9cbcbe5f3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
@@ -6,7 +6,7 @@
 /dts-v1/;
 
 #include "sun50i-a100.dtsi"
-#include "sun50i-a100-cpu-opp.dtsi"
+#include "sun50i-a133-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts
index 47b5f2ac824..7d4c346276e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts
@@ -6,7 +6,7 @@
 /dts-v1/;
 
 #include "sun50i-a100.dtsi"
-#include "sun50i-a100-cpu-opp.dtsi"
+#include "sun50i-a133-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 

-- 
2.34.1



