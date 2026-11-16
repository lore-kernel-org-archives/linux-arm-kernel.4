Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BA4606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 02:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WdlyBkxa;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Ln/1P3Nm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VnScLMcYbIevCbUp04UB8Pkf1UTVjmVy//XxyaUsFK8=; b=WdlyBkxa/MVXfckQWW5kcthDqM
	WkP6EX55SQC/7Yzv6bzAVEr3/+dnSMB0AAMw5Xa3ZljSjo2VHMxgP0rasy12ncBUivPPgUwEE6bXP
	18UNP+qCtSwSXkZCrhrHi9kyGND67aBBHJEizwktiFniiRvfvz6BX9cVHTZ/mYDYUiTI2EDvBHRWK
	31IDT0EfmWUzWHfIw5wFuBDwRklikjGH1CUve3uIZS82CnJHEXHVWYPAWxIvjiVrFkyaEveJ/997U
	SiF6Wp7ImwQ0/Pl0+GfMfVWsMDEQbaHtzcrnHzVYYML0CG+48AKiiwG9P5dQgQKMgR3fQmfVLa6o+
	Q01v1BiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmm3-00000000yFS-43Io;
	Mon, 16 Nov 2026 02:48:51 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmm0-00000000yF5-12fj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 02:48:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VnScLMcYbIevCbUp04UB8Pkf1UTVjmVy//XxyaUsFK8=;
	b=Ln/1P3NmSrz2gtWrXFdeBbQFrAEcAgHu0epsuwX82dmlPaKQ13f6Ydt4TO9XXp4WRrjZ7kinb
	bhtTLZTpt1lseyd22JNy6OvzOClJVPnctKsb8eWuoENOtq+k5m8fkq5RjcCkF8+uifVKD8J7L5b
	x6epMFcQf89UXDLnWXgP2qU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jSXNR2XCNz1T4hn;
	Mon, 16 Nov 2026 10:48:07 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CC9BB4057F;
	Mon, 16 Nov 2026 10:48:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 10:48:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <jic23@kernel.org>, <tan.shaopeng@jp.fujitsu.com>,
	<zengheng4@huawei.com>, <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] arm_mpam: resctrl: Annotate domain list walks as RCU under cpus lock
Date: Mon, 16 Nov 2026 10:48:34 +0800
Message-ID: <20261116024834.275512-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_184848_911205_C005352E 
X-CRM114-Status: GOOD (  11.33  )
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

The resctrl domain lists are RCU lists which are only modified while the
CPU hotplug write lock is held, so traversing them is protected by
cpus_read_lock().  That is the convention the generic resctrl code
follows.

The MPAM implementation omits the condition at three places, so lockdep
reports a spurious violation with CONFIG_PROVE_RCU_LIST on whenever
they run:

  WARNING: suspicious RCU usage
  drivers/resctrl/mpam_resctrl.c:1762 RCU-list traversed in non-reader section!!
   mpam_resctrl_get_domain_from_cpu+0x200/0x298
   mpam_resctrl_online_cpu+0xa4/0x160
   mpam_cpu_online+0x2b4/0x300
   cpuhp_invoke_callback+0x304/0x700

Likewise for mpam_resctrl_get_mon_domain_from_cpu() and
resctrl_arch_update_domains().

The lock really is held: lockdep_assert_cpus_held() is the first thing
each of these functions does, and the warning's own lock list shows
cpu_hotplug_lock and cpuhp_state-up taken.  Only the annotation is
missing, so add lockdep_is_cpus_held() to all three walks.

Fixes: 9cd2b522be2c ("arm_mpam: resctrl: Implement helpers to update configuration")
Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Fixes: 09e61daf8e96 ("arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation")
Cc: stable@vger.kernel.org
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..d25c2bac9678 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1516,7 +1516,7 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
 	if (!mpam_is_enabled())
 		return -EINVAL;
 
-	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list) {
+	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
 		for (enum resctrl_conf_type t = 0; t < CDP_NUM_TYPES; t++) {
 			struct resctrl_staged_config *cfg = &d->staged_config[t];
 
@@ -1743,7 +1743,8 @@ static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
 	if (cache_id < 0)
 		return NULL;
 
-	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list) {
+	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list,
+				lockdep_is_cpus_held()) {
 		if (dom->resctrl_mon_dom.hdr.id == cache_id)
 			return dom;
 	}
@@ -1759,7 +1760,8 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 
 	lockdep_assert_cpus_held();
 
-	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list) {
+	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list,
+				lockdep_is_cpus_held()) {
 		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
 			return dom;
 	}
-- 
2.34.1


