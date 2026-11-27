Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6626606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c+Gw9bIc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aKn8C8f8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wpe/XInsRMyClo0wZtR891IB7bnYBNwFImpPUyM5/T8=; b=c+Gw9bIcYXJNaS
	ZiNOtnadLnVbGm+ksUyPgflMWHO4UIwkY8LuD7XPe3/pK8pET/N9q3qdtVcKLyDqLmUUZIo/jY9j4
	XzKMwXKYFiZLb8vfXlgCFeA5SSLIPxCrN0A4XdRWgJv7/GD5hu9+HFRfs6MZME3AyAlcMknJU1GSx
	tM+oYS3f05Wjv+jcXgRhvIvS8ZOjgsJJTN4mDfMntuh7BkPtLxqKVmRqOnsDNBN/+9Q6BHUJm+07u
	kFROxVnkLq7rN95QtKse1hlH1r2qQKKiXUtvXxyS9Q77vIhIUaxkv0FfAYUxAtrUZKe60w0Hef20y
	Ylipkzs48WuG84HupISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyn9-0000000H3zV-2cKn;
	Fri, 27 Nov 2026 16:27:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyn5-0000000H3y4-0KIW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:27:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A2A9400B1;
	Fri, 27 Nov 2026 16:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DC71F0089B;
	Fri, 27 Nov 2026 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796834;
	bh=wpe/XInsRMyClo0wZtR891IB7bnYBNwFImpPUyM5/T8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aKn8C8f8YiJZ7VBHVUT4M1yNl1CCoMRjHStdmygBcJ6vgC56+Fq/fzQgHw1lzL/TA
	 RHqixC87trjr8V1otXioNBTxe+VE/Gqi9ETgs969fHg71C2heyJqnIYOo9YAeigjGU
	 BJg3It+XwLYqQj9/iqW/IzhkfXnCuCycNWnbgVnPg1wSVrIQyfLLFs/itoEWG7HnoS
	 HTa/t54yi5Rfh9AnQoIAETqikB8juiJJW0+p9f8pmySdz//8Rh/LFILIx5yhkywUxX
	 FgfJ9L9/04OjR/qDDFm4ybBT4yxbuNTgkpg3D+0mxJk/fweeIMTPyobZ8S5TDhMi02
	 JvO94lLooiDQw==
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
Subject: [PATCH v6 01/14] clk: renesas: r8a78000: Merge debug prints in r8a78000_clk_get()
Date: Fri, 27 Nov 2026 17:26:46 +0100
Message-ID: <7abac4b033081657e2a9870182bc06f5a5a02c0c.1795796064.git.geert+renesas@glider.be>
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

The two debug prints in r8a78000_clk_get() are very similar.
Merge them into a single debug print.

Note that the clock's name is still printed, but its ID no longer is, as
that is purely internal.  The printing of real firmware IDs will be
readded when their handling is added.

While at it, unwrap the (wrongly-indented) continuation of the
r8a78000_clk_get() function header, as it fits on a single line.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6:
  - Add Reviewed-by,
  - Clarify that fw_id printing will be readded later,

v5:
  - New.
---
 drivers/clk/renesas/r8a78000-cpg.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
index 6fee05a899f47bf4..0e11ae139fbffd80 100644
--- a/drivers/clk/renesas/r8a78000-cpg.c
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -62,8 +62,7 @@ static const struct clk_map *clk_map_find(const struct clk_map *map, u32 id)
 	return NULL;
 }
 
-static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
-				      void *data)
+static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec, void *data)
 {
 	struct r8a78000_cpg_priv *priv = data;
 	struct device *dev = priv->dev;
@@ -82,12 +81,10 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
 		return ERR_PTR(-ENOENT);
 	}
 
-	dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
-
 	hw = priv->fixed_hws[map->fw_id];
 
-	dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
-		clk_hw_get_rate(hw));
+	dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
+		clk_hw_get_name(hw), clk_hw_get_rate(hw));
 
 	return hw;
 }
-- 
2.43.0


