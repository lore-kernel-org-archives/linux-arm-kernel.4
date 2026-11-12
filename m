Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22D7606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xh7uHZzN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAqhGWp8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=; b=Xh7uHZzN+zA7fkzzAmJY+ZB4fa
	HHLfWZ58mCVY0iEuqfiQhGx+zxCv98E7HV3qgTqTckMH/Yyn0SZ3sP3NblWaHM+QxwfAeaqHmT2Qr
	BNBwkvo9FHq9e829Jh1KbcSQOX5VQZStFORu3lTtG9TY9PCj1UZ2EnDS5Cn/ZXCtsiHI5JAkWH0tJ
	gpGTdYQovgRlp7E3HN1nH/i8s74tcEIqI3PokiRqy/IbyESA5Yt4OJCUxaq3cNsEB6Cscodd0Trxw
	guY6Va1nONZ8QLJMxuEKJrrDLHErAKb4Iw+mdkrxFebfjMBGH2DJXlcLOywDK32eKi65voEBs6Mpf
	UEjhPFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR0s-00000009LI5-2uSK;
	Thu, 12 Nov 2026 09:22:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR0r-00000009LGt-1UMt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:22:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B59DC429D5;
	Thu, 12 Nov 2026 09:22:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794475352;
	b=eHQyUtTHvK9Qh24U/f1A4X8yuhNisxHGp6d3WrBAWr7oCKMlq2oc5SyVrkGhf8Tuf7gM
	 qhCfgTay+cZX1HVXBAKY0yeVIBXELECpZf0ITRXvnPJHR9KkgU3FvR9vubhLavSH0IRAo
	 bPQVC2OJOiVUYd+WVKyJIHR/9Gat2ar3/E2NmCVFrmgw95+NGMyY03i1oCrjWcjij72GN
	 YrkEc9CJpPjRQMhfYMmVCejZ3Xs44J01Y1GO735O1NJChk8RUjijMYM7fEgScfGjkUJE/
	 T1Yd0XxMGqNzwkvQ3Wa8ibar8kY/yR1I3fHFKvyNk+iUv9w5Hq8wOJIXgW6gwbhuyNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794475352;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	b=IRxof7TG+xAsyKiLUViLbw3ARadjbqSRCw6whFJ8TimyNCgii/jtrZJJa2gGzOanK/z9
	 j24wP3uY+Obh3PRO2MCu6goZJyej+rakukdQT37EwLoJLd4oXWpFOdujHmI0eCUEj2l/5
	 GwvjDO7VkUu/1niAH9LzhvePIky5SS76LOOs+dsebjFAH7wapb04iiDVz6DOkOjffpR97
	 xsctpgg2RCVK+DGsXrjxi28G/s+s/EUq6I+t/X60H2JdgmBkPBmAfqRQRwK+skDQef/Rc
	 S8mm0lDBPm9iKxCKDdo7nih/8fl/+vVrIyZ/Dn5iEegGZUuX36P2LRjHvW1zzVHJdIg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C79A1F00A07;
	Thu, 12 Nov 2026 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475352;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kAqhGWp8d7om5nKdOFYQM6LNpUdxZevJ4FoV2RHtxsSFPA9qPwBOCimcF24gpD8lG
	 3ltQPavyVHTrD7QSGmY1LxNfcZwHnFE64M9/e6uojPjWieu08cB6qlGj2DLdJDlMCH
	 ss6YXPXcGMzxYdxNmcgCmn+mvbG/GmUViaCakNIs/RInJaYj6UhlF0VRJ00THP680T
	 GX0m0tD5Kx6zrFJKPYJ0ELu77ZKbEK+xcaEFDduySjxX+PIYdSQHG9+3j4yNc8QHqp
	 fdQ2h5You8gjw1p4SamlilfXSZG3V+A3oCtNIprQgjZWLZ1U3T0kqd+V/I2aEULfPI
	 LU6YFT30wBLKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8A96549430;
	Thu, 12 Nov 2026 09:22:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:22:32 +0000
Subject: [PATCH v3 2/7] arm64: dts: allwinner: orangepi-zero2: Let the PHY
 add the RX delay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-h616-zero2-dt-v3-2-1cd2664230c8@gmail.com>
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794475350; l=1923;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=hgTnawt6aimtaYNRLXqSLgWoRIBtKR4Hz80cKcd5MZQ=;
 b=vJ2ZDnQf7m9n3JuujGCr6FMtzvczqPGcrm49X9AJCXNCBYfWtNBiezVwEh6ut7LnS+yt/zY2F
 olwUXyzpPADD9lT6n1X1l8Fc+mdovKmAkS6TuCgJkmdT05OuP/k0O6H
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



