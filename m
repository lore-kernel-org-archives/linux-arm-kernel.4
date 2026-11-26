Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8E8606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jujw31jQ;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=WGqhDXyN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=g8kf8/GeH/g1HWFh6tDbyo06gdYqxLTJw8CjiHPTWWo=; b=Jujw31jQyZAAQI+Vf0bbzzIqgD
	ruDDV3pq0dDgMjKgmQ7wvi58Cv6ynbsKLbx5q/hJTVNF/Sgfzwpgy5s4I+zehPyZFui3gj+bT/0HC
	osLkPHTFTEmC5fXSAyVGFJBThDTUPLb83S1FYx7hlYYCLgLzvxQGWlPuhLQ7M4yS6n9JxtzlhFKgR
	AOPp2hhE/5cJkBlP5i2vYljHfigha3tU8+OvxDCe5mf4UND/jbotOeSmfHYumMH0U9mo/uvWO5uSw
	U1hoapXhZSXoZAiaZ1KqhXT1cXXJP8PisG10a9c3FFjVATVP9713agcdzTUgh6i8mjNGZvAzj6aVk
	wWwbzhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUrG-0000000COuw-2Q1M;
	Thu, 26 Nov 2026 08:29:34 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUrD-0000000COu2-1cf7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:29:32 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561726a28;
	Thu, 26 Nov 2026 16:29:28 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: will@kernel.org,
	mark.rutland@arm.com,
	agustinv@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH] perf: qcom_l3_pmu: Remove CPU hotplug instances on probe failure
Date: Thu, 26 Nov 2026 16:29:25 +0800
Message-ID: <20261126-a35bb25eb5-u21-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa216f94d3303a1kunm5cc7b3d23c2e50
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTB8eVk1DGkJLQh8dTBkeSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=WGqhDXyNpObUhpFwumADEkdXBBrKtopgU2let9BhoQMYMAGA1+aLf4CubUzWyWeKeFDP9J714hmE8j8oNLvfVW8lh+OUDoOzZMhjQjvL3qxTgdHUFPPkuEMKypDOcwre3LIHM4APPeLUBy9C7Pc8yi2sZoJpI4lsCpGVs46aB8o=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=g8kf8/GeH/g1HWFh6tDbyo06gdYqxLTJw8CjiHPTWWo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002931_596607_F70F222F 
X-CRM114-Status: GOOD (  10.57  )
X-Spam-Score: -2.1 (--)
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

If perf PMU registration fails after CPU hotplug setup, the hotplug
callbacks retain a pointer to freed device data. A completed probe also
lacks a corresponding removal path.

Remove the hotplug instance on failure and detach it before
unregistering the PMU on removal.

This issue was found by our static analysis tool under development.

Fixes: 3071f13d75f6 ("perf: qcom: Add L3 cache PMU driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/perf/qcom_l3_pmu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index 3e0c00e3733f..afb13882f0da 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -780,14 +780,25 @@ static int qcom_l3_cache_pmu_probe(struct platform_device *pdev)
 	ret = perf_pmu_register(&l3pmu->pmu, name, -1);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register L3 cache PMU (%d)\n", ret);
+		cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_QCOM_L3_ONLINE,
+						    &l3pmu->node);
 		return ret;
 	}
 
+	platform_set_drvdata(pdev, l3pmu);
 	dev_info(&pdev->dev, "Registered %s, type: %d\n", name, l3pmu->pmu.type);
 
 	return 0;
 }
 
+static void qcom_l3_cache_pmu_remove(struct platform_device *pdev)
+{
+	struct l3cache_pmu *l3pmu = platform_get_drvdata(pdev);
+
+	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_QCOM_L3_ONLINE, &l3pmu->node);
+	perf_pmu_unregister(&l3pmu->pmu);
+}
+
 static const struct acpi_device_id qcom_l3_cache_pmu_acpi_match[] = {
 	{ "QCOM8081", },
 	{ }
@@ -801,6 +812,7 @@ static struct platform_driver qcom_l3_cache_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = qcom_l3_cache_pmu_probe,
+	.remove = qcom_l3_cache_pmu_remove,
 };
 
 static int __init register_qcom_l3_cache_pmu_driver(void)

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0


