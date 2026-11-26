Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9352C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lMqkk0Wk;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=XJAiO7Zh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7pvAmy/BcxPcQse9SuPhTO4DpUmDvykB1SW+ZJiDCqk=; b=lMqkk0Wkru+rocAO08m+iN9b6w
	S3uKkZi83PATKPqFiDU01seSbKgCJ9QIgmoGgDQlZ8vQCQj52FEVsee5bJ8EzcS1tr3lQUE9+NKEh
	aMZ+R9N5egzCfp5cvUvdHT/QsDAfb7w8dPHs/nc0XiCdMigvq0xZhDRu5Yr/sd7+ZHWwLHfBsC+gN
	EEaIpmIPqEjFPd0GdjdpovsvkJEYYiavnjgBhZpMQca3PBJX/vF3xZYV2/5kK8R2d8rrImrqGkQQq
	ejn5naZsIKq1RitRAEw/SCTNPi4iynDdlkZesP5bDqyzJQvAQcLYHg29TpPd/KSegn6R1MEt2doW1
	m6q1ypWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ1h-0000000DGCp-406H;
	Thu, 26 Nov 2026 12:56:37 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ1T-0000000DG3O-2mMy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:56:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7pvAmy/BcxPcQse9SuPhTO4DpUmDvykB1SW+ZJiDCqk=;
	b=XJAiO7ZhqDL5u0nVrnOC0EjSIBWcHm6I9HoSiki9g3lk7dtnZxAPG2+jNHX/aXDxv5QwiJCaL
	RRUQYFFjXrJkKV6Mz1ARPZ1lOPR3WGxPSku1EGi0fWFPT3Vfvfag5FOBPz0VqFWbdEaKsSQk5w+
	GUyf28AzZimDRsVwOoeuPEs=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jZxNW61mBz1T4Fv;
	Thu, 26 Nov 2026 20:55:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 35D9940575;
	Thu, 26 Nov 2026 20:56:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 20:56:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <jic23@kernel.org>,
	<catalin.marinas@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 1/2] arm_mpam: Factor out the MSC power on and off helpers
Date: Thu, 26 Nov 2026 20:56:06 +0800
Message-ID: <20261126125607.2304487-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126125607.2304487-1-ruanjinjie@huawei.com>
References: <20261126125607.2304487-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_045624_024516_E5ADB2E2 
X-CRM114-Status: GOOD (  14.48  )
X-Spam-Score: -2.8 (--)
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

The CPU hotplug callbacks save an MSC's state when its last CPU goes
offline, and restore it when the first CPU comes online. System sleep
needs the same two actions.

Move them into mpam_msc_power_off() and mpam_msc_power_on().

No functional change intended.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 62 +++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..562f21a8869c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2223,6 +2223,37 @@ static void _enable_percpu_irq(void *_irq)
 	enable_percpu_irq(*irq, IRQ_TYPE_NONE);
 }
 
+static void mpam_msc_power_on(struct mpam_msc *msc)
+{
+	mutex_lock(&msc->error_irq_lock);
+	if (msc->error_irq_hw_enabled)
+		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
+	mutex_unlock(&msc->error_irq_lock);
+
+	mpam_reprogram_msc(msc);
+}
+
+static void mpam_msc_power_off(struct mpam_msc *msc)
+{
+	struct mpam_msc_ris *ris;
+
+	mutex_lock(&msc->cfg_lock);
+	list_for_each_entry_srcu(ris, &msc->ris, msc_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		mpam_touch_msc(msc, &mpam_reset_ris, ris);
+
+		/*
+		 * The reset state for non-zero partid may be
+		 * lost while the CPUs are offline.
+		 */
+		ris->in_reset_state = false;
+
+		if (mpam_is_enabled())
+			mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
+	}
+	mutex_unlock(&msc->cfg_lock);
+}
+
 static int mpam_cpu_online(unsigned int cpu)
 {
 	struct mpam_msc *msc;
@@ -2236,14 +2267,8 @@ static int mpam_cpu_online(unsigned int cpu)
 		if (msc->reenable_error_ppi)
 			_enable_percpu_irq(&msc->reenable_error_ppi);
 
-		if (atomic_fetch_inc(&msc->online_refs) == 0) {
-			mutex_lock(&msc->error_irq_lock);
-			if (msc->error_irq_hw_enabled)
-				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
-			mutex_unlock(&msc->error_irq_lock);
-
-			mpam_reprogram_msc(msc);
-		}
+		if (atomic_fetch_inc(&msc->online_refs) == 0)
+			mpam_msc_power_on(msc);
 	}
 
 	if (mpam_resctrl_enabled)
@@ -2304,25 +2329,8 @@ static int mpam_cpu_offline(unsigned int cpu)
 		if (msc->reenable_error_ppi)
 			disable_percpu_irq(msc->reenable_error_ppi);
 
-		if (atomic_dec_and_test(&msc->online_refs)) {
-			struct mpam_msc_ris *ris;
-
-			mutex_lock(&msc->cfg_lock);
-			list_for_each_entry_srcu(ris, &msc->ris, msc_list,
-						 srcu_read_lock_held(&mpam_srcu)) {
-				mpam_touch_msc(msc, &mpam_reset_ris, ris);
-
-				/*
-				 * The reset state for non-zero partid may be
-				 * lost while the CPUs are offline.
-				 */
-				ris->in_reset_state = false;
-
-				if (mpam_is_enabled())
-					mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
-			}
-			mutex_unlock(&msc->cfg_lock);
-		}
+		if (atomic_dec_and_test(&msc->online_refs))
+			mpam_msc_power_off(msc);
 	}
 
 	return 0;
-- 
2.34.1


