Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF56606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=45Mz2HnM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJ8lzL7m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=INj9XiCO7qQYOH/BALkYphgV6XWt7EmpgJJgizsfpGQ=; b=45Mz2HnMB1yiOhSCEwvx/pPcXv
	qoF/RnHSESZb6pvB00u2Hg0NAPstmxiRFpNdams2ZAa+qxtite5WzrPfd3MuwUavsASy7msYtmZty
	qAoh9lFB2cNujxPYZ6nUMEDetrSae/x75oKInqy1xGfOPoNxppR8ZKSWagqrtqW4L4xg00SaM+WmI
	nVwYe34HucSAZ+BsXDMqH94ysr+ZE/P3Ttq279IyuAdQFk5UcnqKKS+19wEA7KyiIHPvhKHYruMoe
	FOYWwv/+FQC/Tk9H5NYLgZ9ZQ6t1mnL6StXUmLuNS61ZyqLTzzFFymJ6U6azT/41AANfS1yeTOr7l
	MvZrnQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0y-00000002lbY-3ayw;
	Tue, 10 Nov 2026 07:11:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0w-00000002lXl-1LFF;
	Tue, 10 Nov 2026 07:11:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D79B640AD5;
	Tue, 10 Nov 2026 07:11:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294689;
	b=z1EgNvsWaOafPL7/7+fowANbGI5aBJfBvmj3uP/0P2o/MN8nd/RiWzcTdzgXiaRYeeRy
	 TE2+hZ88PIVGsSYVLx3SXY0v9432tky1VlILkkgeTgVQpNSpusYDpoyDZN09j8w68I9L+
	 mXL551xgHvMMG3BuZhUUZsThGDiCZFQS5fXXc5/uTMU4qs8gkc1VjxOSyYH59tiefNRAo
	 6RoSeLx83bNyTT4ksF1Lf7Lt+H3IlUFWyYl4bPihcPqHAnq+63nlOsR+h7w2nlG2AVM9U
	 ptEtcrNwor4kOoBKBA+oyK6cBORKRDfRtbcUl5rTCQzHZ1W5I+POWWX/2S71QTDc7vA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294689;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=INj9XiCO7qQYOH/BALkYphgV6XWt7EmpgJJgizsfpGQ=;
	b=Q7lpNol4OUhrdhH3lz9AMBxOLjzPLCI2cdGZ2jiQQnYi9TmnTmyLi9hfAwYuzfl/Jw6X
	 0NmTBgnwkLlxuIYCv44+3xkIwMpLwfNb1mjwDQuc3jPRis/So1/vdOk/gc8VEH16Fdc9/
	 pMReNGqE+DhiGaNMbuLYZQp4bKaK6LSlLsnbh5OByJ5Bfpc/fOexLy6uejif1LsVAdVcK
	 DXnlrwa0YO8WBRAmlPSRTxUeEaJ/KszTGDZkOTZQAwXf4jrhmecMFPCCpLgUHKzAEF/3u
	 Y7v64oDzRFDQVDEjOFK7OyCiSjauNq0ObqouM0KN0n1r5ocguSu17lVNV8fDTsXvICQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFF431F008A3;
	Tue, 10 Nov 2026 07:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294689;
	bh=INj9XiCO7qQYOH/BALkYphgV6XWt7EmpgJJgizsfpGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WJ8lzL7mKehPXrnxUTUxUA4SJQBTslk6BLkztD3iriTuXxY6B4uEUgAbfhvo1n3Ut
	 e3cgUAu8IGtsRp9zsANfxZS+oQh3AH+ApWG5arjjkRz4ovdsRFi2LO+29lf+iOIm7O
	 5lt4z/B5erxrZExk0LeM6+Vx43nUxbDpj5YaM3TcO3ADjEFdSS/tCHZkdOosGWJDqL
	 yhaqH/JbampZFRu7riJ/qlaO5tQo9kx6m0SJ44HmZrP9AquiMuGx5yUsxRDsrVoe96
	 aLQPITqLV8IZ03xZsWfojQoSuN1YzH2jZeVMPUmzA7WVuxwwiL7YxsOwUv79//0q+E
	 LIXnq6f+MLr/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 445474893F;
	Tue, 10 Nov 2026 07:11:28 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:11:30 +0000
Subject: [PATCH 3/3] pmdomain: rockchip: do not report probe deferral of a
 domain as an error
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-pmdomain-rockchip-v1-3-6b9fa6ebaa86@gmail.com>
References: <20261110-pmdomain-rockchip-v1-0-6b9fa6ebaa86@gmail.com>
In-Reply-To: <20261110-pmdomain-rockchip-v1-0-6b9fa6ebaa86@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kevin Hilman <khilman@linaro.org>, Caesar Wang <wxt@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294687; l=2616;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=qCJHjn4ARWllWuHF/3iUyLeU1dBEpnl7ug6sZBC3HTs=;
 b=8X1ybrV4e6PsuLq/Pxx6EQ2FHsA73qXCewhBYjwkiMJXLmo6XYpqrrBDeFmWuCs7wg1xr8Atc
 qjKCZLA33M7DM0Pe0fSNxZsscSShW/5/Z1vnho6mDSZn6ki5VYFy+KC
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

When a power domain clock is not available yet,
rockchip_pm_add_one_domain() records the reason with dev_err_probe() and
returns -EPROBE_DEFER, but its callers rockchip_pm_domain_probe() and
rockchip_pm_add_subdomain() still print it with dev_err():

  rockchip-pm-domain ...: failed to handle node power-domain: -517

once per probe attempt, and twice for a nested domain. On an RK3588
board whose NPU domain clock appears late this is more than 20 error
lines before the domain finally probes.

Only rockchip_pm_add_one_domain() can return -EPROBE_DEFER here, and it
already records the deferral reason, so skip the message in the callers
for -EPROBE_DEFER and keep it for real errors. dev_err_probe() is not
used in the callers because it would replace the reason recorded for
/sys/kernel/debug/devices_deferred ("failed to get clk at index 1") with
the less specific "failed to handle node power-domain".

Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
Fixes: 6be05b5ec161 ("soc: rockchip: power-domain: add support for sub-power domains")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index d7df19e10000..70ebe5696b39 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -1050,8 +1050,9 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 
 		error = rockchip_pm_add_one_domain(pmu, np);
 		if (error) {
-			dev_err(pmu->dev, "failed to handle node %pOFn: %d\n",
-				np, error);
+			if (error != -EPROBE_DEFER)
+				dev_err(pmu->dev, "failed to handle node %pOFn: %d\n",
+					np, error);
 			return error;
 		}
 
@@ -1144,15 +1145,17 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 	for_each_available_child_of_node_scoped(np, node) {
 		error = rockchip_pm_add_one_domain(pmu, node);
 		if (error) {
-			dev_err(dev, "failed to handle node %pOFn: %d\n",
-				node, error);
+			if (error != -EPROBE_DEFER)
+				dev_err(dev, "failed to handle node %pOFn: %d\n",
+					node, error);
 			goto err_out;
 		}
 
 		error = rockchip_pm_add_subdomain(pmu, node);
 		if (error < 0) {
-			dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
-				node, error);
+			if (error != -EPROBE_DEFER)
+				dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
+					node, error);
 			goto err_out;
 		}
 	}

-- 
2.55.0



