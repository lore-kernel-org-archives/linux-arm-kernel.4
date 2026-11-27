Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72A7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=acl+bE0F;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=NKiQWi6G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gvWBA1mhx8ibYVBggwemKsSLz8VkwDf35wvv7VpFuF4=; b=acl+bE0FIwIbFdhwRxxNGR+U6u
	LODYJIa7WJR6xzZ2WRAyBq6v/s+x7kvPg7mo9EjIWe0Npinxt2t9xOHDMsQF4oNIB4o716t50Fl7p
	RjWAHzghxJHM124mVejpeerJ/SiQ4hZNxwBQMFb3uURDWr35d1edx71OwObw841FLXiaP9+KFvvts
	5s/RRk5y+BXcoiqdrWqq5eY/SyWwTRX3s2a/ApNQDrxmmTPuyvOQVNE9udh3snGBPofiPPxSz6l+i
	d4r54I/gB37Ms2ZuU8vBD3+FBlclM3hmNnR84SejKHnJjr5MOuI+1YvHecNJTnXbD1GAP/TOnyPBK
	3JVf0bEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqyw-0000000FE6b-3dN7;
	Fri, 27 Nov 2026 08:06:58 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqyv-0000000FE62-0cK1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:06:58 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 2D6D74C972;
	Fri, 27 Nov 2026 19:06:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795766809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gvWBA1mhx8ibYVBggwemKsSLz8VkwDf35wvv7VpFuF4=;
	b=NKiQWi6GIrzDGR2pthCqjgdeHpEK1h48kycZnGQ7Ij9HtRGZZYqaQzFhr33YzIhXsi1wtz
	Hrb3hB6WyphdOfO4PgxapHCaxHo4CpfbhEYOPBZoKuJBa9aZNXnsV/ljO+tPh2cTY/z6px
	ZdnS0wSCDQOPZihsbANHOh0Nyb40lS3tWMWiALnJrcQsB4VydiV4h3H1rV6EuJQ1hNtuUX
	HcFoKpCA2XAkHSBIa34g6fCWIQFwDQxpX2+Jk7pqaneaEMiu9Dz6/7NlRykG5OtEE4/eN5
	wB7z1OQGZNxmcuAsT/zGrX5JHiikTexn8pVu91UgyrPGXTvlUmbMzUvjI848ow==
X-GPT-Reason: legitimate; the message is a technical software patch
	for the Linux kernel, which is consistent with the personal mailbox
	of a developer (alastair@d-silva.org); the sender domain matches
	the recipient domain; the links provided point to the well-known
	kernel.org mailing list platform; there are no markers of marketing,
	phishing, or urgency.
From: Alastair D'Silva <alastair@d-silva.org>
To: Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 0/3] arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI support
Date: Fri, 27 Nov 2026 19:06:46 +1100
Message-ID: <20261127080649.1982883-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_000657_340541_ABA3908D 
X-CRM114-Status: UNSURE (   6.02  )
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

This series adds boot-time simplefb HDMI support for Allwinner A733
(sun60i-a733). U-Boot enables DE3.5, TCON_TV0, and DW-HDMI2.0 and
updates the disabled /chosen/framebuffer-hdmi node. Linux keeps the
display clocks and PCK-600 power domains active across boot.

Tested on Xunlong OrangePi 4 Pro, based on:
  [PATCH 0/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
  https://lore.kernel.org/r/20261125124407.4098345-1-alastair@d-silva.org
  [PATCH] pmdomain: sunxi: pck600: Initialize pd->pck in probe
  https://lore.kernel.org/r/20261127080625.1982574-1-alastair@d-silva.org

Alastair D'Silva (3):
  dt-bindings: display: simple-framebuffer: Add Allwinner DE3.5 HDMI
    pipeline
  arm64: dts: allwinner: sun60i-a733: Add PCK-600 power domain
    controller
  arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI node

 .../bindings/display/simple-framebuffer.yaml  |  1 +
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)

prerequisite-patch-id: 309a5a3ca5b216915907263dea7024263abf1d1c
prerequisite-patch-id: 55e543b9854c7ae2fa86969233d05ccadd3792e9
prerequisite-patch-id: cfcad85224e288ec2168e7f245b4a1c63e9a34a7
-- 
2.53.0


