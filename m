Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5881606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pkbnohdg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ljPX6cKa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gisVbaBWzS2DJvutQXrGbyA0kSo6MCGtMefGtDzFmWE=; b=pkbnohdgqwnITM
	ndtHjjdp45zZAnCr7l44lpY88N+mnw0tVpy2Ib+PQuGp2STjUl/A69zlatSgdLxJh0AxMTCVUMWkU
	iuu6MdzFk9UHKI7xRhyRhmdU5GtlNQwxKFA/xfVycPPAW7hZ9dO++YTAw1Bf0QjnWPuTE8g9UfX/H
	JjFRkWdD3wSShuhLaFGIAju6vpFYzNi97S1SHoHX1fabqNt5u9quowsKUY5g+6Z1/ehX9uZ45nOze
	BkLiAsa/I3+D8kySyoaquHyi92YfLAjwiWlTUGWhvBDWQ6dWvbWfFq6nreAVbSFM9ZfGy4ODjj2ef
	Cm7KPCwg1WCzsVSlY+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyoQ-0000000H4SI-3dVl;
	Fri, 27 Nov 2026 16:28:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWynk-0000000H4C1-180q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:28:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF1304108A;
	Fri, 27 Nov 2026 16:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D93C1F00A15;
	Fri, 27 Nov 2026 16:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796875;
	bh=gisVbaBWzS2DJvutQXrGbyA0kSo6MCGtMefGtDzFmWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ljPX6cKaAwSota4iRpfXSgz3ixc7mnh30WhcMLZLGY4IDA5k3lWT7wh8EpLMlUitK
	 cW1fURRnVv1OEK6n+1qeAu39T9TWlq+YdhGL8qy2/YYryK7gj1fFzbJkfaM6y2nAx2
	 CiwDCMH95QyWl282uWeH6xcxngpER0fmm5UXYaRekMJRVxtLPs0+l5NTrO5MB8Fu42
	 yW4H3Q4hbms8kj7LnsAK5RGluKxZ5d+bH4EwWAggcQbFh8DPWSYxHeI2rvlQH0fUgE
	 0ijElmr+Rx+Gv/VZroY2vIj8ulU6hmtcCSryVUAfojS8Sq0I6gG/MwGNeVnNGkQspG
	 8+o+EP4O7z7OA==
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
Subject: [PATCH v6 08/14] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
Date: Fri, 27 Nov 2026 17:26:53 +0100
Message-ID: <6247d25ea6cd21ce9223c7fdf2d2bd4c9f61772f.1795796064.git.geert+renesas@glider.be>
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

Unlike provider-based look-up functions in other subsystems[1],
genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
the provider is not found, thus not supporting probe deferral.
Currently this is worked around in of_genpd_add_subdomain() by remapping
-ENOENT[2].

Fix this for all current and future callers by returning -EPROBE_DEFER
instead, and drop the no longer needed remapping code.

Note that other callsites either don't care about the actual error code,
or propagate it up.  The latter (e.g. of_genpd_add_child_ids()) thus may
start returning -EPROBE_DEFER, which should be fine.

[1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
[2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
    return -EPROBE_DEFER").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v6:
  - Add more clarification about other callsites,

v5:
  - Add Tested-by,
  - Clarify that all other callsites should be fine.

v4:
  - New.
---
 drivers/pmdomain/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 4e0a76f1f08fc64f..633a6e642b1ba50d 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3037,7 +3037,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
 static struct generic_pm_domain *genpd_get_from_provider(
 					const struct of_phandle_args *genpdspec)
 {
-	struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
+	struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
 	struct of_genpd_provider *provider;
 
 	if (!genpdspec)
@@ -3292,7 +3292,7 @@ int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
 out:
 	mutex_unlock(&gpd_list_lock);
 
-	return ret == -ENOENT ? -EPROBE_DEFER : ret;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
 
-- 
2.43.0


