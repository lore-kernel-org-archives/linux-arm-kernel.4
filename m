Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525A5606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wbvvKpoj;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YOarVCci
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pvpHGUPE1ujSb23x/zea9sO/TzocfNv3Ja0C5XYWzds=; b=wbvvKpojv7ac/a
	Av21R4cMgXaQbud4CehqtBaZ3yY79sk4KEjntuwWcSmjXPRKVCx6PvBilCCZxMyKOCQH0wbfzdMy9
	BFXZ3Z6QlC8cRgvicheDnhwNfGTYT1Zptb87woC3JLK4P/s+LAZIa9VYeHbNs/BEiqSJUhvNp/oGO
	V24frOuRrAI1ml/z/WL7Mb9EmZA52A3l/41EkyoHetGGZmz8gU1g2X4wuk8l5GYPh42wuht34ndVU
	qpc0Z2TCGXI+GTm32WrYVnwQncuA23Lkuv+/iG4McItdmDTXHEjUxTE0LArmteL+GYCe1GMxM0pLT
	PlTrUcFW3NcWg6AWyrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL3Y-0000000ETY5-0Jmw;
	Fri, 20 Nov 2026 09:37:20 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL3R-0000000ETUp-2oSN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:37:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2974E205B46;
	Fri, 20 Nov 2026 10:37:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvpHGUPE1ujSb23x/zea9sO/TzocfNv3Ja0C5XYWzds=;
	b=YOarVCciynMYlaxBNN26lXYURaUu2y8N618dk3Rk8Uec8xM0zyTInDWqsqz8/GN3ZdHP7h
	XlEGJuxRoLPxeJLC7cXkotRd+LstcWn5uv4vL5v/m+sJmm8y7inj3Wg/+1QcDCm4oS6tR0
	A0xtlnM/d5oWJVwMQ/uBVhOn83H5TkH8o/KJQwaWR5dT4Cfd/PQIkHEcp2htrZXWLeCPQp
	64pZlsk0PSIciOK3DoMTIwm+nyMZ2sxvKvxcZhlw1Q8VqPd7CATFlTMJekJy5Qi2S41nlW
	Z/SHfLsQmH2cdhdJgYjdRvUiqF5WLILqQbj13CeD+o6Ar9UimWDrqytSrWL99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvpHGUPE1ujSb23x/zea9sO/TzocfNv3Ja0C5XYWzds=;
	b=Fqc06a/bvpcfpaao7tYEdwS1QdX6/Xz2L2nZxraoafs2osTUUXOHjJbvpmlloxSPCKhlet
	Tm9h7/yYFePdUHLIJXv3aiRGqYGysZsMlhS2pRndmxClBirLtlJuRun0eAbWG0IFkxAAoa
	XBjcj51C2s5fICe5Ih/d2kJuoX3Ot7i4dyWLQFUbfSwhGgWhzHheltlJMncy1KCJZkeAAX
	DlaY6vTyuAHtmS6Bop00EfJW9ky+niVfQhyv4buUHHL0wUomg3HnWdf3AxGN9ZhnoOvDAR
	Ei3QOWEs+Jh0GtpKRVcWCu0MpvLtfdlznOrWACIhvz4drpPcZ9zpisUwADJEgQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795167426; a=rsa-sha256;
	cv=none;
	b=enS3vTD7tqgiTPDYhjKoK4+YRpgr4AnCsvhnGsL0IwMw89Q/4NK6YOoKrZuG76Ms+7+McL
	K4DJbXvNGKNUChbpP0h7uOfhNRApnb8NGZcKE55Y1Y6Jjc/Cc4dGY2yGoBNJyEmN8aQ70l
	Hx5nAR9zVGLpj6UuBh+Mclpses+uTKPoVmRdLl9oVcMl6UDwcZD/JwfSsJnCmWOSCga9Ng
	1CuFgmb5v1akr0CVEqZe9zglJevOEZI/biZgu0djnF91yHXjH/41jHJv7JS7070NOX5wp+
	H8Xvl6H+9LMnmxZjgfw9M5cJs8Jb/PiraCQ+V+KXSY5W8pOA1pCdIB46LHyO+A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xUL3J-000dRE-1p;
	Fri, 20 Nov 2026 10:37:06 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Fri, 20 Nov 2026 10:37:08 +0100
Subject: [PATCH 5/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Describe USB2 VBUS supply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-imx93-frdm-fixes-v1-5-78dde22a56fe@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261120_013713_871168_A461C70A 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

The FRDM-i.MX93 USB2 Type-A host port receives its 5 V VBUS supply
through an SGM2526 load switch. The switch's enable input is tied to
the always-on VDD_3V3 rail, keeping VBUS enabled whenever the board
is powered.

Describe the switch output as an always-on fixed regulator and
reference it from the USB2 PHY's vbus-supply property.

This provides the PHY with its actual VBUS supply instead of
falling back to a dummy regulator, which else triggers a warning:

        usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests (id=vbus)

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 617f2229b559b..eed435f6f87a7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -62,6 +62,14 @@ reg_pcal6524_vcc: regulator-pcal6524-vcc {
 		regulator-always-on;
 	};
 
+	reg_usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -398,6 +406,10 @@ &usbotg2 {
 	status = "okay";
 };
 
+&usbphynop2 {
+	vbus-supply = <&reg_usb2_vbus>;
+};
+
 &usdhc1 {
 	bus-width = <8>;
 	non-removable;

-- 
2.56.0


