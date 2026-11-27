Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320AF606A6B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WUxA0BFy;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nVzCSNEI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T0RD0WwfqIa7YjQQ9gKb568oPICNUDCT07bgLzvcvWc=; b=WUxA0BFyP3UuSQ
	Gpwr+ACEs9oE5Hx3GUHkFao5UnUOxHbQqPGRS7ecZra3AKE48I5HTDkU956g8I1QXK8D8lFzzle4/
	UwTjaHSnHK2D4Rwnx/Vdu/aUxZZK7QHR4+iEUAs8XHtCZ6vpUv5kVTAUFgoVm29LbLyYsmGfUngrI
	comPeu8NyO1r7CC36TBj78Eo4xUrCptf4XHiGvlpxJNFH4gEzSofPNBVMMng0JHButygjwsLjC5dM
	6FLGlnskgkn3wmWDiMJ6hEeLT4TOHGu39hFdkmxeEE/NR6lBkGz4y+g7tci2vFtDa4NSP20RP7vtM
	XUlkcZFSdnlxMtOSy7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrdg-0000000FIZ0-2BJl;
	Fri, 27 Nov 2026 08:49:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrdR-0000000FITL-1OWW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:48:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7H1Is1076489;
	Fri, 27 Nov 2026 08:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T0RD0WwfqIa
	7YjQQ9gKb568oPICNUDCT07bgLzvcvWc=; b=nVzCSNEI1j6k7CiiPwH+8GFyFa5
	hrDtf7yjKPh7oIA8dmA9qau0IzTT3ebkBGeO3KQQYs0LlHmQ9+NIERtG5rY+uBIc
	BU7HP3uiqzi/SoyjA521oG8bKf2LyO7EAWyu1FHPWOt6EgQxBcePY7+gWekN5Yw+
	eec7K66BltlFH6a34sFYhwHol3SeVMx6MW6kApHA57bgmm8Dfz3YEuo+HVtQSCi6
	BbGK+62mUcCddLKoUm0p5JPwQDbL1SliCTXzgeum17j/srsxK/GDpFc/w/sBD0jN
	E6h+2P/yCeS+rqGXPYAu5D6pEcVRJV47H6NB+VX+nfp2jCkPzGpNgT8cFyw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55t24p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 08:48:30 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR8jeHB4193794;
	Fri, 27 Nov 2026 08:48:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mohis-hyd.qualcomm.com [10.147.253.64])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AR8mRer003696
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 08:48:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4840500)
	id 908A266B; Fri, 27 Nov 2026 14:18:26 +0530 (+0530)
From: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Fix Shikra q6apm DAI under KVM/EL2
Date: Fri, 27 Nov 2026 14:18:22 +0530
Message-Id: <20261127084826.916361-1-mohit.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
References: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX2OcOYGRhhVm9
 BjrU/2SZBZHpLGUoWB8LFi/7J4TLzsIhut6AZCoVP3Ux3tx97SRJnW0CiHxfVbiIL9yImwO3m6V
 MeAjTgCVmeNMkGDjnGy8v1dKKk1VE6I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX1fkQ2ktmgT6+
 BTR7poARSRcRAKTzMALA8H6LbE/bR4EZWYO+v26H/toLsuvagU8aWcC7HzNCnZA8Z7qFJrVNgR4
 MrdbSpcklp1+dFdCnQnwG4MUltlfxNft6YhsWa7iF3s3+eZILmBoAY2gLQFmnV63jJ8Q4OsHm+p
 HtQF6BkuuRq02xysyy2f+JnOUzydhm1sGNRKCa1lusn8N3mygboUSAfrgVooKbHdSZ84TSzwykd
 mCj4rifxZi5qxQtLMS85Znss0vjVKpuCUnFS8vKKY5P8z4Y1TxgAcpdoHlzPXU4HUYTxBhlPROh
 0pn6UVHmUErkJmJOHJFPmJG0OO5/AbwJjk403VEypCVicV9tPFHMXLXFQwYRkmNd1Z3U6tjdal/
 6cD/UEow1PE/BfGXOXLPUnnin5RezPvmrXf9V9Z3AFlxf4S3280gSBJ3NgXgCYxOh3GJmyZeYuV
 tzadPn4LyM3C+FGVDQw==
X-Proofpoint-ORIG-GUID: YRGWH0lEQquLN7lfs9ppjk7QUVkvzBEk
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b0943de cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=FdZBeAntQVJhsXRJsjQA:9
X-Proofpoint-GUID: YRGWH0lEQquLN7lfs9ppjk7QUVkvzBEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004849_521927_091E937E 
X-CRM114-Status: GOOD (  14.19  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Shikra's q6apm DAI is hosted on the modem DSP. In the hypervisor
configuration its shared memory is assigned directly, but when Linux runs
at EL2 it owns the apps SMMU and the audio stream must be described and
mapped there. Using the normal translating domain causes context faults
because the firmware consumes SID-tagged physical addresses.

Shikra also retains its reserved-memory carveout as the backing pool for
the audio DMA heap. The EL2 overlay adds an IOMMU description over the
base DTB, so the resulting DAI node contains both memory-region and
iommus. Allow both properties while continuing to require at least one.

Select an identity domain for the Shikra q6apm DAI. Also allow
modem-domain q6apm DAIs carrying an IOMMU specifier to use the DMA/IOMMU
path, while retaining SCM assignment for modem-domain DAIs without an
IOMMU.

The series is ordered as follows:

  1. Add the Shikra-specific compatible and allow both memory properties.
  2. Select an identity domain for that compatible.
  3. Add the compatible to the Shikra q6apm DAI node.
  4. Select SCM or IOMMU operation from the presence of an IOMMU stream.

The Shikra EL2 overlay is expected to provide the q6apm DAI SMMU stream
description. That overlay change is maintained separately from this
series.

Validated on a Shikra EVK booted under KVM/EL2. The q6apm DAI probes
through the IOMMU path without the previous SCM/IOMMU mutual-exclusion
failure, and playback and capture use the per-stream identity domain.

Changes in v2:
- Follow the established subject-line style for each subsystem.
- Permit memory-region and iommus together for the Shikra EL2 audio path.

Mohit Sharma (4):
  ASoC: dt-bindings: qcom,q6apm-dai: Add Shikra support
  iommu/arm-smmu-qcom: Use identity domain for Shikra q6apm DAI
  arm64: dts: qcom: shikra: Add q6apm DAI compatible
  ASoC: qcom: q6apm-dai: Allow the mDSP IOMMU path

 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml        | 8 ++++++--
 arch/arm64/boot/dts/qcom/shikra.dtsi                     | 3 ++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c               | 1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c                         | 9 ++-------
 4 files changed, 11 insertions(+), 10 deletions(-)

-- 
2.34.1

