Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BFD60A2608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ku9TtfLr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=migPxDrT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nj27+dUY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=; b=Ku9TtfLrw6098x
	3/bWyjX0SZA8Eddz195u63wOaP527pmQKTuUB2gwhbIYS6rgEgHxjh9+J+ShvXD08zpS/8Ui24qU0
	I57z5Bbi1FFTmDmcXPsoIBX017+bq83WxvA4+FJWIYGsBtsL7QAnF/S7t2wXwPiyW+42gncVFhpXW
	mv3Mncg/X8SkvlyuqQA5kuX0NyTdV66X0sfUYlWreMynz8/aDmQ02TDtCv9jIRCVLa1DKGqzkUrQ7
	YPkjZarzRpdrxcGRNDBqMnMv66W2fwCKllUSyUKsmlavuSOEkNRuSqLDNG3QlFcUV9PXhaA3CRhGy
	q7FmpCjFnROgD6vTT83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOsv-0000000F7OH-1qFq;
	Fri, 20 Nov 2026 13:42:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOsq-0000000F7ME-1ICX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:42:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjsFi1681944
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=; b=migPxDrTTyI6/FTy
	q28lmrP8ETqeT+SpI3zFUxhTOKhYcOYH1iNE/nOtgiQaNI+zolAkn7DTpXIgKxUl
	0OHhQhiX7xD1ve6vx5arZc78eFX2Kw5RUktAGYOf4ha0ADCWa8gCz6ucKEiIp2V9
	XsF9r4TEJEAjX9xKFLCdZgxk/IA4M4Tc5LMSE0DnEZDVY4w1L1VBLa4ugkjV3U3r
	+ix1/Srndu3GB5+bcNaSD4H2gXPMeNzNsGBZbyK++ceruNaGCgPK65Jn69UU6M6p
	FyW4MrM5bQ+UNW42r2eBg60FG6V3hE1uRO4oV3frvrZ/HXSUYCVkGjNf8W6Pft8x
	3RV/OQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tq6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383f2d05c73so2789547eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182151; x=1795786951; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=Nj27+dUYrGlRY0RmueiJYlGXtN1cGKtnmJMkjrKqB2886qzwnCw5NCTMsfOpg+TGgZ
         /qHQkj0lQKTvYfPHppMjgfpBC1SdbU5tSeVqM+yrpj311DHeYCu5UHYb+cI87mRJHmJ+
         e7IB1/JhfQrACKeU0kmLeoH/CwXnVJ1SNsE/qaHoMiRxShQgz6rxWxegf9b/+5e03LCY
         sACa0qV8cpOMPyidHk2UFT/97EcrpWk00LKQgtGRUWxFHIUGjeDsKLRh+qQnVQwBoEfH
         rCI18TA0CCpiQIHLp1tsq01NZyQxVHGU8BZC5asu7VZphUWmy2eO4tc7/eLPPUHszkBd
         rEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182151; x=1795786951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=LKtYwrDtMChGz3BA4/eqaA+KDdUSWyTegoqTVZDNzLZ+W/LVDwuSCzaklNENPjiTtq
         81OJLHYAqM30DymrpxvJlwu6tZxlYN+xUNPep+smqoBEwUN6H+SGHvpCLxFK6/NLDS+R
         hIhsTjOu7BWHoTN+Sa4uBNxCmhMKK8uJ8qEaou6xUOVvoD0K/FA6BBn5R0qCyKdm49my
         PApzC7wBfFJiKIvFR7P490ZZU7sYkQeN4p7Pap4P1mM8xIUP+QgqmUwZhbl2KHxeUrSW
         7Q2Cc7bmdZ5jH5ETufs4mBI7w7b0CNhSuNsrD8o2Op07D9HaaPLTK47eQrvPahGjv4Qp
         kzbQ==
X-Gm-Message-State: APuU4Z9XpHRztZhf//xQ+OHUvt3K1FGhg9zq9Qjad00ibIdcfo1Q8QpU
	+jAROhYO0lVTicqo8MTCOmlkR7G08iN/TOfjhJTtnZRmkKyOiftZPUmxmcogUUg7CO9P/uiEfl8
	0Gzc2xmm6yrzg/vg/nJz3ebjPxdwPEeAHr96hzj+uUSpaofdJk8+c194xKvoPhcHT2BsuQxrxJc
	Hqig==
X-Gm-Gg: AZFdTZf/qnbmnpOH5MxCTS3mczs2ziu5rE8P/zJUP5XuD7ro9dBB0ZJdtRPjDo2A1+D
	IKFFbGSXWT5dhf+X5lh60JXf4sO++4/Od1SmzCprl1+GTGelm1KrRBeOzqL7zuqp+jYdgC+ImRN
	lX7XdxT6HbfI44ukUGUBf9q6VoDtogEDWh8Ap6CUZKcANP/E5kY0ES69T61xfygdAo3wPjJOQgD
	ruogmR5YbiQieUrJ35ckCMmsH2a/9P3CA7pMrHg+Iy7pHGPnz4Z/xA6eJiA13FZq5GH5WFFdK3o
	WjUQsPLAsAm57xTmMzlkp56L8fVThq8wOmGYaEdWqWbaOlA868DwJPlsVCxEChVW6Lj2rqxD9yp
	BOZwm3IARp3cEX8oEh8PoICpXAkbMszHwxHxhfu7JPW0UU4mXVP0PfSm8LuBQdEJPC3wQ0Spf4l
	b1Hi4=
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr3290393eec.8.1795182150835;
        Fri, 20 Nov 2026 05:42:30 -0800 (PST)
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr3290338eec.8.1795182150128;
        Fri, 20 Nov 2026 05:42:30 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:29 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:32 +0530
Subject: [PATCH RESEND v4 01/20] dt-bindings: iommu: arm,smmu: Document
 interconnects property
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-1-be30526391d9@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=2417;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=L9ZDNV193MgcYYJuTHrN/Rk+LSdrA3XbSL8eIPKsLAM=;
 b=uY0Iae8oylJJB78xRp2RW53OaW97KnbRp1z7xWSKIKHPzU5GnoAeMZpdTPtMbwabSwKL6rJ38
 UUwBSOaoeG7C5EEzLSzPvYavoSyymBGzMhXJ24sUJHfdnpandMTpHnA
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004e47 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LIGS1bie0qojq0S7pNEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: VxO3AoRpZeQhAWLs4XtZmDxmk_pzbocv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX7vXhyWacACwt
 RyNBFSgdPCY881DgWsgsLxICX4Gl9TB0pyjcDkykr59l6ST1t1aWfNfuQTYoNrArWkvq6M+gMyM
 lFXuKkCR9li+HW2DcSkDH5lCknZ10D+wOVUHGEQX9f3DPCXLUkndkobJ/g9MgK/pCR2fnrjw+b8
 rbu9ZISfu+elczXTMyhxfQJLEYoAg/rHyWiGMytEO0KA+Bhlr7jKyNniQ643+Ee/cMw0wjf4Rb+
 YkIjTsvEss+57oTtB9AZfRFFu8WSgDbgNSpFBagH4vbCIWjt5KFC1lnTMvCLtIW1tRzMNYrIdg2
 0ssId+UWUjOKXChu0efdKVod4yjsz5VZ/JzzwbjtNpCBWm6h0nTATOmLFmigt87GpxQt+xaSKYG
 1RGFo7Pdg8FODJdOvSg4iUYfEBqXPe4no0uvuS96cjRQj84b3aVMZvDY62hrObwwa8YVdEkTKov
 Do9bw2cc6O4Qmfkm4HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX9x9KzwhHaoHK
 QVo9pQapmcg5aF6rH47/+diy2P1KaXZfolQdU/qD4aytActb4ycB0mUtbQyPZAgyEcaO4NW0wlZ
 1Y1IMwLEcv35UHAx2pfxvwwH1i/S1dk=
X-Proofpoint-ORIG-GUID: VxO3AoRpZeQhAWLs4XtZmDxmk_pzbocv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054232_352357_205EC62A 
X-CRM114-Status: GOOD (  16.06  )
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

On Qualcomm platforms using the ARM MMU-500 (qcom,smmu-500) as the
adreno SMMU, starting from SM8150 (Snapdragon 855), an active
bandwidth vote is required on the interconnect path before the SMMU
register space is accessible.

On these platforms the GPU TCU is a separate hardware block with its
own AXI master port (alm_gpu_tcu) on GEM_NOC, independent of the GPU
rendering data ports. This means the TCU can be active during wakeup
while the GPU data path is idle, leaving GEM_NOC without any other
voter and causing intermittent SMMU register access failures.

On earlier platforms using QSMMU (SMMU-v2) the TCU is integrated
inside the SMMU block and shares the GPU data AXI port, so no
independent vote is required.

Add the optional 'interconnects' property and allow it for all
qcom,smmu-500 + qcom,adreno-smmu combinations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..ec0fc5f7d4fd 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -252,6 +252,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -656,6 +663,24 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      allOf:
+        - properties:
+            compatible:
+              contains:
+                const: qcom,smmu-500
+        - properties:
+            compatible:
+              contains:
+                const: qcom,adreno-smmu
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1


