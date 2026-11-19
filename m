Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0C1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5CxKVS6I;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mD6bQSRb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=; b=5CxKVS6IpSF6+4ok/hhi+dwGQp
	pYlyuk9kHRO+ECNePuDlllkYwkK/j6+u4S5eAJ9UE+M7IsmVeyP7WoAFmoLgvFmhJlb/e0RzuhLGo
	tlEsZE7V3/KHIvZgqgZsMnTVUMDL7pormV4S+YcqOlLw6LTFJPIN0NNhjdp94L6G2wVHQ/3Cdvak/
	B7wg+10Ybq8SzYjGWHRfoESYA+PNSpIKccSyrbx3QJbw8f0EZimOrslQfk6xeJtd2p0DTyB4Murfr
	Vpzm/XZyrXTfinF5RhOuGIbFPgNqtFtJmwcgWth/ciQ5jo6RV15TFCzUOuPaEhuTU5wRU9ggbpa6E
	xvafCzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6ZW-0000000Cxea-2G7A;
	Thu, 19 Nov 2026 18:09:22 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6ZQ-0000000CxZb-0wUK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:09:18 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-48ed0b68895so89797fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111755; x=1795716555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
        b=mD6bQSRboeKIXW2Nz3AZe1+YsiFP1xjLKmIb+OB1RDKPIBFmW1CeSNT8GeJ1VCtQ3w
         9AHgVC2l84LIzhLCbfbmwV3nUStjbNyz0fWBiOpRuJHPymaInhBkqtZZwDztlQKLxMda
         apvhgsNOQmMzNSO1TK6JRwrXZsuyQcsQtef2vSFur+rDtbdo839KuCJed3gr7LoJ8k8F
         oC4X3ZyEcwqPF7R1jJjZCEGroW/ZstmCYiYxSH28LJ/SSv495YaTVvs4Ci8DlEeJWGZ9
         3syKAN/BCTCkIWvI8xF/hjsRBuNB15tq46t8XKTM8f/8zfsqYY1/Cvr/9kC8mBNrQJ5q
         qNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111755; x=1795716555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
        b=WPKin3zFX6ml92VMVnNHC6S8bgdtZsrY/1IZSibZ12ZIwYcipbASCavKcE2kVLH1sa
         8i9mfTUB0e0vlDp+r/ORVZuAQOImcFTXVfsM650DLCHXMRA+ouEClXT17m+BU5kjr7+Y
         oPTREPsk/WgLy8h+tHkx99oetbfqerMNsKOhKrRgr6XBqHvohbdLWHHn7W7tAPJPNnGM
         XlCYkD/Umaud9lldlbX8fQAQ0232s2BNpKRGSwcdFr1wLlJDZMppASSMt/hHRK+pzZAq
         J3ae5JstEJCFb5RaNnjr5VFI1yGHyogbkzYad9gNQAlA4UD83sme5DxxxvvQTZykrKFg
         0pPA==
X-Forwarded-Encrypted: i=1; AL+hErHEqDlKLXC0ULDjYdZB2vu33hKtDKNEIkcXgmKQ66OgjYP56rHquohJDyXiYrgxpokSAmxmfJQwhInuqzqXkQwF@lists.infradead.org
X-Gm-Message-State: APuU4Z8LkHjcaMccAtCH2OdcshZG0nwA0gkUjEXR8kyOTwGvD/BiOly8
	XW3OiMentr/faGi3TZFkVL24+YN4oi/0uT507tprckq1hjzQ4VMtlbh6
X-Gm-Gg: AYBFou3BHTX0MeAgVKzXd6d2EVkyl9hQYqMk1IrGThNfBpihHsuXv26XJZeSMOrxE/O
	oV/Q9rrNXy8Ip4Al03jzyaj7MRcLwjfBP468FHOQag9GkGvpgMQOWqw6T7Jo8fGfpwhp/9TUvpR
	C+WtvvWJNKFTGG3h2ljTfsmbA8h5jkMh8dxvvP9SvctkRSWup7uzWQB2wM6F2FtPJuPMXt7S3Q+
	T9MFJGRhg7jp2e39EF53HszPPuZgk+Uo+qQ7yJBuomhdu7lXl8VPj7kckAT94NK95KV3K91hOHp
	NZPfAuoLAKIZOxgL8wsmtQKttDh/Q/MktOKEzM09AqPGBAaZTYFxQajpDCyrIAg3/aEhqyTybO/
	VNo7oNfTyQax7PGqzahaRN1NBTQ8k45Wt9hRI7m1khPYNum/scnpfcnbruFyh1niQYUmQYxN4rP
	wViYcJgyw6ykC74Av0XBBY0fH0eKN95PtbihNR2LG9K+pHVtv96aoU7s4y/j4A7dU/DH9piwVFB
	zeGQNJlKDoTxw1f2LWHtHM34Ec8l9pwy7X9qV+kXKW3yNft84uq6EQYkbzxn70c1g5BdjI5yAVZ
	hSTrtyuNOQh7qbiaFL/3KhUPUNTFTNPSP46caxVAJ7KitB5KqZCmmTG4APPpTDnhufy4uYzKOco
	D
X-Received: by 2002:a05:6870:51ce:b0:47b:cd37:f931 with SMTP id 586e51a60fabf-4bc81aa2294mr384102fac.13.1795111754944;
        Thu, 19 Nov 2026 10:09:14 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60491337sm446604fac.12.2026.11.19.10.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:09:14 -0800 (PST)
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
Subject: [PATCH v4 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Thu, 19 Nov 2026 13:09:12 -0500
Message-ID: <cover.1795034153.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100916_276981_FB4EAF71 
X-CRM114-Status: GOOD (  10.72  )
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

This series adds the initial Allwinner A733 and Radxa Cubie A7S device
trees for UART0, the AXP318W PMIC and 3.3 V microSD.

Base: sunxi/for-next (03b3355ed7a39b4416f0d0a39061479b1aa13196).
Previous posting (v3):
https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com

Changes in v4:
- 1/3: Carry Alexander Sverdlin's Reviewed-by.
- 2/3: Add a one-cluster CPU map and A55/A76 PMUs on PPI 7, using
  GIC ppi-partitions. Change #interrupt-cells from 3 to 4 and add a
  fourth cell to every GIC interrupt specifier. Drop Vinicius Pedrosa's
  Tested-by because of the interrupt encoding change.
- 3/3: Sort root nodes and put status last. Move boot history below ---.

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

A7S DTB/schema checks need [1] 3/5, [2] 2/3 and [3] 3/4 before v4.

Validation: clean git am, arm64 defconfig Image, arm/sunxi.yaml binding
check and warning-free A7S W=2 CHECK_DTBS=y. The compiled DTB has one
eight-core cluster and two disjoint PMU partitions.

A November 18 RAM boot on Cubie A7S with vendor firmware used the base
and runtime dependencies above. Two context-only adaptations were needed:
PMIC v8 regulator allocation context and pinctrl voltage-mode v3 IRQ-bank
map context. CPUs 0-7 came online in one cluster. The A55 PMU covered
CPUs 0-5 and the A76 PMU CPUs 6-7; cycles and instructions counted and
PPI 7 overflow samples were observed on each CPU. The timer, console,
AXP318W probe and MMC0 read-only transfers worked; warm reboot returned
to vendor Linux unaided.

Untested: PMIC/NMI interrupt delivery, card writes, hotplug, suspend,
power-off, CPU capacity, 1.8 V switching, other UART/I2C and storage
instances, RTC alarms, EL2/ITS/MSI, and physical BLDO2 voltage.

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 287 ++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 657 ++++++++++++++++++
 4 files changed, 950 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi

base-commit: 03b3355ed7a39b4416f0d0a39061479b1aa13196

