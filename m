Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3649606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eTk1usn5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dgmn1fRk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jOW5o5razoH7JZilM4XOTCBHa7GM+dbv2PqjZiPktqg=; b=eTk1usn558IuQix2+DYvWaN+WQ
	VPnNIiK3UjnWxSxKx/eQS/c+H9A0N52AFgkF9vLws/YiJJUhpLnD63rF7/B2oXa97TG6R6QNPC9D/
	0lX3ETEQgEgg4KI1tnmUbZFnh58633X3WcOzrRM3tvr71cdf5mYOiNt1JdkNi1TwixOHTxjcGR3IA
	mNNRkrODYHIm9HyxkozNA/5Kpyt4kRo9YfHlVS+laLDjcUklVIaKZIEAySSyXop0NmX3deTIW2sWh
	hIzn6ubUukFfuQX56F65QCgoQkxDieUWi1/IWZCQIx8TnqA4vpMeugNaTsGVmJSVbxrUika5c1yWT
	f3/aOr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTba3-00000008HJY-0z4T;
	Wed, 18 Nov 2026 09:03:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTba1-00000008HJ4-3G7Y;
	Wed, 18 Nov 2026 09:03:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD2F86140D;
	Wed, 18 Nov 2026 09:03:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794992628;
	b=jiyylxlxcF45E37ZMl3JX1jgojwugjhykVHSCAseeQI6dTSEsZuDBcOt7ioQZeOFJ+JN
	 Of8j8vbUSVXsTEUdgpBkImlXf6jJaZp082SbjeOom78hTkcFMEGLJiRvZC6Fkvj00vWz2
	 KiVoG7cLd/NHg8gtFj8wtP0qXtyX8Ysd+cijHkSoHkzsDCJi186MBUYcixd0XMb40f8NR
	 PKSIxsFWUiuRDYuGctmpXZa8LOCkQYeH10xVWiezhjTBAta0VM3R55j+HP/ySmoBIp6Uy
	 smA5FkR/l2GTR6DoRdbE0bjoJgrrXE72W9VrpvdpzzlwQtaMY/1siEKZ0PUDYoUogTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794992628;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jOW5o5razoH7JZilM4XOTCBHa7GM+dbv2PqjZiPktqg=;
	b=vPSNDL/8L08kncJOT3yvnysHOd6HWN5aP+JQMX8n4Tx+eQ1iDiGMTdcIVd1ox0dMhZuB
	 6IJEsobs01T7Zk6q7BR6myCagKjrQVTDDu+bFpJS79m9rbUhAOmS0seBLGEnb+lXFPNZP
	 PcsyFywQfEIFAuHA5PDgbILGQwQg68fe7Fo1+g8AOFYDJgF7h+ly4GsiGJBIeJ74mZD9V
	 PLSZYA4Ptd8bn61QyQ0XIj8mQpOUf4F1vT8jy2r2vx3mZk/+Pc5fFAzkJTJCY7RftN2zt
	 h5gm8oB246J3R34KBXm09hfkuHlCxJKI0EivkaU+vFdKZuLDMskWId34/f4WdmZ9iTg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9FA71F000C4;
	Wed, 18 Nov 2026 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794992628;
	bh=jOW5o5razoH7JZilM4XOTCBHa7GM+dbv2PqjZiPktqg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Dgmn1fRkE1Rp6vbBuXL3bNKLudKpbeZ04XCEG9mnKAgFHs2+l9cC9uFBpoEknRVRA
	 NhrAyg9AzlWTLn8ioXkOQ1+bZE8kwbGPxYnlKw15tZcY3pTMyaG1eaMKzkeSWy+1GT
	 fcNIZxUgXlwdpZgvr+AySP2QazeuylWi9fUI86DtRcokNzYqN4UFTzL4Pnv7pL84jC
	 iMoIgcHyAPvvYXhvboMoypAa5JpXxbsAXDgZ+SOkRuP5BxpYdI/NG5GOl9niQ98ghi
	 daAPwhVR3/0EQ6QH/Vf2bjRHCIRVr2HzNblKv4wc4pXWSsXQ2uZI9vRoQBD06/z4KY
	 21AwNq0W/+KDQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1AAE04ACAB;
	Wed, 18 Nov 2026 09:03:47 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Wed, 18 Nov 2026 17:03:46 +0800
Subject: [PATCH v2] pmdomain: rockchip: Roll back power-on when leaving
 idle fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-fix-rockchip-pmdomain-power-on-rollback-v2-1-3e4e93a19996@qq.com>
X-B4-Tracking: v=1; b=H4sIAPFp/WoC/5WOSxKCMBBEr0Jl7VgMH38r72GxCGGQEUhCgqhFc
 XcDnsDlq3ndPbPw5Ji8uESzcDSxZ6MDJLtIqEbqOwFXgUUSJwfEGKHmNzijWtWwBdtXppeswZo
 XOTA6nLqulKoFhUjBz6hGFKHNOgrRbelW/Ng/ywepca1fjYb9aNxne2XC1ft/dUJAyM8yy4+nl
 NKUrsOwV6YXxbIsXz5+zsTtAAAA
X-Change-ID: 20261101-fix-rockchip-pmdomain-power-on-rollback-c11e1014ef11
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Peter Geis <pgwipeout@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794992626; l=4100;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=iNwwI4s6GSLy+qcCrFrOUdp0m3/C5bTABfIfePwVyzQ=;
 b=H63KA2kbZQ2Udd1ZDZZGo9Hi68SF/NWCbC3+XwmNAXq8T/k3dsQ+VxVWUvmFLqYBBiUmgoEex
 xw75v/1FNqUD4mT0epcOH217F8bJF6A2hMLTH1oMBT5JU4Fy1okbdl4
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
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
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cunhao Lu <1579567540@qq.com>

When NIU idle exit fails after PMU power-on, clocks and the regulator
reference are released while the domain remains powered. genpd treats
it as off and may power off its parents.

Request idle again and, if successful, use the low-level power-off path
before releasing resources. This preserves saved QoS and notifies
firmware while retaining the original error.

If rollback fails, resources are still released and genpd may power off
the parents.

Fixes: 6b2690df3f03 ("pmdomain: rockchip: fix rockchip_pd_power error handling")
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
This pre-existing idle-exit failure case was reported by Sashiko AI
during the RK3572 mainlining work:
https://sashiko.dev/#/patchset/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com?part=10

If leaving NIU idle fails after PMU power-on, the domain remains powered
while genpd treats it as off. The error path releases the clocks and
regulator reference, and genpd may power off the parent domains.

This patch requests idle again and, if successful, powers the domain
off before releasing those resources. It preserves the saved QoS state
and original error, and uses the low-level path to notify firmware.

Validation:

- All 48 host simulations passed, covering power cycles, idle-exit and
  rollback failures, QoS preservation and error propagation. No sanitizer
  findings.

- Hardware testing on OK3572-C: 20 patched and 50 unpatched NVM1 power
  cycles passed. Request-write injection caused native idle-exit polling
  timeouts. The fix powered the domain off in 3/3 cases; the original
  driver left it ON. QoS and the original error were preserved, and
  retries succeeded after removing the injection.

Persistent rollback idle and power-off timeouts were also tested:
resources were still released with the domain ON and genpd OFF. These
failure paths remain unresolved, and genpd may still power off the parents.

AI assistance:

- Codex / DeepSeek V4.1 Flash were used for:
  - Reviewing and adjusting code style to follow community conventions
  - Automating tests
  - Collecting data
---
Changes in v2:
- Rebase onto the next branch of Ulf Hansson's linux-pm.git tree.
- Link to v1:
  https://patch.msgid.link/20261101-fix-rockchip-pmdomain-power-on-rollback-v1-1-59a45783e33e@qq.com
---
 drivers/pmdomain/rockchip/pm-domains.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 6abef60a5b4c..2c021784316a 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -648,6 +648,29 @@ static int rockchip_do_pmu_set_power_domain(struct rockchip_pm_domain *pd,
 	return 0;
 }
 
+/*
+ * The caller holds the PMU lock and transition resources. Use the low-level
+ * power-off path to avoid overwriting the saved QoS state.
+ */
+static void rockchip_pd_power_on_rollback(struct rockchip_pm_domain *pd)
+{
+	int ret;
+
+	ret = rockchip_pmu_set_idle_request(pd, true);
+	if (ret < 0) {
+		dev_err(pd->pmu->dev,
+			"failed to idle domain '%s' on rollback: %d\n",
+			pd->genpd.name, ret);
+		return;
+	}
+
+	ret = rockchip_do_pmu_set_power_domain(pd, false);
+	if (ret < 0)
+		dev_err(pd->pmu->dev,
+			"failed to power off domain '%s' on rollback: %d\n",
+			pd->genpd.name, ret);
+}
+
 static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 {
 	struct rockchip_pmu *pmu = pd->pmu;
@@ -682,8 +705,10 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 	if (power_on) {
 		/* if powering up, leave idle mode */
 		ret = rockchip_pmu_set_idle_request(pd, false);
-		if (ret < 0)
+		if (ret < 0) {
+			rockchip_pd_power_on_rollback(pd);
 			goto out;
+		}
 
 		rockchip_pmu_restore_qos(pd);
 	}

---
base-commit: 6f5c8ec9302c5ad8904dbdfe8cf2a538ff835572
change-id: 20261101-fix-rockchip-pmdomain-power-on-rollback-c11e1014ef11

Best regards,
--  
Cunhao Lu <1579567540@qq.com>



