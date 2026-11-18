Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A16606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 03:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bidw3TZ4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAmuvRO0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=W1b/vpjXN8C9t9fKqB2jfvx8t9qyI65mD8KatIp/OZo=; b=bidw3TZ4HQQ6EcE0vD8jq1nX4i
	6Pd2Tw/a0lZCxUNCZhuShaqsk3+8qllYp2Er8wbJhZWtU977o9AlAmkWm8B2Y5B0I7RI3wnTW6vkw
	8/xpEp/fi6W/DFjrT6wQ/1UWfGt041FmaO/3ZQVIMe7taa85Cli72bRhpY1vsvtff/apIpGkpkRBZ
	3i2xzDsNOTawWsk4tTsV8UQBt1P+Hn5HRaaMEzcta5DI7v4zOuQ6Dsp4qeEtE0fiaddRo/bdQcA2D
	UT/1erLtBA3r9dgILYVhN3SNURkHkdxssjcO+bf3S5EmZ3oZUU0xTgnHcVCf1UVf7NmYN0giiMgvN
	9Vn2B3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWmA-00000007g1w-3Ltl;
	Wed, 18 Nov 2026 03:56:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWm8-00000007g1m-4Awu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 03:56:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F24F60DF0;
	Wed, 18 Nov 2026 03:55:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794974159;
	b=e5/YsxtSAl3YhMrSk/wd+/C1calzNb6HU4kcdBTEw0T6fN/n6Ld05xcMYq4wsLlzsESQ
	 fOTAeCzDqbFxqKL9p65Ad7VQsuT+4elu/gQy3nmEwlIs0RBRpRoxBFIEVzqa5DMAb7PGe
	 +euaYePlHVNxsjzEAIS7Ot5W/f5bhGz253349hf8Mhqw1zL1AWic5Sc3FMPzSaHaqbcsl
	 GV4VMfnxDC3sdPIzU17iceN0bLFbm1IVvCp0rHDAbPQno/ExGwwvG3hlWXZj73f+Up21/
	 TRDs1PnDlpcDLfhmcfag3WZmuKAoqR8fbD7B1ECU2FScrSpTvOhJVgEguUopq3bkABQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794974159;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=W1b/vpjXN8C9t9fKqB2jfvx8t9qyI65mD8KatIp/OZo=;
	b=dRWmT2hgPQ3Vdq4/sLXS97Zgelcdzfd6AWBy8PkL7fBuWEVf30PSylJ75sm7ZEfujPPj
	 LE46RleWXV9koiLe83LOCRU3JQUjYO9cKUM2QpA1KDqe6deMkYFCSm6v4dMfgRT4Ruc8b
	 1xCOAH21SWxO+1ZxpwxPk9C8UdGF/YpQdjDl4tA9sOnbjGoZ1jmyfnWv3oKAYpK8xb5b0
	 6g5C5Q/PLDn301hR41HXAEZlUddCzezZfmKayDcPhKjCAekDpt9Urfuka199owAwTcoN2
	 +v/QIjERjsg7llcKW+kdRv+d2/lAmbvGtbjUA4UVtLbqTa+vyb1aITrnv65X/BXB+2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B611E1F000C4;
	Wed, 18 Nov 2026 03:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794974159;
	bh=W1b/vpjXN8C9t9fKqB2jfvx8t9qyI65mD8KatIp/OZo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=aAmuvRO08r3U6fKqiJ7cc2J1yxMP1Ryniv4w1vBwYsCVeYL7yAqEcB23m5Vk8Qecy
	 XFom66Fk/Mf0oyW5CFUe2OrvUtLtnP3+Ukug2mcD2EDiMRAS2Viziw7YqToUndfoh+
	 QHBA6SyWSjUc8Xx5g1IadIEjoZA3uoY+bUavSsg0AyL6W1DRwyW6KgKa3n5RDimqEd
	 26Ixos3Fmln8nIhikMnQKxi6vyiTZrrtxcD13c4hAwGfClrQeOXpOhwqf5Xe4S6lVh
	 Wdya5obP77t9TSA138bZT7PPml9f+FmXIsyp0ZRuIYBHf7NFtE7Ui4X5+Fh4ao2IGd
	 5qsQswfw5Vgdw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 154384ABC9;
	Wed, 18 Nov 2026 03:55:58 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 03:55:58 +0000
Subject: [PATCH] arm64: dts: allwinner: orangepi-zero2: Read the SPI NOR
 over two lines
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-zero2-spi-nor-dual-read-v1-1-bcdcbf785be0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNUQuCMBRG/4rsuRvbyBUS0f8IH+Z20xvpbHMSi
 f+9pUKPB77vnIkF9ISBFdnEPI4UyHUJxC5jptFdjUA2MZNcKiFEDh/0TkLoCTrnwUb9BI/agjr
 kWlmUOZ4ES+/e453ei/lWrhxi9UAz/HTbwuMrpuSwzliLIeglWWTnraiWVoidImhUwn9ylMABu
 VEKq6NAya91q+m5N669sHKevwbesJbdAAAA
X-Change-ID: 20261115-zero2-spi-nor-dual-read-645a6de25e81
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794974157; l=1356;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=azsGory18NjrLZMbFK+fhx8bhUeiwb0w4jtTyXOp1s0=;
 b=m180m4A6WLT+kJyz23ClvGlYswZxgc9As93hAgp5fKtYXJeB/FchFqqzONmKShqEBxtX3Pvm7
 5EFnJiBr/UxAFBEGtfj77F7geCTkl7SG03XkW5QUEsvFcmgngCX6CKD
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

WP# and HOLD# are tied to VCC (schematic v1.3), so read over two lines.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Needs the spi-sun6i H616 dual read series v2 (prerequisite below).
Tested on an Orange Pi Zero2 with it: 1-1-2 reads (opcode 0x3b), 2 MiB in
0.28 s instead of 0.52 s, identical data.

Developed with Claude (Anthropic), which wrote the commit message. I
reviewed it.
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 90c25e12e189..fb117116002e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -150,6 +150,7 @@ &pio {
 
 &spi0 {
 	flash@0 {
+		spi-rx-bus-width = <2>;
 		vcc-supply = <&reg_aldo1>;
 	};
 };

---
base-commit: a203a4bac3316451a3036653657c8b250dea2055
change-id: 20261115-zero2-spi-nor-dual-read-645a6de25e81
prerequisite-message-id: <20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com>
prerequisite-patch-id: 28b145097d0f859e5bd27bcc5028d0915f3ba4bd
prerequisite-patch-id: fb47570beb53613acb42c518fd1999e05e0c54fb

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



