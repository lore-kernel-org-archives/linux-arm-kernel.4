Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D58606A88F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eeqXgMr6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGBrgu2V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zcbGexqUs6AyY6rvNjsjQJWCSAAYmXVOXmh3IdhOCBM=; b=eeqXgMr6lE+2e8/KzR/Oum2Em9
	B2qfw6xGQjERlQs6BwwVWIoeb3k6YYv2k0ALtxlB8wxwZ8OXLFhDXZnBLzkMy+rIjCo3yZhMI5qgL
	WUuAs2kP/gCueWae2GktltPXifsaeI1asG2+rwv/NrahJNwD1CMOHd5vNFaZPNQLL7ljZ24hD1Y/1
	qrl/+NMrWnl1l1MBCU6//ouwwunojFG3vI+zRonIMsJYil41ofnAZS3vViBRTjH/5ZwhiRCN1GfOX
	9JKbaPXR/sDPfju9pIWcfkouCsRKat6Jh7oEwRq2Xv3nYadeA6o8p2D/w1yjI2/ah9qKbvuOatKCd
	zRtjffKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy27-0000000ERoV-0gLB;
	Fri, 13 Nov 2026 20:38:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy21-0000000ERlX-42PX;
	Fri, 13 Nov 2026 20:37:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B5BD746EA2;
	Fri, 13 Nov 2026 20:37:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794602277;
	b=v5BYhPzNZkRqAgpV0tgR3NYA9zY712vFNSIjr1vcgGzs/FfA+/wTJ9XoJMlm9wZuNMIJ
	 Woop4HL3uE+jTYrhTOMtZfBebkZTw7HOKafeCpCQG+fjognYg2iGVulrCBx2Bk5NeJx0N
	 cNjSChLc6s4NUR2LWz35VEhqdbtfe4rY7RcMirR15bPw/8pfkPLv0lAf6eu47FkKHcSKH
	 3hKzq3qgTOlSK9FOx00i7HQEFwDsGwYFIRzeoZkrIRoj6/0buFc0lJVw0PNcqn4jLXODI
	 p7zLOw12uQ9M1/MF3IdRswb6sYX4NwDgM795ymSeUN4fI3KxMiQ9ACtqt53UGYGy9VA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794602277;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zcbGexqUs6AyY6rvNjsjQJWCSAAYmXVOXmh3IdhOCBM=;
	b=1KBXuMvz+W9nyPwHc91KN1255Heq09pcKu0z2uiU0tqAQtFenc4aF4MUi4KZ5vvOqGI3
	 WgF+qXYViPzsCQ107/noPqByuVG44oaWp3jAvoaWsvERCVtHBstFvzunOfZKGlcKqR0u3
	 Q62EpMnp8114GJXA6M2DmXexRUQjOW9EeOMl1rjL/susk8kEhtdP1pN8Uy/00/nuehu+V
	 9I+9I3XZ/YIUdMtmFgo6AL03LW9lOPqFOKIFrI1rcjGhtP8otgTcGKlX32oZhK2bgqIRR
	 h+lydXXxUPNMYfPhmAN9Y1PWKInnesG/10/1I9z7nbzFsv2JByemuhdYaw8D4/qmmdA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2629B1F000C5;
	Fri, 13 Nov 2026 20:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602277;
	bh=zcbGexqUs6AyY6rvNjsjQJWCSAAYmXVOXmh3IdhOCBM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DGBrgu2V0TLeGXO57K3WHeHX2F5btUEhAsCWTruq06By8FEhHvvbN+D3bcP/cLffV
	 aIJTWEltyJMpkPIdGeP42pQ+FXwMbLbViG5/0Esvzotav9h9qanrGu9Zufz/texXqt
	 sCD+qRv9tyHgbVb/ycM2LjSAmBma81RXnZcPdmaziL8B4iNeNEVCFPHJKQBXNj2ZrF
	 qGp6XPOTKhneJCNPuKbKZeTWU03h28cjnsR1Ccj+2IYIn3OuOh5HCLPrx9wmNqGd5f
	 Vtn7g66g9wNEH/yk0ua671FVkY/Dzw5RBqLDREOn7x9IUmKlv2eVC0/GVM+MAPdR+V
	 e9vipkOnNOeaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7B09D49ABD;
	Fri, 13 Nov 2026 20:37:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 20:37:56 +0000
Subject: [PATCH] arm64: dts: rockchip: Fix the order of the RK3588 AV1
 decoder resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-rk3588-av1-reset-order-v1-1-d73f60222ff9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW6gcTW0VwkvdvVUU6AxYxKI7
 +5Wlx+H86/kMIXTuVjJsKjrNGbIoaD+HscbWIdsKo/lSUQC2zPUTcNxETY4Zp5sgHGq8h7bOqY
 2UD6/DFf9/MKX7m9/pwf6+VujbdsBhO9S/noAAAA=
X-Change-ID: 20261113-rk3588-av1-reset-order-b4261a95ab93
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602276; l=1508;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=YP+Ju9QjQfuU0YGwfWBljQdLr0V0QHLGHZyAd+cCC3w=;
 b=h2Y6s+lUrSYGVaonyq4DMPUpiqk68iJw40e55HnQ6t7RM1x9PLBQhBMoWYd4m+8wB0YLKqp18
 ZScq/59KbGvCoQqS2b+yERSYY7jGHr4Gf+2ESpKOOVfHH4VqwHLBUul
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

The binding lists the AV1 resets as AXI, AXI BIU, APB, APB BIU. Use that
order. The driver gets them as an array, so only the order in which they
are toggled changes.

Fixes: dd6dc0c4c126 ("arm64: dts: rockchip: Add AV1 decoder node to rk3588s")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Found while describing the same resets on the AV1 IOMMU (hantro-robust
v3). AV1 fluster on RK3588S (Orange Pi 5) is unchanged (203/242).

Developed with Claude (Anthropic), which wrote the code and the commit
message. I reviewed it.
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index d0f364547ae5..3d1e4369578b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1471,7 +1471,8 @@ av1d: video-codec@fdc70000 {
 		clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
 		clock-names = "aclk", "hclk";
 		power-domains = <&power RK3588_PD_AV1>;
-		resets = <&cru SRST_A_AV1>, <&cru SRST_P_AV1>, <&cru SRST_A_AV1_BIU>, <&cru SRST_P_AV1_BIU>;
+		resets = <&cru SRST_A_AV1>, <&cru SRST_A_AV1_BIU>,
+			 <&cru SRST_P_AV1>, <&cru SRST_P_AV1_BIU>;
 		iommus = <&av1d_mmu>;
 	};
 

---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261113-rk3588-av1-reset-order-b4261a95ab93

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



