Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A630B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TGsu6I5e;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=ZdW3FHGo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=59ZldlQIgO+B2OmxbNWYDSyp3HqONBFUXP5EH5kGRBA=; b=TGsu6I5eHI9/V1BhBPyv+mc/xN
	uZWfvyyMS8/QhNMCOt3fttOsHE6GOwsiqjdD7meon4xNWr+CY+12xKAXI9QQzF8g3aqBXUF5Ac1hu
	mbbzYEBhr8d/yFWNiLBdIk50JUO3m1Er5zcvzMJsQXKI0tEpDJDbxTUponjxRqrm3jWeVAxMddTPw
	sRRKa6H+uTyYe1T1bJ3lYlvuBzaBBb7tCpchLgCk8OsgcJq0NwdEwb0GxQlqdIUjyvQg9gNOVHx27
	e19IG9QVPPpMx+jiEBuxpx5xDZgfTwxTkc0osZ2QjTL+iuTBv10khu+u1b/B30SQTSwLfUb3pxJ85
	/JDkV+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWph6-0000000F4Pm-0XLv;
	Fri, 27 Nov 2026 06:44:28 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpgz-0000000F4OP-3oAP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:44:23 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 46F0340227;
	Fri, 27 Nov 2026 17:44:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795761848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=59ZldlQIgO+B2OmxbNWYDSyp3HqONBFUXP5EH5kGRBA=;
	b=ZdW3FHGoeYY6Qsvb2Odxs+TBuv5pHURLubNh5AHvx8x/Z5POO1NDDMOR3jOGFtmZ52l/wD
	/xT/Qyqz3pf+qlSMMJvUUbHNJ+pTbLRkzgRSYyYWtvDbgyZxWV0wDD6dGH8z+KEuXpX9+2
	ieN2Gk2Hh0Av+KzOyaBwBjIadtrnZnhfRE5RiBLWM0DoGur9uSYnENyF+k5YljtnHk0jvi
	xX3Lkx3okZ9p9fcOcTA+RsOL0uXkDHas4SSrGnLLWilqMAHCkp0HMBxGvFNrbhvFl12h+e
	gqdDOHYKaY8lB+oVQae51UiQ+tRLMV5lEs63t/+kgO3/DXhkywokEG1LJZNqEw==
X-GPT-Reason: legitimate; This is a technical software patch submission
	for the Linux kernel, which perfectly matches the personal/business
	context of the recipient (alastair@d-silva.org); the sender domain
	(d-silva.org) matches the recipient, indicating a trusted source;
	the content consists of specific technical changes (Device Tree
	Source for Allwinner A733) and includes a legitimate lore.kernel.org
	link; there are no signs of phishing, urgency, or unsolicited marketing.
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
Subject: [PATCH v2 0/2] arm64: dts: allwinner: Enable A733 SPI0 on Orange Pi 4 Pro
Date: Fri, 27 Nov 2026 17:44:06 +1100
Message-ID: <20261127064408.1344250-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_224422_406074_2EB8D273 
X-CRM114-Status: UNSURE (   7.35  )
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
This series depends on:
- "[PATCH 0/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support"
  by Alastair D'Silva <alastair@d-silva.org>
  https://lore.kernel.org/r/20261125124407.4098345-1-alastair@d-silva.org

Changes in v2:
- Add base-commit and prerequisite-patch-id trailers for the unmerged
  prerequisite patches.
- Reference the prerequisite series with a lore.kernel.org/r/ link.
- Drop deprecated Assisted-by tags.

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


base-commit: 988117cc1bb17338c586a4e21ade88b5397eac33
prerequisite-patch-id: 3b8415bb791a17bf30ae253b952ff1acf291fc96
prerequisite-patch-id: 75fc07dc2648e6610e80b21b910d9ae00d31c304
prerequisite-patch-id: 35c6c0bef613fb26f3f5bff6ff45dbadd8a51749
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: ed31fcb9809a267b49ee44a5cde678c3d77085cb
prerequisite-patch-id: 39a1e36d272d92139716356a50854eb8b01abc2b
prerequisite-patch-id: 89f5eb4b7c391953fc7ce6a96eb6ce22cbc9eba8
prerequisite-patch-id: 3bdae486f52d8983d80cf272c8c64465bf1d3231
prerequisite-patch-id: 2650d65df328931ab3b40c132c8a862e982ac73b
prerequisite-patch-id: 5d657469bcf35ca76bbe291203363403e00fab54
prerequisite-patch-id: 57131df5b3b6f1d1f12ef26a65e1b161c27e0838
prerequisite-patch-id: 309a5a3ca5b216915907263dea7024263abf1d1c
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: bf4ddc911cf8a6e246adf5f568e55a01abba4433
prerequisite-patch-id: 2ef0d68c7b24d98a3e9cdb55d71e68d84a0c51f3
prerequisite-patch-id: 4f4406ad18138f9dfce895e3ecece445f6134ac4
-- 
2.53.0


