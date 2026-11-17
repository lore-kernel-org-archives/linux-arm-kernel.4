Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B80E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 01:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B70GmcMO;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=frpS6OPX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wICdQTS/j653JNeSpq5WDtpcanKknMisPljCXOeLMss=; b=B70GmcMOD2wehP1/xLLZSv98kb
	0mu3hOxVJu013BEDv44OvQysQcMqtd/qh4v4GkLQiVqL+R4aHO0NYcXbJex40Q8j2eoUr3lEVRqxA
	Rc5iiGBAhufY0PNwX6+2oLWk0YhIMpvdYaYd0STeuXaQNE4IByMHWnRD4jCFqR+gC0DkHelNEq1//
	iNkzpcbkcTkoOai0KSG2dxRNDBFZIBWloelR/RSANjZIcxoL1Gb9+jXKXSQIttY34xgt7q1jZMgKe
	pNUVoomggZ+I/XKjVLVLxBfZspUM3yELl7Rv+OO3FcgmLn7aO6WzMefVX67MMDMyFFrqOZYgBJ6S2
	lD48BxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8EE-00000004Kko-0MZD;
	Tue, 17 Nov 2026 01:43:22 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8EA-00000004KkJ-1a3K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 01:43:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wICdQTS/j653JNeSpq5WDtpcanKknMisPljCXOeLMss=;
	b=frpS6OPXRpqmmhNNflCDPRrZ+OrimVw2l/RYtkrUAZlNSbLWnQs/7BEcx1Yxb2dLhNlHhAfbq
	yi10NqiOnLyxchiHsPNhASIINfoC+5fFp6PRPkmtbslZu4Y8KjaAZksvQ15iu5yYmSFhTyqEGa4
	VubTdFdWssd9ixX7E8x1Bls=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jT6tk52mpzLlXR;
	Tue, 17 Nov 2026 09:42:54 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 71FD04048B;
	Tue, 17 Nov 2026 09:43:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 09:43:12 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH RESEND] arm_mpam: resctrl: Annotate domain list walks as RCU under cpus lock
Date: Tue, 17 Nov 2026 09:42:46 +0800
Message-ID: <20261117014246.530431-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_174319_028862_D86815A7 
X-CRM114-Status: GOOD (  11.80  )
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

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v1 -> RESEND:
- Drop fix tag and not cc stable (Ben).
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


