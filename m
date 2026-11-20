Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3960A2623
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QoJ2tGBM;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=pBjzt0ci
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aYcXr29ZY8+NqUOdQLPvNghpVC/hBxmFhnakvhMIR/w=; b=QoJ2tGBM7AeO0JQw8U/e+Wz3CM
	jfBK+p5noqtsWnZWcH/o7TeVQRACnuRwvrOubQz6au8rB1ZolPp1i5Gnk5IRfyKrFQu/U9bJOLjao
	g9ii7xIChd0EJGqt5taxxRmihtxjSCYlSihirIwCVV4j929s38poS+wcayGeb4HM/8jZ39sDxSPYJ
	g9pw7wBOS3OVGC0+OQ8iiH4aOmZ0m31iOt/V42gNw/IHe+64Sdg/585MCkE4LzbP3r+k9AewfFPW9
	VJCN5B5/sme3VWU32VcWM52El3dR3N+Hz1n0mJzepuRs7KX7k1/CTb7UtwZXKpV3zeb+FMeadjfZF
	zzMUkvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQUN-0000000FPGK-1dzH;
	Fri, 20 Nov 2026 15:25:23 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQUI-0000000FPDd-3LAN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:25:21 +0000
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfS0p1873902;
	Fri, 20 Nov 2026 07:24:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=aYcXr29ZY8+NqUOdQLPvNghpVC/hBxmFhnakv
	hMIR/w=; b=pBjzt0cia/3xeaNZgZ/YyNI+HecdEZ7sQm/m41c5xo5l0TgGE0Z0Z
	q+cbESnvpzZqJxJ2h360QqjJjFv5LykldupI8uKOIkR0F44Jhk2sYTvv3iu3M+JL
	ZRnaaQtSVif1JZRqCGGcAp8JDnmewtw05+4UcEqr11g1XmisTfAWoggVbtc5Buzi
	pKi4jtYxCJJD+rsv9ZGDTJLMfTKz6o1JM4uxK6UuBTm+X4ihQ9qlNAfVSIVFuPCT
	BFm42X6w7OuDxVQYcB2Yr4MdG6PPnAjAgQ5YMh6tZ3EWUnZorgpu7ei7fCJAR5bY
	GqFDJKHgxLi5TutyoyAmiGPNklqh5p20g==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j1yjp2hw0-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Nov 2026 07:24:58 -0800 (PST)
Received: from localhost (2620:10d:c085:108::150d) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 20 Nov
 2026 15:24:56 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel
 Pereira <danielmaraboo@gmail.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/7] coresight: syscfg: Fail to enable a configuration not loaded on the device
Date: Fri, 20 Nov 2026 07:21:15 -0800
Message-ID: <699bb518b0f92c57227d4c73e21c58d8aadcc5a2.1795182850.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <cover.1795182850.git.aaupov@fb.com>
References: <cover.1795182850.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2MSBTYWx0ZWRfX+f1pqSfc15Yj
 5FbV62ndl+ZKG73W8OMkFpIZvSM2z/bKZvhF82WWSDQUNhwJX9cRFQD/XUJn94JWazTKVqkacJ1
 lMK70bay08XTfo5MzZLVpGTzvP/uFYW/Nwu3FhFSOrJzOeIQ7gEYG1wi3sPSl8tOOQGEtlsUB65
 ow+YoNoXZ3CVrQxNITU1zbLAvYHrZUF3F+YuiqeGQ3ktwEhHk5MTqzMvEMMELhh27/AxR9/3CaJ
 YLAgB0xLUoAjZ9bms1QO2OP4hyt6BBb0bqcjoB4VxhbiPKEF1vGZDdKMloGzS00FAA+mvZYyFwu
 0lWOicSdyMxq32OktDwf48bHOU4p0oWK0UKEmqCT4UVPYm7d2qLObrsrcCdBKrSvFq18iK8bOYX
 6b65ETs2kpFq/a+kTP8PG5Xl3Vc/2PXvLsQVKNVFrN+cOJQsxKJxwT5COE4m4Yf1Wfo49Nh/d+K
 itpBBEvDeuTYQi0HhcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2MSBTYWx0ZWRfXx5f4nw8DdEr7
 fci9nOJO/rdfzkuy9BOdaM7CDb8/aDymv2PpUJxWle1/T/BU5FMm/aGYXD8kQoEUrONrJ0OHTUk
 YhvnNP5xXk+MZUFIKEuJ1hCVtA/b6Ck=
X-Proofpoint-GUID: S8PRQsjlb_TnuaQsvmjkWViFZ_3Sksa6
X-Authority-Analysis: v=2.4 cv=aPtlOr9m c=1 sm=1 tr=0 ts=6b00664a cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=GbPsI2Ihf5RTnMjR_gZv:22 a=7CQSdrXTAAAA:8 a=FOH2dFAWAAAA:8
 a=HF-2DHWplcuDzBJEMXoA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: S8PRQsjlb_TnuaQsvmjkWViFZ_3Sksa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_072519_030328_C7408741 
X-CRM114-Status: GOOD (  18.76  )
X-Spam-Score: -2.5 (--)
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

cscfg_csdev_enable_active_config() looks up the selected configuration in
the device's loaded configurations, and returns success when it is not
there. A configuration is only loaded on devices that match at least one
of its features, so a perf session or sysfs enable that selects it on any
other device runs without the configuration, with no error.

Return -EINVAL instead, so enabling the source fails on that device. The
function is only called with a non-zero configuration hash, so sources
enabled without a configuration are unaffected.

Fixes: f8cce2ff3c04 ("coresight: syscfg: Add API to activate and enable configurations")
Assisted-by: Devmate:Opus-5.5
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../hwtracing/coresight/coresight-syscfg.c    | 53 ++++++++++---------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49c8..a816c22c87bc87 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1088,36 +1088,39 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 
 	/*
-	 * If found, attempt to enable
+	 * The configuration is active but not loaded on this device, because
+	 * none of its features match the device. Fail rather than trace
+	 * without it.
 	 */
-	if (config_csdev_active) {
+	if (!config_csdev_active)
+		return -EINVAL;
+
+	/*
+	 * Call the generic routine that will program up the internal
+	 * driver structures prior to programming up the hardware.
+	 * This routine takes the driver spinlock saved in the configs.
+	 */
+	err = cscfg_csdev_enable_config(config_csdev_active, preset);
+	if (!err) {
 		/*
-		 * Call the generic routine that will program up the internal
-		 * driver structures prior to programming up the hardware.
-		 * This routine takes the driver spinlock saved in the configs.
+		 * Successful programming. Check the active_cscfg_ctxt
+		 * pointer to ensure no pre-emption disabled it via
+		 * cscfg_csdev_disable_active_config() before
+		 * we could start.
+		 *
+		 * Set enabled if OK, err if not.
 		 */
-		err = cscfg_csdev_enable_config(config_csdev_active, preset);
-		if (!err) {
-			/*
-			 * Successful programming. Check the active_cscfg_ctxt
-			 * pointer to ensure no pre-emption disabled it via
-			 * cscfg_csdev_disable_active_config() before
-			 * we could start.
-			 *
-			 * Set enabled if OK, err if not.
-			 */
-			raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
-			if (csdev->active_cscfg_ctxt)
-				config_csdev_active->enabled = true;
-			else
-				err = -EBUSY;
-			raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
-		}
-
-		if (err)
-			cscfg_config_desc_put(config_desc);
+		raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
+		if (csdev->active_cscfg_ctxt)
+			config_csdev_active->enabled = true;
+		else
+			err = -EBUSY;
+		raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 	}
 
+	if (err)
+		cscfg_config_desc_put(config_desc);
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
-- 
2.52.1


