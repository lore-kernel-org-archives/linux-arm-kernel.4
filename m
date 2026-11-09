Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qj8M5Mwr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ajtDnW5e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guIo+k6i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=St7kPuwx8TTNbOiHL4PqED3PJrgepz3coZt/Tr0CXik=; b=Qj8M5Mwr9OqfsE0rlBjJ1ersIe
	jXoOtrqhJaZdw1G4svU55WAv5TOLn10WQtOQK/N7GuMgF1TU6RfKLpjVkUrpF/doC6JTDhWGD2iSp
	yM4Ij9WImLTi2b+aMMGOCJG78k7pOGu83Y8fCCV0ZelRsU5MIpk77CCeDROWuLJejkVUbpeDCii3p
	xDzvAeny9BC2mO6oNi56ThomXCBqneQkINyu3iXpptd6mAt5IdAztXDcG8HuJzwZTIcKJlgJOLvRs
	G+JLUeOczLc194wUesWMJxaRlvhYVpVtlj44JqMcvxw33nbhRhYfa3m5dbOXo8Lsl4QCr0WBVmn4s
	X49PMNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXlA-00000001s5v-1I0m;
	Mon, 09 Nov 2026 22:22:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXl7-00000001s5Z-2sCA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 22:22:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA7BB870778
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 22:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=St7kPuwx8TTNbOiHL4PqED3PJrgepz3coZt
	/Tr0CXik=; b=ajtDnW5e4q8b0C5U7nUAfVEjLFRrUXtHsy+nsTE2A0LcKOVRcf6
	LKO3fwxicgD3OSVqPzZWYiQ8ceKqU5szlzyRmKlCQqutYkqFRsCL3UAco8Etfn14
	tLro5FQqMCzGbHeE5qEN5co4PrG3Srtk0C549MlU8nAVS3UDxLx2AGg1U0lFtyum
	hSMD813FFNE0GP2osx7hK59sZujkfWUI6KSNURdKc/8+35+k64TE/03uTNbEMQMc
	fgm1iwzjY4MputaLPqXHbEWieZGoVu8oXxCnbM+44uyNU3FrmSc79MRs4l3eh6LI
	5ZYLIk2fchik5+wD8rUtwGqMiEh2BJnsv/A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58b0j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 22:22:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so3562184eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 14:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794262954; x=1794867754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=St7kPuwx8TTNbOiHL4PqED3PJrgepz3coZt/Tr0CXik=;
        b=guIo+k6iyf7bCOCI3C53oKZRcH1Ydvg/ITYcCpNYPnyEoCP8afJH9W7Fb1utMBCMX4
         ojKUB1I5eur2AsIGkYMY5JpViepue0iwxZQyHIBze33ExmA2LKtQapXBJ/2nPY8+VASn
         FMfzy768Bx0g87RddllEwDa/5iKJ0wFtc+dINE5L0a6+DtXdpw5CaC+pQsmiEJraOqU2
         gUKcEldRUlQYlFqa5z9TxWYCqtLb1n6QDxExRJgInpoRnPpE+kAxxpmwAW2zBC5Cho+r
         xyXAO7ohmDLMYMv8fBO0vXwGh4w+QbqcaT68BQM9SbvTkjKokscdJFkVBMxeyHHMQz5U
         6J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794262954; x=1794867754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=St7kPuwx8TTNbOiHL4PqED3PJrgepz3coZt/Tr0CXik=;
        b=xCzYCMYQMtF8qH8JAmOqvqRwz2tZCmDl2WrzVbs98kf2L5dm9OObkpzIIBL9fjLoID
         bc1QTJH77+s8OK/nPgTDn5bleOd67lEnPECDdllC/g/EGARlImW9I0u5rciPxZmQltp8
         Ks0SDq5Z1vPju2diw+sMBjOj9GcIx7GgqZ+7yHfYM9QR0jeQKKA3fNcyw/fIJf1Y1/oX
         IXZoHxyCxqcyXAAQdMM+HkogpRP6Ii2mWBuXzhLo8fLbC+r0y6XuSt/F3JnwALxCBm6O
         K8ct9txZvuSTQHOV46zP4KtX/O8YGSWk/Nd+yI7j5Z3ZcoSEhHptnu+q5cMJfVY9zuvy
         6MOw==
X-Forwarded-Encrypted: i=1; AL+hErEFayLbInU2K+bmsAKZrM253zmOZ6YplMgIyDEEEiAz7TBUOQ8M1BhRgjj9yZdh/a4oDDKjPpTFuhr4SoJBRnBC@lists.infradead.org
X-Gm-Message-State: APuU4Z+oFV1nQAflPneD2RftT2+7eAavY9Tpn7w5Um7VUx2mxcWRrte3
	B/p+Cl6wjp+V0Y1pgaEoTvgFXdwCcvwg28nRhhIG6XKpEqF51QfAG0OHe8TvPrQ80Rqbh/tw0BS
	F92DXUtvtQy6mxFAGaAW+8MgW1+1MC1Ne2DSRakg9Z2WuoedRAff/J/p40UPNtSOKbd5RZwVdPW
	SMXndSLTwgMA==
X-Gm-Gg: AYBFou0kL3iBXALbPsjK1BpaHGmz4qZmDVWQKr0TKS8HNTUZ4YP6iFAZ6g1r+AuaMFq
	qBtet7CD9zd5dkYicaTXSFm1rupMDlSMSqISIVokab48dgvOGVMLrH7z8CrJc7v0tS0EZ94rLrr
	9gjBo6BRbEOhjWdCCZDZf04zbwE4kv01+sDQdBi50CX0Pglf4IzYkVnmyhqMy/uLwC2UZ1M+Vfj
	Wxn6i6yDoHqJfAglAZMzVuU+ATxecaKadEgaUID7WETTI7T1o8kn6gbo18J5c34J7leSGBXKpmR
	asov1ihCVQZNLKAZdPSgE7c9eMqqPs8VNvnOVNC25GLOn4BvRPojGM5EM2/ZjuAc3amtrwryuWK
	/fXOUXGflnhcx92UijKfOGF6cYLPiD+2VUtCilErNPOZOhvu+bTwV3vLAgE+/aTyQapsPKwf0BZ
	M1W7FyRI37qTzoTAOYmsFM1v1El0qs0bL/iXyimm+/zij8nbSp4r9F0vuBS0dz1Dv1
X-Received: by 2002:a05:7301:781:b0:36f:4a4e:6218 with SMTP id 5a478bee46e88-3753ab03351mr439507eec.38.1794262953997;
        Mon, 09 Nov 2026 14:22:33 -0800 (PST)
X-Received: by 2002:a05:7301:781:b0:36f:4a4e:6218 with SMTP id 5a478bee46e88-3753ab03351mr439447eec.38.1794262953068;
        Mon, 09 Nov 2026 14:22:33 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm1252133eec.8.2026.11.09.14.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:22:32 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com
Cc: joro@8bytes.org, kees+treewide@kernel.org, gregkh@linuxfoundation.org,
        dakr@kernel.org, panchuang@vivo.com, prakash.gupta@oss.qualcomm.com,
        akaieurus@gmail.com, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/arm-smmu: Work around Qualcomm SMMU-500 TLBIVAL granule issue
Date: Tue, 10 Nov 2026 03:52:14 +0530
Message-Id: <20261109222214.3988154-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4OSBTYWx0ZWRfX0Ohur6MAwPUu
 2otpMglYIMQkF74vvmio/HVFTKrznehVkOdFnVsYuE44NIZaj0X3BQIeos8sIu4owZsJcZJJDZ6
 dIcqjxNhBM/HZKB+JU4DXS1+va2yXaSc1pfIP91VePpGEVl113Kdu+iqiCVVBno/sn1EZy70k8r
 2iD3H0d6ezOE9Fo2Wy3mcoiDYZhoA5x2aDRUkeA5Uc0fjsV7mmdqW8HgwXsRlL956MiyP98q6Ug
 JcneuBk5wg5LI3WXoTYlYvma7T7ZOqzCKxbA9fbaMKuCj0OV8r7ZSvtnNbVEZKWnv6fTHKX9cKN
 SIGG2VNoo/JPx+3uyjlhErlz/pAjDcYtxV2NOpKVkjre0UsB04vEP1mjBhqMq8Jwxxx+aIbbarD
 xh4RvgeypvZmR+QyxJ+e8agJzJBlZ0cPiwAdlPZn2xTvdhHVJoEWG2Q6QfjcClnusYzbloEqAq2
 rK9uoyZDGVs6l+l3t8A==
X-Proofpoint-ORIG-GUID: yay_okEGr7ANp6w_vrHMFeLHWLJgl_Az
X-Proofpoint-GUID: yay_okEGr7ANp6w_vrHMFeLHWLJgl_Az
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4OSBTYWx0ZWRfXwWT++3RaPU06
 /dptvfifX2X43CaSzMWJrxPJ/9aZZQ5raIsN0d2fnc2UCflb9Hjt5QONYueJn2hwyiXuTUqKpuf
 UA0wLnL+AdayM9LUZGzmB6nJ7BiE/Vo=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af247ab cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cRIvcy3ebCmbRUWD2K0A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_142237_731967_9913DB95 
X-CRM114-Status: GOOD (  20.11  )
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

From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>

Qualcomm SMMU-500 has an issue with TLBIVA/TLBIVAL where only the
base-page-size entry at the base IOVA is invalidated, leaving stale
TLB entries for the rest of the range.

This causes use-after-free: after dma_free_coherent() unmaps a large
buffer, the device can still access freed physical memory through stale
TLB entries. On FastRPC workloads this manifests as ADSP crashes when
the ELF loader writes to a freed PA that has been reallocated.

Force the TLB invalidation step granule to the minimum page size for
all Qualcomm SMMU-500 domains, ensuring each page in the range is
individually invalidated. The minimum page size from pgsize_bitmap is
used rather than hardcoded 4K to correctly handle 16K and 64K granule
configurations.

This increases the number of TLB invalidation operations for large
ranges, but correctness takes precedence.

Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 28 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      |  3 +++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 +
 3 files changed, 32 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..a51152b4e24b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -430,6 +430,24 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ }
 };
 
+static const char * const qcom_smmu_500_tlbival_errata[] = {
+	"qcom,eliza-smmu-500",
+	"qcom,glymur-smmu-500",
+	"qcom,hawi-smmu-500",
+	"qcom,ipq9650-smmu-500",
+	"qcom,kaanapali-smmu-500",
+	"qcom,maili-smmu-500",
+	"qcom,milos-smmu-500",
+	"qcom,nord-smmu-500",
+	"qcom,sdx75-smmu-500",
+	"qcom,shikra-smmu-500",
+	"qcom,sm8550-smmu-500",
+	"qcom,sm8650-smmu-500",
+	"qcom,sm8750-smmu-500",
+	"qcom,x1e80100-smmu-500",
+	NULL,
+};
+
 static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
@@ -440,6 +458,16 @@ static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 
 	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
 
+	/*
+	 * Qualcomm SMMU-500 has an issue with TLBIVA/TLBIVAL where only
+	 * the base-page-size entry at the base IOVA is invalidated. Force
+	 * the minimum page granule on affected SoCs to ensure the full range
+	 * is covered.
+	 */
+	if (of_device_compatible_match(smmu->dev->of_node,
+				       qcom_smmu_500_tlbival_errata))
+		smmu_domain->cfg.force_min_tlbival_granule = true;
+
 	client_match = qsmmu->data->client_match;
 
 	if (client_match)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8d50a4ad221d..92251536e9b0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -286,6 +286,9 @@ static void arm_smmu_tlb_inv_range_s1(unsigned long iova, size_t size,
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	int idx = cfg->cbndx;
 
+	if (cfg->force_min_tlbival_granule)
+		granule = 1UL << __ffs(smmu_domain->domain.pgsize_bitmap);
+
 	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
 		wmb();
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328..85d1f2d7ec50 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -359,6 +359,7 @@ struct arm_smmu_cfg {
 	enum arm_smmu_cbar_type		cbar;
 	enum arm_smmu_context_fmt	fmt;
 	bool				flush_walk_prefer_tlbiasid;
+	bool				force_min_tlbival_granule;
 };
 #define ARM_SMMU_INVALID_IRPTNDX	0xff
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.34.1


