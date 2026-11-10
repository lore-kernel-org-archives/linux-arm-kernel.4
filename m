Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D1E606A86C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nMpSBLxQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7duKORq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l/MGsum1F0rKCDJOx0Lnm3h1ZbNpJlCrv461gxecIkM=; b=nMpSBLxQFZ0Ldr5akXjmAnTEMv
	lFS/Me+0+wJh564nO2R6d2lDnjtmrnSZLM3TlWJHfxGEUOL8FBW30gSrca5igknH3kHGfNhRdLO7W
	RD2H+8Bpes8RF9qKk3LDOzTqa93TDvLZAm1avWJmbQhtSuh8FnqXTE6EXKQUj+8WBArMqq9qi1rnH
	K6EDhY0VFk5neINo6Fv6TXZySIstBDEb0RcDZyhYa2kFGEmcGKYNxZJbdsn/UkdGyrtWwU2HaJ9ma
	Lp8IYhnKS5LDEcwlA/wIHaAWl5AjowtLvVFbF8+5+7EzLv9S0Knps1jNBpVEJOT5O8G1Z0Ls4gjJU
	KROkq6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg9D-00000002sMF-2X4s;
	Tue, 10 Nov 2026 07:20:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg8l-00000002rM8-0htf;
	Tue, 10 Nov 2026 07:19:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ADC8B4109C;
	Tue, 10 Nov 2026 07:19:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295174;
	b=JffNNjojs6AAzQv+Dkuo0oURZzZTCYpIDYi26bDDb1N+Q8QEFek8cfRij9mRzzzOvMwd
	 pbX9D+YHJTUVXPPj0jmDckSOWaV7aeuD1gdohvM9S7XH8PPIU6t3kyNiy/enq4AJwyW88
	 PC5aG0qAwmEtgT7URNursmh5lraPfB1Ihq8b2VWYIBoDlWgV7QE9eEXTehmT2ibmZaQSq
	 TjAYKALHeDo298mZlWK8Sm4iAnrA+dOQS7998te1fPSKJ2HnyyBQfxQCgM+h6ihAPHrBs
	 1dtQ3jfvGTuhamCo2LmNZDPNVieOzAyyQ37cRO5h8Y5WbgTurSRF/Jl3v1poYL0AztQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295174;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l/MGsum1F0rKCDJOx0Lnm3h1ZbNpJlCrv461gxecIkM=;
	b=DNd06CBrazH1OpRJiGvJjX1GwA78xUxB69TTp3do+8lzUkH4VDPhF40QTbeCpeBxw6LE
	 V2cIiR1eiLSYfGqYUwBQy9W3bT2n3Tk2Bp3yls2pW1uGZGjb1rz5BSE+/hEcHPZpBfEth
	 avmSsPqwDB6FtpX/FGWz6+7llEi1o+UHfZweF/UPSf3fNIhvHJ6+DdCyYTDoDllMkkOAU
	 growSy828ipU+BEg9BWNyHJ93PlI1/wUOOafIcmp46YsBZ7yFCWafs3oerOdsfvqAcpoR
	 yVU/0hIAtchXIuzV4ukjFul6+/VARc5obTWRcDcsHy951ob/t0KRt08ZfkZQAVRPfxw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C1221F008A6;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295174;
	bh=l/MGsum1F0rKCDJOx0Lnm3h1ZbNpJlCrv461gxecIkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=E7duKORqOOKx/1pINaZ1ddPsckJlu6/qUKibcDIjYKDBKDOzgVbV9m/oQM9WOJpKb
	 /xe+PpxKJAI/ZdfKGpYrtsSRR60rcBOTkw+e02xzo4yKIRwowxbEropR8uH4NVzg3G
	 chdm3nWxg41lFviMRc44OTGCqLATwR6NX1bpmvMaFHqVnVbEKiCbVXtyYCnhmUUu0X
	 eZ75sxoJ4D/aXDASYuKnWDYEFhd/knrldwR2x89vLuO+UJi0wRRrW8eM7nU3FZ3AB7
	 O9p2rA9Iih/s2kjz1tRZQhFP1Nyq9v46inSSpe+xPyk4QIalGdNOkKDvpabG5VohD2
	 FnEeZpPWZXCoA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 314EF489D1;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:19:34 +0000
Subject: [PATCH 2/3] arm64: dts: rockchip: add the SPI NOR flash supply on
 Orange Pi 5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-opi5-dts-v1-2-582b63d074be@gmail.com>
References: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
In-Reply-To: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295172; l=1366;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=mzXbVS79UzYXahnmbISsnP+6U3ALGoRgMaY2cMlZvTQ=;
 b=+FPgB3ZEYjghW5Ml7ddBaHziBdOTRwx38KffnN1n/XyQYZlugjsRp1Tn8qSkcS7LlTNMbG5D3
 sHX9GaaMPVFCq2uVbkcq5X5/X9aktgYP87pGOcMpRcawR8IDn+HxX9g
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

The SPI NOR flash on the Orange Pi 5 has no vcc-supply, so spi-nor
falls back to a dummy regulator:

  spi-nor spi5.0: supply vcc not found, using dummy regulator

The flash reports JEDEC ID 20 41 18, an XMC XM25QU128C, which is a
1.8 V part, and it is wired to FSPI M0, whose pins (GPIO2_A0,
GPIO2_D0-D6) are in the 1.8 V eMMC I/O domain. That domain and the
serial flash are fed from VCC_1V8_S3 (RK806 BUCK10), as in Rockchip's
RK3588 reference design; it is also the rail other RK3588 boards with a
1.8 V flash use (e.g. NanoPC-T6).

Describe the supply. The rail is always-on, so nothing changes
functionally; the flash just gets its real supply instead of a dummy
one. Only the Orange Pi 5 enables the flash: on the 5B and 5 Pro the
FSPI M0 pins are used by the eMMC.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
index d76bdf1b5e90..d67c876c8013 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
@@ -33,4 +33,8 @@ &pcie2x1l2 {
 
 &sfc {
 	status = "okay";
+
+	flash@0 {
+		vcc-supply = <&vcc_1v8_s3>;
+	};
 };

-- 
2.55.0



