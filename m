Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261E6606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NNoKJGxc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SeSprMLclVOYKhtm/fy8TNO+yaPlltkJIArN4P50gi4=; b=NNoKJGxctarp1l
	vJXZLEXY/DLa2TFYZJKXf5SU6URwJ70gpk8nLhDjCWAoZWhxCabm6rKtnuvRw8Ytpr1NtDl2K+xoD
	1TAf6+tj26wlma2wT7NXMK2xdpKPCUWSouD9orR9r9WoflCJxgAn5ThUUYekaZBDL4GSYaSV3+cSp
	xv0kiqzvwYjWKLUx02zy19rrGUR92bV4Mt4/fegy5eOvvrJwwvI1uoYT0DegJ9nvKXIn6Ujw/TSvo
	w0IqT5BWeICZ89yuNTqHrHjpn/eJZUzGDAPj+2tjUzyh3ulaWzQlGqCeWZdLHJ3mjVZRo7cc2lpa8
	3fgrzGdvqcbF7PUMaGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlbm-0000000A8nJ-0cn3;
	Wed, 18 Nov 2026 19:46:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlba-0000000A8d9-0Kby
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:46:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85DA8639B5;
	Wed, 18 Nov 2026 19:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEA61F000C5;
	Wed, 18 Nov 2026 19:45:59 +0000 (UTC)
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 08/15] pmdomain: Make genpd_get_from_provider() always return on first match
Date: Wed, 18 Nov 2026 20:44:56 +0100
Message-ID: <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
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

The for-loop in genpd_get_from_provider() seems to imply that one can
have multiple providers for the same node: in case a provider's callback
fails to map a specifier to a PM domain, the loop continues looking for
another matching provider.

While technically one can register multiple providers for the same
device node, one can never safely remove one of them:
of_genpd_del_provider() just considers the device node, and removes the
first matching provider.

Use the same logic in genpd_get_from_provider() to avoid confusion.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/20261019160545.GC3705@killaraus.ideasonboard.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - New.
---
 drivers/pmdomain/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 964e44c2f78f1d55..ee8075e90852e738 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3031,10 +3031,10 @@ static struct generic_pm_domain *genpd_get_from_provider(
 
 	/* Check if we have such a provider in our array */
 	list_for_each_entry(provider, &of_genpd_providers, link) {
-		if (provider->node == genpdspec->np)
+		if (provider->node == genpdspec->np) {
 			genpd = provider->xlate(genpdspec, provider->data);
-		if (!IS_ERR(genpd))
 			break;
+		}
 	}
 
 	mutex_unlock(&of_genpd_mutex);
-- 
2.43.0


