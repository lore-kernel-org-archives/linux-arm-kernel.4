Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8609606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M2z5+52p;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imcV5ba4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L/A/CYK7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=M6YIGKBp2Uwn6NWKr3hKh++AtRtVXDvB3/mXc2CHH4w=; b=M2z5+52ph82+/rAZL8Z0MxhAj4
	spzOpkG2WTtz/ytX/ntE146TnAH5bQ/bSLH43pcwe/7tQOsknsqlNQtjcf/CxaBlEd7nyB9lPVhNt
	D/kspdiNU+jNuKy81vLKXcg1+pLxNu7gqTTIftgbdO0xSIX9Td0Z5y17pOt9S7lvw/BeYL12zdN71
	lOUFOt9dD4ZEv4BPoTz6QSnwyFGQfQDLWNcRBsZcP4QIuFR27uGsCg/Q9f2klonDZqMeksEdZXTaJ
	h1vVw5JA3FHwwiMk+BLg6mZ0/8M+YGB5Haf7IB7T/4TOl5ekMJZFyLIxmOmQ/P7u389SpWolxChkk
	NcDCn9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsFU-00000001dYz-4AN4;
	Mon, 16 Nov 2026 08:39:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsFR-00000001dYS-3dtv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:39:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7enNa1109755
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M6YIGKBp2Uwn6NWKr3hKh+
	+AtRtVXDvB3/mXc2CHH4w=; b=imcV5ba4ohVDeUBr3xoYxAY52dOnSq80oxMNlf
	Dqrko283stk4+hefixEeKjSnY1OFopWzCSuC2AoCNw4VF5+K0dybAOv5CqqS2ocV
	WRmQOkgYbjUSEr+SUDzkCFub0oFdLUdmFIsGwxD606j3JTJqoXVtxvmQ5kSQ0Hj4
	W9Ie9cZOFs8SAZEcgiJL1TpVRUWRCqWOTFXsHu9MNpbklOiJPvaZ5ycoJQkPdo5A
	kkMzg27q/KU52+1Qmoj0bnkrwIgTi7Zig/2KEFVywz/C3MCKndfUFeMdIN/b8Rok
	jbO3LnLPhraOC/vjipbzMozzpdouFnq9EttJ22xz0HOE2WIQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc19m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:39:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5108487eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 00:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794818372; x=1795423172; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M6YIGKBp2Uwn6NWKr3hKh++AtRtVXDvB3/mXc2CHH4w=;
        b=L/A/CYK7Um2eOVgGSgRz61p3BlnKYX7KT/zmBJaYU08pGnNK5B3UeNpNjf7Guq6OaQ
         XeF4KR2q6PIBhAcc1uoz07TC5XF113BLbNk1eLZroFmVVTxXze5Ehu1JNsKeQ3t/E7dP
         P6EEHYgCBTWx64DNPPU47TQpHgFVmuT6iM1vesBUPGqJ1qT124EfjdbKArKnDHzLtqlw
         9J6KFSEqPGWTRHzJPtesEMmVIhZhxstVq+mQUpOSUPlohWmWRPaK0ZRQ+bdcMHtxO3kR
         SPPr4a2dMn3ZJniJAAmYh8ZLEovSTYM5EToCqCP6RiHKaPWlVHI2veDvdsnvw/6XmE96
         bRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818372; x=1795423172;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M6YIGKBp2Uwn6NWKr3hKh++AtRtVXDvB3/mXc2CHH4w=;
        b=yew0+UX63wN+PMraATX3WBJMlPernbaKnUWkNRzIGut4vnV3BKilv0tpkjCNItvFGr
         aPHta3jQtYz0wV5dQ4IyEIbw9hRm3QuaW+gfhgUX/ZyBJbG8qKedzusnkVyMiTS4f/03
         kt5NvYkqWwS18FEM45dXzstvqPE07orhQxRZGunAhjZ+JGxB0z7bw56HrITzH/wjSpg4
         dBAiMUwjNWo8Ad+sOfAymcrGpsqjW25KGQZahriq9645LKZD/bzw6bsGti0t9EnNa/ja
         +fznTucPRQajcIm78P5/UY+dte8lHc1UbWBNkKvVlhyl9mKGkWqIW49RErdUT6PyJje/
         ilsg==
X-Forwarded-Encrypted: i=1; AL+hErFpORAAxQUOIeSklq/dmp2EiTelMrVP4AA+8N1/CKDxTflbVDlkffzbeJUKmDo9du1/1Dwkx/dDQQiRCgpG4I2s@lists.infradead.org
X-Gm-Message-State: APuU4Z9tSzqddquItayxrt9ovqSuHMIN+32lDPv+FxOPPBKWcPb2DDx2
	HNppyVCATcWR3M1910P+7ol581vcjaZ9GyyahTs0ZvYfVDwWv3iQbkNjD+JAnK+HIdCFWOBGQQu
	pmvuEcQokT5Ye5hUdO/+ZwKw7eYnSHOe0UiS81u3Ks4QDcO2Ciz5qZWqIcw25Ah0aMz6Ii5U73o
	sRnw==
X-Gm-Gg: AZFdTZeqtHd1FvVmUW5iBTKVw8CR1yU5jxvcl+9ERVlH1YypV8sKVPEiK+sxOqmhXJb
	ld1gHt/z/W4Xobv7EMRK6eLygq5DYQ9eLrBVCNRxg1fEqVe3Z23Dq/1nh80W6OkykXCLAwn+JIP
	TNuMGkQn/x6W43Afr9vMvRq040Gc46KUfyERl1Mqvi+jtICUT9GmOhzLHwarmD7XZyqT0x5VnDI
	oq0bzxEzXiJQpnTltwEeFcOnyys9iAaSVL3F/6BsgqrsVJ7dKBhNM/lBgGsg0GDjK8qAYul3VSG
	GfjQgD+97NQLoxdfkki+fcj9NAIYaIOvmovWHWwJh67PEvKLUkEftm7eg3rgkXoLY3wGlV6lZok
	WwmuytYmjah2Egspd+kfag1g7UrFH1O00GO453uGxBaBi7ZelBrC+ew5vFulz0IsoqcpJwdEmrP
	rlLiXzkaDGQCRqJ4+Ol45uPNqBnBih3r0=
X-Received: by 2002:a05:693c:8359:b0:36e:c07a:426f with SMTP id 5a478bee46e88-37967ae5b3dmr9545515eec.39.1794818372205;
        Mon, 16 Nov 2026 00:39:32 -0800 (PST)
X-Received: by 2002:a05:693c:8359:b0:36e:c07a:426f with SMTP id 5a478bee46e88-37967ae5b3dmr9545495eec.39.1794818371609;
        Mon, 16 Nov 2026 00:39:31 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm32874021eec.5.2026.11.16.00.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:39:31 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 00:39:18 -0800
Subject: [PATCH v2] coresight: handle runtime PM resume failures
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-b4-coresight-runtime-pm-failures-v2-1-cc437170e24e@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADbB+moC/5WNSw6DIBRFt2IY9xkgfmJH3YdxgPjQl4gooGlj3
 HupO+jkJucOzjlZQE8Y2DM7mceDArklgXxkTE9qGRFoSMwklxVvhIC+AO08BhqnCH5fIlmE1YJ
 RNO/ph5obWfJG1gp7ljSrR0PvO9F2iScK0fnPXTzE7/1DfggQoPRgiqYuKxTitUXKt13N2lmbp
 2HddV1fSaBGFNcAAAA=
X-Change-ID: 20260911-b4-coresight-runtime-pm-failures-70f250927aeb
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794818370; l=10771;
 i=yuanfang@qti.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=YxgjJh7s4rVCCzUEUDoSws4VzvCFsq5v6NB/A8Ce7qo=;
 b=QIIgSboQILLNjdaXyhXvqrUHrbCSklk/3YDPj/4V0t6yyNQ0ZZwPpISPBQ1t0KkczlbAbGaOr
 suayumABxZbDepHYi3DPpuGLkHGNjaIz/8WJeRT29wxXWt4KkDMnL/M
X-Developer-Key: i=yuanfang@qti.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfXz8vm4yNlKmS2
 yHH/yDT5Mlq3hsGBl7Bi0r2MIma6RCE2l95dWAT3+0wwKiwM3X3aOGusXk0wrMQhb3YM7WyihaV
 UlHcFPT7ndfFu7BOBrRYTJ4BT+Yw0M8=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afac145 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=AmsXAa7n7-pT3CpYTX8A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Lmh8dUoIJigai_yCjJxa_98slImDapE4
X-Proofpoint-GUID: Lmh8dUoIJigai_yCjJxa_98slImDapE4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX6qlDVh5IJizz
 x+moBAoDuTNFrl00QyX4mASwBsqjD5PgGPSH4PKzsMFTRaQPoWlbbqJemLFb05lsjLJ4B52W9+E
 ToMth+Nqw2y82r8qEvVlscvUXIkhJQZqsdYgKAbjCwrKXsatd/CBKnkmlGEjQaFdbFhvmcEJ231
 Q8iY73X2JnyE5vAiJsygTb5ygd0xMXrUPMnfAAKIa2axZKuICSD2r/nftxc7Up6jrSBhiU/z1Oh
 bZv0d/gga2bNlVEF2p71r9MRNFByDiWszpjHeYOfpi91PCcWVIlvM/PA2bU0PBpUZtDNcJ1BIgK
 8HE5ZUlTTtU5jutxHvNnrSKOcrE/nLVcRbbeI5cu7B0OPqK9bawC+76r9QXz3WXprpy8mVDyaCZ
 kO0xbib5dbwYSQgMKrEXg+aTKinVPJfb1b53NqaRGGS+GzeIWSTuzr6h+MbLFv7HOTc4mKxmwbf
 pbFeJbRQN9kcLzsxYkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_003933_919856_697EC10C 
X-CRM114-Status: GOOD (  24.19  )
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

When a CoreSight component's parent power domain, such as a CPU cluster
genpd, fails to power on, runtime resume returns a negative error. Several
call sites ignored that error and continued to access registers on an
unpowered device, risking an external abort.

Replace the remaining pm_runtime_get_sync() calls with
pm_runtime_resume_and_get(), which restores the runtime PM usage count
when resume fails. Abort before accessing hardware and propagate the
error to the caller.

In coresight_get_ref(), unwind the module and device references. In
debug_enable_func(), roll back the CPUs that resumed successfully before
the failure. Finally, release the mode acquired by stm_enable() if its
runtime resume fails.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Ulf Hansson <ulfh@kernel.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
This patch converts the remaining CoreSight pm_runtime_get_sync() users
to pm_runtime_resume_and_get(), propagates resume failures before
hardware access, and completes the related module, device, CPU and mode
unwind paths.
---
Changes in v2:
- Rebase onto coresight/next and adapt ETM3x to etm_readl_cslocked().
- Add Reviewed-by tags from Leo Yan and Ulf Hansson.
- Link to v1: https://lore.kernel.org/r/20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-core.c        | 13 ++++++++++---
 drivers/hwtracing/coresight/coresight-cpu-debug.c   | 10 +++++-----
 drivers/hwtracing/coresight/coresight-cti-sysfs.c   | 10 ++++++++--
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c |  5 ++---
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c |  5 ++++-
 drivers/hwtracing/coresight/coresight-funnel.c      |  5 ++++-
 drivers/hwtracing/coresight/coresight-stm.c         |  7 ++++++-
 drivers/hwtracing/coresight/coresight-sysfs.c       | 11 +++++++++--
 8 files changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index bcfeb1c97127ece0960241fe56a3e599a9329cc9..fc06756f2783fb0b499f4d9ad0c635725ed20f4d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -822,14 +822,16 @@ struct coresight_device *coresight_get_sink_by_id(u32 id)
  *
  * @csdev: The coresight device to get a reference on.
  *
- * Return true in successful case and power up the device.
- * Return false when failed to get reference of module.
+ * Return true on success and power up the device.
+ * Return false if a reference cannot be obtained or the device cannot be
+ * powered up.
  */
 static bool coresight_get_ref(struct coresight_device *csdev)
 {
 	struct device *dev = &csdev->dev;
 	struct device *parent = csdev->dev.parent;
 	struct device_driver *drv;
+	int ret;
 
 	/* Make sure csdev can't go away */
 	get_device(dev);
@@ -843,9 +845,14 @@ static bool coresight_get_ref(struct coresight_device *csdev)
 		goto err_module;
 
 	/* Make sure the device is powered on */
-	pm_runtime_get_sync(parent);
+	ret = pm_runtime_resume_and_get(parent);
+	if (ret < 0)
+		goto err_pm;
+
 	return true;
 
+err_pm:
+	module_put(drv->owner);
 err_module:
 	put_device(parent);
 	put_device(dev);
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 87b39874461e205e1dbb9d5f15e019888ff51d28..edccbd2fa5e2c65f44d627b25bebff7bc0cc316a 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -429,19 +429,19 @@ static int debug_enable_func(void)
 		if (!drvdata)
 			continue;
 
-		ret = pm_runtime_get_sync(drvdata->dev);
+		ret = pm_runtime_resume_and_get(drvdata->dev);
 		if (ret < 0)
 			goto err;
-		else
-			cpumask_set_cpu(cpu, &mask);
+
+		cpumask_set_cpu(cpu, &mask);
 	}
 
 	return 0;
 
 err:
 	/*
-	 * If pm_runtime_get_sync() has failed, need rollback on
-	 * all the other CPUs that have been enabled before that.
+	 * If runtime resume has failed, roll back all the other CPUs
+	 * that have been enabled before that.
 	 */
 	for_each_cpu(cpu, &mask) {
 		drvdata = per_cpu(debug_drvdata, cpu);
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 2ed5d8eb1ddab907bff92057c54b7e90f6192a64..75018fe6527cdc019738eb7f66201597b972558b 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -167,8 +167,11 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	u32 val = 0;
+	int ret;
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
 		val = cti_read_single_reg(drvdata, cti_attr->off);
@@ -185,11 +188,14 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	unsigned long val = 0;
+	int ret;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
 		cti_write_single_reg(drvdata, cti_attr->off, val);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 08c10fd146d5fc2bd0cfac829fc50109dd4a3e29..52118d6a2037a09af41641967d4014fcccab5b05 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -32,9 +32,9 @@ static int etm_readl_cslocked(struct etm_drvdata *drvdata, u32 off,
 	int ret;
 	struct etm_readl_cslocked_arg arg;
 
-	ret = pm_runtime_get_sync(drvdata->csdev->dev.parent);
+	ret = pm_runtime_resume_and_get(drvdata->csdev->dev.parent);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	arg.drvdata = drvdata;
 	arg.off = off;
@@ -43,7 +43,6 @@ static int etm_readl_cslocked(struct etm_drvdata *drvdata, u32 off,
 	ret = smp_call_function_single(drvdata->cpu,
 				       etm_readl_cslocked_smp_call,
 				       (void *)&arg, 1);
-out:
 	pm_runtime_put(drvdata->csdev->dev.parent);
 	return ret;
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index db9e603f97ba82cd608d3d61881fe8153db020ff..f29e753245d3d0d367499b4a38ccf2f3bb3d66b0 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -2498,10 +2498,13 @@ static ssize_t coresight_etm4x_reg_show(struct device *dev,
 {
 	u32 val, offset;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int ret;
 
 	offset = coresight_etm4x_attr_to_offset(d_attr);
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 	val = etmv4_cross_read(drvdata, offset);
 	pm_runtime_put_sync(dev->parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index c981215ad64970245e44bf0f34e40fa6c6bcec9a..220c69cb4ee3e08cea32b17f85853fbe210ad670 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -192,9 +192,12 @@ static ssize_t funnel_ctrl_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	u32 val;
+	int ret;
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	val = get_funnel_ctrl_hw(drvdata);
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index a75b1c56a86710ebe5ad85758f85007d4c158d2e..b358b5576d975f5d440d80c28a401d10aad00b50 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -196,6 +196,7 @@ static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
 		      __maybe_unused struct coresight_path *path)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	int ret;
 
 	if (mode != CS_MODE_SYSFS)
 		return -EINVAL;
@@ -205,7 +206,11 @@ static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
 		return -EBUSY;
 	}
 
-	pm_runtime_get_sync(csdev->dev.parent);
+	ret = pm_runtime_resume_and_get(csdev->dev.parent);
+	if (ret < 0) {
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return ret;
+	}
 
 	spin_lock(&drvdata->spinlock);
 	stm_enable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 5dd4e9b0426e4eb260655fc67d079dfb99949812..5edef1f395b9835a44b6c3cbb5b31eac62dabfd9 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -17,8 +17,12 @@ ssize_t coresight_simple_show_pair(struct device *_dev,
 	struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
 	struct cs_pair_attribute *cs_attr = container_of(attr, struct cs_pair_attribute, attr);
 	u64 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(_dev->parent);
+	if (ret < 0)
+		return ret;
 
-	pm_runtime_get_sync(_dev->parent);
 	val = csdev_access_relaxed_read_pair(&csdev->access, cs_attr->lo_off, cs_attr->hi_off);
 	pm_runtime_put_sync(_dev->parent);
 	return sysfs_emit(buf, "0x%llx\n", val);
@@ -31,8 +35,11 @@ ssize_t coresight_simple_show32(struct device *_dev,
 	struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
 	struct cs_off_attribute *cs_attr = container_of(attr, struct cs_off_attribute, attr);
 	u64 val;
+	int ret;
 
-	pm_runtime_get_sync(_dev->parent);
+	ret = pm_runtime_resume_and_get(_dev->parent);
+	if (ret < 0)
+		return ret;
 	val = csdev_access_relaxed_read32(&csdev->access, cs_attr->off);
 	pm_runtime_put_sync(_dev->parent);
 	return sysfs_emit(buf, "0x%llx\n", val);

---
base-commit: 1352ce9c99bdb9fb2905f59db5b74830ff2ce556
change-id: 20260911-b4-coresight-runtime-pm-failures-70f250927aeb

Best regards,
-- 
Yuanfang Zhang <yuanfang@qti.qualcomm.com>


