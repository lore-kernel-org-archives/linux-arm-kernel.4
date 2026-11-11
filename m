Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CCB60A380D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o9/Fn40G;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3hGA8kw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=; b=o9/Fn40GlXT5jEsAguecXWcECh
	etokVeXi/TEPE46RTdCfnyYaA15MW2nUKXySYiKSw7NzrjkvgjnLju9NNb0icEQytEMXVUtVDhV1o
	1Ll34m7lnHF75pAqZVhe6RXJh6vK2VfG3eVCfIITEEeXAMDpnVA0JBcKoJa+Pmy2XmuWoyUwk0iuA
	FUEmShqa3STcvD6zXW85yBg5E2fhbeNDK5uXwvwsHsQntoz5MR6YKRKo4wnxtePTQFmkMXn1DhfBa
	vflSXGS36Hvh5O0ph+honDNUw7qIwgVg9B2NXhUtC/CaZhqUDfFEISyUjQWUQuvFtw6bwNVREy85g
	FDF+1zdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1NT-00000005gpZ-3SRs;
	Wed, 11 Nov 2026 06:00:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1NT-00000005gpB-0PiS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:00:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4325446ACE;
	Wed, 11 Nov 2026 06:00:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376810;
	b=X1gGQGRSsQE7EdiDZVz9Kj8amXxNX1DGKAGJbrdb4cg25KCr6bG5uiPF+520qJQUOePt
	 nOF12zmuNq9Vm5LIS11v/naAAn43jdLR7Uf5S7wcQrIUkmG/Ex39chI5lrXGPgI+FubZq
	 2Hvcd5HeMsviUsZ/jxzc7sPSTKXJRj0C54+04L0wVjOfTPR6K3+po1GPQ0HHKZFj90z0D
	 Z2jaNnISqdGMokiVuqQj7PJOSzF9Jris4L2VxI2ows8rGaqR9gku/1tteYfMKlZQ4CD4I
	 0/aML6qhX1qoIaoGNDktCncERVTaYU1HzFkG1Z9hrZEeX9j/q1gqHYOHfLyBAvNeXkQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376810;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	b=fC0L6E2T+Kww7c5T2Op0cNUM5OEeavxNyEyrc0I/uc092TMBA86CoFBGWQUmX9KOyuBS
	 84bI0O/8SuOJ0P85FxqGLlyPJHRF/u94y2ifaKlZ25iq/aINebpqQtjUGTQsH4WMXaGlm
	 nEsNDdsiauJaRdph0wGYxaQLk0ib5qIUDZ5TTqzkVo1NXrMFyR/IUooHYr+h/liIqanJb
	 7ILldbJF3VTfYUJUwPqjVNlGK4vNOkBGGZ2bxJ+PFPlgSB7P1NzAbb+NnyUSpARj0I89f
	 hFyn+Nao1tmcbXmnsLv6dDvpOWdAyHc8JDN9WNJf96wn4PDoUEhU40bPvNDp+OJZ15g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C4721F00A08;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376810;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=P3hGA8kwV8Hyb7ZUQe/W7phZcnPAHLJH9GNkIrKSXi96eP2vmSXbRDLmClVkW1fE7
	 GDudTZX1fKXBG2RmhnW86GW2bjAUpgUlzjz+Dxq3+00HWOPLBXMEHz6uKIZCKtRUId
	 7MdqMr+vihNwRsn3RW+SSLoIjCuvcLJnZ2puar6U/kbHqEKxcpC+Ql3UCkxoQtdvDn
	 vqM7xD8/RNdctboYidHHTNdkMhZrZIMKfnzbaelQIKX0pz4dUnz1OljGAB6bac/pvJ
	 CRE8NbgBlvKvNpxwwvwVmRLfVqL7yWPR0wrUePcCfBvaK7cpxgednWYmZ+AEXaTJal
	 4od+cadUpfwWA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B6AD248DDE;
	Wed, 11 Nov 2026 06:00:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:08 +0000
Subject: [PATCH v2 2/8] arm64: dts: allwinner: orangepi-zero2: Let the PHY
 add the RX delay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-h616-zero2-dt-v2-2-88d8030fc975@gmail.com>
References: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
In-Reply-To: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=1923;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=hgTnawt6aimtaYNRLXqSLgWoRIBtKR4Hz80cKcd5MZQ=;
 b=rJDt1Z+hIOmV2HpihY42r8mfiUSAtj5Uw7oj3xkPckWjqYiN3DNOs3d5wkuwFn7Qgnk3xkql1
 74YOR/oQxQUBlDDqpowj0gyIg8N53bVNxSijNzHPXZnx5qI5FyA/lUr
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The Orange Pi Zero2 describes its RTL8211F link as "rgmii", with the
whole RX clock delay (3100 ps, the maximum the H616 EMAC syscon can
add) inserted by the MAC. With "rgmii" the Realtek PHY driver also
clears the PHY's own RX delay bit, so RX sampling relies on the MAC
delay alone and sits at the edge of the window.

On the board this shows up as intermittent boots with a dead receive
path, after cold and warm resets alike: the link comes up at
1000/full and frames are transmitted and seen by the peer, but nothing
is ever received and the EMAC raises no RX interrupt. All EMAC clock,
pinmux, drive strength and syscon registers are the same on good and
bad boots. On a bad boot, setting the PHY RX delay bit and clearing
the syscon RX delay restores reception at once, without a link reset.

Use "rgmii-rxid" (RX delay in the PHY, none in the MAC), as the Orange
Pi Zero3 with the same PHY already does, and as the vendor BSP does.
The 700 ps MAC TX delay is kept. With this change 10 of 10 cold boots
had a working receive path.

Fixes: 5a378f9f2b15 ("arm64: dts: allwinner: h616: Add OrangePi Zero 2 board support")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index f2e3300e078a..1fdf2d3c1a87 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -18,9 +18,9 @@ &cpu0 {
 };
 
 &emac0 {
-	allwinner,rx-delay-ps = <3100>;
 	allwinner,tx-delay-ps = <700>;
-	phy-mode = "rgmii";
+	/* RX delay is added by the PHY, TX delay by the EMAC */
+	phy-mode = "rgmii-rxid";
 	phy-supply = <&reg_dcdce>;
 };
 

-- 
2.55.0



