Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231ED606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aVS50SP4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhp9c2yU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gv8PhnTxQshnVsHq1WRH0056hDjCiBtjwxhfJXvGKAE=; b=aVS50SP41pY4aR
	bIJzaFjuSS6UrryQp3DJO+ciU71gDMNGEXvDP80/Wg4Yqm2yrrU3BH8BpagIgYUIQdoXIT7jR3atQ
	utcUjEtzzrzuGWF/CzvFrI+AL2dXdlyq8wtk2smjQ7MnU+iEB09voPhlddRu5Xrf8Xs0ikuXmGYNH
	TJNWENx0nuNNfg8NOFCtcMAZ8Qc1fzt77e8ShgZaG34mtmCCm8DklD3AgH1uOrfKtnYNcHtp4omuI
	6lPk5iEHA9o0orwvY4pY3mACQCV5CZESuQnZ2Hw7VTPczhd/JnmD8rDwDEmEpKVhJcj/DQFWHxg/f
	iIEa51jUk1ygZf9nhtSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg10-00000002lfO-34J6;
	Tue, 10 Nov 2026 07:11:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0w-00000002lXw-2c11;
	Tue, 10 Nov 2026 07:11:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB6B36355B;
	Tue, 10 Nov 2026 07:11:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294689;
	b=TXKeHNeYGTx4GfFztL5n1gTglqUksatWKi2vaiB2RMYbX6OHjVc5tSOPfzbdrjz/3VjI
	 RgdthXcF3uUax7JmI6nhu8aFNaWADT+fA16ezwHtlfmu9KfZcePamqfY60h1KjOYyfX5f
	 uiVVvx4wZk+YAG0UxT+a4dd1gMxkQNfgyF5Ybi3XTACRqvWPTtI3FUecqP2R22IsBXmbY
	 2lRlH4VGEH2bDj5wnM1siBf1SzCQYkT8fsLk+KEHzRhgDlnox/kSVrWdWlWQ5D9k2Xpoe
	 g+ll+EaUUku43eaOrGAgmSFhNABJoS79aaVGodGGF4KXNpCsq0OOsIgQLUVy2xIrNuA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294689;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=gv8PhnTxQshnVsHq1WRH0056hDjCiBtjwxhfJXvGKAE=;
	b=BFiVL2tAruQ4qP3YsD8gUETzww9aIPc26IZ2NizZvBZMhYn2sgIaii9d6TFoeBQBcmpx
	 ofiMJYERsiV9goakbE8d04ZAODrNgA0FObE4uL0DGk8oPNphPLcsRBsy72JQFqYrC1poI
	 U9qoMH2j2jmINV99HSznCg2PKuwXwohFrMtJt0jZdNPwmNqQzjIoUuuU/eOHezn6YjcHn
	 0KQGu7UR9XQ5QVDwRr4XmGjE/THcFVcvAHXIs2UohZ6vKGBsdzIsF2MhDL9sWIWr/yPYp
	 NYabg1iYfNVBmuI5cDMDPFdy+5DvJVBwvGX6oUtc2Bz5SHnZ8zcLUKRH4wJ9jpn/a4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 912491F008A1;
	Tue, 10 Nov 2026 07:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294689;
	bh=gv8PhnTxQshnVsHq1WRH0056hDjCiBtjwxhfJXvGKAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nhp9c2yUvXjcfEFjHw642b67IhNMOHjUnTBmysAfWkFq7QUPGtZ6QHQd4eKvaZtSD
	 vyrC8NYvJmIfY0Qu091aawPAuYxtmohGDjrAwtU9bKGnrh2c93wEnEM3KGBpstYHiz
	 OC+NsOkpf/LC9uYCD+YL6sJZVfZQQ58yCJQ2MtygWzQiuezPs83STeNoraabmp4QZC
	 L3pJULkPKXA8O4H9jW/22Ke7iT+txu9FX42WiKxAxNQ9SXjToeZqjCR+uLD2BGrR0T
	 Y0OrPCSm0rz9GN6J27i7NsYqAfB7mmsnngcJfSvhoOsk2Sm9p1YnvK8UsSx/v7kq5u
	 fXuplUyWKJWYQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 24CE248935;
	Tue, 10 Nov 2026 07:11:28 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:11:28 +0000
Subject: [PATCH 1/3] pmdomain: rockchip: put only the clocks that were got
 on error
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-pmdomain-rockchip-v1-1-6b9fa6ebaa86@gmail.com>
References: <20261110-pmdomain-rockchip-v1-0-6b9fa6ebaa86@gmail.com>
In-Reply-To: <20261110-pmdomain-rockchip-v1-0-6b9fa6ebaa86@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kevin Hilman <khilman@linaro.org>, Caesar Wang <wxt@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Pecovnik <igor@armbian.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294687; l=2026;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=AWNB6l2jcN6MKFzvoLZq759tpOEfOEsNFO9JurbdzAQ=;
 b=QHMOwsrRbvV+Aiyiv88LewtSOVi1XCHYN77Ad7CvvDlcYGBdCa3/ygAp6IkD7/C+5oDlFjjQP
 0VE1cTPmxj8DkLfICTZ3ADwT0hxogSj8xwSNuZv7TaJmgf4qpSfzCAv
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Pecovnik <igor@armbian.com>

When of_clk_get() fails for clock i of a power domain,
rockchip_pm_add_one_domain() jumps to err_put_clocks, which calls
clk_bulk_put() on all pd->num_clks entries. That includes the
ERR_PTR() just stored in pd->clks[i] (clk_put() warns on it) and
the NULL entries after it (harmless, clk_put(NULL) is a no-op).

This is hit when a domain clock is not available yet and the probe is
deferred: the first deferral triggers the WARN_ON_ONCE() in __clk_put(),
and the failure is reported with dev_err() instead of being recorded as
the deferral reason shown in devices_deferred.

Put only the i clocks that were obtained, and report the failure with
dev_err_probe().

Fixes: d8b384777066 ("pmdomain: rockchip: fix clock leak on domain probe failure")
Cc: stable@vger.kernel.org
Link: https://github.com/armbian/build/commit/814ab46114eb18832e18d1f94f2d279680a308d7
Signed-off-by: Igor Pecovnik <igor@armbian.com>
[arun: rewrote the commit message for upstream]
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 6eca21e0bb12..3b39b231ca0e 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -849,11 +849,13 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	for (i = 0; i < pd->num_clks; i++) {
 		pd->clks[i].clk = of_clk_get(node, i);
 		if (IS_ERR(pd->clks[i].clk)) {
-			error = PTR_ERR(pd->clks[i].clk);
-			dev_err(pmu->dev,
-				"%pOFn: failed to get clk at index %d: %d\n",
-				node, i, error);
-			goto err_put_clocks;
+			error = dev_err_probe(pmu->dev,
+					      PTR_ERR(pd->clks[i].clk),
+					      "%pOFn: failed to get clk at index %d\n",
+					      node, i);
+			/* Only the clocks before index i were got */
+			clk_bulk_put(i, pd->clks);
+			return error;
 		}
 	}
 

-- 
2.55.0



