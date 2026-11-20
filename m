Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FD6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ztg9w2GP;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4EGHd+t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d/7HtwFt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YETMORu0EwmjXjFiIGRDhxEkjqRjM/MriqWWStXTlnM=; b=ztg9w2GPBnbRGAy/IZ9z8jfoh2
	3rs8WXez8k3c+BnxWrN2fcx88NTqO6wEVOCmeq4sKqoqdAPa4G8nWKkrMePj4nIoHyuFGoMYPUoMy
	ezoh3QMNaJ+plVX1/7u7m2CHFEO7TdwlVAf2AA8dWGqeU9vmXuqH/VB96RMm9eER0ZypaHY9vrkt/
	GnHOfmfjk/V9evpVCpfT+oLC3T/BIF545g6fd6J+gMtL0bHcBYD7pTICRQcUL3qX7p3s/wYUCnxxF
	Jhl/UgDFvwkOFTc3vdZRrblnGBX1gzh7ZbV55Xx2Axpcub4gPMfKLP4coboDAhsdPYi8sM2qPL8e9
	lZ64b+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOso-0000000F7LZ-0idN;
	Fri, 20 Nov 2026 13:42:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOsl-0000000F7L6-0ENi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:42:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoel1462889
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YETMORu0EwmjXjFiIGRDhx
	EkjqRjM/MriqWWStXTlnM=; b=D4EGHd+tVRWg4U09w/JD4wiYraxbgQO3SUN85+
	StDapF3TZJiv6K7eAzaj+uyiGeyfyYoDLFP5PA9+tgfpTqwA5AWNXTKMatXUZ6T6
	SwTKQmy0tgUL3qrluBGmmDqHuhD4INyWVfD9kyizv49BpqbHUZ8DuoMao+4y0RN8
	njND0851JusG1OjyeeKgsBUHe3uEKLch2sRRBHdT+oPLmt90KtDxoaD8AeAcJL/O
	dpw+ukwxO9p0XuLiVuHAVCGXyleQb7Cr+mHW+yqzXuBSTdvc8VRAWMJIER3IMBbM
	No9Cn9U01SM9DsazpmVPctnHLxgK047/R+VMWRy1yUGZyPTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahrh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so2554893eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182146; x=1795786946; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YETMORu0EwmjXjFiIGRDhxEkjqRjM/MriqWWStXTlnM=;
        b=d/7HtwFt+ks/yO/Kg+NgQEwOOepmJWumZdEEyIc2I2gzQ46gzI1c/Pr/dp+hbmQwUe
         ydG+gYhZ7w+VJ6o8+MG1Er73ICZ3v16+RyOY4OsXaBmDL34ZA069v68bBM+VodzGN1Ln
         +aqnrwc04NsbogRQ6XQF5StxYfQnyHvjwCCHqbolJqDbimg0nMRmSu+Un+nMhcSSzPYy
         /jPRMum2uy/m1YYA2mFiDFQMnpRghJ7exRH85RDr2ky4vOXpUaLomlmJqhMXIVd4zuw3
         rxBD9ZPkYxhPI2cVVVAsJlsb4o6VOwY3NzWqAexKG9TyHvHHhTKleXmg8w3Xqr5mK/Qs
         jJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182146; x=1795786946;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YETMORu0EwmjXjFiIGRDhxEkjqRjM/MriqWWStXTlnM=;
        b=WeaTkgPl2L0HRPiHWOaEjy/2KMHUxs4p1/an25+wPzvZFr3gdPvZ9zuyHdc5IJxx5q
         nj0owzd/16tnVBPKmOvs/sLpD1aRTAvf5lHghYhdUjGJSLISdWHJzXcqsl5Ka/3Ftp2P
         8jeXZxP9ybFC2LBWMLU1dYHr7eRt4myY6ROxAxV5Vk7KGjccy7/EuugM9INstx/PfMlx
         yQ29u5zTFrg91wtkiIGtUn9QILoAHpC0Creym3eBtXLURkht5tVgyuyay5UpXFUOyRgr
         IxWzURi9OBRB5GVY8p/JhteUEZY+OnbUHWsq+6X087EmhjrEAH9Oa2U4lvEwUSjglK1w
         hbgg==
X-Gm-Message-State: APuU4Z/4s6y+cUXkIlzm2XTrTZkgMaxJa3ZjxgP8xslIE5Cs6TEdrwDR
	Yl1rw+VyhjHm2d+R7eGh+TgdKQxKE/ox1QbBwNYsJiZMPfo0ZNHCVoBvJd0HRHqabMXcoiK9uSY
	t0ztm3bfOkzwUfNoAaG1NIoGXWJIQkFh1YHr+ytfRbFHuY+nU1kNXBRy3V4DhrkOpPXZlegfJU1
	yGwQ==
X-Gm-Gg: AZFdTZd5tAJQRM4K6nEMBFMxXNUDRO7SUwEICfptBQ8XtBfuKuqnTpvp2Pa4n/PfFba
	bl0dIY90KZHXlLBiG3yz6QeY2XTzypGErPxGSyBT5bZg53g140x5isvL7jfHpef2ScnGT34qhJF
	AxcGd+g81ZssJAhv4kI0Af1DBtPspb+qLq/h2vU4K4jJXgsmZV/Vvh5JeszbNNRY9o3uAwq+N3N
	fe8nh7ZDX73vyCB2iYjVizeqEYyMleI4sTfAVjzayyOfbqha8ux3yKoyb6FhrFBBQTh5kXVddh/
	XBCAAvTNcg0NvNVB8X5H5nKFsc9vVkq4nFhdor0aMuhY0Y4yX6Ai0p1y2Eviu/uodOu64xInlca
	WSAv9LV5QoyY+tZPgrRfRS5pYzJVm5MZZxtBH833SYdY6GKO/IGxvyiumZu4O5ldJ9u2Q0TvL89
	GPXa8=
X-Received: by 2002:a05:7301:dd86:b0:351:2958:1740 with SMTP id 5a478bee46e88-3856fb641famr2813694eec.37.1795182145390;
        Fri, 20 Nov 2026 05:42:25 -0800 (PST)
X-Received: by 2002:a05:7301:dd86:b0:351:2958:1740 with SMTP id 5a478bee46e88-3856fb641famr2813631eec.37.1795182144436;
        Fri, 20 Nov 2026 05:42:24 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:24 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH RESEND v4 00/20] iommu/arm-smmu: Add interconnect bandwidth
 voting support
Date: Fri, 20 Nov 2026 19:11:31 +0530
Message-Id: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtOAGsC/32OSw+CMBCE/wrZsyXljZ48yNWDHg0hfaxSI622Q
 DSE/27Bu5dNZjPzzUzg0Cp0sAsmsDgqp4z2It0EIFqmb0iU9BpiGuc0i3Lium5olO7RCqM1ir5
 hUqrex4jcZnmRJRluZQEe8LR4Ve8VfoFTda6OB6h/fzfwu88u5MXZKtcb+1lXjOnqXwqjKKb/C
 seUUCIYLxFLjpQne+Nc+BrYQ5iuC/2Bep7nLzgflPvlAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=7804;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jUDvZazO474CIj6UfK9rrKEEe6NXIbdeQpztmygDkp0=;
 b=Oz0AHVzotegR1lX+57u3OLv//lRYW7v2Ee3ue88L3mdvsW6UaoFAQQXyE8ps6BDj6Ij2u13RC
 gCl4ptkMWSIDmubhzASYZ+eSUIZObaxNIRWc0TcxECBUSbp4JIiGCuq
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXz7ZCWsH8sWt7
 oZ7ZhV3WqfJa9cKeWbxtipZlHIsQX5fEkTQj5LB88T/oUF8Xke51n0xgNps6o0ZI9bYCZ/1ty+q
 K28sUUXAuuUG673iQ/RcX6P8ijXGtHTUxQKvrN3CgGqLSLRcSj6xDQmKPzsmGlbHCvBCLt7v4P6
 HrbUlr4/VKZGpFlR1xvjwa39bbrWbfZm7nrkWx0F0OGnnl8oBN9hi9UeftEItcj4UquC5xSeftX
 +Ispt6Vv5LkEJPZ9jT3Pa+gYaZYnTU75d7W3sEkiJQ78O+rzhp43yPdJqPZC2cvvAE0gNBIPmuv
 ElYkVqJvXBwoRhM1ifKpLafPTeP5JaJRM5GR6Xq6nn6h3kUNOb1GtVr0y7QV+C7gT3UVENpse+k
 BQoy2G5X+Hg1EMR35rDh9eNo++hoahLvut/SfEXJ5xBS99MlB/GPvo/r+tvxGiBOGtr74N3txGF
 i+x8lIlD5wSAzzdUCsg==
X-Proofpoint-ORIG-GUID: TupoYqyeXFKddPz1E5NsbY747YesxlR_
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004e42 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fn02ttKd-iuB0E_vrvUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: TupoYqyeXFKddPz1E5NsbY747YesxlR_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX++WPJ3qSK+he
 pjzh8ZFrs4QQ2rYDkAfca7e62etiCy07aH1jyjbLub9ZaLolJUaLod4nxHxyZdg329WxiE/V9ur
 CzzbV3hewoyy43kZGdTtwrlC+bRWUI8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054227_159088_9D725125 
X-CRM114-Status: GOOD (  18.77  )
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

Changes in v4 RESEND:
- Fixed accidental gfx-mem interconnect-names field removal on some
  platforms during rebase.
- Link to v4: https://lore.kernel.org/all/20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com/

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
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  2 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  2 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  2 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 50 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h         |  4 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 29 +++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 23 files changed, 143 insertions(+), 3 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>


