Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFDE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j1Dc+Siw;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=QELFWCRI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9i619VUkzjRlAOTYasUS9lnWRT+j5nIwsaaf6wvh5Wo=; b=j1Dc+Siwjxmh+k
	OR6Rr6EeD+ALOdjST/y2Z+F72M8cB401sbCe05lHZ7cN2WYhAEEQgp3FKnzrADg1Q/d7ggf0nh1IR
	dnMlId93YrZSKhEzw6/hqukZ6gHRv/7F8eFUhW6rVip8Qa3p6vBe+SBG5UjLEOiNLGt18jiJN7aYC
	nbRCnHWCXu+ZfSF4xlaMGRRD0FAaNJp8e2fg5aqyAa5ABmfoHERKLVeHpeQo2vEtKyMN7HhwW5yyV
	pKIL0T5EXQKWJLI5IxZJn/k7nZ5aj8TGQKL16JJHDBWy1LETx1TK2e+k8r7bPxSYJ6wFr4YNQsyrY
	oYodgJQL9mNpzLiYW/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSBA-00000003AO5-0cfR;
	Mon, 23 Nov 2026 11:25:48 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSB8-00000003AMU-0RwC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:25:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 85108200B79;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9i619VUkzjRlAOTYasUS9lnWRT+j5nIwsaaf6wvh5Wo=;
	b=QELFWCRI/YMRTODpYMAaTVzFpAbrLSxBSoCzoAIbpuZzj2q/xElkwa8mT119G7ZIJ938SD
	+mskMFKwJGsgn2UR+Qdkh17dkXkIfKGXtN7BXSkzah+xtHFIzO5ETaWhPhC8p67vxpW1Ia
	l0/276Fs2qp4z2KO8ON3koCkNpszu5oGGxljpYwOEHGExdrtGxO3tcyP2AsdBfKhiC/oHz
	/FqtDo+65t7x0iK+AX/GY7NBFW4smrFuE5vkSLusAVC5eY6T+Fj0LuuEZUg6bRIR41+sNH
	2gegrZzzpBafny9Q1oat7kHNkcUueD06/mHZxrmykik4ij7D9SFB3dCAh/21Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9i619VUkzjRlAOTYasUS9lnWRT+j5nIwsaaf6wvh5Wo=;
	b=D99SckPceFM8GjoWU7L9lZM/tSQS370rhm4HivDfgrFy4yX7AcjwXiotNOenOVkRqBTF0u
	pQye6/ntdUaN8Mghi4UsM0AVoTtogzv25i7Ab+8qF5qyOypXpqMdrr0oUCvbK2FhAFp0cq
	rpD5MCVVpu1jBjI5ii4RP8GNGd7ZdCcPv1bV/kjV1jUnOwCufX+yFnM+Cqa7cPhGF8h+RY
	L/Nl20PT3Ext0OpPwrLzR9WrST9/jAqCbYL92RS6Sd7qMoYw8PZGyt+Gy5JsGsQXQ8moGc
	4mjdq4NO/VEcGafa5kjw55LcZRqd6iTWrXJ2JdgPRg6YCJspDJ4XCmn3u75jZw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=U9h+4/Q2VCp+yKWW0T2gaD11LHgBvKnCai8ccpp+YVyr+YQ9lozLZNlW+4DL6/OPVjyjB0
	ww1BgKUPBpkfZob7SoJC4eChOBlVU6gX1Jk/2vXFayeBrReYJeiuD4kI22IVTN20+WBzFf
	FRL5+Z6sry86JxGxaw3AxN5OjJgpRdRdWkSUaYHw0u3TPmq76fycOPmo0VljMTCfYegN95
	lH7repmWO+p/43B1FlchKRH1gSHcCDLap35RBAWNuoFnKp0ewvNuMPdOQzFH3Estraikt5
	FYsMKWVVlxir8RJQbY+Hod3B1J6gSL/1HUp9mxeNXoQpfInFaL2Lg5fHlcdtJA==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB3-0016XI-32;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:16 +0100
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Describe PCAL6524 supply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-imx93-frdm-fixes-v2-2-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261123_032546_371772_55E3344A 
X-CRM114-Status: GOOD (  13.58  )
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

The PCAL6524 GPIO expander is powered by the PMIC's BUCK4 regulator.
The PMIC in turn uses the expander as its interrupt controller.

Referencing BUCK4 directly through the expander's vcc-supply
property creates a circular dependency: the expander requires the
PMIC regulator to probe, while the PMIC requires the expander for
its interrupt.

Describe the expander's 3.3 V supply using an always-on fixed
regulator as a proxy for BUCK4. This allows the GPIO expander to
acquire its supply without introducing the dependency cycle and avoid a
respective warning:

     pca953x 1-0022: supply vcc not found, using dummy regulator

The proxy does not represent a separate physical regulator.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 .../boot/dts/freescale/imx93-11x11-frdm-common.dtsi      | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index b3dfe516b1d55..e81b2342c50dc 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -49,6 +49,19 @@ button-k3 {
 		};
 	};
 
+	/*
+	 * PCAL6524 is powered by PMIC BUCK4, but the PMIC uses PCAL6524
+	 * as its interrupt controller. Model the supply with a fixed
+	 * regulator to avoid a circular device dependency.
+	 */
+	reg_pcal6524_vcc: regulator-pcal6524-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_PCAL6524";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -207,8 +220,7 @@ pcal6524: gpio@22 {
 		gpio-controller;
 		pinctrl-0 = <&pinctrl_pcal6524>;
 		pinctrl-names = "default";
-		/* does not boot with supplier set, because it is the bucks interrupt parent */
-		/* vcc-supply = <&buck4>; */
+		vcc-supply = <&reg_pcal6524_vcc>;
 	};
 
 	pmic@25 {

-- 
2.56.0


