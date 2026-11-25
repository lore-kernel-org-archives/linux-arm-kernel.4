Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5597606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OvytGEo4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3ft3L20;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rxf+zGb8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=; b=OvytGEo48IBDyp
	fiS+80DkNgQA5SZO2tbghC3EqkNIP6a9M63OjCAzADvyEUvyi2q3qY8y1xCT5WD/qnyFu8/zIAIhx
	ixMXqaakpFrAG0qkDg185ahUpXqC1R16QfOJjhkpRj3mIB9RWITNzlz1f48/VnWJlZk4oqTwLs9u4
	jJi/hodXpcqRl4IhJcp9HXQXUhVH/TfKa2W58eJpqY0cC+JimQ300jajsyboVFnFp+/vf6Ne4eJK2
	pMeSHpAzHLbe16NA/SgBRb49Yik9h32RIcFos/z9INX6rm0jfsHJlAAsKsOVsJbdC7V7hAX1Mh/+U
	Fr8LYfwQvpy5XyM9IxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9wj-00000009Ppo-2Zrl;
	Wed, 25 Nov 2026 10:09:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9wb-00000009Pmr-05h7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:09:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mhMG3642165
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=; b=e3ft3L20BbfVP0Cr
	orjedQSocV5vKsKHSqVfpOqvNtpWxarKhIaPvId+I54N9aiKAW1R6CIjdi7KINrH
	63lIeoXf+mfuTdiGW8V3jKet0lU44u437LnD8EoK41SOH9JEoadALRTsAX1/+4gk
	SNJgzFrMhdJk9o4ex2YxKbmmaG4TfpNnCyIjxQk2gomItUeHPdTEttPKajscvkE7
	8pY5sdOq/B8HDiR2ND21tBfbenAI1b2CLG7Jw122plXdctZNEs4Tt3cHJ2dccY8Z
	KeyYlBbW2NQBV3t5AlOvFbSnlRfyYhEYLpHP0ojQpEKZw5+t6+I7aNVY/KEJ4esC
	aGshdQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2a9s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:09:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d03bfd50aso14206291cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 02:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601379; x=1796206179; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=;
        b=Rxf+zGb8LY6Jt+IgeFqna08gdtfrJcsEjaFge+wDLldiUdFMwkFy7GeHmC5Cta7G0n
         vuOJMy42+FY1pOiL2BVFiEuPMVjfOdD/VoxNF3lZ3xvMJJ3Wx1YXZyl4zo5Ezk9FOqRw
         kMkJ3xOK45cBJjKGOIKewwFQmSyBQ26FU0v5Lr4wbOZIh4KFijQIHE7TLm6TnuqNeE2Q
         +6wNr1JNuWh1VEciz39LmlvJ0tnwu11+8JvihTlbUcdDPexm2W4LXr+RqiJzzAWhlwmy
         eie6Czr4pWhPKYseEoTU5wLxpL5VNDeYzp5tfT8TPzbg9ARwQ5Hwc/jlU2UsR7DSp8dR
         SDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601379; x=1796206179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=;
        b=p3EDTfnhvE9VAy2PnKJdAdPE7/ub4JbTANG3yhbv7Qu3DXBXyUWCeiqHwawv4sXaS3
         Ct9BZSH6RrTDOab1/Fy6TrQ9bIkj3bTYMDx6HL60/km17CA5y8s7ZulzPcQamDmftTgU
         /VQqFpZSqVEr3jQFRHOBk+5dAqbtS1Cf7ih8lWiOZdHqnStqqvxnuYBgrwvODQuZn2c8
         5VxrMgiyxJLMovb1drb879S/Gf4fsnaPG3LRTHgR/VqxVv+6o9Py3h+nd2Xd/rqcSr80
         wpyCX+4rZT+DeM1XC5Bxj4/RHW9wTF9ExUBPxrmpLlb+R1Npn+Z3OfXoJxQeP4Zgp+Lc
         TXMQ==
X-Forwarded-Encrypted: i=1; AL+hErFuhGZSVoIUNMkaio+ZEgp4ytcCSxd+hZn5+aAwo8Rk6TxE9g0R6wIn3WULC83aHj3unNIJFK/kVt/cdxuP327u@lists.infradead.org
X-Gm-Message-State: APuU4Z9x46tFNxYrMlJe4WBqSXWnfhDtp0B0toKtBcx2j5rzd5vNxS0P
	/T7sJXslHQ07cw3+TxY3t1EzOM8TZl8sq9UndU0x/YJlUt6sKgecU7KapLDfCwQC3EQwEg1EL2f
	je0Oq7qDqiH3emHie1iN5S2WGCkMYTQ6rKi3jlAUgd/FUrLpAY3cEikSJzjIeFQcAQp997LhOdq
	grDg==
X-Gm-Gg: AZFdTZeOjPuarFTwEZ7rMekA5pJlujlEj39XydUG6sdLbo7Gn9GskuR4Xifa/IaQGTX
	7KL+hfpvg1zb4vvXfCPxzrb1mnmu233eerc44q6pSTPUwJ/lOALMmOnvlS8T5jlsK+3zvEn90ov
	3ugxy1HxA0XcWhduFSHS5HDJ/mumKyvid2n+nz0mrTWDKj8Cz2cG4HeQXTleLs6LsCIz2eLF5qC
	zdZ71g3UoBkF9j0Fz0BShNKX74DEVbZFEYJ0JwIN+CLAlRHJ/sBP6AJ5uY1InyObi4k1loatbUL
	2Jw/MzzqH+7eergVEChi1gtlJfD6vDr8On49Vd+dZ9SkDFzrS+omInIBAesU7AP2LaD8dw72zYJ
	tTKqnSSS+VAO2HbCcKmHv1YAMkUxjr+wLaEPuKVlu0Rnm6Gzm2Z0DW6i7cYbsAvEllHbEvNQ=
X-Received: by 2002:a05:622a:e411:10b0:54d:2f0d:a83f with SMTP id d75a77b69052e-55d769e8959mr290006421cf.3.1795601379468;
        Wed, 25 Nov 2026 02:09:39 -0800 (PST)
X-Received: by 2002:a05:622a:e411:10b0:54d:2f0d:a83f with SMTP id d75a77b69052e-55d769e8959mr290005981cf.3.1795601378974;
        Wed, 25 Nov 2026 02:09:38 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm608990966b.61.2026.11.25.02.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:09:38 -0800 (PST)
Message-ID: <def07365-b34a-45d6-b439-078cceebaaef@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:09:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8750: add periphid for traceNoC
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06b3e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RthPVecxuDhBgGMHIBIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: t78mOUbAO-7CicKfe7Rndnw8Vrn8crh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX8UC0nJXJ02Ji
 mpRRjGwv89iJENT9AYdS+qiksyfdHhVw125D5x1IaeAuWP7RlJ/RQ+AA/ihLbk3LujxKYPMkh4k
 1qxdXfaoIPaGh65sZicXJ4MGY1gUlZF1Jv7fYf3FeRWjAuQmrYwnAJvB93RFzWdJbAUDBWrDNS/
 X+f9lnVrr2XJ0o32/dwDzrRmyrVDJs9Q+iDWaFTqijwCXpFJzm5iloyBIzcE7Q55e36vOfso7C5
 o/9ksuRZvHqVQs9n3sLffwveqCPCmO4yBjpYfB5271U2NBM67FxvT/8YD4/MT2qJMKMfv22wR1j
 SVCZUT1pOQq/0HiGJUDKxcwzp5pwB9GJSpTMATRZJbFfkKaCZhAwAUSBpxrZVKGf/vPO8ef9YuV
 mm3Jt+B5kTuUXCKuoFNe20kwV+mgjFrmgeDdglDm3uAOT0DnBYxHxZJggQyv6X0D5l1PfdiPAao
 vtyIMq3vbEhM+jIJMww==
X-Proofpoint-ORIG-GUID: t78mOUbAO-7CicKfe7Rndnw8Vrn8crh0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX1bCiPdI8uRtp
 GLsT4KFz36Fja+j78nepyhJRFPnohJrcqa/NN2SOeOjsxbejVE/wcAgWkmTV2YXidvskBMFhOAa
 0uapRCF8REVhvNRPFIP7TXRr1u2K8F4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_020941_188132_ECC15B49 
X-CRM114-Status: GOOD (  16.03  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 8:01 AM, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

