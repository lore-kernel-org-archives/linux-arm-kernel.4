Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18CA606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gsqAWg9g;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vc431bmH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4+4flEC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FoAuz/4JshB4w4D/ztpI8jPhEMpDSwukAkqIBtJVx9M=; b=gsqAWg9gpJ2J+mmSjhv9Dx2d22
	C+PlXBkjurtx3SQ+BGctJ+xIQRysLyGJ6Fy3PaBBW6Ze9CgJ7qQwBwHbcyQsa6S0SetbplZidi3gt
	bLJaZIbEk7u3JkaY08LzH8+rUE2J990ito62tR5uBHuD02YIosp+W8UmvTNuZOeQKqf0ypIUiTKQY
	uzc9tFX6+OzZ/PBzmCqaYuCx4jI6RHrXnac39lJo6Ou3WoLGBvA3LG1rEEKi5pfKSJjVfn9OnTpVz
	YdcfozkDY+sBYAzKDFwBQRvlVK3unSzpxZHtazGbk0ahuoEeuzluNco7Q87hbughZcpG9X80X7FmO
	fyVJkXtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSG-0000000EhrD-3bMf;
	Fri, 20 Nov 2026 11:06:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSD-0000000Ehqa-0QXW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:06:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1n92433131
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FoAuz/4JshB4w4D/ztpI8j
	PhEMpDSwukAkqIBtJVx9M=; b=Vc431bmHORXlRcFlDzGkPmQ23gWZqtZE/uP5of
	X7dd+D/IevR2cCoMYpXW3f6TQBIa+fnZkcfe7FtniZOGvDSI6N4BSE00yK2fzd7h
	+x1rpgc6avDIApa8TObJVtC5DccQuP4kJuzDNcOvCb2dJZBDVrHP0gZaAZPZdiyt
	giqg2YKU4fkLWh7gwj0XnSOoUZUQtW0iFayf+zDqFbfwHmIiRojaavWzGq2vCTxT
	B6qGoe4e1iiqpeiSvFGRrMHc0PWDugijhlFzdqd/H8HB4NVm9JZ9KSyCA1Tza0XR
	zsqpYBGMDCcHDzrdFyDsK+gnQhX4Uy9A8Kjr4mTFhqNHmkcw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9ewt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:06:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1146665eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172811; x=1795777611; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FoAuz/4JshB4w4D/ztpI8jPhEMpDSwukAkqIBtJVx9M=;
        b=Z4+4flECbp+/P7aCLHy/BjZW4G5gSL54dztQ5rjUz5XtaNXuZGGyDLOAjxt6A9iLtJ
         WbqPTHe1YaAt7+AaNN7cgVdSbQephM5Y0SqgexUyk4CGxdBGOJpTLzRq6F37PsHwhvH5
         yGsyjHUdUw/mDzHwvzjb7pMfxCu1WXKvuM9SakClrDPOtBB1nQC+r0sKLo2UPpJuNBux
         sGPJOpQhMlooa2xyYpKZXZFURv+DPPizZO5wqCoqMyHfTk9RQzzQxBfyHxK3G05ZvQht
         YfQ1p+rvs5dkJKgzzSnJtWTCanQxot6SuiNLXeWfv91zeZlAR7vPqK6DHt/2viPkmp7i
         JSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172811; x=1795777611;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FoAuz/4JshB4w4D/ztpI8jPhEMpDSwukAkqIBtJVx9M=;
        b=jl+KMQJEFgDw9EV9tVyYq5S/wVhD5sBZM2o2aCxJhACmOkEDmV0Fn3wveoyEb3Ri2H
         pCuJ2t6soEOX5hCkD8/l+BwZCmQ1Zvls9ksFacs4v5ZyEhvD/x1fo9EgpTmVQpPhvxB+
         Ao5mdC3YbdnlLnVuUrL4q3+keCKQSJejdhpPXp2QB4kU0fmJayxi/1zS1Ap5youAXlKP
         fo++j6JY4K/rFUOnm1KaHYpOzHLFCa/sqIU8+2OIwYB/oujdPrHUM5Hlyrc8jwgyPIQ+
         574XJniyPi51CVRkBzW8Yg0nOhnxVts2ZcoSvFBKqr1g4MOBHO98rVYKAPd+ywCFpaSe
         qJqQ==
X-Gm-Message-State: APuU4Z/cq260ABTpm1TTjpxftuYw3EFL6SWYfxHvC32snb3DAXHz5uFI
	yabbqCdkx5Yn+qND+stEZdxittz0VEMvl4++LbhtplwfPaQqM6mhzGZfVp2BwT05LYXndkiXF5Z
	ZFn3AEk/DJLqCGDuHLUXWsf8G7QWaKDQDXf0BKlpaVSVoSzfqqhwWXK3xfn+JwgglU/JV5TznXF
	nbyQ==
X-Gm-Gg: AZFdTZfJTjhmOZG69tVHDjMPE93qJi6unfm9j2zgLH25XCF79LmnKTsc+ngCyXWteIy
	GRCJ0PxkiXoK0jxuBwgzvw7e6xGv/WZevM30nZgeQQ89t94CBQ8ZGSsUBYIkz2OROTXeLxdeaBW
	FfzOOrjKCbZeqXn+Cd8TNTgJvElSfumPMHEq3/0FuHsgFYDV6IBGAoodKvXqVQpHKMFRmfWgZks
	jvyucbO0SyeVV8RIBZzyiNmnWIvsWFu4olDk058c4a3Kz0wxLcy6fMZt3FJhum6r8i0p+3xlF+5
	mfAQIwx2PVxn+7Qq+0txL8CPKtUyAISNd8dJna0A46HlWgZ5llkZfjo9sNeTOT69C1aOlnRopFO
	dObGdLNJGDsQxCg5KsklKSZiOIqElcBT0EVukMfxz34D8nSiK2/peOCyv8pt3cRYEJH0NfGeZix
	9NOgmx
X-Received: by 2002:a05:7300:e9c7:20b0:385:af7b:d77d with SMTP id 5a478bee46e88-385af7bda28mr2022647eec.1.1795172810491;
        Fri, 20 Nov 2026 03:06:50 -0800 (PST)
X-Received: by 2002:a05:7300:e9c7:20b0:385:af7b:d77d with SMTP id 5a478bee46e88-385af7bda28mr2022569eec.1.1795172808758;
        Fri, 20 Nov 2026 03:06:48 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:06:48 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH v4 00/20] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Date: Fri, 20 Nov 2026 16:35:41 +0530
Message-Id: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIUpAGsC/yXM0QqCQBBA0V+ReW7BtF3RXwkR25lqAkfZWSUQ/
 72pHs/DvTsoJSaFrtgh0cbKsxgupwLic5QHOUYzVGUVSn8OTqdpHVgypTiLUMzDiMjZMoetD42
 vPbXYgA2WRHd+/+bX/m9dby9rvkc4jg8JhUrdfgAAAA==
X-Change-ID: 20260516-smmu_interconnect_addition-d9567535e9d7
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=7571;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=pdxjtL/I9+iniv9i80dLDw+HuIP5yKp4NIiU9QZMoh4=;
 b=gwbisBsC/M5CQj0fLbCn2iPoDx6q9nbsEsGFOPYapp/51vHA8DwsIpzqBp8dS9XAQzq9ulcrB
 +/lyzsmwdiVAZHZ9XFNeMGenqRCIxiTDodKevsr4b8zg3ICOnKYtmGg
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b0029cb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fn02ttKd-iuB0E_vrvUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9fugA9XbF2k1
 rpSqGY3V3yqxJkGOnixos/Q7DAF8gqaIQXUG1ebLf+ESU1jn96fgNT14UdPvcwDxw6HTTJpbutg
 BZCFsQMPWWXyl8eR3enL2lwz4mUs35I=
X-Proofpoint-ORIG-GUID: pRl49iewrYutd6XeEVNBfDy9FrQt5IrG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5VrXNK46mcPp
 ksUasY2RugfnRcsw+eI52C6JkJQiIYvL23bv/TL/mtdkNOlgUPU+b8twMUAuEL2CPu+9WXiiy+9
 8cfM78uN9RFQHZgAZFGUkHcgbBZvYm6EhMuc1LBm8ZGi5oZct3y3w3TNRaHJ4DI2UDRc/Z9EdUt
 N/hZxM3zF1wVoNcQcH8TVe+BlgvKrElDkOHDL0DJZh04YLInhKwBtaqyLWLwbpNom8wm4W/hHQR
 9lHwKQN5MhZrXKeZcYiXuYgV7M+n9YYtDJ5mQYgvd0hgEFzbynVjmICKc3zFzJiHbZyCpBSkv+P
 XnV406vQCaiwYGU//BAm8yrx8Q0fxBra79msZRCXIA2BNXaf4rFebDYmzsaWdKdG0dFaMu8dXq3
 RYhvCRaXf6b5q990ScZRF++kf2Bql/EwFC95KmohdMuKEfWmTS+4qz1WSamRt8tG2wYvA5PJeWH
 kmI9VHP5zm8Su0CgX6g==
X-Proofpoint-GUID: pRl49iewrYutd6XeEVNBfDy9FrQt5IrG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030653_154521_93BD8340 
X-CRM114-Status: GOOD (  19.00  )
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

On Qualcomm platforms using the ARM MMU-500 as the adreno SMMU,
the GPU TCU is a separate hardware block with its own AXI master
port (alm_gpu_tcu) on GEM_NOC, independent of the GPU rendering
data ports. Without an explicit interconnect bandwidth vote, the
GEM_NOC path to DDR can be left unvoted during sleep/wakeup
transitions while the TCU is still active, causing intermittent
SMMU register access failures and SError aborts.

On earlier platforms using QSMMU (SMMU-v2), the TCU is integrated
inside the SMMU block and shares the GPU data AXI port, so no
independent vote is required.

This series adds interconnect bandwidth voting support to the
arm-smmu driver for all Qualcomm platforms using qcom,smmu-500
as the adreno SMMU, starting from SM8150 (Snapdragon 855) where
this topology was introduced.

Changes in v4:
- dt-bindings: Changed interconnect constraint from items:-based
  compatible matching to allOf/contains: approach as requested by
  Dmitry Baryshkov. The new form matches any compatible string
  combination that contains both qcom,smmu-500 and qcom,adreno-smmu,
  rather than enumerating specific compatible strings, making the
  constraint future-proof.
- iommu/arm-smmu: Moved qcom_adreno_smmu_icc_init() into a function
  pointer hook icc_init in qcom_smmu_match_data as requested by
  Dmitry Baryshkov. The init is dispatched via data->icc_init() in
  qcom_smmu_create(), keeping the hook architecture consistent with
  other Qualcomm impl callbacks.
- iommu/arm-smmu: Replaced #include <linux/interconnect.h> in
  arm-smmu-qcom.h with a forward declaration struct icc_path; as
  requested by Dmitry Baryshkov, to avoid propagating the full
  interconnect header to all includers.
- DTS: Extended platform coverage from 4 (kodiak, lemans, monaco,
  talos) to 18 platforms, adding sm8150, sm8250, sm8350, sc8180x,
  sc8280xp, sm8450, sm8550, sm8650, hamoa, kaanapali, glymur, milos,
  hawi, and sar2130p. Note: glymur uses hsc_noc/MASTER_GPU_TCU
  instead of gem_noc; sm8550 and sm8650 use MASTER_GFX3D instead of
  MASTER_GPU_TCU.
- DTS: Kept QCOM_ICC_TAG_ALWAYS (not changed to QCOM_ICC_TAG_ACTIVE_ONLY
  as initially discussed). The GPU TCU is a separate AXI master on
  GEM_NOC that may fetch page tables from DDR during CPU sleep while
  the GPU remains powered. Using TAG_ALWAYS ensures the interconnect
  vote is held across both active and sleep states, preventing the
  vote from being dropped before the SMMU is fully powered down.
- Link to v3: https://lore.kernel.org/r/20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com

Changes in v3:
- iommu/arm-smmu: Moved ICC voting from generic arm-smmu.c to
  Qualcomm-specific arm-smmu-qcom.c via new runtime_resume and
  runtime_suspend hooks in struct arm_smmu_impl, as suggested by
  Konrad Dybcio.
- iommu/arm-smmu: Moved icc_path from arm_smmu_device to
  qcom_smmu to keep Qualcomm-specific fields out of the generic
  driver.
- iommu/arm-smmu: Restructured arm_smmu_icc_get() error path to
  exit early on success as suggested by Dmitry Baryshkov.
- iommu/arm-smmu: Dropped if (smmu->icc_path) guards from
  icc_enable/disable since icc_set_bw() handles NULL path safely.
- iommu/arm-smmu: Changed WARN_ON() to WARN_ON_ONCE() and
  propagate error code to callers.
- iommu/arm-smmu: Changed ARM_SMMU_ICC_PEAK_BW_HIGH from 1000
  to 1 kBps as a minimal keep-alive vote.
- Link to v2: https://lore.kernel.org/r/20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com

Changes in v2:
- dt-bindings: Cleaned up 'interconnects' property description --
  removed "Optional" prefix and driver implementation details as
  flagged by Krzysztof Kozlowski.
- dt-bindings: Added allOf conditional using 'items' to restrict the
  'interconnects' property to Adreno SMMU nodes only (qcom,adreno-smmu
  with qcom,qcs615-smmu-500, qcom,qcs8300-smmu-500,
  qcom,sa8775p-smmu-500 or qcom,sc7280-smmu-500 compatible), so
  non-Adreno SMMU nodes on the same SoC cannot use this property.
- Added DTS patches for kodiak, lemans, monaco and talos to add
  the GEM_NOC interconnect path for the adreno_smmu node on each
  platform.
- Link to v1: https://lore.kernel.org/all/20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com/

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Bibek Kumar Patro (20):
      dt-bindings: iommu: arm,smmu: Document interconnects property
      iommu/arm-smmu: Add interconnect bandwidth voting support
      arm64: dts: qcom: kodiak: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: lemans: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: monaco: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: talos: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8150: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8250: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8350: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sc8180x: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sc8280xp: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8450: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8550: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8650: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: hamoa: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: kaanapali: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: glymur: Add HSC_NOC interconnect for adreno SMMU
      arm64: dts: qcom: milos: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: hawi: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sar2130p: Add GEM_NOC interconnect for adreno SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml        | 25 +++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  2 +
 arch/arm64/boot/dts/qcom/hawi.dtsi                 |  2 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |  2 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |  2 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  3 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  3 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  3 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  3 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                |  2 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 50 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h         |  4 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 29 +++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 23 files changed, 143 insertions(+), 7 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>


