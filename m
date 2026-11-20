Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ivlG1q8;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=BmyIHqko
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=; b=3ivlG1q8gosySO
	uKbgT1fxF2/w0RIglBgpYlp29AXYjsvvFAxhjVmuqsfoWR2xhiYdXHZcGGKbVb2pVW9v2tnEvIBAu
	Wz8T7mSIDmKe64muGzgzbpKFY8/YnYZ2pJpZ0Tbj0CJ4XNbHfdrld2eckCWqSeK5yVcGGCXvemcFF
	plLOnq+0jLjLo1J7TxMomrLRIO5XsyAhMgtxYYJ0ACbUJurviW7JmNTGRs5u7zXVdrVqSQCI3GXQF
	VbKSGjWwIXRjc6u7K7RvINDfhDdvjzKlBAWafUtWTplJpBzx87Y81IfJMLlrHiKYgtAzd5J3n9if/
	t+c/jDy+/40YC9X9bN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL3X-0000000ETXJ-2vLO;
	Fri, 20 Nov 2026 09:37:19 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL3O-0000000ETSv-2cOp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:37:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0EEF2202052;
	Fri, 20 Nov 2026 10:37:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=BmyIHqkobvTDx1mvjrQJX6zuMrQH5fIc5A0/6kriEzoLGnk1DKuijyRlyg4S0z6lsZONhD
	MCQDDSsyOykDj17v7wwewc+FV2lItknqXdlKeNsyeBbLZnyqGPw+IiYvHni7/GRpyo0AXL
	A5K7dlv4kMBdskLc4JtfXQ6ibeG96HZeGt4v/q7SRBdpq/UgWlN8tIcyjYW/f/qunXvSaA
	269GXwq+M0KK+g9G4slI5Ytuj4WSieM1l5nQN6mERq/F4dRMBxhB5jZv0PebYMgxDvjFNw
	dnI/yQvH8uYL3QOQsXfHx88iZHuLMkqa0ZZv/zvyu1wuCSe93gSkngWSZrp2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=YIqIpSFZF2JH7VrYItUYTZIRvmZemmvTh0uimy0c6/DRD9G5Dr4XjMWnn1lHoqSogj/ftX
	GD9EdCbZdLEMpq17pW1GufTl058U7mFIoQr+yG8MwkHnTMxMIhJRmK4lYlymGWY0qavkc7
	pOMGz+5mC603MYH2cYut8VUonDf9aO3S2CCMx/zTmUSp703ut/BjH/h6ff57mFM7so/5Fl
	/jQlDUb3ql014NMF0y47LWAkXe8BmNX4HPsinAe6LsXWIzMU8+Q2mrAy0IYtGxTglFDwFV
	vRUptaa1cnu55ur8V2jWbbC/DCjbXJmnq8GoHyuZeq0yFHNWrLFunCcDUjNtUA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795167426; a=rsa-sha256;
	cv=none;
	b=V/Q/cB3yPbnIWX/3lzbjwEGu4BHmQKiumOFLHh2qZr8qMr6kX+ZJ6Hl32QrBDGfkQ7tF/O
	voRpIxGzQVFhuxcqmxlYmkXEE0s2v52dTDYTn3Xf0cycXmoz9QpCPYu2vQLURxNUpylJNa
	mDl61Fm46kF0RbCA8VNXBf5wtwxhD1iLaHsqNflWmgluNVOP7+F9UxgXhE1Bg36ronnK5P
	Ws6V2qab9bCbLecCyUB1SY0DKrCl1zPdyS5AWH0DdhKfjie6r6Wi/F+/tt2Lc1KAODrkmy
	c4ZHxMY6RJp99Xkrn9vrxcCbJarER3VoSnooUWiAUApTODZLFBmErCMelNxKJw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xUL3J-000dRE-1U;
	Fri, 20 Nov 2026 10:37:05 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Fri, 20 Nov 2026 10:37:07 +0100
Subject: [PATCH 4/5] arm64: dts: freescale: imx91-93-common: Add EL2
 virtual timer interrupt
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-imx93-frdm-fixes-v1-4-78dde22a56fe@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261120_013710_844387_B943338A 
X-CRM114-Status: GOOD (  11.20  )
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

The Cortex-A55 CPUs in the i.MX91 and i.MX93 SoCs support Virtual Host
Extensions (VHE). When running at EL2 with VHE enabled, Linux prefers
the EL2 virtual timer over the EL2 physical timer.

The timer node in imx91_93_common.dtsi only describes four architected
timer interrupts, omitting the EL2 virtual timer interrupt. As a result,
Linux reports:

    [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt

and falls back to the EL2 physical timer.

Add the missing EL2 virtual timer interrupt (PPI 12) to allow Linux to
use the EL2 virtual timer.

Tested on an NXP FRDM-i.MX93 board. Linux selects the EL2 virtual
timer (hyp-virt), and interrupt counts increase on both CPUs. Timer
operation was also verified across CPU idle transitions.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>

---
While this change fixes a real bug for me, this same change was already
previously proposed by Marc Zyngier <maz@kernel.org> in May as part of a
larger series.

Link: https://lore.kernel.org/all/20260523140242.586031-10-maz@kernel.org/
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a68ffd04ee084..af4c93c128d31 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -82,7 +82,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <24000000>;
 		arm,no-tick-in-suspend;
 		interrupt-parent = <&gic>;

-- 
2.56.0


