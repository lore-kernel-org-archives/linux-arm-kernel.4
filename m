Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392B606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1dUP0ndp;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=POO4uN3G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MBO38vnlAQ0tkNY12VxqO1riCqLLGif/aZ8s3OaXq+s=; b=1dUP0ndpCY/XiZSKVZecapxCNa
	DDlJu6RahKi5NtE80Vl/2MJNYfMJM7IVL9EISIgZVejddUFyxn/iXSUc2dat82FGsalzj3QVHQQm4
	zcRrop73mT7mnkqa9Giy9gP476hofhohro3Bokjpj2+W8pFtnuBQYwDyAjtwmfrkfcwvZIRAtT2M6
	JUwl4LGFAHMC8eulPpUgbr2a2Ek78YH+GHDPMlru+auR7rs2lvgEiG8Z2OqwmNJLmMxG1VGU5AMcC
	mwwXTOyTg16em2EyFjn0W7SDgbx4c98Etkeat75XnRne651wOpTlg50WroHe97AcPhdKbCD+cKZvu
	2dpwKcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVFp-0000000A9aC-2wlV;
	Thu, 12 Nov 2026 13:54:17 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVFn-0000000A9Z5-1lRF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794491649; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=MBO38vnlAQ0tkNY12VxqO1riCqLLGif/aZ8s3OaXq+s=;
	b=POO4uN3GdPixp/brpGUrQxb+QgSQLJ2Uab4lA9t9uMaCdAGt+j15deu57IsJzq1j2OqnOwV5yFc62dUzBgYPkf4t/Gf3rPI1kV8DeL/Qju8f79Eg7Ckfs6jBXVAi+xFTO7o68t5RhhNF5eJjR05nFpzEUWkLgQVGGX3ikMCwkU0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XEcATOG_1794491647;
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XEcATOG_1794491647 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 12 Nov 2026 21:54:08 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: stable@vger.kernel.org
Cc: sashal@kernel.org,
	gregkh@linuxfoundation.org,
	yeoreum.yun@arm.com,
	suzuki.poulose@arm.com,
	leo.yan@arm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xueshuai@linux.alibaba.com
Subject: [PATCH] coresight/etm4: fix missing disable active config
Date: Thu, 12 Nov 2026 21:54:06 +0800
Message-Id: <20261112135406.71749-1-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_055415_655604_A4F208A1 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yeoreum Yun <yeoreum.yun@arm.com>

commit 895b12b7d7b8c651f73f57a1ea040d35aa7048cb upstream.

When etm4 device is disabled via sysfs, it should disable its active
count.

Fixes: 7ebd0ec6cf94 ("coresight: configfs: Allow configfs to activate configuration")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
[ shuai: kept spin_lock()/spin_unlock() in etm4_disable_sysfs(); 6.6.y does not have the raw spinlock conversion ]
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
Note for stable maintainers: this is patch 1/3 of LKML series
20250514161951.3427590. Its siblings are already in 6.6.y: 2/3
(53b9e2659719) as 1cd09aaf47a5 and 3/3 (408c97c4a5e0) as
b3b4efa2e623, but this one was only ever picked into 6.15.y
(c7f2b00d5e17e) because it does not apply cleanly to 6.6.y without the
raw spinlock conversion. Without it, each sysfs enable/disable cycle
leaks one config_desc->active_cnt reference and the module reference
taken on the config load owner, so the configuration module can never
be unloaded.
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 593dcfe4c9457..55b20d23b505d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1078,6 +1078,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
 
 	spin_unlock(&drvdata->spinlock);
+
+	cscfg_csdev_disable_active_config(csdev);
+
 	cpus_read_unlock();
 
 	/*
-- 
2.39.3


