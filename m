Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6425606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gUYshcpV;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BPIPLQ8l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=; b=gUYshcpV7LLLdm
	yDzEtSAeG4diFcgGMe9LEvoNT4GtHQ9bFPkKkjW2vhdMYAy2qXxRJDZpSJ/sqQMMXphwjLEwk4prJ
	4YJKQwXZs9wVIGQ96AuAg3MAkGvte3zcH7lt261494BhKS2p4nocphCaudsjQ3704Q7BTtz9zRsm/
	RPZdVIlE0LGTIVC1H6owsa7bQQtD3XYr+PhXyqnwgRsOI83Mhjv6Q7/ZOvIE8n2wijUpr1AwpGk3+
	Ej36CS6Tt5YsiRu7W+ttfCSG4as7Od6b40CtBXNDSNsY24k2SIQXVmJf5cEpPR0rJqV7AuOx8szF9
	FT6KuANGR/XYDNs42sUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOfI-00000006q6p-19fo;
	Tue, 17 Nov 2026 19:16:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOf5-00000006px4-0yHN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:16:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb61185057so1922605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 11:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942969; x=1795547769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=;
        b=BPIPLQ8lVm/XHQeFobr0WNGXsmLfz1IEU7mGxTcHbS4WlrrSdinkTO09iirlu5RaQj
         5RCLWZ34OFZYj6/fTSf4ZxJ1cfElnR6mF505lc42Re9m1DsRsC95VUNu03muqSU6eAtG
         /D0t/LLHb2EzJCWele8u8dr62qbIHDcmKRg7CLfjumSwo0o4beoRTUt6neF4vipfh8bv
         q9o05aRHGQlfW25ZEnR/MYEhkYuaReCqLLk6XEYq6tNdorar1CrgsO1kG47JIbqh+cvf
         G/syAvc3m2/FXNecRw4Q9CwX5zOefJrflnI+SrnsRSPJF2SZxaP+kOJv7Zdwit/X4J3s
         74Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942969; x=1795547769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=;
        b=ZaoGJ0/b8D1tuurVZcPzobpN4cnvOA3Dlk0CQqasJ5eNmOOwRqjnJpEKQdmumDgrt0
         FKFJmSAolj0Sdt9AukkSKVrEUVm80hkpAKiQkcRjkoCxu8Q/O/Bx3FTm40w+CLC8CYp0
         o7+0bOx7bBIxY2WC/sMWC0kjHmmC7495SDTAR1zDptVgwE+GScYRTArNLyQfWvZz446v
         lp6dWiEtN9X0utdmqazO9zGZUrcFXYHfQIto67NJKDAvFW/MP1WSMzmHeflNgFFzWtTs
         dofWJhH4qgXmylWNFkIyGV3FiU1HscW+tbzSGi6Oywd7gLxyCi8tEWp56ILNIsowAEE3
         vnow==
X-Forwarded-Encrypted: i=1; AL+hErEwIMiXG/4f4zfeOPCut2nrK5HYh5J1rtYO7phKSU1hIQM1qB7Rxaqgqh1DjRF9mb9KSC9ct1RqIq7ow7o5blTn@lists.infradead.org
X-Gm-Message-State: APuU4Z8WPEYKZZOVUVuA+6X2SO+m+DuevPUwg/abjv38KRnoK6CycvNW
	S0ZYjgIk9ybzxpI4KhhTpniSpxBEgLCFqHXTjZfGPd46atQQcAMK5oxLY7IH+88MR7s=
X-Gm-Gg: AYBFou2i3cmGKwjo5HvNLPN18bbzoXEpZvi4L4UYNxMb+xdv/yOw5tDMkQwmgq9aJM7
	31g3O1FwwtzfLpmsstPtaeNSC7d4PlW1m/fg/vm6mSf7MxBkPfjFCWpyqYx0HidrnBJiG5hBFc4
	H/gmwNg32qAlXIZcE3ijMP7sn1JOA3Yp7F3Ydomzh/6v2yhNQkhIpeEpP6Ub+pRz1WBkwFTfnZ4
	3KawQFP5VRXk0t0kStx+D60FEGAtuKPBtZgMkastJI6eNtuwqBmFIVv1DB19EC9u6Yq0dx3GzfO
	yM8yvDssK+nisLi0lc08GpfIlrpV5Nj+jk+OrOgdxzjMGDFfen9y4CupJ3ivZKe5h0+v6XeMBoP
	ZQNsy4dwd1iBs7yHfC/I1FMTGAnzpOBODu5j9JeUGLfNfRudJigNVXaQx8G1KRRUAtUw1XuqJhl
	MQd9rehoHWQQniafewwox4xgN2PEnucp1u8qXiuwumhJpNDWk3Bz4XgtT+H+zVDdIvzunpwuOr5
	Krc3xs2KSokFOGPbc4zQAJSP5xKnPD7V28jSkKDeW0aE1p+56cmPytJapoZYsXjAAu0Qz1d9Q5k
	sZ823438PbuKaRz1MpdAGYF1kTz9p1Ki3t/mIUo6ALNYNWQlP6H/E6q0
X-Received: by 2002:a05:600c:8b83:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb7da55745mr2432765e9.27.1794942969381;
        Tue, 17 Nov 2026 11:16:09 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:08 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:03 +0000
Subject: [PATCH 2/3] clk: mediatek: clk-mtk: Add composite mux tables
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-pwm-clk-v1-2-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111611_288332_D5E8B543 
X-CRM114-Status: GOOD (  12.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Composite muxes register a generic clk_mux, which writes parent index N
as register value N unless it is given a table. struct mtk_composite
cannot pass such a table, so a composite mux cannot describe a selector
whose parent values are not contiguous, such as the MT8196 PWM source
selectors.

Let struct mtk_composite carry a table for the generic clk_mux, and add
MUX_FLAGS_INDEXED() to declare a mux with a table.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mtk.c |  1 +
 drivers/clk/mediatek/clk-mtk.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3dfdd3a422f8..b426f7a36e68 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -239,6 +239,7 @@ static struct clk_hw *mtk_clk_register_composite(struct device *dev,
 		mux->shift = mc->mux_shift;
 		mux->lock = lock;
 		mux->flags = mc->mux_flags;
+		mux->table = mc->mux_table;
 		mux_hw = &mux->hw;
 		mux_ops = &clk_mux_ops;
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..c7822a8d015c 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -93,6 +93,7 @@ struct mtk_composite {
 	const char *name;
 	const char * const *parent_names;
 	const char *parent;
+	const u32 *mux_table;
 	unsigned flags;
 
 	uint32_t mux_reg;
@@ -161,6 +162,21 @@ struct mtk_composite {
 		.flags = _flags,				\
 	}
 
+#define MUX_FLAGS_INDEXED(_id, _name, _parents, _table, _reg, _shift,	\
+			  _width, _flags) {				\
+		.id = _id,						\
+		.name = _name,						\
+		.mux_reg = _reg,					\
+		.mux_shift = _shift,					\
+		.mux_width = _width,					\
+		.mux_table = _table,					\
+		.gate_shift = -1,					\
+		.divider_shift = -1,					\
+		.parent_names = _parents,				\
+		.num_parents = ARRAY_SIZE(_parents),			\
+		.flags = _flags,					\
+	}
+
 #define DIV_GATE(_id, _name, _parent, _gate_reg, _gate_shift, _div_reg,	\
 					_div_width, _div_shift) {	\
 		.id = _id,						\

-- 
2.43.0


