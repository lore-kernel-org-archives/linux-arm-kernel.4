Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176D5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RzCsbIsF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdXJLyGK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gJRjpT+Y8kTUcTvkPCm0oLmrvJH7/YI2O0Vn29/eE5E=; b=RzCsbIsFm36iPw0y3mjxO/AJpD
	XY7vyGORC/ExTsL/ujk12uoL85oP1Ez1KDK4/mgnI6VBDlYRrdnobtH2TAcCcjQQ4E18jh/zPllDG
	1DIf2ksNkDw3ql2Szilkhp4wtreNG5+FmJiwMr+49Z5YdlbwJ9jbJSBCpB2WNvCtrB0Fm7Z2vLWoG
	MxHLnPeGbfMZQkW4cYdObXHODGcNCMclUOLqrTN8ij+BuXaLu9i9BX0BJY1/PIzi9NZRLmRyTLbML
	pzYzJCylJGtgKdHDUO/NqCXON2ITX/X41A71vu/iNBTGZllsy1JPVpZ2ITmiI94KtFXCFiE72EvXt
	FV7UnMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Hb-000000093U8-17Nl;
	Wed, 25 Nov 2026 08:23:15 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8HU-000000093RP-42r0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:23:10 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-38190551625so10946408eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594988; x=1796199788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJRjpT+Y8kTUcTvkPCm0oLmrvJH7/YI2O0Vn29/eE5E=;
        b=BdXJLyGKAeXW0rQuUR08iXmABkE2SF+iZ/0nIk+tXpRxnG6TO9E5UnwOkXZQ/gYQeD
         hNA6vOIr4BxKk7HYIr+slo/Q8mtL3Q2yc/GatD04LU3jRE90Aym7f+6trXqxMCJ02T45
         5yzg9iF1R79NwsTrubQMNBy7FMPtu9MCtin59lXTFvH0kIF9fkPSWz918Hb3ftqlbhjn
         E9qzJnf393LsL+bJoaTiLwO+atdssxanmUqQQHTquGB2tqRVaeeAHcL4itg5EW+RGKIw
         3RXRzGal8m+yRjDBfrB3RnJd335eXPeBgyj7Eo5IaHFWl0B6YOmoJY5+Sb1F25nKRCp3
         pWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594988; x=1796199788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJRjpT+Y8kTUcTvkPCm0oLmrvJH7/YI2O0Vn29/eE5E=;
        b=qJuPaj1iaJjjKhKwUMOKchASuNbcaJxFiPTU0jW+qsuT3/fMGsjcg6CVKLaRYXSTZA
         7pCUa6Rg6qyhr0w3m0b1roYtw8M9qO5e9mJ1vhBa0ijNPBHry9uHs7oy4uHxntblQmi/
         mvwWVnvTjlFMd+vrRgYHA7nhPPTNHZPMy1tWXO9upydGXPZ+4xd84OKc/Jqr+OVoubqj
         9x1Mq27mahYkC9aKiGBF1HXHlju7atcdt0ivbg8621t2CReO5255r/m1+1uoxtbygQLv
         AHrkITDJW7tmvkuzNc3ZWP9pDUKGKKFXfnHP2Za6ORAAbdCTH3jxZ9A0xlxnGHlyIMvU
         yQug==
X-Forwarded-Encrypted: i=1; AL+hErHrUN0Mrk/sgm7+K78wDDHLSXDJru48ERp5med/d5uHiPcMiSZ8VuOaWm+R2EX9TJVqNUdRN3wDdYTvL7f1fHoi@lists.infradead.org
X-Gm-Message-State: APuU4Z/Y5ac64rdHIbkN7LRrEEOqvUXgnQveWFK+VEZysNHAclOO1ENY
	yddvSsOsBvLndEDqaHSSqToJYTtrlvIVtHqX9kX6snw1FsEtLVHPE0SQ
X-Gm-Gg: AZFdTZfSK7R2gvmRCB0VPm3KtJA6f6UaZaJ0fCx80uRGqWKWvhW/GgvdIOeNZ8GSLH+
	5ILL7GOr83z3DK18pEtdEriMR/8/m8VKulMgvla9GgaRMCG/R/05vtTjBWWw5kbO9MuNosTP5Yg
	LUigBN5mZwShDYPLT6nmmqvrilWccuf1Z1hrd6hLYA0GXpJ0cw+q732rDakk9py+j3cJ9PVRBPi
	2mdkSPD+AXVv2eyUSbcebcpsnl/TfLwCPB5/5FMfvruJY8tb6jePhHiU1XJV9Gja8uv63Bm2b1v
	L6K+nCOkXVJjGLTtIQeSv3+SR5Wo8kWvzGIWp/c8vxm+AnwYhRHqlkDp8NmnYRii+ZAsqUfCzVn
	ZVvy5sNg1yINEQmdTMQYDypcAILCLvwuof2X9tKXIaOxr5BD4etBSCfns7ncqwXyHVyACxc7s3Q
	5tAYuG2UURxET/ftiRLvxzDz74Lo7UoHX4tzlOTrw/lxx1wkjP9yx5MBwLfzHC/Pbe8dP7FkHH+
	B1QVDeip6n5HC6xMDCPx7eTMUEXNkrbyCyNzSjNS6MtmCNKFdTDGckRSC/FLTHF7n02Y0gHakMA
	OvVpjK8UcZ4mC3t64ojalYmkiGy2HxVhaGHgbGxFeZwCtTYRQO88QaGuENCsM2ENlGLScC13
X-Received: by 2002:a05:7301:6e9a:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3856f14b9edmr16776266eec.11.1795594987278;
        Wed, 25 Nov 2026 00:23:07 -0800 (PST)
Received: from adlinkccoe2-Dell-G15-5511.adlinktech.com ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm50919906eec.23.2026.11.25.00.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:23:06 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 support
Date: Wed, 25 Nov 2026 13:52:19 +0530
Message-Id: <20261125082222.136238-1-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_002309_014791_E988F4F3 
X-CRM114-Status: GOOD (  14.80  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device tree support for the ADLINK LEC-iMX95 SMARC module with the I-Pi SMARC Plus carrier board.

The series adds the ADLINK vendor prefix, introduces the LEC-iMX95 board compatible, and adds the module and carrier device trees.

The module-level components and pin configuration are described in a common module DTSI, while the carrier-specific interfaces are enabled in the carrier DTS.

PHY interrupt properties are not included in this revision. PHY interrupt operation currently depends on U-Boot initializing the NETC power domain and leaving the PHY interrupt GPIOs pulled high at handoff. Mainline U-Boot does not yet perform this initialization, so the PHYs remain in polling mode, matching the approach used by the upstream NXP i.MX95 EVK device tree.

Changes in v3:
 - Add the ADLINK vendor prefix and place the board compatible in the appropriate location.
 - Move module-level devices and pinctrl configuration into the common module DTSI.
 - Keep carrier-specific interface configuration in the carrier DTS.
 - Consolidate the USB3 DWC3 reference.
 - Correct USDHC pinctrl configurations and high-speed pad settings.
 - Add PHY reset GPIOs.
 - Add WDOG3 and RTC aliases.
 - Move carrier-specific chosen and USB configuration to the carrier DTS.
 - Correct the carrier GPIO expander interrupt configuration.
 - Retain PHY polling mode until the required NETC/PHY interrupt initialization is available in mainline U-Boot.

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 147 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 631 ++++++++++++++++++
 5 files changed, 787 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi


base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
-- 
2.25.1


