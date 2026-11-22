Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A54606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=03DMSHZ9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eND055bf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6d9aHwIPLyyycA4lbAZS74hsEAV4FeAw1PtBr9/VNow=; b=03DMSHZ9mmukMd
	aB55Degfa0fAorrzLfDtsZbSVy+89iyaMcCMZnJ0BgRBXI/qTn6zeJfrF6w3f0eCMnEHtoYJLYeka
	40do6A07tOdLX51XHtHDlwG/Dom/ewKrLL92c5qBt9tDR2FtNc04lx7iKxaGKKpwXSFbsoubkWql4
	bG8bsPMOAD8WIxY1Wjj44R4hJJZggz9TRPM8OECM20UxXZffUfyVHEUqrpnpX4GDzdjfy8ctw2bVg
	uBf3bGeZ9rXgtCxngqQQUsi2kg8y39W1aDkUvDoRKLdaBSv6Nyi/VgybJOILrWKqT6JJgPE92eBs/
	7+eEMOgU28qMJEaunwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6AP-0000000137Z-00P7;
	Sun, 22 Nov 2026 11:55:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6AN-0000000137S-2XvH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 11:55:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 04EAA43FB6;
	Sun, 22 Nov 2026 11:55:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795348530;
	b=jV3UHc+hGMOAp3NKZGJMFT46alOmjFCKd6+yuSx97/OEfwzZK3AbcGwcjjfn/iQHiTCP
	 5lf37vPItB2dd08uCt2qHPqIX98FGmUasJGJuDj5BME/LRlnQaANkuOOxq6QfZHNXUP+W
	 6KjjdP+eR/CgPvPiEijcxEIPVBvktue8n83Jts9EG2PRpGCGMQgIX7d3KheVNvGZhSzS3
	 0kvkYsW1cONVJFj+tMjFd8qXTGMz16R+XWNRncNUE/0FT6wPMfm4gZZkkHIgt3Kf6maNL
	 lZIeg23HfgmlhdcgIFoxFl7nkuE+eTAUcFdpQzLsXFISAG5a+FERKUQOxvLUm+sQ/cw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795348530;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6d9aHwIPLyyycA4lbAZS74hsEAV4FeAw1PtBr9/VNow=;
	b=jSgOaKuNrFyDiowvroVP6vYG2+w89b3RrjKxBLTtyuBgwsRMydiWIJMo/HsEuoSJT0Mn
	 UFH6M6hEWpAWoflkl7brh6Zezvu59XYr4Drv2HHpPKvLwM/8g/eMJ4HcpKgph4Ji3HCkr
	 +4H6ZOol7DPyw79Azxh3gqt1k8A2vJq/1suBpRNZcHB+xGFip1sc8+lvNqOc+q756R54m
	 IGhie3JWPlLjjj2qJkhOPD1KFqUGqX3gGvLARExLF1aRD2w9OOivRVYMqntRBcFGgBdJW
	 //NoK8/uCDzhfKLlO2faiwxPcwfK+M80Da0hCc5UJkFjEK4AJRZj4EiHvQBAfhe+s9w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43E1F1F000D2;
	Sun, 22 Nov 2026 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795348530;
	bh=6d9aHwIPLyyycA4lbAZS74hsEAV4FeAw1PtBr9/VNow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eND055bfM3uYlV4GWrArdVv2uqAg5bhHSNVnPe3EyET5aEMKfWY6zRSSFT1T6tstJ
	 PdNpNG74Z18bVP+1HQaeeI1btTt2xQeUiMEn5kLZIfODSjzuqJguRO/JwH122Ok23d
	 qEloUHMcUjbCTSb4jo7Tisy93W/qDAW/9eDPgbYb7vh8IU5KQYOQvENOl0rzlIeODe
	 m7nVr/D/CMgCjfOvNk6u3k8Q0Qdo5TEn2BJCjndULjOq+vnHlCi3TU2wsor/R0F594
	 9VS7DPudcfjdiT4MSNTry/x4DF65tFZ52HTf2VlfLmOckv+a2nwnF5vP2PD9xQ89ZS
	 dCN7yM7nUd4IA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B50D74C013;
	Sun, 22 Nov 2026 11:55:27 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 11:55:26 +0000
Subject: [PATCH 1/3] cpufreq: highbank: Put cpu clock if clk notifier
 registration fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-cpufreq-leaks-v1-1-96fc17ff7339@gmail.com>
References: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
In-Reply-To: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
To: rafael@kernel.org, viresh.kumar@linaro.org, krzk@kernel.org, 
 peter.griffin@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795348526; l=1132;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=3C9gDTowDdRDGMzNw1WS33LAVCdBMhUpJeT844xhx+Y=;
 b=0X9LBAEBk+Vp2Pf+pdsJFaRO6JRm6H0HvH6fJfTnuI2MlOfdyXeBZXhtU4qFfxba9VjBZ+tV8
 8LJG6ZBzf1lD8UR/mWAk6UTOgiD7U1TXrc4QfspH2i6yZawQLh8ub1v
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shyckless@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Suyuan Wang <stevewong@hust.edu.cn>

hb_cpufreq_driver_init() gets the cpu0 clock with clk_get() and then
registers a clk notifier on it. If clk_notifier_register() fails, the
function jumps to out_put_node and returns the error, but the clock
reference is never dropped.

Call clk_put() on that error path.

Found with a static analysis tool and checked by hand.

Fixes: 6754f556103b ("cpufreq / highbank: add support for highbank cpufreq")
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/cpufreq/highbank-cpufreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/highbank-cpufreq.c b/drivers/cpufreq/highbank-cpufreq.c
index a45864701143..ccdaff4384d2 100644
--- a/drivers/cpufreq/highbank-cpufreq.c
+++ b/drivers/cpufreq/highbank-cpufreq.c
@@ -89,6 +89,7 @@ static int __init hb_cpufreq_driver_init(void)
 	ret = clk_notifier_register(cpu_clk, &hb_cpufreq_clk_nb);
 	if (ret) {
 		pr_err("failed to register clk notifier: %d\n", ret);
+		clk_put(cpu_clk);
 		goto out_put_node;
 	}
 

-- 
2.34.1



