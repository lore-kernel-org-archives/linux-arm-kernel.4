Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A29606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uZ1U/i67
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jbw2FjtWb8yft9KaE0ctkHu1Kex0/HcxtFL//rQWWSs=; b=uZ1U/i67xDTB4s
	db5gXaU9qeyOlYnGnYBsmSbYhbkQOTvgUltJDEVhDCAgjBjiQzSoocwN4Bhifw4l7DSDeVQIO9mr3
	F0jSeP0lH/jN5R0r4pGyUKOR5fdkDWEcSGjRsnsujXigIQoSZ5MjRGxjpBEt8mbX9bide9k9zlalA
	j76SsWPWNNcSiW8Fxhk2vlFSIxo8MaUhV5cM6Q2Y3MRKOoHL9VbfBrDsnU4YTrsTWZhsj9bV7f2Kj
	/CeN8/SkBDgQaEQC7n1P2gqazhbS4/tNRlfew6/BNiD8yMxNLqimpYsCaVPDgBFWt5Z63S90NuJda
	1jWoxSRHLkeUeqIYwUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlc5-0000000A95O-3FBl;
	Wed, 18 Nov 2026 19:46:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlbq-0000000A8sK-2NFs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:46:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 530094728C;
	Wed, 18 Nov 2026 19:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064511F000C7;
	Wed, 18 Nov 2026 19:46:16 +0000 (UTC)
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
Subject: [PATCH v5 11/15] pmdomain: renesas: r8a78000: Drop MDLC name comment
Date: Wed, 18 Nov 2026 20:44:59 +0100
Message-ID: <11c375d15b5073212ca79e11330e422539eae4b5.1795029012.git.geert+renesas@glider.be>
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

There is no need to document Module Controller base addresses in
mdlc_info tables, as a mod_map initializer already contains the Module
Controller's name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - New.
---
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
index 75de869872de9e82..1ace1fb10870f646 100644
--- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -299,7 +299,7 @@ static const struct mod_map r8a78000_mdlc_perw_mod_default[] = {
 
 static const struct mdlc_info r8a78000_mdlc_default[] = {
 	{
-		.base = 0xc05d0000 /* mdlc_perw */,
+		.base = 0xc05d0000,
 		.mod_map = r8a78000_mdlc_perw_mod_default,
 	},
 	{ /* sentinel */ }
-- 
2.43.0


