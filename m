Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NpV/zuLQ;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gqedjlSK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nwfeveSkSlHwHSf8OOGn/CKlWE1z7nWFW3dZE8EJls0=; b=NpV/zuLQg7qjAu
	fASoVHmMdvReePB/JakhckJB9TLt74dsl3whi+vUCh1IjYVu8cI5lSfwBJbWyo1ilJiXSTfAMCMS4
	+08jEF9+QMXZjfluZS1gGnEdskwbr9hiAqFbGwaRPIqLdqhnNDLSEi9Qe9lZrOegoYgQwLKEZlvDR
	WTtrkAXd6IsIfA+N5Dc506eN/StLQ97Gs8LFbgUZhy8wQAiFfSkSZT8yiZA6E0h/BaHBvJ7hmq/Rv
	kRvhPZf7TgXQGsb9QhICvGKzEy+k058sHbECG3hq8EVYrJzUTXU2XvYxMg4ikY0JXBZ0m42NNznAR
	NpbH6V7KDvnZFDflf81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCr-0000000FpM4-327o;
	Fri, 27 Nov 2026 11:33:33 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCn-0000000FpJG-22HN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:33:32 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 56429982b;
	Fri, 27 Nov 2026 19:33:25 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	t.figa@samsung.com,
	kgene.kim@samsung.com
Cc: alim.akhtar@samsung.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] cpufreq: spear: Add a platform remove callback
Date: Fri, 27 Nov 2026 19:33:22 +0800
Message-Id: <20261127113322.390337-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127113322.390337-1-202300460064@mail.sdu.edu.cn>
References: <20261127113322.390337-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc8196603a2kunm5097e7d4395dcc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUxNVh5LHk1DH04fGR5IS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=gqedjlSKvHxbmuGqek0Iju77DdWi3R1xrnt4wyrDm57ZaP92+eU4sSoxCXaaLT5JrvJB8N/Zp56S35JOWoItshebgkbliIfproNJtj4zYJXwM3Y1zukjUqTe/2Rp/iViElh5Qd8BAqE3QlHfhiRx2qKvnCmE16tpUSKMAWSgbUs=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=nwfeveSkSlHwHSf8OOGn/CKlWE1z7nWFW3dZE8EJls0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033330_319410_67BE89DC 
X-CRM114-Status: GOOD (  10.99  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The SPEAr platform device registers a cpufreq driver and retains the CPU
clock and frequency table. Unbinding it leaves the driver and those
resources registered.

Unregister the cpufreq driver before dropping the clock reference and
freeing the table.

This issue was found by our static analysis tool under development.

Fixes: 2449d33a4055 ("cpufreq: SPEAr: Instantiate as platform_driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/cpufreq/spear-cpufreq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
index ffe5eda82f0b..91aeaa099f8f 100644
--- a/drivers/cpufreq/spear-cpufreq.c
+++ b/drivers/cpufreq/spear-cpufreq.c
@@ -229,11 +229,19 @@ static int spear_cpufreq_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void spear_cpufreq_remove(struct platform_device *pdev)
+{
+	cpufreq_unregister_driver(&spear_cpufreq_driver);
+	clk_put(spear_cpufreq.clk);
+	kfree(spear_cpufreq.freq_tbl);
+}
+
 static struct platform_driver spear_cpufreq_platdrv = {
 	.driver = {
 		.name	= "spear-cpufreq",
 	},
 	.probe		= spear_cpufreq_probe,
+	.remove		= spear_cpufreq_remove,
 };
 module_platform_driver(spear_cpufreq_platdrv);
 

-- 
2.43.0


