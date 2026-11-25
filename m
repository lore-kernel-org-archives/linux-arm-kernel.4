Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6553E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MGka0m75;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=ipcMGvgS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8NfOYQ9xOQe4jaVMMbVRX9QNJs2ea2xAaZLXH5A8ISM=; b=MGka0m75WtPXqgfKXslRQpIauU
	PnYSfiE3pLike2iT4fYjBXsziuvwJLEQQnUCIBMNx1dHBSUzKKdti9X1fJ8lzbXhsT8VICBBzfkia
	nSSnJ1bJg1DWC05hDTioLUL9jI4kwmyPxNc9NzeQAxuMA+E1is1oQylDB2sPJtdIlB7as+TBfQ5dJ
	3d5hQPmlYaNx/eprR2mf2R+N8Km9+5s0UYvP15RuA8klWNT8D3BU3U1vhaz5XO8v7R7pDyTlWP1jF
	oaxXBtT0TbDufJdvUJB30BfpN3H+5uK9d9IeA+KAj2COQQI0b9FkpByqwH85znUoBCtAp8nhR/OxN
	HSPOYO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJJG-0000000BDzk-0HLy;
	Wed, 25 Nov 2026 20:09:42 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJJB-0000000BDys-03hk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:09:40 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 28BCA403EF;
	Thu, 26 Nov 2026 07:09:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795637367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8NfOYQ9xOQe4jaVMMbVRX9QNJs2ea2xAaZLXH5A8ISM=;
	b=ipcMGvgSX9aaPdr4ULF3tlN/IALDqJEV+3PDAN8JzbopXc+qZ7gB4KI3i6Smv3eXleac7S
	j4At8EQK6UEfGTTLxneNdWLs8ehejEYDRQ7doLq4uSANiyfYMYa+PqRyJjX9IAqRzQFb76
	tCFjF5MhqG9NS6dwIirGXLlFvO4hjHjG1OHweEhn9+574kyHrd8OTFtj4SWtHSL4xChJe/
	5fU+y/C0wqKoL0OWWwMJ6JmpNJq3RAVI+NwEXDRnyXlLas9LkKg7sH66DSWacCROgQYikX
	fZikfMjAWf26Ps88+wonH1jr1bm92Yd0FfgYQ2SW6X31yrTF1TDuGzLKgMnPYg==
X-GPT-Reason: legitimate; the message is a technical software patch
	submission for the Linux kernel; the sender (alastair@d-silva.org)
	matches the personal mailbox (alastair@d-silva.org); the content
	involves specific hardware configuration (Orange Pi 4 Pro) and
	includes a link to a known trusted domain (kernel.org) which aligns
	with the technical nature of the subject; there are no indicators
	of phishing, urgency, or unsolicited marketing.
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 0/2] arm64: dts: allwinner: Enable A733 SPI0 on Orange Pi 4 Pro
Date: Thu, 26 Nov 2026 07:09:25 +1100
Message-ID: <20261125200927.515136-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_120937_321647_9F1EBD86 
X-CRM114-Status: UNSURE (   8.54  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable the SPI0 controller on Allwinner A733 and the onboard 16 MiB SPI
NOR flash (XMC XM25QU128C) on the Orange Pi 4 Pro.

Dependencies:
This series depends on the Xunlong OrangePi 4 Pro bring-up series:
- Author: Alastair D'Silva <alastair@d-silva.org>
- Series: [PATCH 0/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
- Link: https://lore.kernel.org/all/20261125124407.4098345-1-alastair@d-silva.org/

Tested on Orange Pi 4 Pro:
- SPI0 probes at 50 MHz max and registers /dev/mtd0 (16 MiB, SFDP).
- Verified non-destructive read of the eGON.BT0 header at offset 0x0.

Alastair D'Silva (2):
  arm64: dts: allwinner: sun60i-a733: Add SPI0 node
  arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable SPI0 NOR
    flash

 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 24 +++++++++++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 27 +++++++++++++++++++
 2 files changed, 51 insertions(+)

-- 
2.53.0


