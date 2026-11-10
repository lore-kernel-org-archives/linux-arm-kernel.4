Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98C5606B2C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4hV9zreS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyfWbmE2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OTx52hVUF9lB6fufKA+RTnJSg0CR3TeUfaD+GwbgFjg=; b=4hV9zreSJNPA3f
	nVHfIqRtFKHk1Hw+o6hA1eT8FZ+QbH1BuCM9cZRI5y6hAFhlr3cQ+Z+7+aGh8jI5T4et7q+HMJouo
	WWfWB8tQ2NDah6izmhfNpOKRnyDxfG2/0EcrfvN4jnAxvz+tY9P8iQtCxL41GteuNK6pg88hm1hb4
	xlJs5dMwzrp6zPsYqlaxQW+NiLfHDQtzUOTAWY3VpMdnUC6mIVhkajG2fsLCZdv4eAnRQ/ltr04uo
	vv3cbGYjJibCbFHFMtVVnXW4k4z6dNsJU7bTE+O2qlFvPXlu9A6GdpBySH5rZx5ZPaDUJg0PvEsf0
	Bl1RRmpF9IPVMoor9XLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlnN-000000041zT-1mjy;
	Tue, 10 Nov 2026 13:21:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlnK-000000041xg-49zZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:21:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e942864693so10410755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316910; x=1794921710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTx52hVUF9lB6fufKA+RTnJSg0CR3TeUfaD+GwbgFjg=;
        b=WyfWbmE2D1OxX6F1cUrwgUo09tnPs7hxA173DhOtcOM/hebvd10H+ACMA35GHdNtva
         y6uVsFVYrM6M+spy4ALeENcuqxiLsVz34tPylh5BZzI4pvK8y+8NKq4ZOXU3wvqow38W
         jQ3BsmPdy+mWFSCZ3/uW4ArS1FYUTbLBcf6zF7iimhFM2Lz7dhILUX4gwtq7+7tJRNgf
         yPB14p517FOG72NAqX4ctTm196e/KqhkGCjlpAW2FvKqaNwQ/0SBpBRlYtI+7RQDZj6L
         FMO2t5SndsTHzkWzBkuriQeHAAyO9EOB25Oh0j38xp5A1Zs/BFTnpwQl89Dd7/6unhsH
         j4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316910; x=1794921710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTx52hVUF9lB6fufKA+RTnJSg0CR3TeUfaD+GwbgFjg=;
        b=E2RvrL6s9/i+rDWfcldqken5AzbFaYEAzQaPjK+d1lExmP/3Pcq3Ga71pp0xkwKOY4
         fql6NkG8XfE5YYm/lQnzEBagRPoDh91qo4h6SP7PLvwnQGLmeVL2laLBcFSNwDLvSYFj
         fDs8GOiE4G1Ltgh+XdVhgaAldQLxMUrZBJCD84iiXhc9Aw0tdLOuaGVTpDoJ43YvRrZn
         u5P+OqtpVVRHc+Sea+LXXudIKR9deyHFxlKN4UrWwbI6Bt6XZA601CwDWnDZ+DVMLONn
         uvzvCP+rcEVefU1A01EmXRBPb8SI+6l/4eo0Fhr7K3OBFeevPC8S+k5uDxsoAtUTqmkD
         6yPA==
X-Forwarded-Encrypted: i=1; AL+hErHHAFWOHDcpylChYKKJO4p3mG5GoBftwXPoKVkZr3xlYH4Xv4Jjak5spZVa8TkBxxJHxKZ8R0PdfvQ234OzjTYP@lists.infradead.org
X-Gm-Message-State: APuU4Z//tEsDu7rQgu11wFE7DueQfk2q/pyRpzQd4MwYviYRdGotU8O0
	UdRzqG0JrWDgRaIu3Dx/jhoUCMdsrFNg77uSqoFfZbnvsoVEegiYheF2
X-Gm-Gg: AYBFou0s30NMR+qWoOHA57rWLt7LAfByyNJdJx5GsuJ9OcXVSodOOdqkVHdmFgYcs+K
	rVKneNNaM6fq7THtw9xwOEf6sMMZd3XPtTevSZav9d7uLoCDYItjWeUXA3xuS8ajTSlbNTYb90P
	4gnr6I/VhN35UuXeKnOHhGd+ScGKGv5/p6WMhZGQz7msetwhYonzj7G0R1aec5iXIMH8Gs4IT67
	eOT1vcEP3oz94vTc5+IvUaBRGpkSuw7Hzfr7tO8IV2IHvwwmSR3tdg5sBKU+ovlNnlcq0tPR7df
	40QGGSeIjxIdwc9DDehuA3C+mh85GhOQwBPYdXcmkPSW+5DY08CF785HDwFEJrFr9Fxgw1uWkOp
	yeOG/5DDKLAj+0oTmiWWSWHvCFnfT0zLDnCtr9pugXb5N5vDCl4OMPd3TH072Uhx2WtBFKx70IS
	i/Yo3zgeOnLOjic+gokpdzLpboh1s0M8+ExjLsZJsDT7JGnmyjuC/+ARDspJDjwQp4FKD/CxAnS
	7TlTv1taPg/SyeT9rmAKddg53o6XQj2cSFFaGIF0jH8CiuVFu3AS0RseVH3d8jHYZ3hKFF4lFFN
	WYX8+6gONZHI7AEvTYUyk/I1wHLWA9qpS1f9wwa0xAfcH4ZZDAp0HXF8b29lkdE=
X-Received: by 2002:a17:903:1a0c:b0:2ed:ebc:460f with SMTP id d9443c01a7336-2edb91fc398mr24141765ad.33.1794316909936;
        Tue, 10 Nov 2026 05:21:49 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:49 -0800 (PST)
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
Subject: [PATCH v5 4/7] fs/resctrl: Stop the limbo handler while resctrl is unmounted
Date: Tue, 10 Nov 2026 21:20:51 +0800
Message-ID: <20261110132054.3702-5-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_052151_039946_2F0B3AF4 
X-CRM114-Status: GOOD (  24.43  )
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

A group's RMID is not returned to the free list when the group is
removed. It stays in limbo until the cache lines tagged with it are
evicted, and the limbo handler reads its occupancy counter in the
meantime. The limbo handler keeps running after resctrl is unmounted,
while the MBM overflow handler stops once resctrl_mounted is cleared.

Reading the RMIDs in limbo while resctrl is unmounted is not safe on
every architecture. On MPAM the counter of an RMID is selected by the
PARTIDs of the CLOSID that owned it, and the CLOSID to PARTID mapping
depends on the CDP state. The unmount clears the CDP state, so the
handler that keeps running reads the RMIDs freed under CDP through the
PARTIDs of the cleared state.

Stop the limbo handler while resctrl is unmounted, as the overflow
handler does, and restart it after a mount on every domain that still
has RMIDs in limbo. The worker can stay queued across the unmount, so
cancel it before queuing it again. This keeps the limbo handler
lifetime the same on every architecture.

On x86 the RMIDs in limbo are no longer drained while resctrl is
unmounted. Nothing needs them until the mount that follows the
unmount, after which the handler frees them as before.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1+
---
 fs/resctrl/internal.h |  1 +
 fs/resctrl/monitor.c  | 43 +++++++++++++++++++++++++++++++++++++++++--
 fs/resctrl/rdtgroup.c |  2 ++
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 1c85e06f09bf..c95fa6ce62e6 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -373,6 +373,7 @@ void closid_free(int closid);
 int setup_rmid_lru_list(void);
 
 void free_rmid_lru_list(void);
+void resctrl_limbo_resume(void);
 
 int alloc_rmid(u32 closid);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ae9ddd380515..f56d0e32fd06 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -852,6 +852,13 @@ void cqm_handle_limbo(struct work_struct *work)
 	 */
 	mutex_lock(&rdtgroup_mutex);
 
+	/*
+	 * If the filesystem has been unmounted this work no longer needs to
+	 * run. resctrl_limbo_resume() restarts it on the next mount.
+	 */
+	if (!resctrl_mounted)
+		goto out_unlock;
+
 	/*
 	 * Ensure the worker is dedicated to a CPU as intended and not
 	 * relocated by workqueue subsystem as part of CPU going offline.
@@ -1001,8 +1008,8 @@ int setup_rmid_lru_list(void)
 	/*
 	 * Called on every mount, but the number of RMIDs cannot change
 	 * after the first mount, so keep using the same set of rmid_ptrs[]
-	 * until resctrl_exit(). Note that the limbo handler continues to
-	 * access rmid_ptrs[] after resctrl is unmounted.
+	 * until resctrl_exit(). Note that the RMIDs in limbo stay in limbo
+	 * across an unmount and are checked again after the next mount.
 	 */
 	if (rmid_ptrs)
 		return 0;
@@ -1033,6 +1040,38 @@ int setup_rmid_lru_list(void)
 	return 0;
 }
 
+/**
+ * resctrl_limbo_resume() - Restart the limbo handler after a mount.
+ *
+ * The limbo handler stops while resctrl is unmounted. Restart it on every
+ * domain that still has RMIDs in limbo.
+ */
+void resctrl_limbo_resume(void)
+{
+	struct rdt_l3_mon_domain *d;
+	struct rdt_resource *r;
+
+	lockdep_assert_cpus_held();
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+		return;
+
+	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
+				lockdep_is_cpus_held()) {
+		if (!has_busy_rmid(d))
+			continue;
+
+		/*
+		 * The unmount may have left the worker queued. Cancel it so
+		 * it is queued again on a CPU picked now.
+		 */
+		cancel_delayed_work(&d->cqm_limbo);
+		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
+	}
+}
+
 void free_rmid_lru_list(void)
 {
 	if (!resctrl_arch_mon_capable())
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 3312637fb514..b702fe6dbbec 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3267,6 +3267,8 @@ static int rdt_get_tree(struct fs_context *fc)
 						   RESCTRL_PICK_ANY_CPU);
 	}
 
+	resctrl_limbo_resume();
+
 	/*
 	 * Ensure root remains accessible after mutex is unlocked so that
 	 * kernfs_kill_sb() can run safely if called by kernfs_get_tree()'s
-- 
2.43.0


