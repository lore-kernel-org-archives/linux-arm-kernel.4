Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3315606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=chzpZb2M;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p4+P60lH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SIbteC45At9e/phHEDZccWeZUiRHWTYBk94KBVq+cmo=; b=chzpZb2MsTzqw6mwjpKRAeXKsk
	kPPL0vNJeqhhTQFnd1iU8/BdYOTP+mqHwy6vNwIoPDYcEXjkJkBzHXmWQ5XnhwFSlSWe8nXkiB3Ll
	TKWw0qzILVOyemfNePU2xPh4hevXu5k6I/TM/DmraPfppy+xfmgt4KclJQlSKhvmhRZ6Vi8CTwzBP
	6LGLzdJXR4bA8kDP67EfeIhjPdhhemhcv46tajQhIwBqagKX4X5RdRn3ZfxRY+Y1qwZEU2hpRtsg/
	s5HVfP0UNzZnoT/ADbiLHi1W7Q3z1+Oco9S+kUhkLC1YOS6wuAiG0fGEuyvSwW4Ccdfbwc2ll/cmR
	HQU26dsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY49-00000004P1c-22Ih;
	Mon, 23 Nov 2026 17:42:57 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY3b-00000004OrN-27pP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:42:25 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-56431524c22so1447682b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 09:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455742; x=1796060542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIbteC45At9e/phHEDZccWeZUiRHWTYBk94KBVq+cmo=;
        b=p4+P60lHZzGrk6KboIcRO4fuHLGj7/aUoDRPRUM91u5rdg51BkRbPEPFsttgYxiWLV
         Wiqx41Wn5H0LT95ivQMYQwAYCXpbstpHK8EHkPOQVoYxwDM0O0pZT5NfPyL1yU/YEXVc
         HPn0WMbUwrd2Vp2IZJlwQ2Hxi4QOAzwLNPMgf1TneO1xCHlMsES7zoVropseXCCNA4Et
         imwNwXutN78M4oTx9Usk659OQC5eoTGb3/hP3wcgRL1MHcOKCptP8iebnrWCJYSS+e6O
         HaoXkXQsqQmuBQeG57LBN5LFqRMeTiHUyW0ri6Uuay5jiq441kKPgrx15PDcYvqvuPjR
         bbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455742; x=1796060542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIbteC45At9e/phHEDZccWeZUiRHWTYBk94KBVq+cmo=;
        b=VauaNtpT+npDvX9pNKhGxZLpAuDcTScaaZV08lcktxOPnAxX9DTLP39UnV1IhCqG4d
         RekFpa0jMNLFLxbNY90ChfJ45gk0Y3NwM56rBA5CmJ2z9HItWEdYDCudbtoCkASA663e
         wEQeW0WQhVUoTOj62WUJC5Ml+FtQlOvC2EGm0GnRsf22ZVwQs0gzP3+Fy4SZrMonesfD
         kRVBYIf6BhiGu51CORgiOgLOgFhSf2Y8urXpLyrLLe0SF886Fll9wfTfCR9ejmwGYjgk
         NnRbvrx+5QbILt3spT/MqN/5pnjhW5uYmtZ7fr0F/JbLzgQmS1MOKaV3ckqqZIkgpa/5
         aPIQ==
X-Forwarded-Encrypted: i=1; AL+hErG+3vQltrzB9MLvevLK/Z2bCUCBsS+PanZxBWDUMV8o27Owc2bYTv9BcF5HUYXHiUUe6nuAHlkvEyv1FprRLc9L@lists.infradead.org
X-Gm-Message-State: APuU4Z9Q4Piwsm56ezP9fAzt8ivUJnsjz+SX59nkED38SHwSlKs+c/gF
	wmUOlB0Cd/BRcbXujMxM1M/MdqdFYaXssPdKXTGu9+ApR6CgBltS9i70
X-Gm-Gg: AZFdTZcJhr0rasyJHn/erz3QD8M55G5O+EqfX0JJjJide6l6BFq08e5tXKdTgFI+ms/
	tbVDtGlvZ1sVgn7AX2HgVI5TytClIvzbKssP+hEZVKf+Qw0gyF4rherOwr7fQeOmEbdydXtaJEr
	1wOcJ4uKEMQQVw3FqUxSKtCTkvWe6bQg11QNqelor9ivMBTlgc0XFPW9D4e+twIuoDetBNGd14D
	QMtjFJ5WBB4Eb2m+0JKhSlk8WViqTlcWAbKPPkmjkkkE0IKE1kF7AgOeCZfTHw3swmgI7yBdwjn
	TzOjC3NO4U1ja8MGowSIfoizgF3F4lJMD/Ce6WNcwMdhb9zkjX6md1fxA+NjixSgs9uPjapUGc+
	QE+XLrJjfdnubpac7VmGri9sveX4457wQkgay7clWeBJ5ZRFc0xWzzTCa4uvyzogQ4QgdTTPgAO
	AiBrAoMawTlBRZDQpiK6vEj7FEXGUmxRDUe4oQmzvSSGrwvhnPEDZ21WsO3IXNLeWUzq3kllX+m
	h+ipp/SUKrLh6VWLbgDkCihLxRNZ5itr1pAl0QCIFa6PRRvT7AapRr0FwoxxF3eOE66gh8+FwMF
	dKTjxY4rUkaMg15fyIYojG6uBfiriOzf2pLt430A1MLrc38i9PJcJrcKNeGS0e8OrF+JkxMNo2D
	4mx01pQ==
X-Received: by 2002:a05:6808:1908:b0:571:b166:3d76 with SMTP id 5614622812f47-57a0ab2460amr14209938b6e.29.1795455741608;
        Mon, 23 Nov 2026 09:42:21 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5b07d57csm11240123fac.1.2026.11.23.09.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:20 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v5 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Mon, 23 Nov 2026 12:42:18 -0500
Message-ID: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_094223_557336_8C9BD2B4 
X-CRM114-Status: UNSURE (   8.84  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add initial Allwinner A733 and Radxa Cubie A7S device trees for the
console, PMIC, microSD, LEDs and EEPROM. The Cubie A7A compatible is
for Andre Przywara's forthcoming DTS:
https://lore.kernel.org/r/20261122004008.0ee8e16d@ryzen.lan

Base: sunxi/for-next (2ba07dfcd45bb6ec414e68213620490548fd5aec).
Previous version:
https://lore.kernel.org/r/cover.1795034153.git.enzo.adriano.code@gmail.com

Changes in v5:
- 1/3: Add the Cubie A7A compatible.
- 2/3: Keep one DynamIQ cluster, rename osc to hosc and add I2C0 pins.
- 3/3: Add LEDs and EEPROM, simplify MMC0, describe the 3.3 V PF path,
  and revise the PMIC rail descriptions, bounds and always-on flags.

The hosc label also affects Vinicius's A7Z and Alastair's U-Boot import:
https://lore.kernel.org/r/20261111134919.90264-3-vinicius.eduardo.pedrosa@gmail.com
https://lore.kernel.org/r/20261113023236.569054-26-alastair@d-silva.org

Runtime dependencies in application order:
[1] AXP318W PMIC v8
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[2] Pinctrl IRQ-bank v3
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[3] A733 8250_dw v2, patches 1-4
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[4] Firmware-clock v2 for vendor-firmware warm reboot
https://lore.kernel.org/r/20261112-a733-fwclk-v2@gmail.com
[5] Pinctrl voltage-mode v3
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

The A7S DTB and schema checks use [1] 3/5, [2] 2/3 and [3] 3/4.
The runtime build uses context adjustments for [1] 5/5 and [5]
after the regulator allocation and IRQ-bank changes.

Validation: clean application of the mail patches, arm64 defconfig
Image, arm/sunxi.yaml binding check and warning-free A7S
W=2 CHECK_DTBS=y.

On a Cubie A7S, a RAM boot with vendor firmware, this DTB and the runtime
dependencies above reached a responsive console and probed the PMIC.
Pre-boot U-Boot selector reads put every bounded rail within its bounds;
none changed at registration (sysfs at about 1 and 91 seconds, and no
regulator "Bringing" messages). At about 32 seconds unused-regulator
cleanup disabled DCDC4, BLDO1, BLDO2 and CLDO2; DCDC9, SWOUT1 and
CLDO5 stayed enabled through their users, and the console remained
responsive. MMC0 enumerated the card in High Speed, with a 50 MHz clock
tree reading, and completed a 4 MiB read; its data was not verified.
Both LEDs registered: green:power was on with trigger none, blue:status
was off at sampling with heartbeat selected. AT24 registered the 2 KiB
EEPROM with its WP GPIO; topology sysfs showed one cluster. A warm
reboot returned to vendor firmware. Not tested: early and repeatable MMC
reads, MMC ios, SD writes, hotplug and 1.8 V switching; EEPROM contents,
writes and write protection; visible LED operation; physical rail voltages
and CPU/cache topology; PMU counting, EL2 interrupts, ITS/MSI, stimulated
PMIC/NMI interrupts, suspend, power-off and other boards.

---
Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7A and A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 Documentation/devicetree/bindings/arm/sunxi.yaml  |  10 +
 arch/arm64/boot/dts/allwinner/Makefile            |   1 +
 .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts  | 331 ++++++++++
 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi    | 663 ++++++++++++++++++++
 4 files changed, 1005 insertions(+)

base-commit: 2ba07dfcd45bb6ec414e68213620490548fd5aec
-- 
2.53.0


