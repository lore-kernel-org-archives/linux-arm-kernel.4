Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6738960A6F6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YYM2n2xm;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6Ft9jzM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=duXgq8FF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=; b=YYM2n2xm+jBcKd
	i/i5B7E4yFO08GznaAtLD/4T+5dAOpwLkaMJHspNJnovch3MoSU8cpmuHWSHY4gghp7ZAd8DsC2cH
	YkPZdt006H/IYoVw1xZLUJGJBGYL2fsrdFNHZOA/R8jocS1elcZ9UGZBSIMuPahJ+qk6tAbXLaph/
	yzysxjQQvQvcU5DZewd9/yntF4+nIYXghQgYg1hlVyNqYUDSm9V3korgTOsxEo+9HPzx964P3IP7i
	krWdc+qJJVq8XD8+zTh2Dr89ZROwKA539e/o9tip4p63T4gFungG7mx9yl79OETFCS/KYeVwNg3QL
	toJlfFME39ut1cevmgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSX-0000000EhvV-0Swr;
	Fri, 20 Nov 2026 11:07:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSL-0000000EhsY-40XG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkEZP1017083
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=; b=k6Ft9jzM+Hll4YRR
	eaVThWjOWxFJvu7IoA/Do60Gtn+KTjaPAo7Cpr0s9KI6+itc9jYLIJ1zUUJYne5T
	3c5HfDXZ8rKS7pde62QLuaCSn+SmHMylXGZiHYu9p4GgnycrT8rkLi8lZIZuI53k
	Pm0yQ88iv25n/1nalIpxjikLGYV21KpyXE42GdDPzXl4rV1mxPlkyea93/ZOgzQM
	eQr6kCo/JLVdsONz2XGgCQu5wIx2X8PNU2frIHavrrudyrpi3D0pzecmdROzAXcp
	rpcEaGKCXlSc0UTOeFftUD6yNQ7MgnHEenrWFl8cLcsh3ZVQCmH6EIh/+jMZ4bkB
	qc/Dlg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so950699eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172821; x=1795777621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=;
        b=duXgq8FFuz6iWJBDrWC2ntH4UnV2eHX+cqR0UGgplls9VW7c0X70s+TAPIANXz4gmM
         /vQcQ7hT0B7bqBRtSBwgT2JE0G20dsHnXWGotawrVAx64AJbZZYM+1/D34kWG0j1zdst
         nbPL0zf6cmJsWSiwk3/9uco9EUYgVleKqGXywStF2c/VsWQBuJDX7ID/mQ5wH7UtLVy8
         HfAMUgPppI1HMpN8+DD5Iz/Qj1IX3zmPt/CS/gwv9NZGBvIR+N5qGCPL3c0OguVt7AhR
         JMPA1TT8DvfDuVy4GYuiFIId1WDBVLtJj0n779vZ8K5o2TUfC8PaUQjSh2ofv8p3pDKD
         7dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172821; x=1795777621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=;
        b=Scmd2W/u0gzj0g5LP/pYNLf3M3RjuTaYWyKK8WCY4BLgL3lLNIkfEqmLC1Azl01gNz
         Utuc+vJ/LruWGvNG8Cl73ItXbAOlmxKK/1D3FM8fRBySIsmbMy2QgFwng2Dfvy+q0vp7
         u1dSbHiSXbp/hjQWQgJbYhBEvf0tenHXedqNPvEtNIPMgXmgVyZzFJIe72SIJabGbCAH
         iuBhCLQILNB9sKVX0j7dRUk2xBK6f6C3jGjsVpz0FZirvWehZbhhzrkV5HRhAsjGAcmT
         oktE5nyO4/o+J2LcnIrCHT91hKT23d9fgIoRtddtwGl+ym5/GEGGnx3EKFGSV78J5Axx
         qOLQ==
X-Gm-Message-State: APuU4Z8NX4Dnh0zhWH2OGqCLSxe74iu30YYsLhVSVY6SCWNq/oINF/6F
	m+kDst2GCvC+s2290RPrCEYI6nn8QWRTcPCHbnIet/xEKK61+98Tqo9ufA+Elpufv80GEr6kB+z
	cYwxrImOmxtRa7dMYycH6eCoMpFh1f5QY6AXWzfvYUpe15c5abdcj180K2TW2nYzCmtnL5oU3ng
	/XrQ==
X-Gm-Gg: AZFdTZdDDOkv520H9kE7FcjpM0uo7bXa3sW9prPmkwn1y6I66Cr1rDiHeuoiujXJGeZ
	00KbhcWNveHYwwCKLNUfPyEK7qHKTfeZXEvOP04YOIylLqwyi73pgEV7z1mqcVM4yVTT5wSPJir
	73zzh0rM7Kc5MaM3rThp1mWgSQLFUeM3hfrxmEh7iWxwA8L0mXi+pxVbAQ6VN2uKhL3IMZxsMO+
	19NxUQPkxN0WQtdx6ThfO3XtkQDf0C0ltGG6ygX6wNMsCqToLgNufV8qCoHfurrb46FQ7i6boKh
	nr5iMa0RA+FKHtHnFnjjZUOe7eOyfkP/2Kut51Tk2nO+MtI7vKgtyOqWR5nhWuYLTkVYFjizRiJ
	2g20in3mhPFS0obCdP8lr6xAunIusxtbWzaA+YAfOU3G/J1SZkEa3ENZVotaF92FIiWltNQ/Kvv
	IujJNV
X-Received: by 2002:a05:7300:430a:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-385717083eamr3104341eec.39.1795172820339;
        Fri, 20 Nov 2026 03:07:00 -0800 (PST)
X-Received: by 2002:a05:7300:430a:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-385717083eamr3104290eec.39.1795172819595;
        Fri, 20 Nov 2026 03:06:59 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:06:59 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:43 +0530
Subject: [PATCH v4 02/20] iommu/arm-smmu: Add interconnect bandwidth voting
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-smmu_interconnect_addition-v4-2-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=10382;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=2Tn1fmNrImTIJuMoWPhujoBy9ypAmrcFqaUEL7ITQm0=;
 b=82e3NtB7zovJkGgRY6qn9VlGw4xD8oguiXH/aMhyAV0D66HhFdOi+uicnbcEQtVbudd6sGBTp
 XXV7mvXP61gCFF/Jd4OPrIq8UDWMEodObIuOHU1c4R9IDWgVvirvrFp
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX0yq1voWtak1S
 x/BbamH9rdcaHPiOQlGoT/IF589SYmqVxJtz3M+i08KZXdqMBi5u6CdeVQu6Okipc1mxwu3p8aQ
 6W2bCRYNF2k5+JGuf1HsxqAKOV7nTqWkc/TtolodE9yjKOlPQjz760PA8X89zYooM9zNtVRHcKU
 LPta8w34dcUwiD/C3Dn/lzG7BmMJbBCD3Pbb86FPp6VyVadOGLPn2a9nOsZzopyVH5bh+vodlrc
 qGRGY70TPJ0npJm3FgVfTldRDoz9JCyTOikERLo19vtUGDgo6pb99I9usRR8+Jv5cDLGbOAHtxw
 v7XUmbWS8rXegU2xjAzFq93AigXeXFqwugk3oFOZP80xP11dN0lFbK+A2E72/8QMNDTiypCceVa
 4KundUL19s7V0coHImEBJzSz3asSomg7RNZUdr8pHOTSUC0tMTfkT+294wkI4QHPnlqai37b3R7
 cqlSZVCep3a5r754TBg==
X-Proofpoint-GUID: xrrLpdMPRePy4h9iTI4-xK-XsxuMJ-_A
X-Proofpoint-ORIG-GUID: xrrLpdMPRePy4h9iTI4-xK-XsxuMJ-_A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2o37ibWzzMDV
 1UEYIx4SzLXlLf4+Tkn8ofeVfRxFKNKnAh0APWBTTUDYvL19xfJhwWbrJbpXRYcGOmzCf8rGkHi
 aT96VRY7/ez5C+ce5QXzK0nEj2u5s9o=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0029d5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=m-PSj7kzn0EKmAiG594A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030702_026102_05B8ACFB 
X-CRM114-Status: GOOD (  26.75  )
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

On Qualcomm SoCs using the ARM MMU-500 as the adreno SMMU, the GPU TCU
sits on GEM_NOC as an independent AXI master and requires an active
interconnect bandwidth vote for its registers to be accessible. While
other clients typically satisfy this requirement implicitly, certain
corner cases (e.g. during sleep/wakeup transitions) can leave the SMMU
without a vote, causing intermittent register access failures.

Add support for an optional interconnect path to the arm-smmu
driver and vote for bandwidth while the SMMU is active. The path
is acquired from DT if present and ignored otherwise.

The bandwidth vote is enabled before accessing SMMU registers
during probe and runtime resume, and released during runtime
suspend and on error paths.

Generally, from an architectural perspective, GEM_NOC and DDR are
expected to have an active vote whenever the adreno_smmu block is
powered on. In most common use cases, this requirement is implicitly
satisfied because other GPU-related clients (for example, the GMU
device) already hold a GEM_NOC vote when adreno_smmu is enabled.

However, there are certain corner cases, such as during sleep/wakeup
transitions, where the GEM_NOC vote can be removed before adreno_smmu
is powered down. If adreno_smmu is then accessed while the interconnect
vote is missing, it can lead to the observed failures. Because of the
precise ordering involved, this scenario is difficult to reproduce
consistently. Additionally, GDSC power state transitions in adreno use
cases can independently drop the interconnect vote, further contributing
to this race.

The design difference between QSMMU (SMMU-v2) and SMMU-500 explains
why an explicit ICC vote is needed only for the latter:

QSMMU (SMMU-v2) — SM6250 / SDM845 era: The TCU is NOT a separate
hardware master. It is integrated INSIDE the SMMU-v2 block itself.

  GPU SS
  +----------------------------------+
  |  QSMMU (SMMU-v2 @ 0x5040000)     |
  |  +----------------------------+  |
  |  |  TCU (integrated, no       |  |
  |  |  separate AXI master port) |  |
  |  +------------+---------------+  |
  |               | page table walk  |
  |               | issued on same   |
  |               | AXI port as GPU  |
  +---------------+------------------+
                  |
                  |  qxm_gpu0 / qxm_gpu1
                  |  (GPU data + TCU walks share same NOC master)
                  v
             GEM_NOC -> LLCC -> MC -> DDR

On SMMU-v2 platforms the TCU never needs an independent vote because
it physically cannot be active without the GPU data path also being
active.

SMMU-500 — SM8150+ / SA8775P / SC7280 etc.: The TCU is a SEPARATE
hardware block with its OWN AXI master.

  GPU SS
  +----------------------------------+
  |  +-------------+  +-----------+  |
  |  |  GPU Core   |  | GPU TCU   |  |  <- distinct HW block
  |  |  (rendering)|  |  + DVM    |  |
  |  +------+------+  +-----+-----+  |
  +---------+---------------+--------+
            |               |
     qnm_gpu0/1        alm_gpu_tcu    <- separate NOC master port
            |               |
            +-------+-------+
                    v
               GEM_NOC -> LLCC -> MC -> DDR

On SMMU-500 the TCU has its own master port — it can be active (e.g.
page table walks during wakeup) while the GPU data path is idle,
leaving GEM_NOC without any other voter. Hence the explicit
MASTER_GPU_TCU -> SLAVE_EBI1 vote is required.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 50 ++++++++++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  4 +++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 29 +++++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 4 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..eee20811eede 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -6,6 +6,7 @@
 #include <linux/acpi.h>
 #include <linux/adreno-smmu-priv.h>
 #include <linux/delay.h>
+#include <linux/interconnect.h>
 #include <linux/of_device.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/platform_device.h>
@@ -608,6 +609,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
+static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int err;
+
+	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
+	if (!IS_ERR(qsmmu->icc_path))
+		return 0;
+
+	err = PTR_ERR(qsmmu->icc_path);
+
+	if (err == -ENODEV) {
+		qsmmu->icc_path = NULL;
+		return 0;
+	}
+	return dev_err_probe(smmu->dev, err,
+			     "failed to get interconnect path\n");
+}
+
+static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int ret;
+
+	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
+	WARN_ON_ONCE(ret);
+	return ret;
+}
+
+static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int ret;
+
+	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
+	WARN_ON_ONCE(ret);
+	return ret;
+}
+
 static const struct arm_smmu_impl qcom_smmu_v2_impl = {
 	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
@@ -659,6 +699,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.runtime_resume = qcom_adreno_smmu_runtime_resume,
+	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
 	.context_fault_needs_threaded_irq = true,
 };
 
@@ -668,6 +710,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	const struct device_node *np = smmu->dev->of_node;
 	const struct arm_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
+	int ret;
 
 	if (!data)
 		return ERR_PTR(-EINVAL);
@@ -692,6 +735,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	qsmmu->smmu.impl = impl;
 	qsmmu->data = data;
 
+	if (data->icc_init) {
+		ret = data->icc_init(&qsmmu->smmu);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	return &qsmmu->smmu;
 }
 
@@ -734,6 +783,7 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.adreno_impl = &qcom_adreno_smmu_500_impl,
 	.cfg = &qcom_smmu_impl0_cfg,
 	.client_match = qcom_smmu_actlr_client_of_match,
+	.icc_init = qcom_adreno_smmu_icc_init,
 };
 
 /*
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 8addd453f5f1..12c3eda780dc 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -6,12 +6,15 @@
 #ifndef _ARM_SMMU_QCOM_H
 #define _ARM_SMMU_QCOM_H
 
+struct icc_path;
+
 struct qcom_smmu {
 	struct arm_smmu_device smmu;
 	const struct qcom_smmu_match_data *data;
 	bool bypass_quirk;
 	u8 bypass_cbndx;
 	u32 stall_enabled;
+	struct icc_path *icc_path;
 };
 
 enum qcom_smmu_impl_reg_offset {
@@ -29,6 +32,7 @@ struct qcom_smmu_match_data {
 	const struct arm_smmu_impl *impl;
 	const struct arm_smmu_impl *adreno_impl;
 	const struct of_device_id * const client_match;
+	int (*icc_init)(struct arm_smmu_device *smmu);
 };
 
 irqreturn_t qcom_smmu_context_fault(int irq, void *dev);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8d50a4ad221d..f015985cbb8e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2183,6 +2183,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (smmu->impl && smmu->impl->runtime_resume) {
+		err = smmu->impl->runtime_resume(smmu);
+		if (err) {
+			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
+			return err;
+		}
+	}
+
 	err = arm_smmu_device_cfg_probe(smmu);
 	if (err)
 		return err;
@@ -2263,10 +2271,13 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sCR0, ARM_SMMU_sCR0_CLIENTPD);
 	arm_smmu_rpm_put(smmu);
 
-	if (pm_runtime_enabled(smmu->dev))
+	if (pm_runtime_enabled(smmu->dev)) {
 		pm_runtime_force_suspend(smmu->dev);
-	else
+	} else {
 		clk_bulk_disable(smmu->num_clks, smmu->clks);
+		if (smmu->impl && smmu->impl->runtime_suspend)
+			smmu->impl->runtime_suspend(smmu);
+	}
 
 	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
 }
@@ -2286,9 +2297,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	int ret;
 
+	if (smmu->impl && smmu->impl->runtime_resume) {
+		ret = smmu->impl->runtime_resume(smmu);
+		if (ret)
+			return ret;
+	}
+
 	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
-	if (ret)
+	if (ret) {
+		if (smmu->impl && smmu->impl->runtime_suspend)
+			smmu->impl->runtime_suspend(smmu);
 		return ret;
+	}
 
 	arm_smmu_device_reset(smmu);
 
@@ -2301,6 +2321,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable(smmu->num_clks, smmu->clks);
 
+	if (smmu->impl && smmu->impl->runtime_suspend)
+		return smmu->impl->runtime_suspend(smmu);
+
 	return 0;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328..ed08f86cf99d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -455,6 +455,8 @@ struct arm_smmu_impl {
 	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
 	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
 	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
+	int (*runtime_resume)(struct arm_smmu_device *smmu);
+	int (*runtime_suspend)(struct arm_smmu_device *smmu);
 };
 
 #define INVALID_SMENDX			-1

-- 
2.34.1


