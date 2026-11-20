Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FBE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dSjVe/ym;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=S0/Kgf2p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+M8hWcs4E5N08OqYVtXoBpjInpc8kFOf9jqGSDXrooc=; b=dSjVe/ymprdAYdIFiJwDqm8o8g
	ZDSg41G/vQT9dgIBOC6aENsx2SIeKprktGB3w6hzWYxdIvJHs2EZWHG3SC4IxapNCRPPkYJp4ryAo
	sc3+rA+MiOf1oMK/rTHZQHhRhQhcC6wUsLcPVHuXzVH2N2QR68L1EbUTeMuAtS73ppjVSmDUOeVwo
	kH6KSTsA3IbVCPPZxDgHA+/5/Jr3z25uTvXjC/JTtNCn0hPHL+Qj8PRP3O2sJI39JtAwowMXjJ2kq
	KVrydOsLHvN5MpExTEAYtZiY/p8u5jvo8aLn7fzHJTTMNzQRy8pE6pkMUbW9jChioY7XvqZQoYR9V
	4uYAPBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL3X-0000000ETWm-26T3;
	Fri, 20 Nov 2026 09:37:19 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL3O-0000000ETSr-2LTQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:37:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 974A0205B22;
	Fri, 20 Nov 2026 10:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+M8hWcs4E5N08OqYVtXoBpjInpc8kFOf9jqGSDXrooc=;
	b=S0/Kgf2pAEJ7F+kSn/v+IMsSKfoej7749XbflY48WrcbcYnZClttYWM0zFQcFUbZjr7ob6
	ZozQhl+IdqsuPRylCU1Vx9CaZA9Jfbu6svq/5nqy5/6n/uPGJ1tdblKPZ3wpmB8F2eJy3m
	K8x6vJpjxU4UqfXConXnBwyAG89MGhY2foGhjh9wqi9xy2fbRupCd+/SpjaQzE5ZfS7J7r
	hBuOTaJ0hkYCD1Xhjnq8Jw4ynlarFCqJE0DMo/m3KfdNzKUnCpg0vg6cQkCOx20Tb74C+o
	O9iD9nKaieHgxOOA3ZRvbwdvlzu8ZGDnEFumq1ore+epRIow2b+TkRDJdQnYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+M8hWcs4E5N08OqYVtXoBpjInpc8kFOf9jqGSDXrooc=;
	b=eYxcoelSoJotssnavplj3Q9RMLZIFHeE94ZCqMyKIB4iqldfh0XtYTaYN6bcSjRIK4bsNn
	qgj3OWGUqBN5R8XN5h4Pf4avoLLCLZK/lb87b8f9r5xtSv7vuVMwzvDSUjLzYTh0a9SEkE
	rOsCVc/yWeapwcoDWqYC5jWRvpX0MYC3UxT920/XH9dHJ6bq5g/rnnMmB1VRxxxa3X2v44
	fv7VoNiIrTzgDvX+7YdGwZnCVSULOT9u7wHxHZSUz/8AzuTgP3JB/T1AWEIakFfcASqF72
	lP0lg/vcCsGzvPjtkkX7pOKGVoZQBkv74PrRqX4Bt6VEhnbul4btPskeWKC59A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795167425; a=rsa-sha256;
	cv=none;
	b=VN8DGXOhoPfwH+qqZjXhV4ZHdjnVOtd2XHjF6OqNIrlszZKp80RjWjuzeC/1YtP8cK9xMK
	Wki4en5Kjcoy/8rfijSKsKVA5ZPCaJ9Xd4+xhG8VRjWU7YfpQv26dlDQ988F/ft+EhKdEa
	KQYoWsfsU9rYsVag12ac64K+RcBINMp7d+nONfB/Sm1p4s2iZnzr8bW2GPNndE42tjuMIM
	AKAL/Q6/r/kgTbFhzNPGIpj6rIYOdUWQr+XYEpWP288jC4dtLpM7mrfuZi9Z+iOfwVSbOa
	xIHG8dME5qGXYj6ScbA6NF7LWHJlukMjqJuJhxkzGzUlNXqM+ewfvLQGywBmkw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xUL3J-000dRE-03;
	Fri, 20 Nov 2026 10:37:05 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Subject: [PATCH 0/5] arm64: dts: freescale: Fix i.MX93 FRDM hardware
 descriptions
Date: Fri, 20 Nov 2026 10:37:03 +0100
Message-Id: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QoCIRCF4VeRuW5Ad1GqV4kuWh1rAi2cbRHEd
 1+ry4/DfxoIFSaBs2pQaGPhVx4wBwX+cct3Qg7DMOnJGWM0cqqnGWMJCSNXErQuHoOlqL1zMLJ
 3od8wqsv1b/ksT/Lr9wd63wH8Kr1DdAAAAA==
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
X-CRM114-CacheID: sfid-20261120_013710_788923_8A6FB07C 
X-CRM114-Status: UNSURE (   9.40  )
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

This series fixes and completes several hardware descriptions for the
NXP FRDM-i.MX93 board and the common i.MX91/i.MX93 device tree.

The changes enable the PMIC's I2C level shifter, describe the PCAL6524
GPIO expander supply and USB2 VBUS supply, and correct the eMMC bus
width to allow HS400 operation.

Additionally, the missing EL2 virtual timer interrupt is added to the
common i.MX91/i.MX93 timer description, allowing VHE-enabled Linux to
use the EL2 virtual timer.

The changes have been tested on an NXP FRDM-i.MX93 board.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
Freimut Diener (5):
      arm64: dts: freescale: imx93-11x11-frdm: Enable I2C level shifter
      arm64: dts: freescale: imx93-11x11-frdm-common: Describe PCAL6524 supply
      arm64: dts: freescale: imx93-11x11-frdm: use 8-bit eMMC bus
      arm64: dts: freescale: imx91-93-common: Add EL2 virtual timer interrupt
      arm64: dts: freescale: imx93-11x11-frdm-common: Describe USB2 VBUS supply

 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  3 ++-
 .../dts/freescale/imx93-11x11-frdm-common.dtsi     | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  8 ++++++-
 3 files changed, 35 insertions(+), 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-imx93-frdm-fixes-56f8d5ef0c66

Best regards,
--  
Freimut Diener <f.diener@pengutronix.de>


