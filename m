Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AA0606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dgQsblyY;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evvI6gG1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LkcUeeWB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=; b=dgQsblyY619JsyT75ST9UClsQA
	s7a31s5mg4yfQKZEKjXTRit27AGUCipCIatVdlq+eQssY2ek9Mp0IFz6s50R9KHWpELEk9U8EljWm
	lqJaCi0+uYOvLYsK/G8/FzHmdQfjhCJnPmO5QzL888e5Tl7ij7QMNSz858/jJYUNy9mWzjJwFP2jO
	5FZJEWyp5qXFThPNDpZ7tsE098J09bAHhtcs9qgD7NLeuRw9+j9M/9UkmC/hygo5kH+PictNby8cs
	kGQCbZEGARWN+rQAJQcGlizNkFPq4f9gy1H+7pzGMh4ubV4RB7tr5GJQZQLla7CPDgaS7+yyjBCH1
	LHi9lfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZtN-00000004hoT-0iMw;
	Mon, 23 Nov 2026 19:39:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZsG-00000004h0t-15Vj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:38:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1pl63211982
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=woJtGyolaPSm3epuc0oRfWRq
	EJQCl2Rjtu6xIFO48pU=; b=evvI6gG16yb0OpXZQ8sODJiJeD0hRonbIqh306ra
	xuLTFM1G8GcuFl5y7nIH8r9yXtxvkwhHASzlgE6xaS4oG5AvC0h0LygXzvXc8zHs
	SPtx8lVyt3KLLINiWrVUc3SWNGPGP8Ia8/Fr6QI4Gu2LXcgOQmYcM3dluIFr/HOk
	w2x+kcsvx9+s4QYNcgmsXdAbIOJK6Abh/CRHGjaPbrlBiyGsfl8C83R9/Lu4taHo
	GmUfF6iaB67NjLe7g2TWT4Cto8mNG7lzX75auIKcCEWD7unPWTRFOXO7JuwsSSX0
	knEpQgDNcmvdSk9UaI3Y+/JVHd8woyrD3gV42U8MQ4/WYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr4xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:38:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so352385485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462727; x=1796067527; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
        b=LkcUeeWBIG1lcFmlncHGly4HPqPGM9O3QZkProttCyNENku9xKBiCyxxoYslSSjNul
         Bup78NyLzhvBLXsnN4NFg41GBMwal7Gw6zl2S8x5gs1E/4csdaRVxOYTB+5Z4H489yZF
         Znt33VnH/PA8dGQt0kFQHW3fMX2FbXlUIuVsCm97c9RDD1aCSYqRkUBfuWUvcuau3IkE
         0K5nZ2qz+hCm8pxdAHFJUaHXTPCyb+tO1GjvX2Jko9le9go6nkU2tH9I0WhlOdbqAUQ/
         ZSDDWKT0FpN6DqpL8VxXHn064aBP55o9kk5RzSGfMyyupz/m9IQvoCUYIA3E4zGdWr0k
         mg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462727; x=1796067527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
        b=1/YaiFmjLqiYQWF+Jwr+VPSCbl8PVDcDPwcXX9bL83x/5sABd/TzI/X7rK4x9imrCB
         cEt9A/lmysqDJH9rAJm/uHUPR2wP2pxsBvbap29ErZy6GCd8YGlwZQqfl2tSgJsM63Mk
         R4Dt7iNIrkXXMPtM/CIr0z74dTTZs4DumrgMN3aIdgKfGaSJuKiBjU7mAIPmXVA/kYa2
         SQjPRLLBkezWoWC1DQxuZsucwhbBCvBRydB54KNIfDYnYRiaxWVVrFPiKmSJD0idBS8H
         itkyx4zRQ5X3Se63eWIl+NvjtdY4ZhSahAxgNAuTcDfKdFSiD84g3h5dwzVp5iQFIHsv
         Vzxg==
X-Forwarded-Encrypted: i=1; AL+hErGmdXEeDLQoCt1ct57Jk4vQpekg5Zt9FAePSaUYAej7A9/cyHuH8GR4JS5VV6/mY1qgf1R9WiqRaPS6oZsW7WHU@lists.infradead.org
X-Gm-Message-State: APuU4Z+y3ncrurmMCmrPFmxUcZIhw1e4NVCTteJcThU4OlxS2MU5o03f
	QFhDazgaVEtCdoAcEN6PPaehuckfdySi/i2ClA6tMWLM+y5V/5AdFrzawx7iHFED8AFnJjsWgoa
	YUj2F0yzpWclclL2N5cAR4of8wjhQpL+Y4of1Nt4pAfiEPJ5jR0+i+P+/dVihXOrLZjwuzTp+UT
	Wl6Q==
X-Gm-Gg: AZFdTZe1TiMJwQbFsGlXRKS6nfHKaVBDHhDaX9IvL9HIXB7QF0CxXWG9egWl/ngSUHN
	1Z8MV5Ix+mBp6yKaJacmhbf34vb9pJ1Z7zvjFS2S3kSypv4GHDFmgFihOaEDVKgNBllYi3zKy7E
	iIg/mcT5NfInifJOsA/31YL6bim4MxFSLTifi/UpyXBE0sdJE7wMqYhd8++mdoULYtHtxknWax2
	Eo0vpENB8PnDsw3WHfBrxIJoolitt/j3rUycDv6y6PqmsiCOM387+wQGLlZAdDVEduINY66Utr4
	0X36pKnWNVjyHhLpd3fQLWuazNGBP1pkQPdPFaV39kNfUx1X2/PjSszb360wf1uN4Ghqxw4FgCZ
	rRbI3GgDCehkdP0Rvj2vlLrPwXyWvqDnk01sTWh6nlFE95AxqgwHRLeQF5zv/duoR
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr2007145185a.73.1795462723821;
        Mon, 23 Nov 2026 11:38:43 -0800 (PST)
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr2007138285a.73.1795462723165;
        Mon, 23 Nov 2026 11:38:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm24078327f8f.52.2026.11.23.11.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:38:42 -0800 (PST)
Date: Mon, 23 Nov 2026 21:38:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <xadzsuftq6la6asx4r3cdknho3hbjljpkrqr4iblwowbz4fhrc@yt2dbeff5d63>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/2rGHfmbOO2X
 So5MIYD2L4kKciBpb8qL3xw7ercqmzbK7WmUTFxzGA0hoCKArULito1e0B2juS4lNT1RqyvRYLk
 FkuUVVgcPjJBm1f5BmveGxfFEMP1Cwih1GvPWCtT/G7lSc95uGetnDF2CJfvETAqzY0qa5meEWh
 HH4w1PNvZKRM9uYd6RvuJugJ4e+SnrN2TKup+u+uP2AhlgxciLTucjTrVsYkEm4NH9SZxRaekmg
 Ye5xEr3gEgIAgfO5EsN41sqyqYdyFB1TlsSIUDKW17vUpqVk1/5a/RTLQGNu03R43VA3PvQJhnG
 emBJ5BvULDsFFq2OE8m9ZHJYLsC7eVhXEAL0X1ITl0faiGnbyJw+6//iWX4+XpIwcdmdo8LA69m
 Uc6UkYQ7lAxOQFeCzvC+Yc95S7Ddl5Ac6q+Hc6gZnIZHnLKH0DKkWrjfkm4glrHxS9Xb6Y+4RTb
 GuphGhUII39MzmrotjA==
X-Proofpoint-GUID: AZkSkNX7cZKWzvkFcCBtaeAMx6nbMSHG
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b049647 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=umFhNDnhut0qF75FkN0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: AZkSkNX7cZKWzvkFcCBtaeAMx6nbMSHG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXzhJ6ZrfyDrld
 fB6Ljv6lFK3v40pxabnikUNRf+c3G9zMZoC43oMs8fQezj/A+wRSiLQQVqOGNS1qgBpR8j1/mU6
 tArtdCn4+pnQz9xWw7DoQpmojpOnoC4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_113848_553746_9AF63BAE 
X-CRM114-Status: GOOD (  12.01  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-20 19:11:35, Bibek Kumar Patro wrote:
> On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

