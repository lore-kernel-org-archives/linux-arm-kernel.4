Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9833E606A8AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S/28OJXH;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ej/S4iTx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S7gJ+mmdj4WD8XdNszsZW9Soksa9swlMwBZkMkhbAg0=; b=S/28OJXHqg+NGnqX5mgMofqi6f
	opDBuFwRR+z6vQGtzveQAbjDk9ODcYjR+ZNyuBPJkHNdvBezJ1MqML0qbKDNViSojDQoujNSZ8uSl
	4L1uNIepFmm2XJ6RU5xAWOFTiLOKk0rMxnKmWP7ni0sSzhMxJjpJFqwuZKUVujNAir+RO+iJ9AWls
	9BBD+JAFxtlg4ITsuxH5VPB91fKWwL5SaPwwf0VdfYaDIvK/HR8+wMSSwnMuCQTRjGNb9Vqv9cZbe
	UuF47wm7ivumGlkqPiILB/gXULBIwyutXEQJ2ouIvJ8u9zLbeU+GJypgIoRvLgeIUKdY57wOyqij3
	OBqTKTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUcZ-00000009ydW-3Fmn;
	Thu, 12 Nov 2026 13:13:43 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUcH-00000009ySa-2KYE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:13:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=S7gJ+mmdj4WD8XdNszsZW9Soksa9swlMwBZkMkhbAg0=;
	b=ej/S4iTx41VeJL9brXJ9rhJdW/Zo2ncGLkDo6fqWSSbSp/XbDgbzr5EFlV/xl0YomR8umZLmC
	wJQwBd0sAqU3QsGzBsHqDpRVfz9Lm6MmNwhRlWUwRqfjUBRdeSzQfVrTKjBSLBQP9bzO/cwfbp+
	YEuAE49iHoaLXKA5EKPbyNo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRf4JMyz12LdQ;
	Thu, 12 Nov 2026 21:13:18 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0BBE240537;
	Thu, 12 Nov 2026 21:13:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:12 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 2/9] fs/resctrl: Avoid division by zero in the MBA software controller
Date: Thu, 12 Nov 2026 21:12:47 +0800
Message-ID: <20261112131255.4043381-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112131255.4043381-1-ruanjinjie@huawei.com>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_051327_306827_B6000596 
X-CRM114-Status: GOOD (  13.20  )
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

The software controller raises the control while the target is above
the bandwidth expected after the next step, and it uses min_bw instead
of bw_gran. The two are equal on x86, but when MPAM's maximum control
has 8 or more bits, min_bw rounds to 0% while bw_gran is 1%. The estimate
then falls back to the current bandwidth, so the control steps up
whenever the target is above it and oscillates across the target.

With min_bw at 0% the control can also reach zero, and the estimate
then divides by zero in the MBM overflow worker.

Use bw_gran in the estimate, and step up without evaluating it when the
control is zero. Also require the target to be above the measured
bandwidth, so a zero target does not raise the control.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 75abbf90d090..f067329e92c6 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -673,6 +673,9 @@ static struct rdt_ctrl_domain *get_sc_ctrl_domain_from_cpu(int cpu,
  * with 10% granularity steps, check whether moving to 40% would go past
  * the limit by multiplying current bandwidth by "(30 + 10) / 30".
  *
+ * A zero min_bw lets the control reach zero, where the ratio is
+ * undefined. Take the step up without evaluating it.
+ *
  * Return: true when the control value changes, false otherwise.
  */
 static bool mba_sc_next_ctrl_val(struct rdt_resource *r_mba, u32 cur_msr_val,
@@ -683,9 +686,9 @@ static bool mba_sc_next_ctrl_val(struct rdt_resource *r_mba, u32 cur_msr_val,
 		return true;
 	}
 
-	if (cur_msr_val < MAX_MBA_BW &&
-	    user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) /
-		       cur_msr_val)) {
+	if (cur_msr_val < MAX_MBA_BW && user_bw > cur_bw &&
+	    (cur_msr_val == 0 ||
+	     user_bw > (cur_bw * (cur_msr_val + r_mba->membw.bw_gran) / cur_msr_val))) {
 		*new_msr_val = cur_msr_val + r_mba->membw.bw_gran;
 		return true;
 	}
-- 
2.34.1


