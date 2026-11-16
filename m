Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF61606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bC6jJov6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5AJNTn6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KaZt/cWk6Uzq2UjNNzoD9I0L+jy07U06thE4fRQILYM=; b=bC6jJov6LhvxK79koT9IA9fcvn
	/sBqbk12f3/wNks6y1s1nFs6bc0CmsF8HnkQX4NS/9YM0KNR7CkqFVi8jm7SwQSGDSyhbiSLW/4BK
	RlSLdgaUiQU8HPtgNUkku/ETsSLAuVRqygGoX1xdfs/tKZxTqO4vsOp0aOTAOs4nWWNxFKrJ4168A
	wPczjPOzb7R0a1mEabT3Iv8YsjyAftvD7m/tmUMePsilf+SnezLFPuXT1iRjIKEEUXhHCIMWEN5Sk
	YbNkSI+pW8j3yibc8bI/BZvf+LKzhY6noPFtStinj0aiAgoa7xyiWTzlCdz47/ML/3VMIIb+zRklt
	VahMbHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsKt-00000001eOk-16Fc;
	Mon, 16 Nov 2026 08:45:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsKs-00000001eO6-0Hz3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:45:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DC0D625DD;
	Mon, 16 Nov 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794818708;
	b=MPbIWrw6FVxrR6xZ0CE8mcFTcw7W2tzmASHM/oJg1EBprGgOOUMxQkaAmBN8bvzMWj+H
	 OcM5ggFzQ79CaAoXeSwOrt+nssso7pQtlM68JVVUII8QHzTEsjAQ38yiv5TCLAe0gUrM9
	 QvNFLu3HXDa+5RLE+V86PpbbGEcV1biuVNzD0ijVj8PFUkv4lFfnfepQh8qolOLeME/Ji
	 2nuPqCf+i5Xs6HfyYQo7HJLmVIJv4EMD5PUdKnBR3NzCEfb/gtCcne91/0/ZyN1adKaRi
	 4xOs8nedX5rqjJY/wCciJ/EncVP4VOoiD5RuLw2QdM4V5D9K4T30mJ09BH2wMNrxNCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794818708;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=KaZt/cWk6Uzq2UjNNzoD9I0L+jy07U06thE4fRQILYM=;
	b=EAoYJU/ztWxnBgXQG9ZZ9lHAjQeBrca//o2oayAdQ5Qvow3fIzGXTKd+ZMO11UIE6JJv
	 HH+ANb17SPX6dNJw7e8ZlAwET6boDmfbmudOrBxuFZn8t7RGHqGIZIERVNHl3IF39eauu
	 5UHaId8CkTwKxmkCvBbjTM/Wrd5+Wwt8cIHKkv8skwg+k9p7rL/mSo8uN5gjZA89wNyZ2
	 7dbIEpm4ZoicHz8akRcMsKTlV7rjbjXvqfsz+sEd3AYxC8YTerY+GU18un8ic46E1T6D3
	 UvyZxfwfF6IkpcNvcxV2E0Yfj5syilcOrxJ92m5Ax3zj8uTJVtLeoqPMaYMoDahV22Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06CC31F000C5;
	Mon, 16 Nov 2026 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794818708;
	bh=KaZt/cWk6Uzq2UjNNzoD9I0L+jy07U06thE4fRQILYM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=V5AJNTn6EQ9c3HGz1uyTPS1q9Jnc79bab49botWpyaSUqIp277tRXcEvNSQ0d7Kel
	 IOuQC81GhFvR9VcqmGZ74BstC5FrI8gV82VupZ7mjNc+jgwhc//SnLi+HrOWLwnaqu
	 EzViuFhQe01DxVQmxw4GDxF4KZaVy2BXOqs9rX6uInfOFelDUuQBUZE7kSf/4uz+/n
	 EtswieItNLG1+31An50YpTJA/UJwfEwSql3QYlG81UFo1CNAFAVIZmU1SvzTTK9kuD
	 lZH+Ekhk1vyaII3QQmOyEm10ew5PbQG+C+KlFo/2tBaEaqGa63Hd3jYBBHqWWmWVq9
	 9u8BR4LQCPoaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A0F24A3DE;
	Mon, 16 Nov 2026 08:45:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] clk: sunxi-ng: h616: PLL output gate and GPU
 notifier order
Date: Mon, 16 Nov 2026 08:45:06 +0000
Message-Id: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7RgKtRFX3sOwKNMBaoCSthAN4
 e4Cxp3Ll/z/3gKBveUAt2QBz7MN1g0bZKcEqNVDw2jNxpClmRJCSGyVUDh2HbopjlPERkdGKkx
 upJZpwQVs19FzbV+H9lF+OUzVkynurn3R2hCdfx/dWey7X+LyPzELFCipymuSRpG83pte2+5Mr
 odyXdcPKIhKecoAAAA=
X-Change-ID: 20261114-h616-pll-output-gate-c9d3d4a409e9
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Ilya Titov <ilya.titov@wirenboard.com>, linux-clk@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794818707; l=1465;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+gIGBxaGYrzlHRjrte48rjzJCH2FF1p8PLkVsm41dBE=;
 b=rVKKVnQpSRBwsSYWhSWt6F6Q9Vx2Sm9DefvBeZXvuKHQs5alkTfrfR2ty28MhZHTJumt9NjX/
 Jcfe2OMOMbeDgNtTPV1vs1lomIrwci6DsP8VvhzqKi84dy1EDxPKkNV
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch 1 gates the H616 PLLs with their output enable bit instead of
powering them down. Patch 2 registers the GPU PLL notifier before the
mux notifier, as Ilya Titov's 0ec5e7572ddc did for the CPU.

No Cc: stable: the patch 1 crash needs out-of-tree H616 HDMI, and the
old GPU notifier order never failed here.

Tested on an Orange Pi Zero2 (7.3.4 with HDMI patches): v1 survived the
failing mode set 40 times. v2 was not re-run against the crash (our HDMI
no longer leaves pll-video0); it is a regression check: expected PLL
bits, 1434 random CPU and GPU OPP changes under load. Idle power not
measured.

Developed with Claude (Anthropic); I reviewed it.

---
Changes in v2:
- Patch 1: power up the PLLs in the existing loop and stop forcing bit
  27 there, instead of a second loop (Chen-Yu Tsai, Sashiko)
- New patch 2 (Sashiko)
- Rebased on sunxi/clk-for-7.5
- Link to v1: https://patch.msgid.link/20261115-h616-pll-output-gate-v1-1-4cb3fc4d6c48@gmail.com

---
Arun Iyengar (2):
      clk: sunxi-ng: h616: Gate the PLLs with their output enable bit
      clk: sunxi-ng: h616: Register GPU PLL notifier before mux notifier

 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 37 ++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 17 deletions(-)
---
base-commit: 63a29fbb4ecdadbaccd2693864616918698e1e58
change-id: 20261114-h616-pll-output-gate-c9d3d4a409e9

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



