Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D463560A6F6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BYSsXejL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blpj9S3j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOlEBe/W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=; b=BYSsXejLs2yWDw
	hBnaAR1cXg8FDnkoZ/vG57uk7bTBL6EHWbBvWDqop9G5bKCcCrTbNL2qvawKc3hKMVhEiBAeRVB0T
	+9dfA6fMReW4CkYYUwsTh8yxVqMQdrir1NxvnOFAXb4hGWBr+1P5JdEIWEw3vjlIRhFypsmNbDEvM
	PnAfHSlclU5Z1qILZlKStlZQZlMrffLZGQKEGWiohsEUS/ynCu6M4ELmY4Z4PRS5AGQ5utxe33Xya
	gQOvKbLW2t1TKOGzDhjIK6OAcBDvdsZyRxEcR64QiS6OSnDTqHyYX1x09UJeUsWDaQGZD3vcyWhnw
	gh/7I57pLDLIasO8P6xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSX-0000000Ehvz-3r31;
	Fri, 20 Nov 2026 11:07:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSR-0000000EhtB-0zUc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkBaO1017037
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=; b=Blpj9S3jBEpimAqR
	kcnxRQbtKRqltk8V1M9qtQpYbyVMXPlKJNXCkEk4qw6pHhw3kOBmuiHQorn6HDfi
	stMDbLOtYugmbrzXfUN7ks5CaHgJFmia9ruy5rydRPVgKmZ/ujFWUwQXwOQ4vcBr
	MJ5F3/7/Jh/xiwAdKF8J1tcu7YfgggUB6om0hBMGWvXd+wQNWY1xYzY0by7QKZpE
	b/IXdF2sSKg7lSq5Kdo7G4qRGGgkYd4GiTGz+rm9u7NWo7/OkuGFbx+3+a7yTXwi
	uzv/bbd+qZK92CSrYPZ7TLYAW6EwtMuZwh19jFHDuvbZnbWuoVVsAZcmMkSWiaEa
	3Go6aw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so822501eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172826; x=1795777626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=gOlEBe/WFHq0QK3hTJPtKWcJaSxEjAwR3su8nmCIEfAOSwd3Sa16kYwW1yf9ZhcXk8
         ZVwTUfFFSj9g34doHu34YNFT7DNT5QVtLwj4CjoHWtGZfnlLXrwaP6FIdrKzK0RPeQZM
         BAt6YU2i++BTBD6t0oarWypQPhF0bzK5v5Wv1dRyJQctSKx4lalVLiavDrX0qu2KUO1K
         7EZDsjr552WPLif+7NRqLjbyfrUQewh0MpvmeUoL7/Q8AtG/xSHgAUzN6C0R8LGJ1Dah
         6bBqqrW4x6wJVmQNb7AJQ3tXus2g3GHiw8mSu7R/RB51vzAhNMJCLtBZFhNY6YbxhX8v
         xeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172826; x=1795777626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=R4gHWDOn9YyFDloeKDNdcyXcJ4ZtrtufbwkkKoFBsRSNGGC4K/qWXNZzL4b07hSEiC
         OzNsL4+OKwkeeqH0VdNOJQGbEnFwQuWc0/VK3KZSJWCqRxQZFAzvnNYYApgqlJhISkK4
         27EncXzke1LkZCVQEsMKEXAJZzBOZzSVkq6DQYwck54QpVEudqPF8YQ78Nin8VSEn3zN
         p/sHsmZCvFG0xfKOeYvKLKWLR2Deldl9i3vwMtui+a41IJQOE1bls9yuOyIcYITYSH8p
         FVrXmMScGB1MNMauUCAVRGyLdWB9qv+4LeSZNyHzozPNS1J3Z4cngC6znQ7r4ozw1xzd
         MJKA==
X-Gm-Message-State: APuU4Z9FbwtRQqhCjLL/7TLC+UAB9JTGzDcGZ5tj7zC1q9z7PB/tiO/H
	FP4uCZA3mGFPb3VxU2SDc7JO6VyLQmR00mdesavL/GtzhStyUroU5U28P4fyU7t/i6DzeVkLFAc
	8M5OyIu0Ogv8XtvEG6EPSf+24eWJVSMVmCvAr0/SjYbJO1AdSfxXOaiZJyBzRX2rTZGOhRNRk6C
	SjHQ==
X-Gm-Gg: AZFdTZcXpkb8qytJt/8WM0DRLokTdq/nx+7yB/hSuk8+OtlOLZAY9bk84JvnJ1tNfGe
	FWk/Z6sf7x0wfVvf2pfAo6xAP6Vi8nD3pr1nRRp6sWnGPxssKaUS57KoYh1LXGGWzNL+3T6vJTS
	KVaucMPz8mUqL+wq55685dvJ091kyYJmTL/M3AAy6JlF9dWIgEwp81Jyl1oIwmS2S4sceyDd8G1
	5PebW1gWY8j0QjyHu0ObfgOQzzjI1DXPk2uNf0464ln+htEZtPNSQ50Xe3vVDxWsW4H6J2kPHyV
	d6ttOGPp0XU0itDOVmkgZia3rO/el+Mcss0hUWpxNR051tL9u8XDXIkrfeESPUjJZbm7DN1MW4r
	hRYkOQBIcq4yZoq+kxWdvIbN+k3hGfa8QJ1aMqI7ODhIJ6UUc2HtPcUB5+xE6jeuCkLOSybUUID
	+1Jr/j
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id 5a478bee46e88-3856c6b00fdmr2845762eec.2.1795172825822;
        Fri, 20 Nov 2026 03:07:05 -0800 (PST)
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id 5a478bee46e88-3856c6b00fdmr2845713eec.2.1795172825017;
        Fri, 20 Nov 2026 03:07:05 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:04 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:44 +0530
Subject: [PATCH v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-3-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1065;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nfp8+SD9J7PQP1TIlHLZz6YXOr5xoEhGVTCZWtBdhd4=;
 b=9enQAwhrtiAROoFA0A0yXkaYWGcoYyy6fPoNMJULacdk9ULbL9BFKhSfPzmdlWfAc50CSpTuM
 BXgU2EZNUdlAiuErjAsMTVcYGtW9zxqDvZf9rLcNWXZVHqRoHeGmXEN
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxcCe8r6O6vwv
 jK599ZwOCH8+zT8q1uiSX4W72+fX4ZfnytdQBjMlc1alJbVDRIZlW9en5yF+UgnwbaBVNdaWwTM
 aWg72u6NHJFUqeEL/nrgIv7odLOWWNzgnm/F3bMECf6IeNKQKzTTJ9/koI/EDr+N2RdkF7JrGkI
 QYRvuGUpn+klKFygcaXGc/sw1NKpvP297lHEIAcQYlDZG89FCk9i1ETtIh9VIHoAfubTNufsCbg
 NOjSwkf7ynFPYFS37mP3x+3gKVAsDUs/9gQ+RZt2ZAw0T5RDZI2ueCXaAiFAR2XPklkQxhnKkxe
 95mkwQGCtF2N79ufraBEO1QcGXiHBE15vIWnY1BSQL0U9Ft8XO2/CwdivQ8d5Xk/4MMmRzDxV9t
 ZHX3Ozh6ZS82eVM4WW6vTOANV1Q28+F2D3ixq69Swa+54xR4yxK1o55SGY4LEwjIullFOg1y+BN
 cJDIWsFQz27z+CWsMtg==
X-Proofpoint-GUID: u224JNESPd0YWwoVUUAqeD46ljVppZIg
X-Proofpoint-ORIG-GUID: u224JNESPd0YWwoVUUAqeD46ljVppZIg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxvAO4W0dOBR9
 lHQ74I0byN+B1lTWBMlnSwNKUsvetPiG0Xn/ZJwo9tEG9dg3P+4uamrBPztgvTBfdQJ/2Q6oxPG
 wJhhR9Fol1nqY/Pan2vGcJTmDmKLo0k=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0029da cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
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
X-CRM114-CacheID: sfid-20261120_030707_595545_B559AB15 
X-CRM114-Status: GOOD (  12.03  )
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

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed6..c142c7cb509f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3413,6 +3413,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1


