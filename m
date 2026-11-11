Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD0E60A262D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l2+rFyC6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WceziVLt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GBpk4qu8pcZYCdUrURfSkvotRI0YOn6Uq9RK99ZjCJA=; b=l2+rFyC6yqXR4JJPNOmluZMkF4
	arL351YU2N2evGbhrkN0ho/iumG2PGOZN21/p8NSHBwTaAN40NzriKnLvdgK7ImWGu4Wjxeq4GDua
	N7pCWWLYg5mmu9ksfqZfYCLURdgkeMls7tn9hOuxpOH3/wRR+5H9uv5hS2wNIjg9HlK/o1jSLe0x/
	SP6A4iZskjyi6FO0KfRnEoIvelVW0ijOzfMjDaiY8V85e3S6VK9LKHFDVAO/+nTuymwsSo+y634r7
	JfTjxC3wRS80vdsJJAZsFxXpfmIXrXrfxZr4wlsQha3fZZukFm9WYEj7IAAvkmMKO+UzbTtOpUD7J
	bAeJTunw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBCT-00000007C99-2Ekn;
	Wed, 11 Nov 2026 16:29:29 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBCR-00000007C8S-0hDU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:29:28 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-36a6ce64b95so2009143eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414566; x=1795019366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBpk4qu8pcZYCdUrURfSkvotRI0YOn6Uq9RK99ZjCJA=;
        b=WceziVLtVYuTxbBl2nCyb5z9Vc3R/GKRGb5yFp+z8esb+HJQed1rzHFLVG/EaBuQC2
         EsU9AKBRk7KqQhNjdU5EcKXDK5elidt12mcoWP9Z7KoHIERlBSaUGGz4geg+IPEPLld6
         pxU+HluzZJoyRjlkCMJ05s0jGXb1UESQC8oWu5g0uItkc4/a51B/shKufI++ArPoYmhc
         BMDPhVOJh4DtDDW15clZJJlfYQH+sVG/fVhVhlyPlh0yGm7e+M9SLf3z9tYUo685uukY
         bq6DjOC/0Xn7TDBjWdFsaivVmBkSwrfYHILtThuUn8266lI1//Ef1PStzQoQADBjSTmc
         CCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414566; x=1795019366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBpk4qu8pcZYCdUrURfSkvotRI0YOn6Uq9RK99ZjCJA=;
        b=R9Yos5yyA24sTgugVeBsMvzNCTSFyvmijdr+yIj2+kI5I7LdyYp/RKw2wPp4JBqWPG
         +Te5FlL1Cf2AuUcrKqoP4SJC3tSB62rwwzmBz+Qjsg0ysmBTUT/0Kuv8WHyb1JF4YOWg
         iGBpGvER6ZQJ0QuT68K71fGaxHci7KVrNLb5aQ4oyCkCwY51s154hBmUCjyqJFnGw0Xb
         dQ8Al3rtxWTFLmaIx6EQprIIEjC62EefDEOKuUKMGycsLCf6yHegsJYzCDd3Pozzak8o
         1lOg55mBfWCbb5DlkxjQdjihVy9kxNW8a5OSOncVvNo3BgGuixXt+qphpiQznBhwb9pb
         mV3w==
X-Forwarded-Encrypted: i=1; AL+hErHSfuNe+ZMrRpWln5LJQemjygLlbTFTGz2a7ZsfOeg5Q8em7GYIZVAHGUrLOI25NDIQdtvJeUQpLpcVIExZYyc4@lists.infradead.org
X-Gm-Message-State: APuU4Z80sdb7qON8gJvTnWaa0V9RgkvQsdOZ9ujU7tkm1MSMlHxNFj90
	LSAqHVbOr5oAumCiTb8csfSOo3zZ2C9+m6ybYPrgHK/OQWnysevSh/n0
X-Gm-Gg: AYBFou1wlq4ECnFtDN40Xv5y/5REZ6zF8ccyFR9Uy4bWCEA9Z4zErLGtIsF+C/6Q5oL
	jOZRN+KOH6ykskKsOSxRTTqsBqLfQI9dMKK86YHSERp4phP09PusazsuJxgF8nr8DxzJ+oBLW3w
	AsWNeE31oTjnKi9O18cLTz23J/KDuXdp0ZgD82XiR9xUcgSCyyAyJKi3m+pH4geng++HhPuSKqA
	GOkScEKE48wqt8bhTbO3MG5kxrAhUZxQEVbB4ecZYs1yngubtPUhadhW+jT/v8Zec5+5TzkrkIR
	11chd17DCW6k6N43nLwe3aJa82nb5lFmloxwF1yRpvNAjas9ghmjEWd1W2MTVAq0YzLCihmZzkL
	mElq7qSMlcepfP6QWCojVFufQRG66z9b8bPGlmH3Kd5vN1aqPKdL9twgpuHdU2ExNlteSJ0nQ4d
	8GfV6lQlx731z0Wuw0nib3iiHPPJd1pFAXjTnEkogPUUD2KeuMowcJ2VKuotjmxKNsot6ZuwXqQ
	iy92YWi/zv+lby4UkbMp4aPSGvMzIbj8XUFRMDcBo+WUkXfgQlVX+DrU81PVJ1mBpQ9/9Z88hXQ
	uwQzkOwKRwiYujfHrR9P0j+edIoJreNvOWqSqWrAHGCvl+Ngjw==
X-Received: by 2002:a05:7300:33a7:b0:36c:f88b:caae with SMTP id 5a478bee46e88-37686469c40mr3335801eec.22.1794414565934;
        Wed, 11 Nov 2026 08:29:25 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm34892599eec.16.2026.11.11.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:29:25 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 0/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Wed, 11 Nov 2026 11:29:15 -0500
Message-ID: <20261111162917.97532-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_082927_206594_69C61468 
X-CRM114-Status: GOOD (  15.95  )
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

This series adds device tree support for the ALINX AX7Z020B development
board, based on the Xilinx Zynq-7000 SoC (XC7Z020-2CLG400I).

Changes in v2:
- Add an explicit mdio subnode under gem0, placing the PHY as its child
  (suggested by Andrew Lunn).
- Use hexadecimal unit-addresses for the XADC channel nodes
  (channel@a, channel@d), matching their reg values 0xa and 0xd.
- Move the pmu@f8891000 node into the initial root node block instead of
  opening a second one.
- Drop the standalone "alinx,ac7z020" compatible from the board enum: the
  SoM cannot boot on its own and is already documented as part of the
  three-entry board compatible.

Note on the vendor prefix: "alinx" is documented by a separate patch that
is already queued in linux-next, commit 1f06cd374a60 ("dt-bindings:
vendor-prefixes: Add ALINX vendor prefix"), so it is not part of this
series. A checkpatch run against a tree without that patch will report an
undocumented vendor prefix; that report is expected.

The platform consists of two physical layers:

1. ALINX AC7Z020 system on module (SoM), in zynq-alinx-ac7z020.dtsi:
   - Xilinx XC7Z020-2CLG400I SoC (dual ARM Cortex-A9, 33.333333MHz PS_CLK)
   - 1024 MiB DDR3 SDRAM (2x MT41K256M16RE-125, 32-bit bus)
   - 32 MiB QSPI Flash (Winbond W25Q256FVEI) with 4 MTD partitions
   - DevCFG FPGA manager

2. The AX7Z020B board (AC7Z020 SoM plus carrier board), described in
   zynq-alinx-ax7z020b.dts:
   - Serial console via USB-UART bridge (CP2102, MIO 48-49)
   - MicroSD slot on SDHCI0 (MIO 40-45)
   - Gigabit Ethernet via GEM0 (MIO 16-27 RGMII, MIO 52-53 MDIO)
     with JLSemi JL2121 PHY at MDIO address 1 and RJ45 link/activity LEDs
   - USB 2.0 host via USB3320C ULPI PHY (MIO 28-39), reset on MIO 46
   - Dual CAN buses (CAN0 on MIO 10-11, CAN1 on MIO 12-13) with
     SN65HVD232 transceivers
   - I2C bus on MIO 50-51 with 24LC04 EEPROM, DS1338 RTC and LM75 sensor
   - 2x SMA AD inputs and a spare differential pair wired to XADC aux
     channels VAUX1/VAUX9/VAUX12. XADC is a hard macro accessible from the
     PS without PL configuration, the channels are enabled via the
     xlnx,channels property.

Tested on hardware: boot from SD card, UART console, SD card, GbE with
iperf3 (940+ Mbps) and netdev LED trigger hardware offload, USB host,
dual CAN (SocketCAN at 500 kbps), I2C sensors, QSPI flash MTD partitions,
and XADC temperature/voltage plus the external AD aux channels via IIO.

The DTB passes CHECK_DTBS=y with no new warnings compared to the other
Zynq board files, and the bindings pass dt_binding_check.

Pufan Jin (2):
  dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
  ARM: dts: zynq: Add ALINX AX7Z020B development board

 .../bindings/soc/xilinx/xilinx.yaml           |   5 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  70 +++++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 142 ++++++++++++++++++
 4 files changed, 218 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

-- 
2.56.0

