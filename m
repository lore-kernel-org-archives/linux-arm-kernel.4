Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91AD60A2612
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TeeMBkGi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWV1F7Me
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=60siS61lJQVsPLSNWq9Yx9eryDhQch+eqG8LRWnJFnM=; b=TeeMBkGiCrOY5U
	vjmdo+PtzPGLs6octVQM+PCkS+5YFE2y8yz6dThjdV0qRyuy7+k/Jdtf5kvZx9ByddFTNDPJKLHwk
	SLZbjrqM6mZa+S1w1BXh0hcCHVLAeWNEq+5YIBuL7uJx2OnRaLUf7BtBJXz0DFY3aYbhVcKicWuCM
	Z29BV6/cn9tOBUh/yU8VrPZlNDQaYsaLXJcz6021pzQdZ//KKqVp53BEXpMjxSeCMMYdMgKzitgM4
	ZGCatc2StFS0vTKSzWTgVDVYGADf4GpUmZ/Y5F9o32X3ATEkk8N1ZX09h+nWCtRmp4Kt7XfNDfW4Z
	YtR4gitW1AGyZgeWV8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnJ9-00000004IOK-1d04;
	Tue, 10 Nov 2026 14:58:47 +0000
Received: from mail-oi2-x0a.google.com ([2607:f8b0:4864:32::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnJ6-00000004INW-43it
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:58:46 +0000
Received: by mail-oi2-x0a.google.com with SMTP id 5614622812f47-4c3bb46aaf0so869166b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 06:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322724; x=1794927524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60siS61lJQVsPLSNWq9Yx9eryDhQch+eqG8LRWnJFnM=;
        b=yWV1F7MeFkxYsjHmHC95mHq/APG+/NBvFV1jEHYVBzIFMYeb2Dx//cwIaRvieYp74b
         oQKzhlGG9AqFp5L6QKdQMflrHLyqXS98bejUBmk3WJkWXiIZPMVr+WxAuvfSvNZSBVYk
         8dY/4H2ZzE72DMKcmp9m43JDrk5X3WCUuRSYInoY6ptvLIpl37PhBRL/3l2M2C0DCZD0
         i93lETQeFXKlSdjvaR2CCCS1zlI3DGNBdFMRRkxqeP0hBdnARrGBCMOAJttgvmUMIWJH
         5MJZB3FOwab+46Hk1KnDORlGbzdcO8hilEHymZ7rzJ8LpuGjy0EBKdURMXeEPg5voZkY
         hZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322724; x=1794927524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60siS61lJQVsPLSNWq9Yx9eryDhQch+eqG8LRWnJFnM=;
        b=C5KkAK41zPO27RJyK/drsWM5cc16JtDL23NYO49snC/RxZ/9lKEkM++YM0VkYTRqjl
         uzzTgRlZ/yPXmgZsYt+bnD079hmrvKF9hKXXk+ihmwUd1EGoxy8bz/VQbfK9Z4OLjDYA
         yeQj9zFOBNIQhsz1LwMbwE2hCR8lH4tZp4MGd9d447OU+uujP5Ir9Ij8ddCRGqp6xS9E
         YYSb56Ol9HwkMKyTxXYo6EWoArG27AaTou+vV2vsleHJwfoCqO/r07i3kUNetBhADph6
         W06Kq8Ewxu8FCTeehdOUYDONWdqJnghdYrPERThNLTqnu77OzPNDNNclC8UcYiMCixcM
         XflQ==
X-Forwarded-Encrypted: i=1; AL+hErHWv0aBbVHZBtWnVEiD9g1aYUmIof+C9jVWt1gqupFVaH/0209QUHm+zPrC7a+uKPy/58bXfuIAWUxMzF+HYXJZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+tJs9NAPo2fveJ2GJv15bWX1YhQXcu59hgsmVnIw4mRdYzh4qz
	Xxv2tnbBKz1daS7jsDM+MIjDCHaKS2qdboK6PBQ1SWC1MS8JvStxmWljM8tuTD2z
X-Gm-Gg: AYBFou0nqUpbPhR4T5EndhzhWP40GL9n4zR76JaDXZy8oU2RZgwhYFPoIYkoQyCO/io
	UFnZkFrBrZhpnhtbwwKkjEjD60eh5oWtoHNuhZHLWSmLv4nMyYIeUeCLbFDvbnb3VbFbQ+2xeDF
	jgOH1LJzK/HosIfC+CSYogi+GiGz4LjXE418fTY4r4gwXZweundtKHZWgO1NVeG0tsuMaBZmGky
	Z8hTNgDOd1/GeZ5zZruV/BAMq1fwS6UgzDAd1g+FTpp9ZR4afTgFIq+CgGuPh8sMJBYtjm2ifHX
	9dLNoaZthsXM6q+Fsj80bN2q8p1sdYVGMUwv2WwzP/vQG12TeaWY4iEW++8cECeh43a4EiMXteg
	gqH/lIhweriIwMnGlSFv+ZElaG8sFsGNXYisr2iZ6ZKmnxloc30tPKCvGq2xU3//M7LCBO6XSQu
	Zhki0q6lDeB9LKw34Uq3pn7TR4UybXU/deg9vIxHf9zkQaHl0KgdHDkFWl3uvcQ6Fv5FrFCCqVD
	kXsZ6MOrOObHx7MUTOXbY+TwEsBe0cgExhwcSf8oDkwn5xbD6iWc/PoaN4OvWRaTAK/v0U/DWAZ
	/Eg4OjPV1LUw9rSU6zkmfXt/s0HhtNf2Ciqa7+WhNEsUdYqnqpvornzydL0Ajws=
X-Received: by 2002:a17:902:f64f:b0:2e9:9bac:2e84 with SMTP id d9443c01a7336-2edb92bb80bmr24201345ad.66.1794316918385;
        Tue, 10 Nov 2026 05:21:58 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:58 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 5/7] fs/resctrl: Release the limbo RMIDs when the CDP state changes
Date: Tue, 10 Nov 2026 21:20:52 +0800
Message-ID: <20261110132054.3702-6-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065845_042649_7518F844 
X-CRM114-Status: GOOD (  29.50  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jinjie Ruan <ruanjinjie@huawei.com>

On MPAM the counter of an RMID is selected by the PARTIDs of the CLOSID
that owned it. Without CDP, CLOSID c is PARTID c; with CDP it is
PARTIDs 2c and 2c+1. An RMID that stays in limbo across an unmount and
a mount that changes the CDP state is read through the PARTIDs of the
new state, which are not the PARTIDs its cache lines are tagged with.

With 5 PARTIDs:

  mount                  CDP off, CLOSID c -> PARTID c
  mkdir g1..g4           CLOSIDs 1..4
  umount                 RMIDs enter limbo with CLOSIDs 1..4
  mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
  limbo handler          reads CLOSID 2 as PARTID 5 > PARTID_MAX 4
                         MSC error interrupt, mpam_disable()

The other direction is worse because nothing reports it. If resctrl is
mounted with CDP and mounted again without it, CLOSID c is read as
PARTID c, which is in range, so the limbo handler silently tests the
occupancy of the PARTID of a different CLOSID and frees or keeps the
RMIDs based on it.

When a mount changes the CDP state, release the RMIDs in limbo without
reading them instead of restarting the limbo handler. Cache lines that
still carry those RMIDs are accounted to the next user of each RMID.

The CDP state that matters is the one that changes the PARTIDs used by
the monitors, which is not necessarily the CDP state of the L3
resource. MPAM gives every CLOSID two PARTIDs in all MSCs while CDP is
enabled on any resource, so enabling CDP on L2 alone also changes the
PARTIDs the L3 monitors use. Add resctrl_arch_mon_cdp_enabled() to let
the architecture report this. Only MPAM can be affected, so the RMIDs
are only released where the RMID depends on the CLOSID. On x86 the
RMID does not depend on the CLOSID, and resctrl_arch_mon_cdp_enabled()
returns false.

Reproduced on QEMU with the sequence above:

  mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
  mpam:mpam_disable: MPAM disabled due to hardware error interrupt

With the change the sequence completes without an error.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1+
---
v5:
- Split the change of the limbo handler lifetime into the previous
  patch. The limbo handler now stops while resctrl is unmounted on every
  architecture, and only the release of the RMIDs depends on
  CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID.
- Drop the cqm_work_cpu changes. resctrl_limbo_resume() cancels the
  worker before it queues it again or releases the RMIDs.
- Move the rdt_disable_ctx() reordering to a separate patch.
- Add resctrl_arch_mon_cdp_enabled() instead of comparing the CDP state
  of L2 in the file system.
- Rename limbo_cdp to limbo_cdp_enabled and document that it is only set
  with CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID.
- Check QOS_L3_OCCUP_EVENT_ID first and drop the rmid_busy_llc check.
- Use lockdep_assert_cpus_held() at the start of resctrl_limbo_resume().
- Describe the reverse sequence, from CDP on to CDP off.
- Link to v4: https://lore.kernel.org/all/20261105070934.2258613-4-ruanjinjie@huawei.com/
v4:
- Use resctrl_mounted instead of a separate limbo_paused flag.
- Record the CDP state once when resctrl is mounted.
- Add resctrl_limbo_resume(), called once resctrl_mounted is set.
- Previous Link: https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/
---
 arch/x86/include/asm/resctrl.h |  6 ++++++
 drivers/resctrl/mpam_resctrl.c |  9 +++++++++
 fs/resctrl/monitor.c           | 25 +++++++++++++++++++++++--
 include/linux/arm_mpam.h       |  1 +
 4 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..d88a09a45d7b 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -181,6 +181,12 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
 	return rmid;
 }
 
+/* The RMID does not depend on the CLOSID, so neither does CDP change it */
+static inline bool resctrl_arch_mon_cdp_enabled(void)
+{
+	return false;
+}
+
 /* x86 can always read an rmid, nothing needs allocating */
 struct rdt_resource;
 static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..563ca99a581d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -148,6 +148,15 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 	return mpam_resctrl_controls[rid].cdp_enabled;
 }
 
+/*
+ * CDP emulation gives every CLOSID two PARTIDs in all MSCs, so CDP enabled
+ * on any resource changes the PARTIDs the monitors use for a CLOSID.
+ */
+bool resctrl_arch_mon_cdp_enabled(void)
+{
+	return cdp_enabled;
+}
+
 u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val)
 {
 	return val;
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index f56d0e32fd06..87d744a168fb 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -70,6 +70,14 @@ static u32 *closid_num_dirty_rmid;
  */
 static unsigned int rmid_limbo_count;
 
+/*
+ * @limbo_cdp_enabled - Whether CDP changed the hardware IDs the monitors
+ *			used for a CLOSID when the RMIDs in limbo were freed.
+ *			Only set when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID
+ *			is enabled.
+ */
+static bool limbo_cdp_enabled;
+
 /*
  * @rmid_entry - The entry in the limbo and free lists.
  */
@@ -1044,12 +1052,15 @@ int setup_rmid_lru_list(void)
  * resctrl_limbo_resume() - Restart the limbo handler after a mount.
  *
  * The limbo handler stops while resctrl is unmounted. Restart it on every
- * domain that still has RMIDs in limbo.
+ * domain that still has RMIDs in limbo. Where the RMID depends on the
+ * CLOSID and the mount changed the hardware IDs a CLOSID is monitored
+ * with, the RMIDs in limbo can no longer be read: release them instead.
  */
 void resctrl_limbo_resume(void)
 {
 	struct rdt_l3_mon_domain *d;
 	struct rdt_resource *r;
+	bool release = false;
 
 	lockdep_assert_cpus_held();
 	lockdep_assert_held(&rdtgroup_mutex);
@@ -1057,6 +1068,13 @@ void resctrl_limbo_resume(void)
 	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
 		return;
 
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
+		bool cdp_enabled = resctrl_arch_mon_cdp_enabled();
+
+		release = cdp_enabled != limbo_cdp_enabled;
+		limbo_cdp_enabled = cdp_enabled;
+	}
+
 	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
 				lockdep_is_cpus_held()) {
@@ -1068,7 +1086,10 @@ void resctrl_limbo_resume(void)
 		 * it is queued again on a CPU picked now.
 		 */
 		cancel_delayed_work(&d->cqm_limbo);
-		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
+		if (release)
+			release_limbo_rmids(d);
+		else
+			cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
 	}
 }
 
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 002f56e15362..ff1e1d6420fa 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -62,6 +62,7 @@ bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
 u32 resctrl_arch_system_num_rmid_idx(void);
+bool resctrl_arch_mon_cdp_enabled(void);
 
 struct rdt_resource;
 void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
-- 
2.43.0


