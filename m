Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607CE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QNIJgY6m;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=P+OUwZLi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rQIbTDPqM1kGhmjmlo8VdalXlbJAiuRtdZwXJ1lLpOc=; b=QNIJgY6mtNfzfu
	JIIBvb2HtfLsfd9gic54fbk+IAYcJIoMcn3B9w2r5GUdCzcAyTf+b2hKIxfNAfLC38TBEp+AnP3mC
	b34NfdzDPVV3ygFSmas7lBJuUPQIB4Z4BJiq8pdDQiXW7ELrsyX4S2mH0kKnw3n1FRryXd7VA1ItM
	g0zRJTSljdNeciJ18bfoBhLP6kL51iXtakPrsyj1Lry76U4Nh0WrVU5HO3jsKrxqWmsikle8xFW9u
	sUEgt5oPyqeqH3d0f7AuGQ46wdp+iVHkxQjzLXTYmN9DsPsG461TTsJkblzYC/2RNmm9HvXTT6O8r
	5uRdzr/JQlgBI77TfHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL3X-0000000ETWc-1W7K;
	Fri, 20 Nov 2026 09:37:19 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL3O-0000000ETSu-2LO8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:37:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EA610205B41;
	Fri, 20 Nov 2026 10:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQIbTDPqM1kGhmjmlo8VdalXlbJAiuRtdZwXJ1lLpOc=;
	b=P+OUwZLiqMnCGXLmYWvt1iZfw82Rk21aiy1iOLrfOT5yQzkLITUknmyO3+nqIb+czQx//o
	oRmBU4K8KrdrFfkRAzexYS7CY+IV1LAZjNqKvWPQkYhWuCAqEE2VUfZpL5YNl9UjiZmHka
	2A0F6dvxmWSJsjcGamzkbuyw69GZ+MF/MwXZXPxZrupb57Cr1oCv6qrkuvUM3Mdx2vLfmE
	2YsMKIpTvbYmroaTgVuaPb8gDB6O2haUU20BUkd08+nTT17N1sE81XLMMe/bU0FGOMotpw
	qGaTHXeZBHMSQpK5m4YAys7IJF/zQpvN5zMqzt55NiAxJvCGPWegMKIRJTO+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQIbTDPqM1kGhmjmlo8VdalXlbJAiuRtdZwXJ1lLpOc=;
	b=fl05Vht4e6739plESL9sVFP94kS5cjxBBI0lRv3FLwzKk+KqvtWfDJdfrQMSpH0jYseF1C
	2wzAVPA0ThM+X0ThlC6jlbRU5S8byJKQQqBLN9mEyWku5DtTI0a+Njy9n5K2B0IMztxV1+
	19yy+WSmjgirvoMXRjY7Oe3sCILr35BTaNN6rfmne9S8xBF8vfcwK9dxIUxTh19rjc6zw1
	NZWlSIVQbSS+lALFBE+KaXH5dPsiqK+PAQfQ25MHVC4mqBmTf2D0WB7Zykk1MsIBM/iKO9
	x4YwN7oZNbWjeChODEygEIZypeFF3sYPx9C+0YjI4SUkTpE6EHNm8Mj62EF8og==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795167425; a=rsa-sha256;
	cv=none;
	b=EWMWytVgopVKw+1nKLwQ33OpYY5zcjexx08gPySa8ODEVsati7+UD1ik9todrKqZoaZjOD
	/oROixqM6S6RaOhkgBvvLshySbTxaKKZtFmWUroor5L1rALMm/9mOGoAV/7nFjIP9NAfnK
	aAx/6FJIIjtI3oQIaqEMMyw+TyqH1wKDLAo3T8uWhVeZzNMzbr9WCOB389SNYGB/57JAFn
	sNymnpZg0MN3ISVm/HZ1Q/y7WvcokVJ8VaBn2WRaQR+qxjtEwUQsozDUV9WcD9H2kLpVpm
	ihnZUUNd5wAkRj/cjMvS1ILIxgome5ptn9ZIBImm8h41B1qxkT2jTdMV8CFqWA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xUL3J-000dRE-18;
	Fri, 20 Nov 2026 10:37:05 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Fri, 20 Nov 2026 10:37:06 +0100
Subject: [PATCH 3/5] arm64: dts: freescale: imx93-11x11-frdm: use 8-bit
 eMMC bus
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-imx93-frdm-fixes-v1-3-78dde22a56fe@pengutronix.de>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
In-Reply-To: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_013710_766700_03848A64 
X-CRM114-Status: GOOD (  10.64  )
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

The FRDM-i.MX93 eMMC connected to USDHC3 uses an 8-bit data bus.
Correct the bus width to allow HS400 operation.

Verified on an FRDM-i.MX93 board. With the corrected bus width,
the eMMC operates in HS400 Enhanced Strobe mode at 200 MHz.

This also avoids a respective warning:

     sdhci-esdhc-imx 428b0000.mmc: drop HS400 support since no 8-bit bus

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index fbe3543e1ee8c..af674f3f48364 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -75,7 +75,7 @@ &sai1 {
 };
 
 &usdhc3 {
-	bus-width = <4>;
+	bus-width = <8>;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&usdhc3_pwrseq>;
 	non-removable;

-- 
2.56.0


