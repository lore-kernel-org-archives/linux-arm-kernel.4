Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FB0606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MKkvTBMq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qx87iXvD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=; b=MKkvTBMqWQr4hTFD4yKYR4M47/
	5CRCLxAmgzi4EyUr+DGIzcAbVG4g3BfK2Z/bXnLJEWGLSejwIe0vxln6Pn0gBC+4G3nPCjDRc+bA1
	GJiz4L6wgt0uHojyeXAYTjc7hE9xDyp04VBIYF2BDTk9TwHXhe3q9d/IeENMQLazQxtPxP25Cflzv
	9L0rxJP6voDoxBvtUtAaWxssyvV52Z/3izD8okVORxgeHOgAuXjLpTcy1xxLNFpwt6NsABZiVxcjx
	Ged7zUu1ValxpsEmIBJIM7H8l0E4MlWpzODlkvqs/gHdDNp8+7MmP5kUpXo0K5Ec3H2np/Lz3li28
	1BbihkxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzKC-0000000Fupq-1B1b;
	Sun, 08 Nov 2026 09:36:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzK9-0000000FupP-24h4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 09:36:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so1793535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130587; x=1794735387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
        b=Qx87iXvDuVs2a4yvkO8VfBflsV0UVoFwID7TuO3mbUgcbEDxBEllx6oKrCbMBSG+Pa
         6NDUsEcE8fuXJBdHboJkyfwHWoLIPU8VhYCQ0gZP+XtBlKStQCNBXjP69u59/Xffm8FY
         bgcZGpIFsN767yR2Pfas4G1DHkMLFRzsVR5aOM6E/PXrEH3KzjpTQSs3FfLnlSFaF2UJ
         SFtiHRhGVnlfO+AGN+neh4wlOa3ls+6uFsDHmQo/voJh6ikomgnPLKtI1vKOF3GZy6ag
         0svBV3ExhC9Zvj36doieMtlzE9Q+g8oat7d4ZMK1XGWBNXFnpbBa3ZnDMFcyuPToN1TX
         QWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130587; x=1794735387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
        b=G3iOpTvc6OE7uK/P7PNRF/aT0NqRvR6Vzb2hEOZS/9jErg4PnOB3c67shYck97H+kv
         cSX9NNsRiKR9swMpRUUMvwGJWnmPtfE/eddmklAK0UU1B+bYkufKhvGxHnZCgV+5ImiW
         fdB7AZYhEHUCIKGZpIB/a8LNg+nrInnmPFlzeSApKvPsb/Oy4q7sMAVB502BZFNj4Eb+
         J7/LEJP9/DrnL3GkcdJKUW8sKTcQk6l9+91aF8BmTS5S7XZJZdrxPCWZczsawLGKdfoA
         wp0hgzFiFd2g9eW0IWXuVEWaGMysvvcoeQQ3fX85YhxEkInIylMLz99xc8qFh74mnpO1
         YWYg==
X-Forwarded-Encrypted: i=1; AL+hErGt8Iqqqr4XJtI4mXvoPCqlhBANU3hP1nB10l/UPlxyKhdnuzB89AXya2pR1JkQnyYWIRdwkGd4bD7E2klnjfis@lists.infradead.org
X-Gm-Message-State: APuU4Z9EcMs69p1Mt4kXcFEuDZpyUd2AkvMOPdM7egTf1aPbLmt85PGV
	5ny4PMWVZsGyJlPauj56qhQijYQp/gAl3IecaDD707f8B4VzLYsr4U+8
X-Gm-Gg: AYBFou1JM2MsWX1kxBITCRkyaSGEjC0HXlTqZseWhch9MW4w1OEdXJCp2p4YS4hz57S
	9V4ZDv7QbMbAD1cC9OMHjPi1YfEnAHW34VJflQjSR04nTkZdb1bbXHiA7nHuP/dVVLYpy32HJi8
	54iiQudxVGMp5w6lM2IRT3NE30Ah38fNyPGoCMqTIEwOvTYUsjA4tsdaMLXsouASEXYSFW1VkoW
	Ihz4GAtq22Zd7OCeg2U/93AV9Jn8XQ3dLTF3TcHCu36aCLjhaiBMvyacKyAzCK9W4D4D7/OBlDm
	szBZTwn/0JXq+PNN55cbvblI6uVVLHegp6Y+/zM4bSzH6XVMRdKd/iq/4A+OWfIXk378/kftwre
	8Hgn437o9yJA21SX4kyjd/euSR2wL3Z6ovnSlzt0K80VIsumoG10oOTz8+0WuAin0WNHA9aoVkQ
	IcRNVfKcFOpdZ3bSaFF4y2pEhfr3llTzVed0a0J8s8QzfpKFO/PlExxzD9UIrW9GORKxm79jKT6
	RweYUqWMdE5FtlP3VmuU7BiwP6mDIltEFPcpusaqVv83A84L3eJIyvUvc1a+cBZ6c89mBsVCuLt
	bYAhFZ8im4aBqPZpMeGAkmNCBKAKq3Tp6aCUJh7uqwUs2Hs6ZInNpu6OSBDRx/0=
X-Received: by 2002:a05:600c:1c0c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4b963c69d23mr19923505e9.19.1794130587155;
        Sun, 08 Nov 2026 01:36:27 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:26 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] sy7636a: power the panel only during updates
Date: Sun,  8 Nov 2026 09:35:57 +0000
Message-ID: <20261108093602.329554-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_013629_577845_207D1FC6 
X-CRM114-Status: GOOD (  15.24  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature only while the rails are on instead, and bind the
regulator to the I2C device directly, with the hwmon driver as its
auxiliary driver.

v2 patches 1-3 are in regulator for-7.5, so this is based on it.
Patch 3 touches the regulator, hwmon and MFD drivers and removes the
MFD header, so the series should go through the regulator tree, with
acks from Guenter and Lee.

Tested on a PocketBook Verse (B288).

v3:
- drop the applied patches 1-3
- new patch 1: no wait when power good is already high (Mark)
- move the I2C binding before the hwmon read change, so the hwmon driver
  only probes once vin is on (Andreas)
- patch 4: explain in a comment why power good gates the read, and its
  limitation (Guenter, Andreas)

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- no VCOM enable at probe, which also removes the probe race
- read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (5):

  regulator: sy7636a: don't wait for power good if already on
  hwmon: sy7636a: fix negative temperatures
  regulator: sy7636a: bind to the I2C device directly
  hwmon: sy7636a: read the temperature only while the rails are on
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig  |  1 -
 drivers/hwmon/Kconfig                 |  2 +-
 drivers/hwmon/sy7636a-hwmon.c         | 66 ++++++++++++--------
 drivers/mfd/Kconfig                   | 10 ---
 drivers/mfd/simple-mfd-i2c.c          | 11 ----
 drivers/regulator/Kconfig             |  4 +-
 drivers/regulator/sy7636a-regulator.c | 90 ++++++++++++++++-----------
 include/linux/mfd/sy7636a.h           | 34 ----------
 8 files changed, 99 insertions(+), 119 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: 2a1984b30e9cfcb306a076cb4b9e68d71daeb45c
-- 
2.52.0


