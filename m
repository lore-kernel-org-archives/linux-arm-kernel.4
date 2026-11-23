Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE863606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=maxkbTvm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MHKwkmHq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6d9aHwIPLyyycA4lbAZS74hsEAV4FeAw1PtBr9/VNow=; b=maxkbTvmp7VH+N
	7NlrSSDC6bN3WKQ0EZVEQgYVFtsR+k0KwfkXRdSClqlm/myJtNQD7uC2ZfckvfTEaxGlM4iLAV3sA
	IzyXgmqsvqXd3aGytGjA2mZr/8A0fD2z0CacgdxAGeMqh9ZX3viYeiEh7Forgkofz1nx1NeAclAb1
	DafMiNWCTIcaCNAl4o9MVgJfI/7aLdVnL3wRtzP/9XL4M4CrvfAtbq7ouveTGf82vhk2WbWFFc9NL
	f7E2pBVlaIm3wh4AsgeWLYWVbiXY45J/lUdNb79PzHNz9np8WBoNzs3iRdIQxTaXQhxE1lJpqoNLD
	196/hoEt8tDqWWhcwcjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMUW-00000002IRC-0wC5;
	Mon, 23 Nov 2026 05:21:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMUU-00000002IR6-2Qhk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:21:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C5954082C;
	Mon, 23 Nov 2026 05:21:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795411281;
	b=SgdQGQ3+tEd2sB6Qr0Bj2rOmvQG14j9SVadlY5O3y/aaw31LvNd9AnT8wVWL9Z0GFjeS
	 UPKQwWajtUYjD8MDU+IM01XfGDC8qRiHN/GJ4vj/MShXiDW/3WVb7CWfmxd6D/zOuWmkd
	 M6o/SreK0VJTbGAwcuHc76YuVRF3fXhZ7tMC/NncadSVxBnsh9jSmTu4wQnAPhPUt9tvf
	 9L212YR0FfHKtqH80GwGU9EdyiAC4jnohnJIeukliyAoLaSGrXpSPC91HQbcvovdGe7TN
	 1fX4GG5AzTWjvJkSv/W7ErFb0mNbrEpkIjFJ04gmUNd92rOtO1GlNKMCHK3bEyjCBbQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795411281;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6d9aHwIPLyyycA4lbAZS74hsEAV4FeAw1PtBr9/VNow=;
	b=TGqySmVpsKoKsLn98++1NtYVfQI+7SCe9lRiuKGVl+19uRdsJ5/uRqiZn7edJwsJHSJd
	 TTQ8crgq5fkyV/FTKiZxIdYHi8Zf9bXfLBWBxk+tpzdk2KvsWSUI684jsSTtqD41sNhwk
	 OXixONMHBhc8hPuop5u5s0JV0Y4fjLO9I0ux5XD+7yQSAkTA/ipPq+dp6mMwmDg785J0s
	 4Kn3mSd19wOtnEbaIgcLA0CZOygPChzY6aGxZkb/98m3+W+XqVmYEfiGLPUDndIuqy3jP
	 ugODLRHpB3+8hvmYIJxkoITG9qnsx0dVphfHWbXK8zQa6Od7aU0gfCg3zNQpS5POrcw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBF641F000C6;
	Mon, 23 Nov 2026 05:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795411281;
	bh=6d9aHwIPLyyycA4lbAZS74hsEAV4FeAw1PtBr9/VNow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MHKwkmHq8DkRpGQe6eLSxGpEgG3FB6oQ51MfqbzuDMfy/T7gFcRyZEs1cbux0pjMY
	 dNxL1FRud+ncD7Q7GLforFjHmMjepYsuzXjI7+d+/iPrmBVtAtLc9HFECl6+neg7+6
	 4FHzfT97YeWmMLXNwKexofUuYif7PX1DhqLWnniwVSi9QaTnAag+eXcZOxXv1jJ4lY
	 mXcvenO7KGXVIEp3xo+h/XOBKXtgKFvMJMmAtAyShQqwNvPn625GnoZyVo5m5fFk+O
	 SkcZN4k7gTf2k8rMSJzz1sZU+TGUWdj/z6CUwNDyo9il5K8n3JO35k/MDCifjgYkht
	 PJcGv3JU29X2w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 707F34C366;
	Mon, 23 Nov 2026 05:21:19 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 05:21:18 +0000
Subject: [PATCH v2 1/3] cpufreq: highbank: Put cpu clock if clk notifier
 registration fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-cpufreq-leaks-v2-1-29277f2f0ddd@gmail.com>
References: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
In-Reply-To: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
To: rafael@kernel.org, peter.griffin@linaro.org, viresh.kumar@linaro.org, 
 krzk@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-pm@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795411278; l=1132;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=3C9gDTowDdRDGMzNw1WS33LAVCdBMhUpJeT844xhx+Y=;
 b=GL1vgLvcUui95YQY/CL0DXZRMnKDChxPyd/L4C2Yvsf76SYi/8CyeMT3UHOHVkLog2bCiTDHV
 Fb8fPqsU7q3BpI3JYmUD04S+5/ay2W+v30fhrlesLBQawZagAFWSK16
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



