Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921CB60A6F64
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L1+xosHb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OLE/ah2/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8w6UE5j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=; b=L1+xosHb61wT0Z
	QUDLCvfEbJilPeWNd9OfVpR9HYsrmuYcxLJHLmfKTmdHTDiGtV+Ke0tZxeZhq/Ad9SaCM0oSXhTVj
	1f8JXd+5+/xqKdz+wFO3qBzen5tNZztRfYD37gu+Bd9WMC/1a70+q4oEXkNj/1Mz0zBofUYQv6fBq
	VurtxAUlY/ecw2m4K6FjihOciR+fR/2F6rWieqhtdvq86oNB7TOEB5/fD4ZGTVbUSo+WA1vMWlp4x
	Nw2G/7y5WUn9zRP363pNub4pr/lE+aO+2yCUBK7ZoTHdF+kbWDxcFaoIOQ7WlS+xwTkO/56/KZSU/
	gNeFYUugTpgMesa26GgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSW-0000000Ehur-3H07;
	Fri, 20 Nov 2026 11:07:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSG-0000000Ehr3-0l2Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6O33987225
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=; b=OLE/ah2/EA/YApVL
	YDox7iNZKWVUiawjm/9KI34WLgg5QEIn0CJ5Xtj/tGcSNsBpjo8yuF5sLbGg4Ajr
	vhabz062Akceh+Xwm0SzRkpldVZOEMWeXCpGVBq7IK/fzgNzezHFiuA+w3qH18Tm
	dp3QWFIgoP7yJikeVctlZQO2suD3mHboa0Pd2LdktHuy2prEU1gfUVQBMxMCL2x0
	BmuWYWLFW+mgFvMqWEKREvnhOu6VK+V+XWJiI5/dkEnPlZ609NfHX/zX3JJCnS+c
	Z1CZU3tjMwmLdCpAEkXRy+5bhMWsAPVO9gOxL0RHxyBTQYaa5Cn8/rMUvEg+0WkY
	djwa8w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu813xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:06:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so822317eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172815; x=1795777615; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=Z8w6UE5jGlr3vKioKLxp/zVNK5qsAquGqGBVjg54G3ODfBktdYAaKhZZi8oHzgVSCU
         e72bQMhVaL/WiJCp05dbLtwSvs5ZJ/vKIb3WEKwzOAOYrNnNoZC+jYuzQi44L2ILanUy
         QrbtYIHIaqId7jRe/3nhqk+KVWA6Uz2pLhF8kgKXqA5p5j6yPDrbzfIK7dcQGphzDiHj
         Tzsxn4y8Opbjqp68XkaqG7Do9iG7f2ejfEFCqsHtJtZ5qFr7ZiGY21sPdy6kNiqGtDtR
         5afFsZxrlN3oQ8Jr0bzompi15qUwFKt35GcMUKnP62bj7Hyld1BiE/GL1rdBvobECxrd
         hBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172815; x=1795777615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=pMA603HeUT2ZmopT1soWz09qngmtbS4pNZD0zyGL8AK8jfv9G1fl0lZeWnMDZwGgwu
         9Bje6F2si17K2FTGfM9EX/XQs+HZ0Y1SqVSz3DrmvvhUqSdX6uSmsD4mJX2fuCxXlYC+
         lT3nf+w6kJGyV1EdU3izV8mHQo4ukVRR2nUatjSpDM6vMzHRwmQJkKOAXA/NMC1PajGC
         y1XfEimg3mxBnCqRulCxgY1wkJEKKoZeVfgjyI6aHF6pIpH93sD6t0D2lQ+9M4h0m089
         DApw2Ud8VcMU1kZKSuzkvRdbA26C/PCN1A010REVGkwiC1FJ/j/o4v2v86olWB1MoPdo
         PaxQ==
X-Gm-Message-State: APuU4Z8eONS+5cAa6fg28HzcmWYC0c4jJcOcjpWa+k3y8Z6a9rVDa5Fn
	Uuox5pRMGy9D45BqC3FQJkNvJCJIWuDEr7OK1zZbF5YMUqbISIYcFtyfWyS2c55fmQ+MqPV7BAM
	u8ss4R3oL2LsOvdI4BmG8m+Vi3RlsVQ5eCXHM6uWXZCUTFx8rji7h9HhW2L2ka+sB2AG2F7eYWC
	/4rA==
X-Gm-Gg: AZFdTZdTN2kFQIL87PIDfItjjh6ujnaE4vO3gw8mMl9LqC40fFuQeSGF/6OnS8PSuAL
	3M8kp38UARMgluoVv+IfnhemmEll4CK3qyhzqjqd9KB/mnBDvFaumrMFxBRd3lXc1Pe+E5PuFMy
	E8+0FINvD8tXUvwx3LW1DKyuP11FA6sCOyZ49dTjg3YLam8OkRhjKWO4EBz52lpj3kjbYXDTqCt
	Kr0vBXmZE7ZMrTSKXNubDLc9dLcu45MRjHHuBmxnmFB0c1QtA/mbQeQocGMqu/dPv3TRgTLYLCM
	PUE9rcVP6FHnOr61+Oc2ZfdpamUNlWx3OtALRAMlLCbLKW5HFwpXW1Y5nTVwsUIZeJqXebimrdR
	1xxZ6MWk9OwV+FKqNh7k6hjepWcPthTCdRTUepr8PQHKN4yF90jAKBs27dQk7QUvLRu3Sh/Twm9
	6kxLLA
X-Received: by 2002:a05:693c:41cb:20b0:384:4fb:510 with SMTP id 5a478bee46e88-384b4e7510dmr3920921eec.27.1795172814803;
        Fri, 20 Nov 2026 03:06:54 -0800 (PST)
X-Received: by 2002:a05:693c:41cb:20b0:384:4fb:510 with SMTP id 5a478bee46e88-384b4e7510dmr3920883eec.27.1795172814150;
        Fri, 20 Nov 2026 03:06:54 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:06:53 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:42 +0530
Subject: [PATCH v4 01/20] dt-bindings: iommu: arm,smmu: Document
 interconnects property
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-1-cab8ee8be0b3@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=2417;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=L9ZDNV193MgcYYJuTHrN/Rk+LSdrA3XbSL8eIPKsLAM=;
 b=wdg5TvZTBzYicERdTGjHlneO8uNo7gn2OPeJEAerjHG3UyVz5Pfkn/6J0N4Bhc0D+p0HdagtQ
 2sciI9FlJ7GDWUDJ5zSVep6gADyCUDd2XYfiX8Wc3WXC3zK6xtK0mkb
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX3Au+oKnR9OBm
 9TAFIDR/vtWYcqbzkL03xH2k6DwcZa7yrOdV1Kbth9UohfGxrybI++9Pq6Iv0fvYKfuea2E5Z67
 K5habU0spiL2DheWQZPbcm7uQxwobFwnSzgzknWFeLNWrs9dOT4ITC4evWWA0Gf29nc3qBZ0JA1
 lRolIqAFi5gG8L04snb+kdWuIKSqcGOindCUF89Sub7c5xDIXYIbJ2hc3oXcdskhEs5Wo8qElJg
 GPG+F8PMqnETjyIqmhFoAcse97l8E/wUsL47LiVm0Ck69qEA2MLgITx59eNC0RbREqTtnr9Y1sS
 It9OwYBjGAYQSfF6x9ns+XI+mEDxdHoWHbGlcyhGOZpT6U3xJfNC7vacEEFnBjzqBW9yZwNpwGy
 gXvIDcqHMsoiVp+pEBZQr92SMmrxDxVSf7lvh7mufkP3jpKuxlU8y40f6wtaNUQSzlN3gpMoi0B
 j1F8DrUZNhNNb8uX80A==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0029cf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LIGS1bie0qojq0S7pNEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: G5f1pN_TJgUpqFelrl5hfwEXE_Shb34B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1qrlkQk/o2k3
 SZ++6ClwrP+DMDyg25GNUzGURipVss8Klz3RFn32Q6s56frtgzl/1VBdU0mAzLxNRc0twRE5rFZ
 tBj1gzYlLG91BRI6j9GC9Owz37GqXxw=
X-Proofpoint-GUID: G5f1pN_TJgUpqFelrl5hfwEXE_Shb34B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030658_557412_37A9BB45 
X-CRM114-Status: GOOD (  15.60  )
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


