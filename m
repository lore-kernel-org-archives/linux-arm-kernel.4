Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9289B606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dyGaL1X6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bWY2U3gE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+Unuck0L/sShMb2nfjdX7eeGNAqWrxqSLL69bQBhGqw=; b=dyGaL1X6JpHFMt
	4RWrQjm2SccRe/lH0cVFFpGgnQbnbEOGV70N4pY4JjWjB3TefmRXtvz/kuQhWhrGR5Nmcz95LzLJr
	8WAU/Mqio1e6vM+W92I0xHw1aG4cscmyAozLQVE7CS5UXGiHw5E3kgc5QTjnUYTIWXYJ1qLoWEpAP
	FE0bWAX41tPm0EC3MUZnbCQoDX7sonkdTKMMW7C0Gx7M0yTJR4ugwBma546MvZQqBGoHnBCQv9qv/
	rx/rSc6EVyrX0jNXZH1QQ65j/9Wq3FBhA1lcT6iYC79yQKaUtZv9wKyZLg+Xxbm2N/5mUQpa7UU4d
	u0wTdQVJypAGIPVQ4fKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWynd-0000000H48K-0g1o;
	Fri, 27 Nov 2026 16:27:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWynH-0000000H427-1lbL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:27:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AAB9C62158;
	Fri, 27 Nov 2026 16:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEA51F00939;
	Fri, 27 Nov 2026 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796846;
	bh=+Unuck0L/sShMb2nfjdX7eeGNAqWrxqSLL69bQBhGqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bWY2U3gEseWVVoDm6cU4dw0hzZLUA3VbMC6dUFrYxdr9bw92/4Ko5DS0PHE5i//lI
	 HHFm4le0C818UBgIYqM7phZh/V5f0tYUfWwsqzEZbsH7CVrPkhxjK/YS93lqtsT2u4
	 E2RiPX/lIJpEThgeLHa9AIyRnxxMUYs79oGzMCj9JDqazp8KfNMc8By3h7OmaDKobY
	 1/LHArKZP0hEgwTvD1ENtVzes5XNV3Q4mf/gcUm1gV+wEjz8O9coTt2ivxosdMTDwH
	 //1tp9U2A11smRSICElNa+KdOxyVVbGDPrV7vd1vihyj8ln6UBglxcaYvVo6zz4NCG
	 aKJ3WEJNPtRpw==
From: Geert Uytterhoeven <geert@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Paul Elder <paul.elder+renesas@ideasonboard.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v6 03/14] clk: renesas: r8a78000: Shrink IDs to 16 bits
Date: Fri, 27 Nov 2026 17:26:48 +0100
Message-ID: <1b18c48f836202147a39385296ce9fecdb91657d.1795796064.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795796064.git.geert+renesas@glider.be>
References: <cover.1795796064.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Geert Uytterhoeven <geert+renesas@glider.be>

Reduce table size by shrinking DT and fixed-rate clock IDs from 32 to 16
bits, which is still plenty.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6:
  - Add Reviewed-by,

v5:
  - New.
---
 drivers/clk/renesas/r8a78000-cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
index 03fcd128d4293cfc..236c638834703f95 100644
--- a/drivers/clk/renesas/r8a78000-cpg.c
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -17,8 +17,8 @@
 #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
 
 struct clk_id_map_entry {
-	u32 dt_id;		/* DT binding clock ID */
-	u32 fw_id;		/* FIXED_CLK() ID */
+	u16 dt_id;		/* DT binding clock ID */
+	u16 fw_id;		/* FIXED_CLK() ID */
 };
 
 struct clk_id_map {
-- 
2.43.0


