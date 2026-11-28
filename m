Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE683606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wpc9ebTQ;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=vuVekJQ6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2a+Yri10/zFE3o9wz8FYNDHmwFSDAaf5+qNG/L9KbRg=; b=wpc9ebTQbYDromx5DyNqlgXLci
	EYDH7Fth0k0/6xu57LyTnehuOfM067Q5GMKvL7PLTLncGo+REnsvF2nobSgLJrO6i8MhTgk7HaXlI
	wvZoMC4wV1bRB1gGRutnslHeK4BueJ8RevIqXaKyCDslChfH/t9xAcYYRi+vNqFaEls1YBrSg0s8p
	fKCrtgTRgAv3AaIlhI95nygH3BVLT4/fQjGZ62XpiLxmZ2cgVFhCmrXkHMqGBFXTNeGpx75C2rBC7
	YuBqYZZ7sTTbbi4Upm9CGfrxMQkhtVzToxAuLFxQNj8TkP6LoOaRwxcYPvbxA2YKSq/HGLEORSHJm
	h7epr84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIqA-00000000nvs-3OQh;
	Sat, 28 Nov 2026 13:51:46 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIq7-00000000ntf-35Bp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:51:46 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jcBXW1CdMz8tH9;
	Sat, 28 Nov 2026 14:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2a+Yri10/zFE3o9wz8FYNDHmwFSDAaf5+qNG/L9KbRg=;
	b=vuVekJQ64sop22dz12YCBiw5cfW3TvTYZnX8Q0AL616Xp0OjwpByoeYPUcnfigAAyLD/CU
	IwGoMtQIflxO29oAmD8Mcnruzg5PSLc0HYPDJV395jxfEQYJ9W6uhDNSPaXgdVprdu8HYi
	IfYRhK8L4LFOvay+ZvOM12mSWeLshbijlNonSefhRABzibODqOAXfsLqcUnuFXdFsziNvI
	HfI6aF0afY4c9iW+7iB4X4THIB2/8BD+wTUcqLKqXwZ9mMVqoOlytfCTF8nKAwqfn0R82+
	T7rdnOj7V5F39TB9V+d1+XDY6J136L2ZQiRSmvUDuOLBERW5F6tTlrnAidhoQA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Subject: [PATCH v2 0/7] Input: s6sy761 - add SPI support for the S6SY791
Date: Sat, 28 Nov 2026 14:51:27 +0100
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr2K6dgxTg0ldeQ/DopQp1NCWdEqjI
 dxdwBO4fMnLf38RTMkRi/tpEYmKYxfDBvJ8EmbQoSdw3cZCVvKGFSKMOl85Qx9jPxIkXShAjrM
 ZYJ44J9IeLCptOpRopRHb0JTIuvcReTY/5rl9kcn78m4MjnNMn+NFwd37K1gQKpBa2brGWrWKH
 tl5T8nrEC48aUOiWdf1C4JvBBrtAAAA
X-Change-ID: 20261011-lat3st-google-raven-touch-upstream-f19acd121f2c
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXW1CdMz8tH9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_055144_177535_5989DE4F 
X-CRM114-Status: GOOD (  16.91  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds SPI support to S6SY761 touch controllers, specifically
S6SY791 devices. Also included are the necessary adjustments in the DTS
for the Google Pixel 6 Pro (raven) which uses the aforementioned SPI
version. As the mentioned board has a reset line wired, I also added that
functionality to the bindings and driver. To implement SPI versions
cleanly, the driver was split into core and bus transfer modules like
seen in other drivers.

This series was successfully tested with a Google Pixel 6 Pro. The I2C
transfer part was untested because I don't have a device with an
S6SY761 controller.

Known issue: on gs101 the touchscreen probe at boot fails with -EIO
because the very first SPI transfer is not understood by the controller
(the reply is all zeros); rebinding the driver works. This looks like
spi-s3c64xx applying CPOL/CPHA only in transfer_one(), after chip
select has been asserted, but I have not verified this further. It is
not addressed by this series.

Patches 1-4 and 7 are meant for the input tree, patches 5-6 for the
Samsung SoC tree. The DTS patches depend on the binding in patch 1.

---
Changes in v2:
- Reworked dt-bindings to require properties for SPI variants
- Fixed I²C variants having SPI properties allowed
- Don't wait for devices without reset gpio to come out of reset
  anymore
- Remove includes of linux/mod_devicetable.h
- Cleaned up array initialization around of_ids
- Link to v1: https://patch.msgid.link/20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space

To: Lukas Timmermann <foss@timmermann.space>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: André Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

---
Lukas Timmermann (7):
      dt-bindings: input: touchscreen: samsung,s6sy761: Add S6SY791 and reset GPIO
      Input: s6sy761 - split into core and I2C modules
      Input: s6sy761 - add reset GPIO support
      Input: s6sy761 - add SPI support for S6SY791
      arm64: dts: exynos: gs101-pixel-common: add labels for touchscreen supplies
      arm64: dts: exynos: gs101-raven: add S6SY791 touchscreen
      MAINTAINERS: add entry for Samsung S6SY761 touchscreen driver

 .../input/touchscreen/samsung,s6sy761.yaml         |  51 ++++-
 MAINTAINERS                                        |   7 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   4 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  50 +++++
 drivers/input/touchscreen/Kconfig                  |  20 +-
 drivers/input/touchscreen/Makefile                 |   4 +-
 .../touchscreen/{s6sy761.c => s6sy761_core.c}      | 228 ++++++++++-----------
 drivers/input/touchscreen/s6sy761_core.h           |  34 +++
 drivers/input/touchscreen/s6sy761_i2c.c            | 111 ++++++++++
 drivers/input/touchscreen/s6sy761_spi.c            | 171 ++++++++++++++++
 10 files changed, 548 insertions(+), 132 deletions(-)
---
base-commit: 56beabeaf17aaf9acc6afc6d6d21ea28d8f67797
change-id: 20261011-lat3st-google-raven-touch-upstream-f19acd121f2c

Best regards,
--  
Lukas Timmermann <foss@timmermann.space>


