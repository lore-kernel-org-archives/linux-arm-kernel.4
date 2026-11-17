Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90277606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WZ82BwQ9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f13az/Gh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QZQ0OLYxSEs5u77Q4Tee1gRSnR0YYIfa5aCuKhvSQ5M=; b=WZ82BwQ9EFyzwP
	JsZlF05mXeADru5bRn96HgUenrNY8tEhff+GL0SpajzacOfYpnB9T141VSROpbogpYCx0fopEXlt3
	pXaolSyOdsgbVOZ56tnWIpFB7rDzgErYqCBJvaDfWdqRxUZhgKTVR3tOThML6n8DG2DTdcjDLMEAW
	3MxcQGxCalHMj9BCz/F1N+3iWRUGvWEsNP7BCXjH3kvWffl9efdtZk16xj6yj31mj48lr4BdBL9Dz
	mRP5P3VSpOFdTHZobUJJhnjVIRxaezGjVsN6V4aDzAIPcXm6kK3lrd1FkmJN35y/BTYq6eFMuLks1
	8IxXbIJlswtiqitLDuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHG-00000004i4q-0eH3;
	Tue, 17 Nov 2026 07:06:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHB-00000004i1a-3vlh;
	Tue, 17 Nov 2026 07:06:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 636F243EF7;
	Tue, 17 Nov 2026 07:06:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794899205;
	b=qIGp2rUsyhr0ThHnlHW0KgrzxOGqgC+1YmzZ/aY/tgOfFUKMfHd2U/c5Ipx5iY326TUQ
	 vZeVQqzaNxM5jnHza5da89FU8fdF8Q4todtiiZMBFarXDcGpQeibmFJ4wxrFpNyQ4rDgg
	 dXetcCY1FZXpT/fgrqQxdJ6xGGHRdm7VUyQF5TPEnyGXbyntweW8EW5fmWTIe1/YskG0o
	 vKsrkcQdtdFq4OiIsGLjAPzG3OkRjG48RWxv1w8MY/fSe/Ir3iZD5n1WpB3bxRMolSxL8
	 JotrIoN8af9UxpO+jXd6d0WZQlgGIZ226Rh15ZYldfE1o8VFYlqjCH9H3ZuUtcBIXWA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794899205;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=QZQ0OLYxSEs5u77Q4Tee1gRSnR0YYIfa5aCuKhvSQ5M=;
	b=SMrYC8/Ckf73N8Kku6V3sfCJD2vfBs5/Kx149WHEVEtJVRY0Da0sqO/9UpnTaHfsXe3W
	 fWyfHsz3YfJKaznz/UtUBT0h9GgUSWAFKtoxZoHz8fbRM6zjH1FOcaagrXRM2YzgOC6Ls
	 n6U3+YbEfga98pyfxMcjxxkoBv0AHP6YdGZ4Bou6C2oQIb9/Mm04KHgeIesh9hWmdQAQo
	 rUg0zYQGX9Lg6nMhps/q/W2Ky0l/kvT2CTXcm+OEr2ctfYk+N2gDkZ9HjkDQa5NSWv4xR
	 egNJxMtlpafWANATIQvm7QyGN/3arQhIflyVZm1BBV8l5VsZ1Hsb6kxm+/e2nRtxMuw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF8111F000CA;
	Tue, 17 Nov 2026 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794899205;
	bh=QZQ0OLYxSEs5u77Q4Tee1gRSnR0YYIfa5aCuKhvSQ5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=f13az/Gh0vZ9uxmidW8OChESFp3xClYqPgR4PZzyUWmT1iajWFxz/GEtx8gVNTZaF
	 WAgST49bfQ3TrKgmqQKeRNGXfQ4/Z/kJTAThZPxf0G4KftlDMEFUiub/glvj6QQSFb
	 f/kkbb6LvrD0aGsfCcyQaFR83MBmco9vHUrEMwWcjLUIBZ5bpIzY7/H3m7iXMJdUkv
	 uSQp58EASgG1GxAKRPZNOK2Cu5p/uXuOZt9k/Er55B9KUkoDTD1vzt0cMPuIfSX4n5
	 oAR/GP41QmQcAn3bPSlHzM0/xdgJwf0XKSLnByfXAHauZDg+hNCWvTonL34WAXicTX
	 I9zgcEM8XyiyQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6FE924A706;
	Tue, 17 Nov 2026 07:06:43 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Tue, 17 Nov 2026 15:06:23 +0800
Subject: [PATCH v6 3/4] clk: rockchip: Add composite clock macro with mux
 table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-add-board-ok3572-c-clk-v6-3-cabad6610c5f@qq.com>
References: <20261117-add-board-ok3572-c-clk-v6-0-cabad6610c5f@qq.com>
In-Reply-To: <20261117-add-board-ok3572-c-clk-v6-0-cabad6610c5f@qq.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794899201; l=1536;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=ARjPwse4rOa3gyvTIyxk5QA6f1wP4DKLCzCn6mGIImM=;
 b=xZ9qFKy/b0fySTvvtwuPXLE+IiBSlXcZW0oooIqLCqhlK9LPOqBQzvvnLY76ikoqyHGoHBHZ8
 JYXR9LKGRPfAsNarDIWdS92UKxWlnKrj97c1/ZL92+vErRLTHOxlYyP
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Elaine Zhang <zhangqing@rock-chips.com>

Some Rockchip composite clocks use mux selector values that do not
match the order of their parent clocks.

Add COMPOSITE_MUXTBL to describe the parent-to-selector mapping along
with the divider and gate. The RK3572 audio clocks use this layout.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v4:
- Split this helper out of the RK3572 driver patch.
---
 drivers/clk/rockchip/clk.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index b89165ee261b..7bf242410f63 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -871,6 +871,28 @@ struct rockchip_clk_branch {
 		.gate_flags	= gf,				\
 	}
 
+#define COMPOSITE_MUXTBL(_id, cname, pnames, f, mo, ms, mw, mf,	\
+			 mt, ds, dw, df, go, gs, gf)		\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_composite,		\
+		.name		= cname,			\
+		.parent_names	= pnames,			\
+		.num_parents	= ARRAY_SIZE(pnames),		\
+		.flags		= f,				\
+		.muxdiv_offset	= mo,				\
+		.mux_shift	= ms,				\
+		.mux_width	= mw,				\
+		.mux_flags	= mf,				\
+		.mux_table	= mt,				\
+		.div_shift	= ds,				\
+		.div_width	= dw,				\
+		.div_flags	= df,				\
+		.gate_offset	= go,				\
+		.gate_shift	= gs,				\
+		.gate_flags	= gf,				\
+	}
+
 #define COMPOSITE_DIV_OFFSET(_id, cname, pnames, f, mo, ms, mw,	\
 			     mf, do, ds, dw, df, go, gs, gf)	\
 	{							\

-- 
2.34.1



