Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04244606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kFQuOZY7;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T2BEv0v4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AazhS24I/7MuMOkh0TY7pWo5KAGFVFjGku5DM2Pt/BA=; b=kFQuOZY7+LS3tTPk0+NjbB8OT/
	IqnU3lZGBNci3bNZhaG855bUiFSXjFlZwhwPs+NVYsLjzZ3xEM2/hqERDKh8e5vNycQ48igbzCWl4
	2ROXT7079I+dlvxtqcQxksAeCUUX/EbAepM0sE9RGt6JmG2FxJ+uWs1PI8vdzAo8XhtXm8zSj4huL
	K4NMB6JeTTkh0mD+GFlfv9jxwSCBXiDR9gIhNm+s8vG0vJj9JjJRxu+dPSyjY1IyuugYma9+xgPWP
	U0ne/WsjQXhsaOU137URyC1fP7r/GhiPz+3oUF5x69E+HE6Jwe330R6ASVjZNq1mCZXn0n9eJOZPW
	UV7iJEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdCI-0000000E3KD-2E2K;
	Thu, 26 Nov 2026 17:23:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdBZ-0000000E36I-22Re
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:23:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 562CA1BA8;
	Thu, 26 Nov 2026 09:23:01 -0800 (PST)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8CD03F632;
	Thu, 26 Nov 2026 09:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795713784; bh=ijv/jqvo5qY8ee8OXFhmAq8F26CDUX03x4X4GgLtBiI=;
	h=From:To:Cc:Subject:Date:From;
	b=T2BEv0v4xCvvpktZYfwPdzScfkP5S8lUNLojcxTQJzrRj3V3wx+NZtgnWawxisl9/
	 pTypmHyImALeo5sYPgA2jhp/716j6vDY+oioE0H2KRD8hf0pQYtxYdJvd1wtIY6Zu/
	 v9J12xwfMjIEdG0IPxMkjI6/meao1kZdWbF7jNSw=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: add Radxa Cubie A7A board
Date: Thu, 26 Nov 2026 17:22:51 +0000
Message-ID: <20261126172253.1097838-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_092305_590112_6EA0981F 
X-CRM114-Status: GOOD (  11.98  )
X-Spam-Score: -4.4 (----)
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

Hi,

this short series adds a devicetree for the Radxa Cubie A7A single board
computer. It's based on Enzo's basic A733 .dtsi and Cubie A7S series,
plus the other required binding patches, which are partly still in flight.
Patch 1 adds some I2C pins to the .dtsi, as the board connects some
external RTC chip there.
Patch 2 is the actual .dts, supporting just a very basic system - the
system peripherals like GIC and timer, plus the PMIC, SD card and the
UART. USB and Ethernet should be easy to add, though binding patches for
them are still in flight.

Tested on the board, with MMC including card detect IRQ working, also
the LEDs behave as expected. The EEPROM could be read via the sysfs
interface. The I2C-attached RTC probes, though I couldn't really use it,
as it reports an invalid calendar format. For booting, I needed the
sunxi/for-next kernel, plus the pinctrl fixes and the AXP318 patches.

Ideally this series should become part of Enzo's DT series, to avoid
unnecessary churn and avoid conflicts: patch 1/2 should be squashed into
the .dtsi, and patch 2/2 just added to his series.

Please have a look!

Cheers,
Andre

Andre Przywara (2):
  arm64: dts: allwinner: a733: add r_i2c1 pins
  arm64: dts: allwinner: add Radxa Cubie A7A board

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7a.dts   | 385 ++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |   7 +
 3 files changed, 393 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts

-- 
2.43.0


