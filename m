Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57772607BCDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qSeYafPt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGI+keYl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fTSRhI7N/2ri6MBbUf6jFRoiVt7qnFhqogVJCSQOksE=; b=qSeYafPteMZrLi
	XkBVgRGS8Af+CP3obWEMi4qiEKhs9tDvdRui32AbFj8Dq6L+9pRJ5wvwz+JIV7HX3wSoWCCI7lFh+
	zWS9/WpqPpmvmCkubqfchg7KC+yQ7PxptmB1BMoaIFYfjHjnzwdn5/CLTX/giS3VraKiNBFm0Hhvs
	3uTxvZdzASPwVai2382wl61zfY5gjJ3RTH61AmQPBq1f1gxLAZ2YKKFl6URM0bbrhFh5GX9rawM4D
	c1AdNS3UomrMtqSGVzhna+s56XCTcF0JdYI/0LKm0FtpntNwTBMq0XiS5p/I2NlkDNYDePcCDs1FA
	/tkBF3yHgmG5zUfMeoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlnH-000000041vj-0pha;
	Tue, 10 Nov 2026 13:21:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlnD-000000041uR-4Bfh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:21:46 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso12679685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316903; x=1794921703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTSRhI7N/2ri6MBbUf6jFRoiVt7qnFhqogVJCSQOksE=;
        b=FGI+keYlpOENdDuIJK7so7gBl9YMjR2wkoHIT6/EuheOMYIxqIhn2vJDxDqHYUX0Ay
         xr3bR/KCdWAyWnZ4eugVpA6MvkD5MUjuZmD/I+quyTH5fqtAuG8XmFZO8hUMx0BHe8A6
         bK8w84MeuTe0OzLpckO3JMG1g0wybbu78BN4D63CFywZMAaF09GBBA8MPj48//D1bcgI
         VTcrFeD/0/tGKjaoYGhAfBTD3EgwjZ207aFzJAoUYg5BDeIPaJD4MjhTlRXzZsDCtz19
         isBQZZW72qJh8a5+QqznPRGLimszYUGteSLuAFQs9VEYytsRSaK0E/dy2oHRtQCr2mwh
         dy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316903; x=1794921703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTSRhI7N/2ri6MBbUf6jFRoiVt7qnFhqogVJCSQOksE=;
        b=Bba4lPfv1vy9IMoySUHZulpw41xkRHQOQTpNMDP5NtS0xuOh5x9jO5wJR6ghLKkb8O
         +goQQmxtkfF0wK4OMvSZEJrCpvwFnU8JpsHWJoDDmwuCp3CAnwmQ2Lwa5EbqKma/fMKI
         c0vUHNJ9ew09PkUFrJg8qN+AN5JsdV9l+JcgO8pQ0gemC9/7tQyzUhnblmopGImsI4VF
         bytZvLhT3mCNAb0xW/4dzRo3EXJ/8FhqRfARxA4e3ntAoCN4NCR9C5EPBYW/019pHDiC
         Gq3H8AL3gs6+vbHi0/gAT5ececFwTZd0y2Pc3FOQn39F6FHgarRam0/OGtcnYkzAPOsY
         WCrA==
X-Forwarded-Encrypted: i=1; AL+hErHRMxGozIyH86TwA5G7IGD65LeqyDtkIQUEcusr9K4ctMWBgpEhpV2SzMdmrGdgq+4wcm97s3gt3BlWhMuRAxCn@lists.infradead.org
X-Gm-Message-State: APuU4Z/3XCFU9LSkxNsOWrbMDbnBR0fLxHLCi4G9a+eYVUF9OMfq6DsO
	6X/y0OdGaljfRQkYJgJOS0UCGOskbGDJXKLobWPPKlI+Ggja2p380PX+
X-Gm-Gg: AYBFou0+a6nGCzTjjmXS7oK6HCMFxtVvamjIPp0KNBOY967s0S1fcDiEANSXqSinS16
	NZwp9QIfTEwAIhXDYeT2IMSaq989i0/be1LsPcqqeANAfpFZXsw3xSyrS0Q6iC28cMQbGz46kQY
	XEn8mI3SKi8b8hnv4ukrf3QqFVYuEOD2SHk3UkF1Ayth42QKSTcOfUvlE5MvYFb6j55VVb/VT7e
	z8Jo3IVORuhO92gGYmVZq3vqsX1pLyVmynYAo+U1fpouax1UZvzCd1UJCGsyOE43tEe0NoRgrI5
	UAUN6I4u+HC85gYtr4JpuRaCnBBl7YGxHX8/mFtCg+KxWNme4KLl6UpiixQK082nch48PwpXw4F
	dMQYQHj08xro7Gh2X/mUGspc6S5aNtJHVXP+s8E937SaK1bzyccfBfonSebPYtpi5wkjmsBsQeC
	5SpShEflDCRt9pk5ujjKsj/IJmWNQ6xfUHxFAdbLQuEw9DR1iYw0xPSNS0MT8L7ZP9lL/whdHU2
	0uSzdfpyksn2zd2dIjLqI0nCoTohDV8bjXo1d/xzv1rf0JsFfUvr1VXph2JQt07Q7mlhX9S08E5
	8+uYXQNFzbZmKhxGE34RFWyP2eRRpyHa40QAElIlRODAcCBYkV0qIZN1BBpdTZQ=
X-Received: by 2002:a17:902:f70f:b0:2ed:21fb:e75f with SMTP id d9443c01a7336-2edb91acef3mr23181235ad.48.1794316902956;
        Tue, 10 Nov 2026 05:21:42 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:41 -0800 (PST)
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
Subject: [PATCH v5 3/7] fs/resctrl: Clear the CDP state after the cleanup
Date: Tue, 10 Nov 2026 21:20:50 +0800
Message-ID: <20261110132054.3702-4-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_052144_040835_A7713A37 
X-CRM114-Status: GOOD (  17.02  )
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

On MPAM a CLOSID is translated into the PARTIDs that the hardware
configuration uses. Without CDP, CLOSID c is PARTID c; with CDP it is
PARTIDs 2c and 2c+1. resctrl_unmount() clears the CDP state with
rdt_disable_ctx() before resctrl_fs_teardown() removes the groups, so
the teardown translates the CLOSIDs differently from when the groups
were set up.

For example, rdtgroup_unassign_cntrs() unassigns and resets the MBM
counters of each group through resctrl_arch_config_cntr(). On MPAM that
helper maps a counter to a monitor with the index
resctrl_get_config_index() returns for the CDP state. A counter assigned
while CDP was enabled is mapped to the monitor for PARTIDs 2c and 2c+1.
With CDP cleared, MPAM removes the mapping of PARTID c and resets the
monitor for PARTID c instead, so the mappings of PARTIDs 2c and 2c+1 are
left behind. The helper had an empty body on MPAM until the ABMC support
implemented it, which is when the teardown started to program the
mapping with the cleared state.

Clear the CDP state after resctrl_fs_teardown(), so the teardown runs
with the CDP state the configuration was created under.

x86 is not affected as its RMIDs and counters do not depend on the
CLOSID.

Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.3+
---
 fs/resctrl/rdtgroup.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5d0351453c2f..3312637fb514 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3150,13 +3150,19 @@ static void resctrl_unmount(void)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+
+	/*
+	 * Clear the CDP state after the cleanup. The CDP state decides
+	 * which hardware configuration a CLOSID refers to, so the teardown
+	 * must run with the state the configuration was created under.
+	 */
+	rdt_disable_ctx();
+
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
-- 
2.43.0


