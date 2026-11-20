Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75C660A2605
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C7kj0tzr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkX/FZmu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XCgMVtCDlxDzreExdU7WeSN8TnmsA03m5m2Y8AQaSmg=; b=C7kj0tzruhoh4ydCxr//uI1iZx
	RVjs+3OiVqqzRgBB74SkphglJfX+wz0plVCO4oUirQHhjPfxTuItZXxWKTbBMh2PjLB/FT0BsBqfF
	cQcHOQ6AQmnLvsyeVZjLJe5uQtNFhhDuKI9o2xIEV4EFcD3flfEo9KgZnQ+8zKwhjpK1Tjxx8UOJf
	uLe78LE9wvX8zi5sbcw6/YidFrN3sW0f6Wd/R2iOyWpFShbMTJPZmrwNqUWLDqJom4HT0HDzPmwOX
	C5p9+BRePvNXc35QtZZrDVeXqi+uKPbP+cjk6LYT3510mKtRmWdF1Yku9EuyxHSOASaivR601/2RU
	xEia8pdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMzJ-0000000Eq0m-0y5R;
	Fri, 20 Nov 2026 11:41:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMzC-0000000Epwq-0V2A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:40:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B7FA62581;
	Fri, 20 Nov 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174857;
	b=cVlhjlDUiXPArxlJjJgD4tLxoBLxV/zdP4fERqf5iZ8VjWWdx+beT5VQwmWlwz79H/sA
	 ecpmEEzQxSmAy6+kNJlkmYG7NYjorqwSUpN4csOM1tJX5bPQX/gA/qNfRRDBfbzWKSPB+
	 erCJ+fqWoIRBycZcik+n0qEDVzyZpa30gxRrFcWLI/FKGCXIyOGpcOSdq+9MFyPKHO/+R
	 UqfyntVaPpQEHg77QUKUACDV+tqoRhc1G+Osuks0PGxQR3LthJQg8a5FGvDdnXpXkOuKg
	 RwOAQusDayJ9zCgmfWKa24a1tvx7HzK9uQvLMWcegqhMW5oVGBcikBPvirap3FytXGA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174857;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XCgMVtCDlxDzreExdU7WeSN8TnmsA03m5m2Y8AQaSmg=;
	b=F27dWuSDPSJgf0FjnV+6qktOtXQDapzHy5k0ELjHSjpPhQYRwpbRZbREcfw6soPAAUn9
	 81NNtDQOavomPosafW756ZyC4C7ETyER9FoHwFCzAjTIAYKFf8b4F5q2w1410c3wWmsrA
	 0XbqNRf5ZpEH88iapjPVMUY7vJA8dda6ZRvg8c4KwR3ZSJb2ynaQ4Z5yGIiVydCAWxozY
	 kRRsHrfyqM+AdSD7w1R/JQmFzS4ljRPVvdaxoIt9MDCYc+ZfJaKuOBnbBZmW8Tifu69Am
	 WaUmFM/hTajqPTvqEmnJFYXBrx7bSseJgiyZ6dVUS+tSZa5w0B49us7TWqvb686C0bA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E03A1F000E0;
	Fri, 20 Nov 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174857;
	bh=XCgMVtCDlxDzreExdU7WeSN8TnmsA03m5m2Y8AQaSmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AkX/FZmuj6MbRWrYIrRjTYR+6/rthTCfjVyylnpmZWOKpqnQ3p/ymM8ZlgZWTKjPu
	 /hAza9gcF4SiQ2CuD8I5jyD0tsqy+m7qne9kDY+7dVuxuviNMWUu3U+qUevwt+g+xQ
	 fvoY+/xvC8HmN31Mi2SsJkRpc7SinZEDxV1jLZf2FD+wpp1IdA0knG4G4JVxW5t42f
	 Ii+E2SfTaZXKMTSCZXXM7pcI/ZL2WhAEJM2VwrP1XfD+4DNIXkFyxUUJGFL9n2Xg2g
	 nSlfi+SwNqee6bw9trZEQ4ORJ4Y7eqoFUArgOqIvY31NpNl2tcTIIN/IoZhnGOukev
	 wLjDGmchO2z0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D8A1C49873;
	Fri, 20 Nov 2026 11:40:46 +0000 (UTC)
From: Ivan Pfarher via B4 Relay <devnull+ipfarher.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 12:40:48 +0100
Subject: [PATCH 4/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 MMC aliases
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-orangepi-zero-plus2-fixes-v1-4-ecd792189f27@gmail.com>
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Ivan Pfarher <ipfarher@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174845; l=1496;
 i=ipfarher@gmail.com; s=20261120; h=from:subject:message-id;
 bh=9aWwwAzsx9U2iQUbLdf6klaNBeIN6Kxth853YqVu9o0=;
 b=8oBh1A0f4Jl18/rO4qnX4tVCjQH3AZVUPMYNPiUjNYReBhlAIRtNGVpHJ47ipRRd4WcRtZa/D
 j/DnSy61jIoBYnN+mht9zy/OcJhtwYXLYuVLWog2LE+kyyHdAotZk8L
X-Developer-Key: i=ipfarher@gmail.com; a=ed25519;
 pk=3DMYyz/xl+KRAx2TNGJpheG+5QUm7lqHhKXFqVu2TmY=
X-Endpoint-Received: by B4 Relay for ipfarher@gmail.com/20261120 with
 auth_id=1582
X-Original-From: Ivan Pfarher <ipfarher@gmail.com>
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
Reply-To: ipfarher@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ivan Pfarher <ipfarher@gmail.com>

sunxi-mmc probes asynchronously, so without aliases the microSD card,
the SDIO WiFi and the eMMC get their mmc numbers in probe order. A boot
script using root=/dev/mmcblk0p2 for the microSD card can then end up
on the eMMC instead.

Add aliases so that the microSD card is always mmc0 and the eMMC mmc1,
matching the numbering U-Boot uses on this board, with the SDIO WiFi
as mmc2.

Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
change applied: the microSD card is mmcblk0 and the eMMC mmcblk1,
booting from either. Build-tested only against current mainline.

This problem was investigated, and the patch drafted, in an interactive
session with an AI coding assistant (Claude by Anthropic). The submitter
reviewed the change and ran the tests described above.

Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
index 892723b46..4a26863e8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
@@ -13,6 +13,9 @@
 	compatible = "xunlong,orangepi-zero-plus2", "allwinner,sun50i-h5";
 
 	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc2;
+		mmc2 = &mmc1;
 		serial0 = &uart0;
 	};
 

-- 
2.43.0



