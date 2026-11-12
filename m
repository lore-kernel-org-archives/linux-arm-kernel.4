Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4AF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LAfeeBhL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ksrxAS7j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=; b=LAfeeBhL30D8UNVFJyJVR6oKqW
	bCr+tEBLPagGGKupodzShpGiw9FelPHRnUaNlG7vJL4hit7BZI99ODI2dqZqCSGmGgwdF6CVmQqQd
	OaQ/BD8KpGGYWAdgXzUyMmA3VdcJaIoIhYh7z2kPDczK0i88MpkaeYU3Y75wH22dpNDBgUnpNVHry
	jnU8HmuI/snxsmZkKPOheuM2WY1AF6iOy3WxooJreJwb7EWZZviUAhTDEeHgX23QksO42FeSs62E6
	EfKkHA5Nutb7KdZN3+EF8oWGjhiZoAr9G86ZjCKlDhw+AB+5KAQaFjI0+VFgWWRnUMqGetCz1mNhP
	XydJF24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVwI-0000000AI1R-3lS6;
	Thu, 12 Nov 2026 14:38:10 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVwG-0000000AI0P-27zm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:38:10 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so1625720137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494287; x=1795099087; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
        b=ksrxAS7jh4oxhx2iUtDtqbHcdUe8dDBdp+RbY9sqKwTKRlibmjox1LqWfby8mCL7W/
         eHj2GBEylw4FJPgrCrSB4WPK5dIkqr3mmKH7emY8jdsupzIMgwQQpgLeE4ktIiwkKYQq
         XGn5wbLM52tk9JypJTNbVt9gaAzU0qWCnggxmT37tUjh7PIQAmbUwXGtfR3XUfMWyPj6
         AG9xeAZIdKIxXtcfWx9SsHx7IzRs3+6c6AL8cXv5LWTwA44GFxq7gmZCs2XhJ8dzLU+/
         zHDx3f3HQnr8XAz8Z0i2mxwLVlMXkq7jIDxNoASdPt8BUk1sHZIYy1UjQ/Z56zrYK26h
         Zyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494287; x=1795099087;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
        b=UOnSHZrQ1yatZCbVPE3vwjzr/asFbEfoGLEj4unG4RQ1fs3xUTLCk4lU6X2YcYJuNg
         oTZ1OHq/4BhrMG/U0lIAhQbrl7lxWEUlveg2/ErBdrUP5bO79/ytl8eI1SnhUlzuHyJ3
         SXKgfAnWb7BwfOF8NkTttGqrxoqTXlgkPwUqXe1BSN0lHT10jCJKV14mzZaSGS13D+re
         4+9bKjRWYDr7PVK84HBS4siPrHmzxxATx0L8ZpjaGuP9/QD/v1vfg1KpBm9fcju+tGXs
         PQUdmMyiOVjldZTHEtKk0PEclfgW6vZ9x8VN7AMc6DayqKtMIgtGDwzYH696Wdh52pBr
         GSSA==
X-Forwarded-Encrypted: i=1; AL+hErFWotMRf6wKdZ3uYt9sT+vTBOldg7pafYGJH4X4ck0pwAS8pbgo5yHioKKGgrq7WeD2lq8JFHswkoy5hDqr4bd8@lists.infradead.org
X-Gm-Message-State: APuU4Z88DAAxdPPddjdnBFW5c34TMJbdcw3mTYJ0fbdoIAi15KgGaRRz
	hI51K6h09UtKTC2JJbt7S/IJ0TRR8RdEEGWPDOVv1tGhRyb3uoNs2uW5
X-Gm-Gg: AYBFou1vAPEXScErvHV149aO8bH7eCJ/Sn+fEoxjvYQEhGxyWdtHrulTF/JOPzH4Wg1
	lHdvSiVcLi4SuNreyTBE+ulbb8ZAQHJyWzHiwTFxn975Tvi8XzvYhAU1+s7JES4xLLE4s5/vdix
	R2DhCm+2N5ptWgX10DqCs6CO9MbONvS1LyEIsx0+I68tw9JL/bLP3F9MtEuMZJHL3uwwXstPz/F
	HMaAoTU5oYrhAQSnhuDTW6ucm0nIWkurAwNPNIJ0KYgVWCAQ2PqKc2eCGgdL3V+EZ5LhM4GXrYb
	gh0rE0WIyN0xsaioFOkOu8aTYqLpsU82wA3OaD1BgQPhK+3PATBV0TWm6R1v6m44Z29Xq9XsMOa
	Buz11WP7FqYgnnUXjfWCORHEkI3LcF5+Ym/HYNmjiTTU/sumajjsP4COzPluHsA5H6VfKeQ2em7
	FNhxjA4KY8QqWil2BFbiAIBrsQQb9GcIVq8yRJS5x/S/K4lUzH1/vnLlgE4LdFotCr+GUQ3fh1C
	ZNQQJYqbJOmoZ0SaDVwNoygy6OSu98DspG0ErpbZblUjbJECjAX9yE1ZH7xVAIYm0vRKGSp9Qe1
	lXNKLWOADam1nb7NlSUM8m/cxOT3kPMbhw==
X-Received: by 2002:a05:6102:149a:b0:7d2:d194:3de6 with SMTP id ada2fe7eead31-7d5061175femr2125294137.35.1794494286681;
        Thu, 12 Nov 2026 06:38:06 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:06 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH 0/3] Add Lotus Carrier Board with Aquila iMX95
Date: Thu, 12 Nov 2026 11:37:32 -0300
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACzP9WoC/x3MQQqEMAxA0atI1hNoSu3Cq8gsokYNFJ1pVITi3
 afM8i3+L2CSVQy6pkCWS033rYJeDYwrb4ugTtXgnY9ELuAQ8CLk76mJMe3HaTgdg6Fzo5fQMnG
 MUOtPllnv/7l/P88PWp6GYmkAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=1750;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Fyhoh2gvGk3Ft2hHZ7zQnpX2e5GJIorXgz24xXGeA8c=;
 b=wJ/LS0jpHT8LcyyR5TSXkc6mSkonP1SS8IhsBv4qtGJ5gdoAYFflJJigSL5SExYpGh6YgMZ1U
 yfhxpkJMDaqDqYK8caPbJ0/huMKaV14HbWGQ3RhMaeUGivztiMEcHxk
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_063808_560727_A5928CD6 
X-CRM114-Status: GOOD (  10.18  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds support for the Lotus Carrier Board with the
Toradex Aquila iMX95 SoM. Lotus is a carrier board for the Aquila family
featuring a small form factor (Nano-ITX 120mm x 120mm) and built for
volume production.

The board features:

- 1x 1Gbit/s Ethernet
- 1x 10Gbit/s SFP+ cage
- 2x RS-485 (Isolated and Non-Isolated)
- 4x CAN (3x Non-Isolated, 1x Isolated)
- 3x isolated digital I/O
- 1x CSI
- 1x DSI
- 1x TPM 2.0 chip
- 1x microSD slot
- 1x USB-C DRP
- 1x USB 3 hub
- DisplayPort through a Mini DP connector
- A mini PCIe slot with USB / SIM card connector for a modem

Additionally, this series adds pinctrl groups to the Aquila iMX95 SoM
dtsi, muxing the I2S_1 and PWM_4_DP pins to their GPIO functions. On
Lotus, these pins carry the SFP+ low-speed control and status signals
and the isolated digital I/O readback signals.

Link: https://www.toradex.com/products/carrier-board/lotus
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus board
      arm64: dts: freescale: imx95-aquila: Add GPIO pingroups for the Lotus Carrier Board
      arm64: dts: freescale: imx95-aquila: Add Lotus Carrier Board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-lotus.dts      | 365 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    |  61 +++-
 4 files changed, 422 insertions(+), 6 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-b4-v1-aquila-lotus-dtbs-00c2e45a1a66

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>


