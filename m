Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3F1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q2HIgkn2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JAFOsqt4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=; b=q2HIgkn2rXHN0PuSL2XMap8gWX
	xo+GDKSeTB8D9h0BA7b1wvdCelNzogQpYekHnwTtqK0o9ISYrx0BeT+UZsGFKsoFbtcdb8NcrM7d6
	rrzSGoNIFgdozsCRtftewTyQPILLjQKnjGIeR8JSVLvDu8RRoBDKIlZW3h5Y4lA7+ez72vpGX6vjO
	gbD8c2O2UDixTnRG7tOObk84wjXrQrfZG935MkCi7Z0O219AlY1y1DJZZEJVeCCWbd4YUatDlPGFd
	NtqQMHzxusCuPNUNp1JFXI1zXJ8MUfXh/woQw9wXlU71j23mcaU4QHH13yx1syydtT7QDyoveePDb
	P0mHSIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXb-00000002XlE-1A4D;
	Tue, 10 Nov 2026 05:37:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXV-00000002Xff-0Fd7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:37:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FC78609F6;
	Tue, 10 Nov 2026 05:37:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289020;
	b=UXM3EKFCfzHumv5h23ND/bhgu4Y87AoTpmEPoq9w2Lw2Xh31zrmrIXtp40wjtbjtbOEF
	 lIaCFX2E4jflGHLYjK7rJVRa13owij55By6qX1zaZwNiAKmiBBqfL/rdkbGUuAzt08x2p
	 5Pc5mgJQLAy3NV+nPMiNDnAaohHRRdefO2wjPeFFM6/uPUpv4MxiuanTR04lBt5TYAgSe
	 Qr2uk/0hH8VUB7YPi131ANoqRywFHN0IZhEwk+QRkoOrYv1uF4yu7Y+ylwPmWJkS9FwYL
	 Gn9ivWqbG0VGbx/0L/soiHeZkrfugAYbPn1iiLAzN20W8a3jWLBYdrug8cXNcDCcLzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289020;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	b=bXymHt0ulRbgT55YzZVs2hefGdaNsgiK6kc88WocnZNN9jHeCfzC4JrM4nxpClALNwY4
	 b7yhP1zdI0m/ArRT3UK2gSbpk7fa2X+wQ++WRjuLml1T8E7NMPAEm5bPXURpw2xlvfzSt
	 lB405e1UT3bKzQKksrg8hSusvsXtEN05mB5I4E4K0jO3xoscALRyeYB8KxQMCsmnauvjX
	 cQpP5VRrpnMsLaaAI2Z6yhe7Z0NFzrZeN/aIF8VsCTXoFAre+xna5N0wr/51PmzxhFhhz
	 ltDU7EJhQ9IoRK6naVjMkysKOrNDv2dETAhMDDnr+zfmm050Oq5kh0PaFRVYCEvIrHg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 420E31F008BC;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289020;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JAFOsqt4xB3Qs3mhAFaSJK4B0oavTNdgo7NkIgwDCpOrFFVvR/p5nZhv74fKZGw/+
	 0+hZRDgCTNbQc+Y/4rYa0QzaxLFN79rjEkT23cAVUcXmFOlyDfuCokTQ+JezwL8aD+
	 BVPiKjETL2SAtr3Je/k1nORKPZUOXyzkpRYQVfnEh/DPbwFnHtJy8XiXGxZjYoHmXs
	 bS29xzCN2FBEwiE6vxrEswc+VI0HsyFeEOOr8pmw2bLmxTjroW3Tlc3dSwlG4T0NOc
	 FchvjVRBq1wLYN1ZBIHXMZgpZxp5E4Naz5pe6kegS6ncWYZWqwv0NL++incmgJ1Qa5
	 TM6j0WvSwevOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E952E488B3;
	Tue, 10 Nov 2026 05:36:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:37:00 +0000
Subject: [PATCH 6/8] arm64: dts: allwinner: orangepi-zero2: Enable GPU DVFS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-h616-zero2-dt-v1-6-05506d760f21@gmail.com>
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289016; l=990;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=5MPJQC1S+CHiR8Bt9vkp2Zk5ZwEghmC4r8Nx+9ugUME=;
 b=8053UKYHfOqO54EdBf1xGwXwUhAAG8olofHNp/ByiYCdgJYl8axWDp8NLgo9hQQ0vnxphtsa5
 +6qHMIMauqzBvoMNEJJfhMcbKPmNY2m1kyACcEh3CGFcHxLyV/cESHG
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

The Mali-G31 on the Orange Pi Zero2 runs at a fixed clock. Include the
H616 GPU OPP table so that panfrost registers a devfreq device and
scales the GPU between 306 and 600 MHz with load. The voltage window
of every operating point overlaps the 900 to 990 mV range of the GPU
supply (AXP305 DCDCC, mali-supply).

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 719d6dadf7bf..ca78d094c431 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -7,6 +7,7 @@
 
 #include "sun50i-h616-orangepi-zero.dtsi"
 #include "sun50i-h616-cpu-opp.dtsi"
+#include "sun50i-h616-gpu-opp.dtsi"
 
 / {
 	model = "OrangePi Zero2";

-- 
2.55.0



