Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA0A606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v6E2CoJR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oVUJ3p7R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=; b=v6E2CoJRUaBoK7heYWkVysd5d1
	vcexvcVng17dKRvPkMzGoFNMaMay4BnVOesrztFrl2gGQcaj8I0rGdcELhv1TseOxogj2uZZAiCz5
	pvEV4a12dmLtMTlc7wVXUkAt6whwyhbW9xpgqAafnzDCx2AmSyzbMc01k83p9wDARTglrFDuI3JqU
	dt2AJhpe8CBnlFM4thndb9cD/lE3afLaLd0EvNsAKPH1O5saejA8Gr4yDceC+wVY08Y58Vj7KgPnf
	lHAK5ZUmgVhQTsFzMQyyPfNzsx0oo32m8uoiAIcV8EHQ6v7xb7E10l3tT3YRzXcJnwU/1y8Y/FmBv
	6W7K4fdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRErJ-00000007cOt-0m4b;
	Wed, 11 Nov 2026 20:23:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRErG-00000007cNy-3Sit
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 20:23:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48dee593f18so2774743f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428629; x=1795033429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
        b=oVUJ3p7R6LGyQxGD9tBbulGA6dx1fhpV+5/k50uVAX40r3yrMhtoF/OfIi0/HTcj9C
         Tsx4WJzWVmEUY9d2HW+SemEqvcq+om68fbuVG3jG49mnaUjjzjmXIFIBnisqmQfh4zD6
         eRWeDHNkqFDWvM065YGTYUdzFUi17YVICHM75jbWm51RlOYp1KeDw2s49ih+Re0NHPb7
         UZvRSin4gHF+9PAPWnpvHxQW0g9MjEuY6lKPCqFbLT2tG3lVaHi7Qiz2MCCMEj6Jpcrp
         FX6dsrm7IoNNA2hghV8oOsq4UY/xmiNIWzPjCAFzaRtDDhbRctP77+WPpsVJS7MF3HaX
         aRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428629; x=1795033429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
        b=aqwZ/964YL70SjHHmzRXBOMX6CcPTrtfXcFbIDsgTADP+s9nJuxMcGz7UOsE0Vrszs
         Wbjck5pbevRLn8/tmi4tqUiEumQ4bCVt/61b5MgF4/Gm2QUkf1g6kIhRrRUwMmJ3KlZz
         kIe5lH47L6Pw0+h7vYj/qWub2DRodx6xF+Ski23Z05yCR4gtkMdML0EUa+ehmjxv93zj
         43bD5pphZmewVG7orDNSp/s6e0dl8DKTcDUv8QCn6Sd3+Cq1+FKHdUciZtT1R1mhNNkZ
         /lMsMldAmeU5THuSksNouPvHbD9/NH9DkqxiZjjisu5+uLfQDToaiLiQ9/TSX14mD8+s
         8jqQ==
X-Forwarded-Encrypted: i=1; AL+hErFzS0K+1IG2ujSSOaUGz87kYLBzWTzlfOfwLRyb/fOBwbDYwYySJ+Q4rkzaEqxM3H2soUM0ANV+AaMT89UHM0Ma@lists.infradead.org
X-Gm-Message-State: APuU4Z/a26pLfQgUweK/Ozzm5bh98otiEmwbqy6jS38znmrMl3SgyLX4
	s4RE2OHhYX5M0wXtLdDwz9Dslqt2x8rBEFgzB+dRKYX5AjAbVWDvRXhX
X-Gm-Gg: AYBFou1eXFgUv8UXk8J8b035/dK240lqA/TqzRgQuWqXozGDWXadSeaW6xJAehXI9sk
	p+YPMKu74KLPrSY0sHh4n6di2ePVlSF1FZP91/BGwwTYz03dxnfWVOWMDdByMcMCimid+KU0UQg
	sz07ULYL26cIsE25g3KC92WaODSbV73GpTiyb5dK2il+iVoEJro7/ntGO91/RA0sRLNOaCaKLzd
	qnISbEPqAhhQndaLUQ+H1RVGcVMzpGDXcRaczfSb/tYzwbG531m7uhl8GOCfqTJufGOUG41S5Ou
	HlnuZ9wvhfQN/bSbhU+H5MV3c+GtiA9L0jXZQHnDu+txObe3cZyl6XKW1hgDmtrlLDVOaxtlR/D
	lhcmQcs+/XT8xgK3X6YY8NZttnUkVb/ydISFzMoAPt3KZfD6vymWH42Jmhd+MkYq2febzoCuaI+
	YY58iBOAhGbepfSOLFjNyQ92SamPR2uqlfxejEGhBGT+c4KjUHkorTnQzqqidJB5xZd2AVgP+8D
	gEN8pvkIVP+xFilyZFprr1dnl27U/WSsnMzd3IBbi6GHkppEZe8cg/Ku4ibE64a0p+4szwji07a
	OqWth9aDppnP81mXCc7Xhu32Iggjl+FCXa2czng2EPaDAdeWJf/KP45y9ohgzWnETf+Jdyrv2H9
	EgPPmnatTjA+2dW2C21y+B0HJ144UFv12Vn1JoZ3T8pJiGoD6GHTNyCY=
X-Received: by 2002:a05:6000:611:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-499c89825fdmr6554563f8f.10.1794428628387;
        Wed, 11 Nov 2026 12:23:48 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm12079305f8f.3.2026.11.11.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:23:47 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SMARC-MX8M-PLUS and Echo board
Date: Wed, 11 Nov 2026 21:23:09 +0100
Message-ID: <cover.1794420001.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_122350_908456_76B4FAFF 
X-CRM114-Status: GOOD (  13.91  )
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

This patch series adds support for the Variscite VAR-SMARC-MX8M-PLUS
system on module and the Echo carrier board.

The series includes:
- Device tree bindings for the module and carrier board
- SOM device tree with on-module peripherals
- Echo carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Remove the unused ft5x06_ts label from the Echo touchscreen node.
 - Add uart-has-rtscts to UART1 on the Echo board.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
  arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS
  arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-smarc-echo.dts   | 648 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-smarc.dtsi  | 640 +++++++++++++++++
 4 files changed, 1295 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi


base-commit: a62533fb6362e6424a7bb4ecd4b5afe1a3355849
-- 
2.47.3


