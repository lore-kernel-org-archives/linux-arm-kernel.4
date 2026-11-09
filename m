Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCCD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vtfv43tH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s79WHJj+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yjcmzLe9NLb31BRnk0YYkyQlltkBEnbcgBXYWiIw6EQ=; b=Vtfv43tHzIaqlp
	D1b2dDOGKy6X2MwePec8YrXztO7+wBpk3+ATGQnIJfDpl3d9f8vnZ+X+whQLh5P0C4804uyrvQPHs
	24Kc+12HToXAQ2VcZRfDRoiLrDxxyBRsLtsgeG+u0ESd/KDEgmP5tiZQniku/55MvwcbLeOMN1W6L
	07+DHul9TDDxz4fMmYlbQ8PCsmSL/b9jPBTaCPabqiO8oWzdRQrXetzxXtfunym7t8MmS5Etn8ux/
	ADCnC7j2egGUUmlCfI2/V/Ar3qF2lCvtUihXyxPUqbRdBlnHV21umiuQwFf1U1CirxF0XPpDugnuR
	ZZtXF/dXocNdxBc/cBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOy-00000000nul-47mY;
	Mon, 09 Nov 2026 13:27:12 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOt-00000000noW-2rd6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:27:09 +0000
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso586656a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230826; x=1794835626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjcmzLe9NLb31BRnk0YYkyQlltkBEnbcgBXYWiIw6EQ=;
        b=s79WHJj+D3ln9jINiigUqW2U6kz/Vk9wJbB/QTvpqJ8e9pJvd/abRE5K14Xuf/ooaM
         Cd4pGCxofvXDZGOlaCXh2eMrjsMN2v3VLOFqilF8Zi/3n1AruXQkFWntGFdlK92UPxGV
         V9QUtXLa2SUYqmDs+k7SdPKzGTmsOTx1nXGr/tXhK4KQ43G42CF4ymr4MWatbR3QWraX
         teGyhxnEdDsdSSuD4n6oNB5l3kEuUPV2mRRP6Aa04nIOZ/IdmP6j5TvytSU9qLNKU88J
         JUYD+SwGTnT2jtO5HCv2AMfQiwkVRkCuFyApNlBJ3MyIU9mSaIEPgi3lI4cp46vuwdKx
         Uklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230826; x=1794835626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjcmzLe9NLb31BRnk0YYkyQlltkBEnbcgBXYWiIw6EQ=;
        b=sX9W+nIlw4o1e4hNBIRstVZEZ2O1yTRo5SwII4Ap/Iyr/eqjjnAKYOGqiWlVB50UC3
         9pzo7LTzjgjux7s58ohCj5PyjRtDWYqDU/3aw/mVqBhCsrol8v5B3msoZtQmgSRVmtf+
         tzGvqtvjOSbEgmgHYR4DEqBtUTMKZ9e1Lngf6ntpnnr0bry1vcQfWvJRN070/arBYcz6
         K8KvpZpuC4SUR8zefAe6p/O8UasAZ01QorqeCKfqUpQda8Pm9euLD9Cnq6GtdOapXG3G
         j/FohF4Oa70Ph0zutoEG+RnaY1lB59AvWpvt4Wl/eHuVq38zkRZ1gXnziv9uWM4G/Xuv
         VlNg==
X-Forwarded-Encrypted: i=1; AL+hErHjFSvfn3FoqNIDfXPofqbcFSDre+eP8IZzqV4otMH6lzRrNrL50Xbfgn+NSDS8MlUKbuvQLGdElBATvo2UpJY7@lists.infradead.org
X-Gm-Message-State: APuU4Z+nyIKgtZwjMrOTtV3c9BjrG8M91A9UiTF/sGCws4+5+tC4RKla
	4lOc/pWJyFYd+7pLrMi4ZMPJFWoKoB8di2vAA4bO1B9B/wwKwM8CLOjz
X-Gm-Gg: AYBFou3cOgOZsmKqXnI7H00wdb06sOUrKLG5ncaZpuqwvUx0vHz4QFqpCKiL3JDCuyJ
	kOJR5t4NJm5/Q/oD7vocpwv7FqiEsPg15dHfSVyMiuIdIRh7U3XPK19xgCGoB0bODc7il22uBQk
	vD0FX6w0eW6oLfHBTcC+uMuD5lJ0E9KimKO/XgbyvU45qFoJClGN3QQjdh0eTuhNqtW+Q4sOS2Y
	Ku9Nf34itmbvQz0udR0nDb/x/eMz4IFSwit9sp6P62Rz0ejnfw8SRpxMsrZ38gDJfQKj1YiLd58
	co2FlUEYX1zy1Q3ivfKaJ+lD5vVt1UiaC8n2ik/Ts8ciU9yFLbZpXL3F2t2vRAFNhsTWI1Jv9yk
	4j9WRIKBfCLPV8JRT+tsgvEf7yIIpFnTqmI/BVmaF343tQngZoZ5+iipZ5EvO2gkYJP3DZxNvaf
	lL6CqPKaNBUsHyFXhbp8NAZPQxabZP7bIa49vAz+Ox41wwqOXxWMbYAHJL45lat7Brf05+f+FiI
	3gyQACFOybheHignF14sQ5RH0DuS4WBQMkIW1/DQ6cGEsmVGnvorIA6Jmca+5hSiNqSvLsgxJAT
	T3JpxtBOYVaYdi0FbUTeksjd8Aywfl+dDeNk0hpLCGdLheS1bF08sQYANtaRRJ8x
X-Received: by 2002:a17:90b:3e48:b0:3b0:9cc6:62bc with SMTP id 98e67ed59e1d1-3b12d4ca89fmr3867376a91.37.1794230826398;
        Mon, 09 Nov 2026 05:27:06 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:27:06 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 6/6] arm_mpam: Program the hard limit for the software controller
Date: Mon,  9 Nov 2026 21:26:21 +0800
Message-ID: <20261109132621.3862497-7-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052707_746353_75E1054F 
X-CRM114-Status: GOOD (  23.41  )
X-Spam-Score: -1.8 (-)
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

MPAM's maximum bandwidth control has a HARDLIM bit (IHI 0099 B.d
Section 9.6.9): when set, a PARTID that uses more than its maximum gets
no further bandwidth; when clear, requests above the maximum are
serviced when no other request is waiting. The driver writes only the
16-bit maximum, so the control is a soft limit and the software
controller cannot keep a single requester below its target.

Carry the hard limit in mpam_config and set it when the controller is
enabled. MPAMF_MBW_IDR.MAX_LIM (Section 9.5) reports the implemented
behaviors: 00 both, 10 hard only, 01 soft only. Record the soft-only
case (and the reserved 0b11) in resctrl_membw::max_is_soft_limit so
mba_MBps is refused there. Merging resources into a class propagates
the soft-only case, as the hard limit is only usable when every
resource implements it.

The percentage interface never sets the hard limit, and resctrl clears
one set by the controller when it resets the controls on unmount.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 55 ++++++++++++++++++++++++++-------
 drivers/resctrl/mpam_internal.h |  4 +++
 drivers/resctrl/mpam_resctrl.c  |  9 ++++++
 3 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..2c8f60c96d3f 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1025,8 +1025,22 @@ static int mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 		 */
 		props->bwa_wd = min(props->bwa_wd, 16);
 
-		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
+		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features)) {
+			/*
+			 * MAX_LIM: 0b00 both limits, 0b01 the soft limit
+			 * only, 0b10 the hard limit only. 0b11 is reserved;
+			 * treat it as the soft limit only so the software
+			 * controller is refused rather than rely on an
+			 * unknown limit behavior.
+			 */
+			props->max_lim = FIELD_GET(MPAMF_MBW_IDR_MAX_LIM, mbw_features);
+			if (props->max_lim == 3)
+				props->max_lim = 1;
+
 			mpam_set_feature(mpam_feat_mbw_max, props);
+			/* The hard-limit bit is a configuration bit. */
+			mpam_set_feature(mpam_feat_max_limit, props);
+		}
 
 		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MIN, mbw_features))
 			mpam_set_feature(mpam_feat_mbw_min, props);
@@ -1911,16 +1925,21 @@ static int mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_max, rprops)) {
-		if (mpam_has_feature(mpam_feat_mbw_max, cfg)) {
-			ret = mpam_write_partsel_reg(msc, MBW_MAX, cfg->mbw_max);
-			if (ret)
-				return ret;
-		} else {
-			ret = mpam_write_partsel_reg(msc, MBW_MAX,
-						     MPAMCFG_MBW_MAX_MAX);
-			if (ret)
-				return ret;
-		}
+		u32 val = MPAMCFG_MBW_MAX_MAX;
+
+		if (mpam_has_feature(mpam_feat_mbw_max, cfg))
+			val = cfg->mbw_max;
+
+		/*
+		 * The hard-limit bit follows its own feature bit so that it
+		 * can be set without changing the maximum.
+		 */
+		if (mpam_has_feature(mpam_feat_max_limit, cfg) && cfg->max_limit)
+			val |= MPAMCFG_MBW_MAX_HARDLIM;
+
+		ret = mpam_write_partsel_reg(msc, MBW_MAX, val);
+		if (ret)
+			return ret;
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_prop, rprops)) {
@@ -2661,6 +2680,19 @@ static void __props_mismatch(struct mpam_props *parent,
 		parent->bwa_wd = min(parent->bwa_wd, child->bwa_wd);
 	}
 
+	/*
+	 * The hard limit is only usable if every resource implements it,
+	 * so the soft limit only wins the merge. The encoding follows
+	 * MPAMF_MBW_IDR.MAX_LIM.
+	 */
+	if (alias && !mpam_has_feature(mpam_feat_mbw_max, parent) &&
+	    mpam_has_feature(mpam_feat_mbw_max, child)) {
+		parent->max_lim = child->max_lim;
+	} else if (mpam_has_feature(mpam_feat_mbw_max, parent) &&
+		   child->max_lim == 1) {
+		parent->max_lim = 1;
+	}
+
 	if (alias && !mpam_has_cmax_wd_feature(parent) && mpam_has_cmax_wd_feature(child)) {
 		parent->cmax_wd = child->cmax_wd;
 	} else if (MISMATCHED_HELPER(parent, child, mpam_has_cmax_wd_feature,
@@ -3405,6 +3437,7 @@ static bool mpam_update_config(struct mpam_config *cfg,
 	maybe_update_config(cfg, mpam_feat_cpor_part, newcfg, cpbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_part, newcfg, mbw_pbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_max, newcfg, mbw_max, has_changes);
+	maybe_update_config(cfg, mpam_feat_max_limit, newcfg, max_limit, has_changes);
 
 	return has_changes;
 }
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..184fbc01fa91 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -234,6 +234,7 @@ enum mpam_device_features {
 	mpam_feat_msmon_mbwu_capture,
 	mpam_feat_msmon_mbwu_rwbw,
 	mpam_feat_partid_nrw,
+	mpam_feat_max_limit,
 	MPAM_FEATURE_LAST
 };
 
@@ -243,6 +244,7 @@ struct mpam_props {
 	u16			cpbm_wd;
 	u16			mbw_pbm_bits;
 	u16			bwa_wd;
+	u8			max_lim;
 	u16			cmax_wd;
 	u16			cassoc_wd;
 	u16			intpri_wd;
@@ -364,6 +366,7 @@ struct mpam_config {
 	u32	cpbm;
 	u32	mbw_pbm;
 	u16	mbw_max;
+	bool	max_limit;
 
 	struct mpam_garbage	garbage;
 };
@@ -628,6 +631,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 
 /* MPAMF_MBW_IDR - MPAM features memory bandwidth partitioning ID register */
 #define MPAMF_MBW_IDR_BWA_WD		GENMASK(5, 0)
+#define MPAMF_MBW_IDR_MAX_LIM		GENMASK(9, 8)
 #define MPAMF_MBW_IDR_HAS_MIN		BIT(10)
 #define MPAMF_MBW_IDR_HAS_MAX		BIT(11)
 #define MPAMF_MBW_IDR_HAS_PBM		BIT(12)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..5f35bfe1955a 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1236,6 +1236,7 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		r->ctrl_scope = RESCTRL_L3_CACHE;
 
 		r->membw.delay_linear = true;
+		r->membw.max_is_soft_limit = (cprops->max_lim == 1);
 		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
 		r->membw.min_bw = get_mba_min(cprops);
 		r->membw.max_bw = MAX_MBA_BW;
@@ -1481,6 +1482,14 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
 			mpam_set_feature(mpam_feat_mbw_max, &cfg);
+			/*
+			 * Always carry the hard-limit bit so that writing the
+			 * maximum clears a hard limit set by an earlier mount
+			 * of the software controller.
+			 */
+			mpam_set_feature(mpam_feat_max_limit, &cfg);
+			if (r->membw.mba_sc)
+				cfg.max_limit = true;
 			break;
 		}
 		fallthrough;
-- 
2.43.0


