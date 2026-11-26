Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sly3Em3s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SsXvHyl2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IudzfN8LIy/t74NXDWPyPvpw6cRIqs2tkSJhcHYTJb4=; b=sly3Em3sf06tTQlLCFadLHOUkh
	fv1puyGKoszNiGhF07rIst6iswec027o7dn629kNvdzfZZ32Y1yAT9j2LAMCo4omNMBcR2kFSnO+W
	HHt15M5VbHYda7eRCOBrbbuYoFIm1xhdsYNU8pNcroyAb2HSoQK5ZTRssrPlkfvQxCb6tzTNIWCdC
	vUvN2PN0lox8QuzqZKiBbE91WzhUjJtyrQmEzIbw8/lCe1USk9ArFSte9LcDzwGabA39XHMpiuBrq
	uxXR0TPHOU4nVr069IbIlYWfB2IsA947iTIxu3E+3UWfSoIlTwtPGRQ0K5s8/NFhdmzIfpwRcsQdL
	hlqM62ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWIb-0000000Ch7I-1Dg7;
	Thu, 26 Nov 2026 10:01:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWII-0000000CgvK-43mY;
	Thu, 26 Nov 2026 10:01:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D6A6438DE;
	Thu, 26 Nov 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795687294;
	b=3OoznR6f32i6Ux7XAyqOSVBisYgoysFSBsFbXPRqRf1gRhIejCRjBoDRJ3UvAsEGHco2
	 vIN9DDSVJIenEdzAlJy31oL1JGFivDlvxqrp5pvZu/oP3qU9hm+JGtfE7aCKudvaoRh4+
	 B5lLq3KRMTn+kAlqfEbjP/RidGcCdspxrX6o65R9M5nhty+F+i0+f1hlAJHSRhPxv78dg
	 v4WpIi/tLdui+mf44CJh7Q7m4FycUF+i0o5/qg6pJlyZkqFRLcWLkor68WnXQ/L73+uU5
	 pi5XfOh+1wduX1pv8NCgJ/zL9WRnfGTpzalvXyjrGM4Wa7SaaJqvndyRI2UPcdJnMnA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795687294;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IudzfN8LIy/t74NXDWPyPvpw6cRIqs2tkSJhcHYTJb4=;
	b=u9Dlc56Zs297QX4zTNlJV9glsIjPKO4tRIleGJ2OEfGw8ySx8shG2X0x6OvoZlt6SskP
	 R8FKPeILlfJ4QVgXS+w2hI0n2HlEqskIGg+Yn7wTrH2+IipcaPDSkjF1yXtKzc8deLz27
	 tVAuNahv6K+p9RxwL0Vn1TulXXy1ewPVk/nJ+WQQwnlRPjgjTqdSoD/fcE9otulQbMKoM
	 q9KWMUkPSfN32IyrDmxLiov0XOlRT1SjBDAkuXMX10lZt0ExCla0LESMLSRoCHNZhjxqW
	 Y0PpktpyI+U1IcSyqiHMkMcQaO8OgfxwDj5LAo2XMOBIptx20zUm4BjT4XZfijxX9hQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63A2C1F000D1;
	Thu, 26 Nov 2026 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687294;
	bh=IudzfN8LIy/t74NXDWPyPvpw6cRIqs2tkSJhcHYTJb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SsXvHyl2z/3NiAJyN97RFLHl/zclSSNNk7yNsPNCvYp6os/Ot4k/1fMV40H+U4DGu
	 YtDcINEKxbeZMZuEAvhwClrew6X1qfS9FGkFKhj/NpBxqj7C7PZpKu0Ro5My82yR9J
	 N/V7tX6ZKNd//aphsOD3NjKevgoNSvtV5VrCeLO5OJ4gX8lzGQQogL2QhPPaBCitKu
	 u35aP84uRno+IbLAZsl7Yw0QAHDeq1ayoB4+FDao7kupgpM0Ayb0jHrc9BKn+lybra
	 bHJqIn+NS4OGkFbsgDCx+mMp0by3c/PbBdDme6dl8HRPjXWaLR/m82byC31rZILwrS
	 wT+cTPk5LobaA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E1E2F4D3E9;
	Thu, 26 Nov 2026 10:01:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 10:01:24 +0000
Subject: [PATCH 1/3] pmdomain: rockchip: keep the pm_qos regmap error code
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-pmdomain-rockchip-cleanup-v1-1-a19f5ea7d555@gmail.com>
References: <20261126-pmdomain-rockchip-cleanup-v1-0-a19f5ea7d555@gmail.com>
In-Reply-To: <20261126-pmdomain-rockchip-cleanup-v1-0-a19f5ea7d555@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yao Zi <me@ziyao.cc>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795687283; l=840;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Rr7b7wy7/bWnsPzKpwANzWHGgxRsCm6m0gcZ7iKlZsE=;
 b=Cn5i63RwUAn/ITud+BGQ8dl7zKq5hhKeQ415dPtLhT1AnXObQwTI1NA5Nf6/vtRvnvgcabsJS
 eOygr7BCQyxD8KrZe0fNeKxOdjjI7xBJGfTvckf0T4OC/3+21jCH/JW
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

syscon_node_to_regmap() can return -EPROBE_DEFER. Turning that into
-ENODEV fails the probe instead of deferring it.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 17a6334b0b9f..b52bdf0e8a19 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -928,7 +928,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 			pd->qos_regmap[j] = syscon_node_to_regmap(qos_node);
 			of_node_put(qos_node);
 			if (IS_ERR(pd->qos_regmap[j])) {
-				error = -ENODEV;
+				error = PTR_ERR(pd->qos_regmap[j]);
 				goto err_unprepare_clocks;
 			}
 		}

-- 
2.55.0



