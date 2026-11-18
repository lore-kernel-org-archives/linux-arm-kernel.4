Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288B8606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b1gZhQzo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+aCpfT9hXykgb7HwKIuZi82drA7L3aK5mwGRy+xyKWA=; b=b1gZhQzocqZYKz
	7gHB5ng84MWdlqFeExsMb4IfBpwelHEY1ZSsD+qrC4sxVEFgiRG7vjZIsa3ONmpV0/M0V0FOoW2xD
	vsDBJDcLTshaiD0fW29yGrZIMft9y4V1uJOZSIfNZuYG3tWZbi3yMiGkQkOmJOqZMmq1OVMFlu2R0
	WphbeC282XkRWRf5lJwhlc6YEzFKEvxGpQMpess0NNzE3Wk/O8776KFpQXcu5qpO3k+VJfXJSLHeX
	C58HwQKd/YMsMdn2m84u+Y7O4QuqoAtWv5ymSx9mvg7C7KNB8CF/PM6Gqfp+bNJLNMiGj6oNSGKCh
	gg4hwITPj9VzZRjr0KGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlc6-0000000A96H-0hDM;
	Wed, 18 Nov 2026 19:46:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlc2-0000000A91q-12xc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:46:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC1F5405A5;
	Wed, 18 Nov 2026 19:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6031F000CC;
	Wed, 18 Nov 2026 19:46:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
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
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 13/15] pmdomain: renesas: r8a78000: Shrink IDs to 16 bits
Date: Wed, 18 Nov 2026 20:45:01 +0100
Message-ID: <72f8eae23faefaa169cff7a52cdbafce2cd50e1f.1795029012.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795029012.git.geert+renesas@glider.be>
References: <cover.1795029012.git.geert+renesas@glider.be>
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reduce table size by shrinking hardware module IDs from 32 to 16 bits,
which is still plenty.

While at it, use u32 to store of_phandle_args.args[1] in
r8a78000_mdlc_attach_dev().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - New.
---
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
index 6477abe64511e880..733bf68dab2ce6dc 100644
--- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -17,7 +17,7 @@
 #include <dt-bindings/power/renesas,r8a78000-mdlc.h>
 
 struct mod_id_map_entry {
-	u32 hw_id;		/* Hardware module ID */
+	u16 hw_id;		/* Hardware module ID */
 };
 
 struct mod_id_map {
@@ -148,8 +148,8 @@ static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
 	struct device_node *np = dev->of_node;
 	struct r8a78000_mdlc_priv *priv;
 	struct of_phandle_args pd_spec;
-	unsigned int id;
 	int ret, idx;
+	u32 id;
 
 	ret = of_parse_phandle_with_args(np, "power-domains",
 					 "#power-domain-cells", 0, &pd_spec);
-- 
2.43.0


