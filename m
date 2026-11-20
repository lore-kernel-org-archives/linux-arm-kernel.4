Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F23606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jvT5eKxk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hAIYuTE3;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8lmYrck;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cs4QIj8r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=jvT5eKxkyU47Yb
	SROQCbLptezxJr66aivac6CvOs4zrLqz6m57V447Z0ykFCP6amNjdPlKWDdxQFwKfwchOUC1PBAFB
	55fI5SM1rUYrthWxNIfK8CivgrM5Pam69o9saSFXYA4Ac7Sqp0YqnWla19FNe10S++bFuCQrYu4Ww
	r30Jh6w2jD7vAnZkjIb0b1eV1xyoXYEgMNL0R4Ffh5RffMJiSQzIGpnNTMYOnSe3QFO8VuItZLhhT
	xIWfZcxe24zsUiWHKCWZluab3Bh/C1PNfWElew4C62aXvsJH5uehgeyDRa/j2roziwZqf5DQaESSo
	6Vo1Fd7/Wl5gs70AFOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuV-0000000F91N-2uxU;
	Fri, 20 Nov 2026 13:44:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuN-0000000F8mK-3tqx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Nov 2026 13:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=hAIYuTE3YA3n952yuYBlMVnig5
	bOMw0DvZGq0X/XmcRUVUxp+bPKblQ42n64i4WCbZV4Pzwv4lgenkEEJyDNFBHt5IobEGDxgA32Vjy
	tT4RSVLm5TmsfLs9xqcE5xXzOSnrbaLMvynIFNPDIQNra8MUiTzZWbApLEclezdDvdLOMJC1/GmDn
	fzPW2DqK0mdNB6pE6ZRxyPGOvfk0AELkuAa6HYOOHfPdOtzZUyk8X3ORUU+qdRyXA05IPTYXGX/uN
	gY8RVFCldXvYoF+t4TQS7yPLZoRBLAa+BzCGEP2cpI3KKO/qCvcp6g1Kv8Uwn+Kjq85XYO5xJ4MCi
	+TPddkSw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuL-00000000obr-0g6r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:44:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkDrE1017066
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=h8lmYrckPdPOTE9c
	zBfMzDPhb09b77c+f7yC++L5R671ZuqDB4ARr8QmZkVWngg8rVQozVA5dAT3uwMv
	DeCalnH3oHpSn/4mMtGROnCaGRRte5JmgxEh9tBuWB3fpmh9OmhYJncenlOWJS5E
	nqh5ZTC+V9bv5AfI119C5acSzsYxl3n8GU+fZDBPKB4JMtNxusRxFnD1MxlrSC1Z
	VYJ9wu9fcadHw/OusG/AhSdbWLb/tdl7JFVZ3Yn5IanRMQ+MZqyxIqWwMK3bU7LZ
	m1+mSlPSPFfVi1VUwXXkwVx+E2Wm3BtbjC6MQnUEmULsvha24zyvKq0IEt+p4uAK
	yS/U6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:44:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso2856996eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182242; x=1795787042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=Cs4QIj8rBkV8E7ERPuDbdEi9dOWDQe7INWe7dTSP7fSpzZwPGR0GEkhN+tXkTEGCvm
         k+cqMXXJto2rnuNV+fE/s63XHpKdgAWNMxKf3ag/mdxz1zWxpUXQvwYrGWnBs1shrvNe
         ZFYqs626NDcrGRhRT4bO+4k3+dH4AeEekiDFg74Rk61vnj1Ws2Btfi5VwLA4It6a98eR
         BQH6UamGd0briYOzrm2qHMRs7nAcnW6P4KgqzLVJuPBa1pReZjMnHGn8jl/6/YAa5Nen
         F0mHKIRZYzem8Uv5L45pCjj+G+zRxWPz1A7GoDgZOikncvgiyg2eU6mqZUZHYRUYOGIr
         BK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182242; x=1795787042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=mNohTXPt8boENYF326qVz+PgLZbNz1RoZJ4OGrZYqiUSnBp+E2Ekifg4jqPuBRBguX
         y+5ud8/DrUig4ahWCJDM6PzRpbxs/FnbSrWxUx0N+iXRWMqPuBymmY1baWff6MR94q0C
         hvSgTeuf8UfyqDA2CaHYE3XAKdZqElgTJxyeZzyxrClsRacHTRTW+FlslExDB4BdSgXO
         25Ue/Fbe8NsVgJ13tALOvPw68UvJbZ725Fj9cAg5rKzzg+n8Iifn8SjIeRtp9YpDfaGW
         YFqDfZeBsB7Ju2CntywuKEQ2Y5g3yxbIRk9VmAK64lJp6eRe/08/9BuSbR+bBIPTFGUY
         F7/g==
X-Gm-Message-State: APuU4Z+foSCAz8KhY49RjZ6Nm4a1zm8VkCUgn8JWqvbvIpbA39uXXffJ
	11yp1T+vhrQi+9fn/ccMnD/VnNsSp5KhvY6kaL9LNTnGM9untU6/VOra0aVzSetnBl3NAGeou8T
	yUf7n5WYyvofYlfQtJF1Fl+vo2OPl4kosW7E9xIR4J5oYrz+Nv9dgA6/9t5pnJwNgRWsm1Ck3JD
	Li6Q==
X-Gm-Gg: AZFdTZfhR0Cxx/YxIAsSsmyhFI82uSfL7bJtyqttvfrIxLSQe8RQYNTP0QRk6mhA9LN
	8oE3Pz7BBhB8LfN9s9pbYSn/TIkmAJYcGk1ke2SJOmlO9CtUF0BIWZoL7Rc/NLCnrvUcW1INKyd
	Yd8HDagdEpxJgVFJ1jbm9tV0qnXFJSMNZWIg/ImdR8v0M0J8LZ4E0DB61s3uC12U1hSzg1GwYOD
	zSNBUK+1qomMeFgp3pDNKTIw+79svi0dh8pD0z6mgN9AeDiWctJ02usFghzse3EvKDijvvpbySD
	PfEikX8QSdVuwhJftl+L+SLpr/m+rSvU+TS8ga/Kcplyp2axEfgYLXlQUenDyTf34grnObVKtEY
	cldTzfO8LWPDFe5UvMTdl0YjP6rj4Z0bAwWInuyTZ9MGywrLmsCV/9WeEk0Yl4obYmEnpJO1f9V
	JI8rM=
X-Received: by 2002:a05:693c:87d3:20b0:382:8358:9e03 with SMTP id 5a478bee46e88-3856ef457c4mr3214237eec.17.1795182242318;
        Fri, 20 Nov 2026 05:44:02 -0800 (PST)
X-Received: by 2002:a05:693c:87d3:20b0:382:8358:9e03 with SMTP id 5a478bee46e88-3856ef457c4mr3214196eec.17.1795182241665;
        Fri, 20 Nov 2026 05:44:01 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:01 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:49 +0530
Subject: [PATCH RESEND v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=uW8nrRF4SJLtr5/e82lnBVVXICez3ZPhzw4syEcDxKA=;
 b=ruBw4Imxa59bxECtm9BfDnEQ/DhLV5sEaxl2SqHiR8757X6GkqgD6J2x9UuFHUZeWElYLwbS1
 eSMtXQ8gr56A+YS8LcG974uxZbhOFOHcVO3rJlm/kmCKVRbZFPz+WnV
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5N/zjMdonBsN
 5oANPx8YQCmN6Dwy8byEN8xLX1t8WXT+pB3MizkfB7GuNiYHIpvPpk9Ha7rJTw0BuDeF+epFDXK
 77kqNMDNdRdDQHnPWlf/rypJNpOpqu2nyxKBc8wlItNw+70lNRuGaTelXg4sPzS4LwTk0pYUAd/
 16oFJ9Cf+91XSwXPKFEF4BPSWpyBnWmnfGj8b98sUK713orQQ62UbV8ry6V8SKreQGmaL84hFYD
 F+Pqexp4FZ3CurMDYc9KeEezzmBavPf1V/99EKQ7rH7B6NO2hcLwAann/k4iquGk+S5MjxVlD2t
 Lt5hkFYYw7HbOuLzsief+DgYZQPcn9aOhStVoBJJXXqo/GgsccZafyFUYoejSZK4nhD9JR7eDTq
 utHEJrSWJ2b78JC1y/o2n1SGy2V9jsQU9UzfL1dpjlNPQ4q41IUfbJwMszxeWt+Q8Ah6/h+33iS
 c9UZvJoWQnsiq9/POQQ==
X-Proofpoint-GUID: 5F19tlQLkKjDfL2LI4rjupcTBWBclgwj
X-Proofpoint-ORIG-GUID: 5F19tlQLkKjDfL2LI4rjupcTBWBclgwj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzjDp/jYvysRt
 00/+bTYC0p2NAyjYHCL7KZwYiOx4N0NUOGZBEiQ2BBxGxYVxq9bU3vUULQ20MwjrD7ZuwgFapjY
 a7Us1ij0AvPjV5s7CCHqTZ7Sz2ny67s=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004ea3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iSr-qRAn3DWi8jR0IaQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_134405_392394_04886630 
X-CRM114-Status: GOOD (  13.21  )
X-Spam-Score: -0.9 (/)
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

On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 9cae93b6a610..49ea0a8759f3 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1988,6 +1988,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1


