Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C6D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GiySGgEs;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XC7/GABB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FZTB+VKUReCx8XgfvlzddrAeMA7GwaWZltQEpDEq+1w=; b=GiySGgEsvcdySuwdt9JlIC2kgO
	R80RXyHMAW/0HWz67CAimNQnzRjmO4DpsvqWcbk2BB5cgzh6/20cQUhYdx1bezANdo+5CH5RcEo5i
	RWonB5PqTpYU1S86aMxV7jE7GWbSaUZH2CMLgGtwqxn1BRN+q43OOgFENhTk/RlwrvCHU7lZCcJvO
	OianmJ8UTUPRYYtrpc/yLE0KLsmeElYba1/eyG2cj2St5SEZ9qGw286pwD/YTgPp8qdu2azKr8jT9
	+e2laLfRCquydJKdAL1OJfohnHVyg1DfIg/WHKHw02Qnbi0eDKUBHg6KdMGKXdkI4BDYRfH5CliDJ
	YmKs9dVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSBJ-00000003ARz-0lH9;
	Mon, 23 Nov 2026 11:25:57 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSB7-00000003AMS-2bLU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:25:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4FAA92004F5;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FZTB+VKUReCx8XgfvlzddrAeMA7GwaWZltQEpDEq+1w=;
	b=XC7/GABBbVCy6qSUBLzaxbF1Tgdso6abzV0o+CLMO7Pyrc+E4bpaPHhMYOPvqBcnH6d8Kz
	pS744332w9d2Kp0QSlr2pLp+O5LG9/ly1US6YHoFz3jhhV4uM7cFIFjCgkeLnqFaedQ/8X
	t59iSGt91W1E5YUbdEfD5WV/CvRzJFxllHa5BlVFlLGFnpt08gEWlnnm92Qalp8YzLgSLM
	EhOje00UR1YbhXNIkbvE1YUmdZC3FMOe8XXkBTblXQzLoTUXRdK6aIoL+B25EFCLoV/oie
	gwBhmddDSciXPsBhRIct8uprObwmvLzcF1sv0cLEFyP88X/pa4wtRjCzai+/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FZTB+VKUReCx8XgfvlzddrAeMA7GwaWZltQEpDEq+1w=;
	b=CZKb7kQBUh/XBdr74KsMTSaav0Yi7PRhKkXpjI35Isabftlf1S41trm1bBY9rQ2Q/hl2YL
	Qmmjad12VNfrJkN/zhHa+QjU9aaLXBq5A7vtjkyLRSRoqZ8axd4oPN3e5BEBkRERDYX1hb
	CH1HCW9BLduGvjeWfcOI2e3zQrC2BT9jDEpalwF4oaKewpLpzMJi2NxB26aOfVHY+hCYk+
	rKK/3nj8XKBy1stxatUc925dn6NSryBENfIeK7M/S6ex5y4ucm3jEfuFKA5h5nuJ2MZWIA
	fyx94IpDLymJ9rdQstIPhuRROPv97OXsA3Fsy5DQfkD6m85/bhu4ryET8OANiw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=Px/bp4ZMaZED356D0hsShG2xnXTdCwbJlF2VKHrd0g1sRd1h9xMausOhY1EmQISVZ/QMUO
	tqqidIDPAUp1tgz2WaxyEVIDpYuvafWx5Oe9BJkefHqTwfE8WUwdvixgM5En6vdWpT7W4T
	znkivYous1GncOc4DJT0vdwepOQM9fjksa9J/SeSNXEdUSP10aXUInxU8SAtxeG9jL2j7p
	1Sn30dYn+ygxqbYanRUTyU7QOrD2vIrFkJCrBrU+Ww3TSJIVYgoM+ocb3LOyxhRaZ0qgEg
	UOY7FA7qYrZN/jomXKqWInUUR2p15ehJFz2/3qGS33qwc8SZbTZcOMgHj4luaw==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB3-0016XI-2L;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Fix i.MX93 FRDM hardware
 descriptions
Date: Mon, 23 Nov 2026 12:25:14 +0100
Message-Id: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf4Xs2TVtDRU98R+GA9ItrAmFtIVgC
 P9uQY8eX2bmzQqBPFOAe7aCp5kDDy6BOmXQdLVrCdkkBiWUllIK5H65XdB606PlhQLm2hYmJys
 arSHNRk9HkFaP6sther6oibtnb3Qc4uDfx+cs995Pr/7oZ4kCr4UxpFSdvqgcybVT9IPj5WwIq
 m3bPsgMzwnHAAAA
X-Change-ID: 20261110-imx93-frdm-fixes-56f8d5ef0c66
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032546_434160_FEEC8854 
X-CRM114-Status: GOOD (  11.37  )
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

This series fixes and completes several hardware descriptions for the
NXP FRDM-i.MX93 board and the common i.MX91/i.MX93 device tree.

The changes enable the PMIC's I2C level shifter, describe the PCAL6524
GPIO expander supply and USB2 VBUS supply, and restrict USDHC3 probing
to SDIO devices.

Additionally, the missing EL2 virtual timer interrupt is added to the
common i.MX91/i.MX93 timer description, allowing VHE-enabled Linux to
use the EL2 virtual timer.

The changes have been tested on an NXP FRDM-i.MX93 board.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
Changes in v2:
- Keep USDHC3 at 4-bit bus width and restrict probing to SDIO.
- Move the I2C level shifter configuration to the common DTSI.
- Address review feedback.
- Link to v1: https://patch.msgid.link/20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Freimut Diener (5):
      arm64: dts: freescale: imx93-11x11-frdm-common: Enable I2C level shifter
      arm64: dts: freescale: imx93-11x11-frdm-common: Describe PCAL6524 supply
      arm64: dts: freescale: imx93-11x11-frdm: restrict USDHC3 to SDIO
      arm64: dts: freescale: imx91-93-common: Add EL2 virtual timer interrupt
      arm64: dts: freescale: imx93-11x11-frdm-common: Describe USB2 VBUS supply

 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  3 ++-
 .../dts/freescale/imx93-11x11-frdm-common.dtsi     | 29 ++++++++++++++++++++--
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  2 ++
 3 files changed, 31 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-imx93-frdm-fixes-56f8d5ef0c66

Best regards,
--  
Freimut Diener <f.diener@pengutronix.de>


