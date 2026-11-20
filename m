Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE1606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DCqanDzr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VpX+WrNS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UFv4WjGl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=; b=DCqanDzrAR0SFe
	C22laRPO6gJqC4v9ekSHFITMGl0UW6CLTXvKv3eCbktETVYCA48vcNeurcnMISTc9mxHCCQejDMIS
	7y6wj9qPNm/walLIq9AZ6tQ48By25G4Zhr3c2+XoO2Puxes6lqh1qWJaQ2tjS2vWpzjxR+01TnDRj
	iNWOsNvS5Xp2PZ52BnimxIKfOKdSuII43UYR5bz4F7XEE1n8p1ydwawMGTotRx+lLIBuvIM09lZFh
	qT/teXB2s+Z4S1UPzF6ps8/qjHnOw48IS9xeto3J5H8614NQhIjGd0fFDedIMw0uGwebckmTauULD
	Qnqix6mqxCJv3pJKQojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOt2-0000000F7SB-2FXk;
	Fri, 20 Nov 2026 13:42:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOsx-0000000F7Oi-03v9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:42:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKD5f5S1366912
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=; b=VpX+WrNSheRNdsIh
	jnlawjXhDk5SdKChzYJiF11MgSmP1K4jnwe6FiTQcJwVBHIPDFkQ2+2XCCUFojMf
	+dAs1msm8lS0YD9C5vuHYzz2fW0cZPCr2sw8m4xE8XMJwvNfgMXP1EOoEu9rVsLH
	07UqGPHZBnOpBMMys9hOJVq9XuG4gai6Smx2WxCMSWbmrBrCpjGiSAOqAKTJGbal
	l6hpPCcqjD3SzmJKrS3GvpwvzN+eBU9F7IqjNCPezxd71tlUGEYtnRdG1KIvecPp
	qqLdhEHctnkoPTKWY32AUaH//K+IgbyrniLLOkJDKmKPfKsKXxsIHT+waQl14caf
	/6v+Gw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykwr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386177b0516so1465096eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182157; x=1795786957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=;
        b=UFv4WjGlR0x6UAZ5tA2DTYvZVqVhMiWmuIuMQnDfbLZQk2wq59EeY0eETB3HRM3ssx
         uwcP1lrRkESm83vcg6BKP286eQPkZ04Rqtai2TKarVF4275h9/TKjOhIRL3Sg6/NyojQ
         IZrZULifOI3kQIwTOjvYTDnXPGNlt8muxhtvogDrcOzkpHJExwytVULvQadGboOiFUee
         0bSba7DmKeqRAJRj26snWk5RwKdPOqFRu8tTTw3YI+ypnrWdnBHNBaTAm4fgNHMA2qOJ
         HuioVo2D/RMUzk2a5c4uG9im4PrhrvJF7wqw2dqhXHHrlBAp/4X0i1UEYVW+i+WMiKXm
         MPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182157; x=1795786957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=;
        b=ttO4J5nCLmytvteU9roR0MMottYDzKs2AFfZ2gMvdv31nTGUXcnyhoIoq88mtwsATh
         CH2CYKnlCveK2kYZlH9rtV2nitk/Q3qzKQtey7AvUMzEpqirJuzFimmT0M+vrVf+mi8v
         a+iXS2RkqcfBA6TcZWSseashzLpMRbuOuuL5K9sQLOsV3V2nUhhRR9S/RRdT24NoQiKZ
         LD3pwHBXqg7Fr5lz4bxGT55h2V+Z+8tviG4aFYRvkz1XUifWQViSfqrJjYUUginP8Gpk
         WmIYG+kJ9dPeWy4fllovcJpzBXADky4m22KabyfakT0uAhwWyZaYdwjWvCgjvcFFgzaR
         Uiaw==
X-Gm-Message-State: APuU4Z8r/aEe5l+PnJRwylkflAAn13qelyzKYkrhzj1wiEMsxJnsymKd
	/uArGyh5tsfl9s/ze6cQuwYrQJCMF74zOdQn5KrcIaqtP/iBxuyMhj2M1vDu/S4dalfiYaRuqsr
	sGf/APmGSr8XLAHGGw6bK3p0FC5QqFDlGj+Rn7oxidY3P0voJCdrN5fN0ImubhegNPpNq8uEzbU
	5QjzUQpQCJcQ==
X-Gm-Gg: AZFdTZdm6SXbQ9rgSO/An+fl1znxU+JQR63QhyNjxO5+xWo3OkwLpX4ULAYo/3Qod2U
	tDFqXi6PAHhd2QHtoJOPwR/idWvPE0suGiHLx/R4CLyGNZntxpi5BFw42czrwew65o3Pm1EVBro
	2VH/+LNhRxlLscz+RnjBu9vusVCE6sZkIOUTEaU8/R/cYhhScyg7EzNTyJ4HNBZU/GaDkJTjTk2
	IMmzkOMR3nv69ggSozHT45k3ZJJyMuN+hKk+UUR4QIjUKzKdeI0aYIHP2Idm7DsmAB7HsdBXv5w
	qRzlDotBY1qbi/oPc5Mcw23M1LSiuVCzMDeUMKjG2GOtx2XNaUC3UHqzdgdVV0b4e8Az6Cvq7wQ
	VdNSCU5zUUI10Bj/QQXI1wVvV2gnaP2s5xq1UMKRWb8HwLeeH0ocgAk3CMg2BOvB20ze8gk+QHZ
	jCLto=
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr3490821eec.12.1795182156551;
        Fri, 20 Nov 2026 05:42:36 -0800 (PST)
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr3490762eec.12.1795182155811;
        Fri, 20 Nov 2026 05:42:35 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:35 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:33 +0530
Subject: [PATCH RESEND v4 02/20] iommu/arm-smmu: Add interconnect bandwidth
 voting support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-smmu_interconnect_addition-v4-2-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=10382;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=2Tn1fmNrImTIJuMoWPhujoBy9ypAmrcFqaUEL7ITQm0=;
 b=v+DWxwu5/WMk87TrV37pjjikV8G/qbn9c9CWLUPNf9rAyFFEt1qI50VI2GqHh1iK9PqlVIY9x
 /TC6dlmkXGnBU1otRLEEcXU7EQAO5Mcd9Bdv64Sq+QTg3oAWTYT/bem
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyGsvHybtEliu
 f/KRqXQ7JK8ya6XLUI2H0Brx15atgoR5vUNJht75hAl4ABDO2gRo7S469khfgtmtlL+PFo54iVE
 4eM5rqaD2Dvxwwir1hcN8xBJBslYhS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX8H+2svgS5dPb
 Wk7Dk/MD0wEDBZ4l4zoANB3qjLMCoImiV7NdHL1yWpw+dleP5CFRwAjKCvHv0Bq3WX8HvMLSknr
 1M03LpHqntcSX+AJHUrZAclM1LhfDYsQ+tyj1h2cfE1s4NwBxXT92XrB7e0EaMzPgsSyrqIryWX
 V5Few5/T6RG5m7kYpIBMI3TceHkb7wq6TZa9WC0PNIzzBA+22/1AHZ/kMDZPmFMoO2xvvHEJfaw
 HKS/e1ByG2Q+pB4xbRym+/gVzsQqXyaiGu98L3ca14k10++eCEEXy6UZeTI7gVcf3smjCrMF2ZF
 6ud4oQOJPfASLYRSPUhPgbYo1dlh1Zd9ulPC1SJppUyVOqcNnV6WvA/Hd3eQxd1PQVjv9Z9VyMC
 8ijYe3u2xSDcaMj9CfEh3tUGu7BoMlnd05QabrmksX2eW/rerwPNyccfGqunqBBpcGFrYiOuiGK
 MYP6MBBxmdpvs1bo2kQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004e4d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=m-PSj7kzn0EKmAiG594A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 45387WBFwxsCZmre7l_1HbtVYq2D6xC8
X-Proofpoint-GUID: 45387WBFwxsCZmre7l_1HbtVYq2D6xC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054239_177235_BE0B5054 
X-CRM114-Status: GOOD (  26.10  )
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


