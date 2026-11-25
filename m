Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6F7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lhdW1c4+;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=nmtyNYBk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=B0GAGZCB4wcz4EWht71Bhu3l8vS6nHzZaxGeRP6mJPA=; b=lhdW1c4+3VIfuKJzcrCkfNnY8t
	Ce0I8iRvOfQyErceyCJ9Wvt7WVvXbt0GDvQTrSvfKHFxEDCTlWpD4j8la29Y1d9ThpsiTtjF0cyR9
	CyY3ZfCsILSG9cm4zGELWKvYueOiPS80jNALabOlTqq/+RgzVvRuiPWph6YfEpJl4ESN3NaZnWvXu
	DtOBNL2MevAQxW4eGTLu3ZfQxk9k8m9Nm53egeKixEesGE1rz7+p6gRtIWajnmVuuY9qrQ64Twzmp
	tVI8LP2ezQJb1iAlcT2dsdGvBWlLx22pHbwXY94Q3sLpg0hUEEqcWMB7Tq9SEiqk5rtvw8XmmnSFF
	fRfwVZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCMH-00000009sJp-3mi6;
	Wed, 25 Nov 2026 12:44:21 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCMD-00000009sIK-3Xa8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:44:19 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 8FEE64C936;
	Wed, 25 Nov 2026 23:44:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795610647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B0GAGZCB4wcz4EWht71Bhu3l8vS6nHzZaxGeRP6mJPA=;
	b=nmtyNYBkFvc+wb09Oh/TGJs+Ek4VqEhtEtxptzrmjCOSD2qemtgAf4OMEqZhLVyhURzpv0
	TlxmzqLjKp6XjmzWSCQQg2kw/8bZQUOCgtEx+5+8iDPAUdR0vSf38tLunaII2/Tumwe0pO
	oe7Br24ZitijD7xDQWvOQ+7trLYJqhonBSgI4yWuEyOAzJxtiWu5BXAN37oj9ZLUJ5L8TF
	jHjBmTmd6SMKLUXOL3EZILjhDK3HQa3OhMwXnW52fnczCdhaeJ6Cyh1gQTTFM3rnCb+nlg
	Dxk9Osviesfs1DiBBDx9eZKegxLdei+R76+pki65y0oeY8wM1zL02Fv4nhWN8w==
X-GPT-Reason: legitimate; the email is a technical software patch
	submission for the Linux kernel, which is consistent with the sender's
	domain (alastair@d-silva.org) and the technical content; the subject
	line and body describe specific hardware support (OrangePi 4 Pro)
	and include standard kernel mailing list conventions like "Depends-on" and
	"Assisted-by"; the URLs provided point to lore.kernel.org, a legitimate
	domain for kernel mailing list archives, and there are no signs
	of phishing, urgency, or unsolicited marketing.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 0/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
Date: Wed, 25 Nov 2026 23:44:04 +1100
Message-ID: <20261125124407.4098345-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_044418_029279_460D2530 
X-CRM114-Status: GOOD (  11.57  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add initial devicetree support for the Xunlong OrangePi 4 Pro board
(Allwinner A733 / sun60i-a733).

This series enables the UART0 serial console, SD card (MMC0), and the
AXP318W PMIC on R-I2C0. It also documents the allwinner,sun60i-a733-i2c
compatible already used by sun60i-a733.dtsi so CHECK_DTBS=y passes
cleanly. Audio, WiFi, USB, and Ethernet are omitted for follow-on
series.

Depends-on:
- A733 CCU v7:
  https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech
- A733 firmware clock v2:
  https://lore.kernel.org/r/20261112-a733-fwclk-v2@gmail.com
- A733 pinctrl v1:
  https://lore.kernel.org/r/20260910133519.459011-1-andre.przywara@arm.com
- A733 pinctrl IRQ-bank RESEND v3:
  https://lore.kernel.org/r/20261124215048.42074-1-pmazzini@gmail.com
- A733 pinctrl voltage-mode v3:
  https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
- AXP318W PMIC v8:
  https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
- A733 8250_dw UART v2:
  https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
- A733 SoC DTSI v5:
  https://lore.kernel.org/r/20261121-a733-cubie-a7s-dt-v5-0@gmail.com

Tested on OrangePi 4 Pro:
- make dt_binding_check and make CHECK_DTBS=y pass with zero warnings.
- Boots to /bin/sh over UART0 with RTC, pinctrl, PMUs, and earlycon.
  (Note: ttyS0 hits the v7 pll-ref 22.15 MHz bug reported separately.)

Assisted-by: LLM

Alastair D'Silva (3):
  dt-bindings: arm: sunxi: Add Xunlong OrangePi 4 Pro
  dt-bindings: i2c: marvell,mv64xxx-i2c: Add Allwinner A733
  arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro board

 .../devicetree/bindings/arm/sunxi.yaml        |  5 ++
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |  1 +
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 75 +++++++++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts

-- 
2.53.0


