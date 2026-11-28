Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF46606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b2c0MJRC;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=1HXO5MIX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lB1V9xfXl8tQv/mYXKXj3a0bxoflJn/p+eO9avUpcxw=; b=b2c0MJRCn/hlkw
	EeOUaXfDx9S/1kjw5uljYo0wkQckczzkwmVMfkFJQP+yTEGv8exRvMRKCkFQzF4Yxt4Amo/CwQr30
	bfNNBOt9KHmCuE+0YFbzhGMgL6pF6Afs1BBCUXA17QEqNSPxcuDtLstdQ16GIiWCrs0JmIBCr35Mu
	8g7Kp/kkert1LyzMCBqctkEeBtc9RNElsviSXZWcxrHGeVk5lSG+ydkZFB2HFCK3uKjkLnB/TdlVu
	8Z3Dtog68nEEtb4hP8XFISH6jSgDphbWVdyLwbUbzNPKHr9eVH/ZlUC3SAJyYCPv7peG6oIRseG8M
	Wl9vht43RDLjhHiW/i3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIqT-00000000o0K-0Vtd;
	Sat, 28 Nov 2026 13:52:05 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIq9-00000000ntk-1SMx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:51:46 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jcBXb4J8Fz8vZH;
	Sat, 28 Nov 2026 14:51:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lB1V9xfXl8tQv/mYXKXj3a0bxoflJn/p+eO9avUpcxw=;
	b=1HXO5MIXfDyhAQL5TVuVBDoadwndiuw2iIPuvoTtVkgWhWDF4fPpKeRyatJDDzsOTdqOFg
	nKF7LRtyjVf+uDtpnp3TlcK0pOblG9aPcXwyrHxXAgBX8aryLlvtwmStQn/UWcYtIt6zco
	KD2S5a6XeO5R/HUmhEk2woIFjQQx2W1dMIt/BfB3gPzuztG2ywEv499+sQkFH8o0lEjm2T
	QNnHMDTjSZJofrg0gxEK4gGtRICU9g4uSphZHK82yz3ZbrUCbCMOVjsLOCjMmswnaJirp0
	aI4mbhSFOSSk6g5geCxFz0cJgCD7HtWvIWVh5aSwkk6W4A2fcSBkxO3mr/4LAQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:32 +0100
Subject: [PATCH v2 5/7] arm64: dts: exynos: gs101-pixel-common: add labels
 for touchscreen supplies
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-5-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXb4J8Fz8vZH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_055145_533104_472A8A8E 
X-CRM114-Status: GOOD (  11.32  )
X-Spam-Score: -2.8 (--)
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

The Pixel 6 boards use different touchscreen controllers. Label the
touchscreen supplies so board files can reference them.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index a12f2b88d72d..92b1640c0612 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -399,14 +399,14 @@ s2mpg10_ldo22m: ldo22m {
 
 			/* ldo23m & ldo24m are unused */
 
-			ldo25m {
+			s2mpg10_ldo25m: ldo25m {
 				/* touch */
 				regulator-name = "dvdd_tsp";
 				regulator-min-microvolt = <1600000>;
 				regulator-max-microvolt = <1950000>;
 			};
 
-			ldo26m {
+			s2mpg10_ldo26m: ldo26m {
 				/* touch */
 				regulator-name = "avdd_ts";
 				regulator-min-microvolt = <2500000>;

-- 
2.56.1


