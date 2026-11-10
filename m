Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBAB60A2605
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WV8cPtGt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHKrEvNC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RYs2hSwn8nYjE7NjLz5FT3KJmBw5ONd9purncIQHNZ8=; b=WV8cPtGtzbpIp1
	gP9iAEOHlELNTuUkYF1NlVD7FV/vL0MmO64REM1lOTaVUauf1bN6OJKneJymkZZilV7Lt/CC2IunC
	OrSsvWuajfCDYmjCv4snRg3x3l5DN5hFOvS4OAIEPDs4o6xD+VhXGZOMTi2rOSpyHr/ShUYHUyc/R
	ApdlxGt0CcELBBx0xeqrFuski9CJHj+cv4NQ93GBtACfNltkBOhbVKF+GUw/mqAW8WIRXf8ZgFIpT
	DLRYjGSHOBLbB3HcpUh/uhvfouFJRnO1p9GIbJgVxrU5mbvGgE+0NNcRnxGLR/+gEXUttNuBgkSly
	zYkvtfza0Uey1A8mWHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnJo-00000004IZx-36QF;
	Tue, 10 Nov 2026 14:59:28 +0000
Received: from mail-qk2-x0a.google.com ([2607:f8b0:4864:34::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnJm-00000004IZL-21L8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:59:27 +0000
Received: by mail-qk2-x0a.google.com with SMTP id af79cd13be357-93e67431372so192365785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 06:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322765; x=1794927565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYs2hSwn8nYjE7NjLz5FT3KJmBw5ONd9purncIQHNZ8=;
        b=nHKrEvNCM1GwZNMms90Jpl+TI8pKF5kcPurNHVABPaiaELNEERVI0/zNQhmc87F1Th
         aMAqlZSjb1fhGVTIu8/1ncv/q8iFMpoQGFAIyZVmDwmgvcHr6L213Ae90PEOwy+ASfkl
         kdWAEPxsakT037SRjCpeLokmA27FULD6wXkCSmWFPtrNcJLQHyNZ7IW6fV2p3JrcsGPf
         FjRfqT18etwhiSVyvsFdew7zW6ITIRuj2WvZmhAaIHAQmHLug6DsqkvJg4pqbFLu8CNl
         57qJ1QNAuwgIK5aq1UOS25CIkZrP89drWUzAwLVczEieI4Ur4ceKIRlDvzVyq64LdWeS
         Znvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322765; x=1794927565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RYs2hSwn8nYjE7NjLz5FT3KJmBw5ONd9purncIQHNZ8=;
        b=A1SC9PfauGkEVdO/Yeh+vDXsAj/h/ez/SyfHGJ0hHzME0retDY2deGbnRKwRlc88ke
         u8Ug10l3SqPsDUysVVEcadix9CI8eyfuktYVoTVp4/qu0424Ads+Iogp81Y6g0t0Bh15
         akNUJhjdKAWAogAC4D2nbLHM6Y36AOQvuF7nt7YwNqiJiPpY2eW451S9ToPe8/jyVX63
         p++kan9NqNSw3z1euhTEp2RRwUiC7NOla7VFkn/vz8X641cuTUH8F/gDbRwIbmfPFOSA
         ZA8jg1kCvwahFWSiP60TtY2rmLgt2oX2qJtqyad6/G9Tq9mq8VCko6QkSdUdExTxSmc8
         raug==
X-Forwarded-Encrypted: i=1; AL+hErF9e6Y4JlGfqXphuVKmdp2EmiGYW4Kx8OTDFhv+u1rJH9t0oM2lNQNveiww5JmQTeltCCPs+YexC0kebumBW79W@lists.infradead.org
X-Gm-Message-State: APuU4Z9bjcfHFhw5MQkVPdOgRoI64lqrTWf9tVL5asqIKbcDzdyHplll
	bShO0XdGlkxLZ1G8y9NJcHm8Zixi9Igy4lyP83iPvF66wgbWbjjRW59XUNItDr+v
X-Gm-Gg: AYBFou1gUYcthJgC0N+eQpjplaPy3JBK8eJj4OwZG39ILkSNPCsl2+9xtTo+AGz3jmX
	+LXfLJSffV/xkmJSEeMsuAo/qPUdet8HHXrY2FCpKf/3Db0t+SAWknkqiyOEXMDeoLj8kYRLFQD
	CEwWkYGW09PMClFdN4zBTYGTniV4cyg1L/JChF5XZ1/w3NCvwUfAj6SbLtwTcYkb2rc8mgE9vzU
	6nWvMJmIT8oIu3tcJ03IztkP9CItVjzku4dcUTt6Hxj9NtVOf1XA3xhV79qFXy/N9oGcaK3gpoV
	QG9VBGCXVuOE1fzGT3gcPynFTmIE+7auql6swbq6taWCPjHRGvHz6ZP4qB9uPNKc0sKxFCQE8mG
	ntde2a9n87JOE+a956iOpoClEEHSLZg6LMywuhJxScpBbVXOXVoL3d640ytToUoh/ZldMs+02/a
	CBnKH5PUPaEObB7MomrVy6OiK6/B9fJhWDU5RbVUFddAUZkBdLhD4kMB63fHfXEbM1QF5P9cKnw
	4Et9VyTzI0nzN1B5lI9rbZ/DR63MMJB2Cz4gjU/ZwSfFBAtcQQb2HGvSY79QFeDDWFyb3tZSQ1m
	fdcn4Ubwf4SUnys38eFdeoNEl1Cf+9ZyVBm8hHz8coEL2wxOAVgH9ycB940RP2Y=
X-Received: by 2002:a17:902:e751:b0:2dd:c053:a6ee with SMTP id d9443c01a7336-2edb9260ab0mr26092925ad.32.1794316893463;
        Tue, 10 Nov 2026 05:21:33 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:32 -0800 (PST)
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
Subject: [PATCH v5 2/7] fs/resctrl: Do not allocate a monitor context when releasing limbo RMIDs
Date: Tue, 10 Nov 2026 21:20:49 +0800
Message-ID: <20261110132054.3702-3-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065926_566741_7C66D2FD 
X-CRM114-Status: GOOD (  26.49  )
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

Busy RMIDs of a monitor domain are normally released by the limbo
handler once their cache occupancy drops below the threshold. When a
domain goes offline, its busy RMIDs are released without checking
occupancy, since the domain is going away and the RMIDs would otherwise
never return to the free list.

On the monitor domain offline path, __check_limbo() allocates the
monitor context that an occupancy check needs before it scans the busy
RMIDs, but without using it, and returns early when that allocation
fails. Then the caller destroys the domain's monitoring state, including
the bitmap that records which RMIDs are busy, so nothing can clear those
bits afterwards and the busy counts never reach zero. Those RMIDs never
return to the free list and, where the RMID depends on the CLOSID, the
dirty count of their CLOSID never decreases. The allocation can also
wait for a monitor to become free, which stalls the CPU offline path on
a context that is not going to be used.

Only MPAM systems are affected. An architecture that can always read an
RMID allocates nothing for the monitor context, so the allocation can
neither fail nor wait there.

Move the release of busy RMIDs into a separate function that does not
take a monitor context and leave the occupancy check to __check_limbo().

Fixes: e557999f80a5 ("x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: <stable@vger.kernel.org> # 7.1.x
---
 fs/resctrl/internal.h |  2 +-
 fs/resctrl/monitor.c  | 72 ++++++++++++++++++++++++++++---------------
 fs/resctrl/rdtgroup.c |  2 +-
 3 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..1c85e06f09bf 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -405,7 +405,7 @@ void cqm_handle_limbo(struct work_struct *work);
 
 bool has_busy_rmid(struct rdt_l3_mon_domain *d);
 
-void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free);
+void release_limbo_rmids(struct rdt_l3_mon_domain *d);
 
 void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index b8f4e1ff4083..ae9ddd380515 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -124,21 +124,45 @@ static void limbo_release_entry(struct rmid_entry *entry)
 		closid_num_dirty_rmid[entry->closid]--;
 }
 
+/*
+ * Release the RMIDs that are marked as busy for this domain without
+ * checking their LLC occupancy. Cache lines may still be tagged with
+ * these RMIDs and will be accounted to the next user of each RMID.
+ */
+void release_limbo_rmids(struct rdt_l3_mon_domain *d)
+{
+	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
+	struct rmid_entry *entry;
+	u32 idx, cur_idx = 1;
+
+	for (;;) {
+		idx = find_next_bit(d->rmid_busy_llc, idx_limit, cur_idx);
+		if (idx >= idx_limit)
+			break;
+
+		entry = __rmid_entry(idx);
+		clear_bit(idx, d->rmid_busy_llc);
+		if (!--entry->busy)
+			limbo_release_entry(entry);
+		cur_idx = idx + 1;
+	}
+}
+
 /*
  * Check the RMIDs that are marked as busy for this domain. If the
  * reported LLC occupancy is below the threshold clear the busy bit and
  * decrement the count. If the busy count gets to zero on an RMID, we
  * free the RMID
  */
-void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
+static void __check_limbo(struct rdt_l3_mon_domain *d)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
 	struct rmid_entry *entry;
-	bool rmid_dirty = true;
 	u32 idx, cur_idx = 1;
 	void *arch_mon_ctx;
 	void *arch_priv;
+	bool rmid_dirty;
 	u64 val = 0;
 
 	arch_priv = mon_event_all[QOS_L3_OCCUP_EVENT_ID].arch_priv;
@@ -161,30 +185,28 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 			break;
 
 		entry = __rmid_entry(idx);
-		if (!force_free) {
-			if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
-						   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
-						   arch_priv, &val, arch_mon_ctx)) {
-				rmid_dirty = true;
-			} else {
-				rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
-
-				/*
-				 * x86's CLOSID and RMID are independent numbers,
-				 * so the entry's CLOSID is an empty CLOSID
-				 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
-				 * (PMG) extends the CLOSID (PARTID) space with
-				 * bits that aren't used to select the configuration.
-				 * It is thus necessary to track both CLOSID and
-				 * RMID because there may be dependencies between
-				 * them on some architectures.
-				 */
-				trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
-							      d->hdr.id, val);
-			}
+		if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
+					   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
+					   arch_priv, &val, arch_mon_ctx)) {
+			rmid_dirty = true;
+		} else {
+			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
+
+			/*
+			 * x86's CLOSID and RMID are independent numbers,
+			 * so the entry's CLOSID is an empty CLOSID
+			 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
+			 * (PMG) extends the CLOSID (PARTID) space with
+			 * bits that aren't used to select the configuration.
+			 * It is thus necessary to track both CLOSID and
+			 * RMID because there may be dependencies between
+			 * them on some architectures.
+			 */
+			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
+						      d->hdr.id, val);
 		}
 
-		if (force_free || !rmid_dirty) {
+		if (!rmid_dirty) {
 			clear_bit(idx, d->rmid_busy_llc);
 			if (!--entry->busy)
 				limbo_release_entry(entry);
@@ -843,7 +865,7 @@ void cqm_handle_limbo(struct work_struct *work)
 	if (cpumask_empty(&d->hdr.cpu_mask))
 		goto out_unlock;
 
-	__check_limbo(d, false);
+	__check_limbo(d);
 
 	if (has_busy_rmid(d)) {
 		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..5d0351453c2f 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4590,7 +4590,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 		 * the RMID as busy creates RMID leaks if the
 		 * package never comes back.
 		 */
-		__check_limbo(d, true);
+		release_limbo_rmids(d);
 	}
 
 	domain_destroy_l3_mon_state(d);
-- 
2.43.0


