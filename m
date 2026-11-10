Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6008606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2gltqloP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V3X1yiNX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uVHJ66IBAZ9HrGJiF0rEsb3YQgbuxpQdp8RZ0wE379U=; b=2gltqloP6KCElY7UDhj1XPx9KH
	YsASYRr5Uwgv3KLC3ER4OctUBaoi673d+Df5OGI+YSWYl86tFQ3iTRDifpy1MYtdXY2A9PtfLCqFO
	Ir2NT6PlNhKfCEezBicqi4BCTtzDU09vwi79Sjd+6GoFSzpCyJhnzHx4/AgBOF9FxdEa5XaOWl+tW
	xnQpmLA4WPxTW401dyZIgcNVdjjGDqIszP4Mh/Xnd77+XAqFi2TfUu5ay84Y673eubUlM0Enk5gdf
	tBeLJM+Zbs9bnR/qWkfTJquaY3BZiX3fHT+aY0hF9xUDPUT0h+E4YE/iEm/bh6sj1xdAvpfm9LfHO
	VKqUZosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQewo-00000002aeM-3oYQ;
	Tue, 10 Nov 2026 06:03:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQewh-00000002abb-2yMp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:03:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CAE8863756;
	Tue, 10 Nov 2026 06:03:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794290582;
	b=PLZJA4EHGjmTZlKo5teAVw7+xilqfT0j1T8J6+iVqAMXAD+8axGoZRy3THBDHExW0xrb
	 GsS+aoQqqoe2U6/PDO/Z/VLp5aBULe693rVg/6HVRVgDnVbDTHSGzQL606LihF1lBylNh
	 ZzWlk2M1Vxdmh5KEtl3Z6vIV/fZH9qFQaA72uS/TanjvCz63CDtWA3QFEixC3VlITo3hZ
	 TDZQ5z8/YFZFsaDzc8/QemMq7bUUs8VKodPN2fcK5Zeb8hLZSI8OWhgJx8s37nphCTPcL
	 rqIm7u8whpXIfVlGLG/DWrhRhj5SLJOt+j31UOJGjWdIVXo8gCDuin1lwdiVRaK8ehA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794290582;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uVHJ66IBAZ9HrGJiF0rEsb3YQgbuxpQdp8RZ0wE379U=;
	b=KPCyhNQWmjcrA7Em+9ab1psolLWODajrDgwzp/0QK+sOAF5I+AAQBGydsRHVvIgODKp0
	 79DUOWYewzu2cJ/pjYrXdmdiSr81bClF/zdZzLoItTtNQI6FOVsOWsytGL/RoKCQX5oLM
	 NtqoCDq2j5TKICZN0LA+GWaMqoVTfcVcyNx9CWbe02gI7yFjpvwbU765XeyMfV2Ehsizm
	 Sy5EouvdPgfLmUv79rs/M3sr9jeNPNfAOpeRp7KlCyZLSyYCjB+y5q4sIupEdbhCjRWGw
	 Ar59Wurj+WV/gBQngQzsErhucReOuCezKrxXSby8bEnlHAtJAZscuiTgkG8U7i/5Eag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D6271F008A2;
	Tue, 10 Nov 2026 06:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794290582;
	bh=uVHJ66IBAZ9HrGJiF0rEsb3YQgbuxpQdp8RZ0wE379U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=V3X1yiNXqYniAM+eRk7KLMipxr8zp1mqP83OdHaWqwq2wTuvdZ3Z13WguUgQGj+Tb
	 6qvb+TNWLmzams9edQjOiibqduNWX54R/9InWAQyZdEd/jNtDqSi24hxZ/ngMUiMWT
	 92A06YppjPhHuSRb8UYjpt4DdQtPz11fB4Kii5CSR8AJprkkAXLL7AecqFVk9K0J5F
	 2GukO6GBr0YhbZlR5EIt2KafKM+dTAsGX4mDCWL2btAAV20T5RugboynKxfOJQVmTb
	 RTP6Zkwfpc9MemxkcMxbeQWAY8iqiMNhv+LNgfxZqXCvVLhslwYAHr1Ga3BPTZ9W8f
	 KaD425rLoVtbg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B2F12488CC;
	Tue, 10 Nov 2026 06:03:00 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 06:03:01 +0000
Subject: [PATCH 2/2] clk: sunxi-ng: h616: Let the S/PDIF clock set the
 audio PLL rate
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-h616-clk-emac-spdif-v1-2-e5e36e8963e4@gmail.com>
References: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794290580; l=1435;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=uVt5p9JtVDMkgUlUZbZagSzjVS3EEVHXWn6aQwkqLrw=;
 b=kyMvMV20BqetCpzD8DhhjOaPMNYBc6IvDDTj5ZZGpdi3HSJMYV5oXMWuEqnn44dsbYCkeVEBP
 oquoJsXrKj8Dp4E5xE8a1X/8YjlP2M+IRWPHyU1Gt919aOwQnKRLddx
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

sun4i-spdif asks for 22.5792 or 24.576 MHz on the S/PDIF (OWA) module
clock, depending on the sample rate family. The spdif clock has no
CLK_SET_RATE_PARENT, so it can only divide down the rate pll-audio
already runs at. Unless another audio device has already set the PLL for
the right family, the power-of-two divider rounds down and the request
succeeds at a wrong rate: about 12.3 MHz from the reset PLL value, so
48 kHz content is sent at about 24 kHz.

Propagate rate changes to the parent, like the audio codec clocks
already do. This is the same change as the one just applied for the H6
[1].

Link: https://lore.kernel.org/all/20261104185027.883011-1-jernej.skrabec@gmail.com/ [1]
Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 CCU")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index d2625fec651a..f703d690a563 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -529,7 +529,7 @@ static struct ccu_div spdif_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("spdif",
 						      audio_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_SET_RATE_PARENT),
 	},
 };
 

-- 
2.55.0



