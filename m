Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FAC606D82B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zdZk60cu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPGfMqLA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fIn4mkSNdY/hxwoGUrWw1hPa5UFbAE2sAhOFZhD431c=; b=zdZk60cu08gpeu
	3j33nQZIs6oxvlQHD6DHwgIFTcov8wti/E82OYTN+qrSlOXBMM51Hum77QsGn2ApLLc7oWG+U8MAJ
	2Z2RP3Jr099kiOEU+9KtpGYPf8eIKJ/YakSvlH8GWtfLU+F5KV4wexqQoaxGKHngp91waoEthSmuV
	XEIDdfXvx/NccxldFwjmH3z4R1hxg+C6RjVwlOA/k5I44bTRgbHBqpIX9zW3VzghfnSgnQlL/ALSe
	4y9/jUpApIUFNmmm9b8VaGjT6oU81vP8Y+fal0sd3jmqM1qvY46K7oNAn3B/OJ9xxU6FM6w0VwCOf
	XFxHnKsivhLda+RwACsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOt-00000000npN-3ee4;
	Mon, 09 Nov 2026 13:27:07 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOo-00000000njk-0e6L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:27:03 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso291888a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230821; x=1794835621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIn4mkSNdY/hxwoGUrWw1hPa5UFbAE2sAhOFZhD431c=;
        b=TPGfMqLAsH2FOagcnFx8VLGZjTRzZ9cTlm+xjps+kCdYJvSCdU8EUNwde/G6plJZs8
         Hhb1JN1eSTTSON3hQv+0iDadHJgsixMb64cMjaDzQs2/bwQbRNRKgzyhwXx5LFd/xD6E
         g7CoVRiszhIkyXGBkcbmZ7n6UVWs9XeE0f9KiFqvGm5F3kV+hTk5VSAFUcfV7hCz/CWz
         EOY16V6gk6Y+bhk71VFilc0SqNsa3sgOKlWJPG/8xnfpdSwI9q10EUTsjPX/k94x/YNj
         DeOBSXKZreDGaiNoVgGNQk05JuPOkad98kiCn2vKaGITCCpwagbqp8eerJGsY2Fc3U9v
         fzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230821; x=1794835621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIn4mkSNdY/hxwoGUrWw1hPa5UFbAE2sAhOFZhD431c=;
        b=d0k5u6LLcT+pJJ85+KDs7LGjyP5PIdsnc+ZB7TI9pmG56q94rzg5yQJY147ARUmQEr
         PQwXiwGM0ZtfFhBkwoVm2lOT2LYRe8wKTY9774EzhVNL53DmO/FogQMjvB3CrupUmmh1
         XUVNooQSnXmzIf6Lt9Uv4JjoZEKKs8HrcURaUlJuuMapcdyT7i0Tu6fTPdkj+DHxKPPp
         STOvBQrWJcjQLSsgw/7/Mb/zsZEvlumaS3HwJdjy4AFgLTO6rqsZHjMhWypEoxLMkdmq
         BasVOcb8gE/9Kh2nPinuilwpnTxMdQuUX/jGGHTnvBivKAnopzs2kJ7QpYC22LujHuL4
         1a1A==
X-Forwarded-Encrypted: i=1; AL+hErGZLcsioSVB+wle+DracwkFE3ENYBh0fAyq9rstg/cn7cR4bQDdbtrigXh38/do5LVTTG7Sl0eP7IRqmiv3V9nP@lists.infradead.org
X-Gm-Message-State: APuU4Z9qZ4Dilus0ARTY/w4934koZEG478IZ0d37BIZgkn7eLCH/wMcV
	DNJZDmoWIpWfelXt39spqH/z5mZX2PaiB8kKZ9OESpxV+4aXsIw5u4NL
X-Gm-Gg: AYBFou31Nss8r1xBYq3wus/zKcOR22PDjQrKa0LsyU7D8RqnQBwK2Np1c75i5pmDr4/
	S0Ws16wQVioLE7NOl6RatwfCrmfhnhkDA0oLcqXlmqslo8vDWLDITb+EI8aG3RE3uryd1+nWGhj
	fNXYcsL6BBVdh1wyrj6004aTnJFbnLM748d8G1VACGbCjRnCXSPgU6ccuBlMc1WuMrO9RAmXL9K
	tVVAz1bKsDFRrrv15wiKYySf1a2WGBFhjLcNm8E2gKUKQLVaQ9qroAj1nXRps2j3h0hDrclJbwb
	rCRw9WVasEtY8x4EQ8rOmp9hFop4R7HaJcJMnhiSYTmnFCqYF57eYD0xA0RpeRbAtoNyPweTKhP
	wAmLx4evMAtlxFMcs3xlsxK2QMEoVJAcxqlDkufQ0xAOe+D8Y2bKkPFE1/pdTwJLUdiYq9fDfCJ
	C8s/xJUkxincyE62bb4Es4T1uz3bIU/dbiALx0FsdhAzLSMcGILpnjc2tUj/cT4j8P6fALMPo03
	OsxLKB339vox0rzL1z1o2lK4PnM8fWwwb/f+x1i/MDNh6eDJE8ImMOY82ZzhFjXGPzMcgC7DRBt
	dlu8DPxmblYDbcsH0QnHlTepyic/vMhozp48uiDCqhEn95OegPmdR9NILYgY2Ts=
X-Received: by 2002:a17:90b:47:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b12d105c47mr3658009a91.1.1794230821078;
        Mon, 09 Nov 2026 05:27:01 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:27:00 -0800 (PST)
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
Subject: [RFC PATCH 5/6] fs/resctrl: Reject mba_MBps when the maximum is only a soft limit
Date: Mon,  9 Nov 2026 21:26:20 +0800
Message-ID: <20261109132621.3862497-6-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052702_230495_9587F705 
X-CRM114-Status: GOOD (  19.66  )
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

The MBA software controller lowers the maximum bandwidth control when
the measured bandwidth is above the value the user writes to the
schemata file. It relies on the hardware enforcing that maximum.

A maximum bandwidth control can be implemented as a hard limit, where
requests above the maximum are not serviced, or as a soft limit, where
requests above the maximum are serviced when no other request is
waiting. With only the soft limit, a group that has no competing
traffic keeps using bandwidth above the maximum and the controller
cannot meet the target. MPAM reports this in MPAMF_MBW_IDR.MAX_LIM.

Add resctrl_membw::max_is_soft_limit for architectures whose maximum
control implements only the soft limit, and refuse to mount with the
mba_MBps option when it is set. Architectures that do not set the flag
keep the previous behavior.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/filesystems/resctrl.rst | 6 +++++-
 fs/resctrl/rdtgroup.c                 | 7 ++++++-
 include/linux/resctrl.h               | 5 +++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index d70aec6f7096..d2dacb00a848 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -47,7 +47,11 @@ mount options are:
 	Enable code/data prioritization in L2 cache allocations.
 "mba_MBps":
 	Enable the MBA Software Controller(mba_sc) to specify MBA
-	bandwidth in MiBps
+	bandwidth in MiBps. Refused when the maximum bandwidth control is
+	only a soft limit: requests above the maximum are then still
+	serviced when no other request is waiting, so the software
+	controller cannot keep the bandwidth below the value written to
+	the schemata file.
 "debug":
 	Make debug files accessible. Available debug files are annotated with
 	"Available only with debug option".
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 957a3df7af83..572b3d9c79e5 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2614,6 +2614,10 @@ static void mba_sc_domain_destroy(struct rdt_resource *r,
  * With assignable counters that is only guaranteed when the architecture
  * uses a fixed assignment mode and assigns counters automatically; keep
  * that assignment enabled while the controller is in use.
+ *
+ * The maximum control must also be enforced by the hardware: a soft limit
+ * still services requests above the maximum when no other request is
+ * waiting, so the controller cannot keep bandwidth below a target.
  */
 static bool supports_mba_mbps(void)
 {
@@ -2623,6 +2627,7 @@ static bool supports_mba_mbps(void)
 	return (resctrl_is_mbm_enabled() &&
 		r->alloc_capable && is_mba_linear() &&
 		r->ctrl_scope == rmbm->mon_scope &&
+		!r->membw.max_is_soft_limit &&
 		(!rmbm->mon.mbm_cntr_assignable ||
 		 rmbm->mon.mbm_cntr_assign_fixed));
 }
@@ -3375,7 +3380,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx->enable_cdpl2 = true;
 		return 0;
 	case Opt_mba_mbps:
-		msg = "mba_MBps requires MBM and linear scale MBA at L3 scope";
+		msg = "mba_MBps requires MBM, linear scale MBA at L3 scope and an enforced maximum";
 		if (!supports_mba_mbps())
 			return invalfc(fc, msg);
 		ctx->enable_mba_mbps = true;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 10dfdca7f4bf..d1f989554031 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -250,6 +250,10 @@ enum membw_throttle_mode {
  * @bw_gran:		Granularity at which the memory bandwidth is allocated
  * @delay_linear:	True if memory B/W delay is in linear scale
  * @arch_needs_linear:	True if we can't configure non-linear resources
+ * @max_is_soft_limit:	True if the maximum control only marks traffic as low
+ *			priority. Requests above the maximum are then still
+ *			serviced when no other request is waiting, so the software
+ *			controller cannot keep bandwidth below a target.
  * @throttle_mode:	Bandwidth throttling mode when threads request
  *			different memory bandwidths
  * @mba_sc:		True if MBA software controller(mba_sc) is enabled
@@ -261,6 +265,7 @@ struct resctrl_membw {
 	u32				bw_gran;
 	u32				delay_linear;
 	bool				arch_needs_linear;
+	bool				max_is_soft_limit;
 	enum membw_throttle_mode	throttle_mode;
 	bool				mba_sc;
 	u32				*mb_map;
-- 
2.43.0


