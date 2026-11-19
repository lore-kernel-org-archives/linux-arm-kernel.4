Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD57F606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QIdKXT9d;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVKaS6YL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VIgL/O6urWB2GHhIUk6aGQm3b52JD8HwlkLDLPdkbqI=; b=QIdKXT9dPIKLYsAFbm2dHjZqEo
	aJEHndMnb3qkxA+Ns6EEGc4nYTD3sCokHFMWbzPMDWbwSsOff9kbnqa5uwqTvZ2L/GGVK31/NNJdj
	KV7bEHohMwhV0AIYZVkbCG4/xUzIhLUFoxJLZPKRwhSoEYnnyzCbeF0iO9e2/QvhBiVTyc7+lIn8y
	OyQTk7tk9SiDnSINbSm+L2N2lWRBxk95QR78Ivtc7X9CjjMEgUzkfj/rAyebsDOt/i7Pna6lpR9DC
	Ds8KwH9J+krlQlecHH8LJwC6BeUejUge7BpLaQVmWHV4/UczF+JYZT8oea5w/gRJcQO1ZdsaOQSWi
	7dDvJswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz94-0000000BVAa-0nrP;
	Thu, 19 Nov 2026 10:13:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz93-0000000BV9k-22Bj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:13:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FEE24074E;
	Thu, 19 Nov 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795083213;
	b=XVw1DT81GshVIb+isaOMvcpriVYQPIdGQ/msIr2Vquud0cGhGOCDMbeQAraCIHVGZq0D
	 7R3TtbXNBqoRmiy2HOOGlsHThwXI878lafLIzVZvegnm/3HxHzHuATW6YTgWgkvAcJUF8
	 jUmdrt3xBUpdBJFhmF94isffqemVF12bEUyv3ZB/3vkFyRsKzaxQuDex8OZ26ekrEkZK1
	 rZ3GyUEVExwBrUUWSbVFi3ga6W6w457gjzhnnDvXhfVvaJY/tYFN4AMu/06tYtK7ms6Ir
	 IixFAkO+QDpShPBO8V0CkPTT9juGyOuw4BNXS+Rpp+Jd66g9/lgkRN0X9JrnTNy5ISw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083213;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VIgL/O6urWB2GHhIUk6aGQm3b52JD8HwlkLDLPdkbqI=;
	b=WIW/nwe+XKRSWhNvGVs1wOqwEnmvyypdR7Yaq7R4kqd2CAtGaBkg8SX5i6U09tmHwNh0
	 4avgYNht/M0wqaOWco2jl30oB0Kegee/2fY88w0tRRkg1uH8TXoSa939Ji3WDFzvSW7jp
	 nvamTExLb9vMrd6MbFwUA5tI94YJAcdQ/v8Ngtwt9smPnFtoifzQC5/COfk3Xm4QeDbjv
	 m6pHC4C+58vb9M4QC/EPEgZHFNqX2bJpXWGOT9tnQ1fsVHyvPlwoc4JRNEHmjsre0Z5Dc
	 BEmLXhFcYPo78XMK7Nkck/Ml5Lu+3gCZTRiHdCwG7UzcJK1EXuEYIexWPRwbWb134Mw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91AE71F000C8;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083213;
	bh=VIgL/O6urWB2GHhIUk6aGQm3b52JD8HwlkLDLPdkbqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hVKaS6YLmCCbkaFSCfQQwwpPWUZR+UL3rtY9alKJQR+q7S63b7tbSI7TNTOL0JPzv
	 H9z6AVPatiwWqafO5MK53jgOCFwDtqzZMVuqwP7OH3je8PjT2xYUtOAfdhFUvNZSnF
	 g4sVW4ceCTF9CXskZxlIlHLyno6eVpeZPaQI/giD94TaZJIyQzkpdsR4KWjna3tqSk
	 va7iB5aO+BJfV7V2ui0EExSMUxd5vtKdXgMUEsocDMSdV+BAg1aadX6rfKqOwEIZ9H
	 vDT5kuXzIwZJan5zVHWc4Ro4t+Q1SNB4eZ8D3Vhyg0k6uDDoI2Kt0cASlmQx5Iohcb
	 e+PbMQzA2mahw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1BFCE4B234;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 19 Nov 2026 18:13:21 +0800
Subject: [PATCH v12 3/6] arm64: add ARCH_AMBARELLA
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-cv75-soc-v12-3-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795083209; l=797;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=TcxFa2qICxsx+3aVN3CSUHlAvke6t5Kh1BAcv+g84sg=;
 b=kZFuSRx1rCDEBf0F6XJRQOn0urtsVM+m+d/A0Hg3dQg4s56a+VThpSwPDPHmG1mxypFOd/0c4
 GgGrgiUx0HpA3p9Fb84ysUlsA4I3zmUnsZKdxYsu/i4rGEf0lbd5ufd
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Long Zhao <longzhao@ambarella.com>

Add the platform symbol for Ambarella SoCs.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..16d7e3a4c2d6 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -26,6 +26,12 @@ config ARCH_SUNXI
 	help
 	  This enables support for Allwinner sunxi based SoCs like the A64.
 
+config ARCH_AMBARELLA
+	bool "Ambarella SoC family"
+	select PINCTRL
+	help
+	  This enables support for the ARM64 based Ambarella SoCs like CV75.
+
 config ARCH_ALPINE
 	bool "Annapurna Labs Alpine platform"
 	select ALPINE_MSI if PCI

-- 
2.34.1



