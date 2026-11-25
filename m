Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB55606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EVeKMu7Z;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MAPz+fdn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=; b=EVeKMu7ZbfsQ3vdPM0aMnFqeSa
	sSAHToTtGkbwdjtS6TRTTs1D+bp22kRwptWmChfJAu/kFpKfnwHp7JC5n8LJGR9vZyzZsAIJ1HXqU
	/lkSVf2VAAPCks7P82neRv4vFbzT108+zHYaCJMrHdqVaVTDGu0pj8S1UxvrNkyNaxqkjz0OF6RHw
	bWgAMoSKC5fbHVh2Pjobza2xiC8AJQyXmXQvfkHPxmCDqLdJVXlnPmPMwHdsEvvH1x/9rV3V0f4Xc
	BYXRRuJsBe1GkXBTZe+DACzakoP8h5akYwLahtRjNJrj6W2iBI6cfnLvSwzfiWOlGYJbqvbnRPzrJ
	ZwDeEOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHLG-0000000AwDO-0Jtm;
	Wed, 25 Nov 2026 18:03:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHL6-0000000Aw7H-0ZTL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:03:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso5382483f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795629806; x=1796234606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
        b=MAPz+fdn6b0rri0Z4qRHR7G6J+Br4crsJ/iren13p9G5AXgUM+64/nPYIWWktbtnvk
         0dYDadmYx9zQBjXKG9hdE+UysMPvABI6M/bzE3BgruFBLFgrXXDFwQjr276g1SNsb3Xh
         RuFqcLo8OGTV5dqDyyNrr2od2ojDHCky7rAsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629806; x=1796234606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
        b=sIptcXqXe+0ZCQv09Z7LiPXUXPFoc7oGUWentwA6xhkOQGHnVVpANrWqrJitBrFtT7
         16B8mzZWCV4ttkD9Oa6hCpKDOCQbnJzNRXT0Wuz5Ut0iQc7yQrmN3LcfOOQW0jKF02sY
         8ICKqkI+HbWZ2JQPkViqUiE0KHjoPIjduvxM567NN/tGhFmCMtNKTqgiu/I/TvUSGLRL
         wpnXRtj8JhbHOT93sw3GRtqTnwXs3VVihPrxzpyJETOCRLluFBiRd2ykJaMP4aeMDmI3
         PeWe4BokxWeQ7QqXHWM5xP7FmAGVNBfeO5F11kPWwvo+2VorPyU5jBtEkNNqLmBfM+NP
         sLXQ==
X-Forwarded-Encrypted: i=1; AL+hErH6qEXUTVscbNSP/3DfzNY+arCe9Wq3GavboMkQYtgoCUbLtbV0lHSHm9MbbDE49jB1lft1KmcooCjqwQRKBHC3@lists.infradead.org
X-Gm-Message-State: APuU4Z9kuDTIcdwKXNfuIHJai9hgk80GcNmjR7TuwinsAPeCoCEG57ze
	WHygKf4U2tucKZ+90di36euN8pwxHDv1kyh6Rq7IaREYo4RoWXW0VFWEOAGfBf+i66I=
X-Gm-Gg: AZFdTZfVFtP+mHd3yYxVyeUfZbmoAMpDXEZXifmLQncJeGdcrvxakrhNbBIzTcO7mwY
	UPJdZrt3VWuU2IIF35iPawv+C9k5cSa++QQ7PGb/K80Gm7VQPuscshrKgfowPRklVGbxXHPlkxA
	WPVu728tmoYPmDKLRbArkuNZ6Aw4+Zc0CPPK8DecQSgeZ1549DI8IegT9z4FJfTQ5HdlGVTt4wk
	tz5PXWGsbcMVbIyWtSwh/RXFyCh/QZAWeCJee6zDP7f5+ZseVZImu5MTH/e7LIkh6ngAsdPvDRo
	yNa0O9arcoa46x+hn5R3ILBNo/QIsJZPUovVixVjF3h+j+WIAAc54hy68U4kLOJ5MzW7TKPeEMl
	EeYkDmAuWajIb1UD2qgq1/omMcEt1bznsNMFXjpH/1mUrrkJ4wHUWEJ5gj5cFwcRA/Jwf/iUQnL
	qWMyr28O1A2cm5LknYNHB1Wnn64j2oMWxlwbXYFsf3R6kC/0uIGAHn0KNrObEQZtjqTq1M/4kMd
	oBIa1r73O9Hm9vM4cawt6gzlQlbONS7a2+s2qO3UidCmGP/BpC9+MqAkH4H+9nQ4KIDRy1pazXI
	gCzlLMYzK5edtgQcLYkukZXR4Ywh+7vBqTzr8WDT1wIjRT5b/tclHXWG4IfJNXmQPu+OGpbynJH
	mC4+XTP8f3aQKMWGdnKvTUU2TQL+L/B9DjGtgNrJdRWXftj+etuTOxby6h6HSQsJOl38fsRZsKk
	iumNY0fclT+TCOdTuee7aI
X-Received: by 2002:adf:e00a:0:20b0:490:1881:80ec with SMTP id ffacd0b85a97d-4abb3a4d2camr26718119f8f.36.1795629806160;
        Wed, 25 Nov 2026 10:03:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm19644251f8f.19.2026.11.25.10.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:03:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Akhil Narayanan <akhil.narayanan@in.bosch.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Ager <florian.ager@bshg.com>,
	Haoning Cheng <Haoning.CHENG@cn.bosch.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Qiu Guochang <guochang.qiu@cn.bosch.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
Date: Wed, 25 Nov 2026 19:03:11 +0100
Message-ID: <20261125180316.882220-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_100328_200748_DD705951 
X-CRM114-Status: GOOD (  10.86  )
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

Add boot phase properties to the resources needed during the boot
process.

The BSH SMM M2 and M2B need UART and NAND access.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Rebase on imx/dt

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 96f084b6ade4..c1ab536bb1c2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -17,6 +17,7 @@ &gpmi {
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
 	fsl,use-minimum-ecc;
+	bootph-all;
 	status = "okay";
 };
 
@@ -33,6 +34,7 @@ &uart2 {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -75,6 +77,7 @@ pinctrl_uart4: uart4grp {
 			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
+		bootph-all;
 	};
 
 	pinctrl_uart2: uart2grp {
---
base-commit: d868355562901bd5043b52ab903811bd95a7d65a
branch: imx6ulz-bsh-smm-m2-bootph

-- 
2.43.0


