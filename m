Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2283D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i4zcc0I9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWmHI/tX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WvyRvGGZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=; b=i4zcc0I97vtzL9BjcVjrFtExCE
	+Gu8NfOS0Wq9ewZUFJNPmbVs4Wa6tcaHPa9C7i34JgZ3p3FSHQQWk4QhJOGV+mEMCPgPppW+yozZq
	YzgFTbICJeIIWk7599xD7SOUkDFIk8bMm0YM86fAIr8wxoN8iDnYtUGnO+4tr/DQyda4bSoJLvxHP
	Xuk2UZ1YGxoy8It5icBEbewvS0vagGZCahTFqYikujmuuDQetShS95SuhQOg89dAHi2Gj1KeBxm39
	NFnI9Sf9Z/rNCO6Ds9AmF98u8k+XZwmYC9iSdplPfqAxkL7cFC2C81s2seestkDpXNeni0scVk7k+
	oEGZmoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZyS-00000004je1-2xNw;
	Mon, 23 Nov 2026 19:45:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZux-00000004iqP-320U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:42:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGr3F2769190
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iWoAxW0ABYsS0zE9hrZD0wqa
	trqG4QOz/0q/ZQLBBik=; b=jWmHI/tXXYpGKgSop4Rgj1A2WikJEh7R2Zxyde6T
	0t9hhhftHUgi+qC6ulIhceR7XS6XkcMFifkOgZCVCu4jylzs74pybTY6K911PAXm
	k2DqlshdqwQZ8xoA3Wsra6zHhFZ6HExXgaCIKf7k84P7K0MWtU6R+NaTllVBPIhe
	aaDqmnwc1NV7AE5jzRv8/JKKRi3T61wBO9/pFDpJsmPZzPFN6EYJKqFnpSHaVF6/
	AU5FigJDqdkjY6NR6P+5NP9q6VjJHXSRiFcEvH7UEcyM54/sOkoiE5vdxO8amup/
	1H9Y8ANMNaZVklcQ4Ik6ReDEaSYt8Xhr8dsLsOYKsHdPbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb47w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:41:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so738888585a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462894; x=1796067694; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
        b=WvyRvGGZ+hoCoxO5WlOGTilTAILO5XBMi7TYqXbgshvpERrjmv7VDe4VGr/b1O6/QT
         1ZfsyTJQXg0S2bx2zAIKGV3KscaxrsChPRpMZI5+/FBOgnoXpCGlExFqxYEuOeXBioAV
         gBeNk8B2RZw/59iKOguaCXJL6gD13ty0M1LGT8Hj1dQNOfckuf4GbFkWMe2brUJU19fY
         To4T27N+uv13CjeQX5JgCE+i8Q/FPwQbOYJlZgSh0toFvhGVUswQxckxATpDBJePdH3f
         dh1xXO2hxL0Ah+SEw+9aImsCXUGBdnQBauIK/NTjLNoMmfvQaN8vxHzUqXQ34JwznPh2
         cqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462894; x=1796067694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
        b=jbaDH0r8LjUjiHM96zZelMb17SXYERNP77U66atu+46VvFCbVbwKl+bwSNWlnsXDJL
         4VM0P0DsPgbC7cinEwSDrqtunalrJTJtpZXL5FccW4x3r+RxY8lwKjNyybM7KZVjarnD
         yawUmBFtwEXEC795eWdVonl0NHfIPAbPPnGsqu2V5fhdUriZJ/FN+B3k0osBvM45zdZU
         1YxYZ0jFF1tBUnGXawKxZDcZGd6rDkSGOoPv/umjZ3eCDy3Cq3tfVhvPV3nrY248CpCX
         0r6FLtUGY+9/1GoVqzoWBsdbA48rW6vQPMhRTJ02/H00dKqpBI3HVLkYfDt9ec6mCS/W
         CqlQ==
X-Forwarded-Encrypted: i=1; AL+hErGkZmPIevbajLhKgsHN2Ca4zgMAcF2suB8qPuINMr0sdSpn4gOXsnRlp91gE39SPWYyrQ4cUVndG15lwSj1/cWe@lists.infradead.org
X-Gm-Message-State: APuU4Z9rbSb/5KVZ2YVMBGlu23PakWygvKxsoqihDB0Ad9J2b+Epl3KR
	/qoGPrmyG69vR4C0/qnnKsIkhXExcc8kFindmOp0LWDqDTmcHDMiKz6DNrEuMJ6IAqvP3plVA4M
	iELRZp4g14XVLamolgTeg7ctSdZZYMkatlJgeOUFsxrRoIeRXP/tnR201DH4NTvS6SX8LiLhHDu
	hIMQ==
X-Gm-Gg: AZFdTZdj9RctJQnpcxdrQ3dDwAQ9C9bQTpWf+WUhSHb6EHGhYed0n2d19+wa5z9KkQE
	pVJP4fBXd91IP8GBdcVsjSsUYPWkH9RLNcc6MHr1gPJq2223MjRIAg8VugygnfY33Y6ZqbG/i1F
	C4DmxEIvm5bYseIsuj3l8Ii7r+HGcilWTcRGLSqGG0297ulf+ZNn+cDiC6M+FY7epqfN88X42j5
	LHnFpDo9+xuLXq0YdMnZcJAjrkYalx0US6grAOTL+Ay1Ko6IYkVUxp9DA4zj7WI2UbCbE9kVQ/I
	WHlDdBGX5CJdQaCq2+yUkbL2jmokxnoTnIuJKCM2Yyoji3AaA2y9RsJuOUHw9lATZn8logd2ldl
	FSHBrPF9G05NXOdZov6LTCIniWEUZohqSxS4zSiWLg3QOR3mlhqeDrmy+Cd0rd3k+
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr2093265585a.49.1795462894015;
        Mon, 23 Nov 2026 11:41:34 -0800 (PST)
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr2093260485a.49.1795462893448;
        Mon, 23 Nov 2026 11:41:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm22227959f8f.25.2026.11.23.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:32 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:30 +0200
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
Subject: Re: [PATCH RESEND v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <tll35ljrujo7sgz6fesshor7idu7ujoyhh76crbe6xajc2sar3@6uvambereae7>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4MH3Runv8+xZ
 O1tAoGVfEYg7RG9TJkmwGhkK+9Kbbvw8G1VQtm3SXTq5z2u1bQ3ZPM+wZOMWz6gBzk2tFiuedYM
 /2YFMvDiPMmcoWJltc/YpD9aTISqqz/piCLqpggGsA921a5pzK2NzzhgCjqkKreZ+SPv77yLqOy
 wpasRklDKYZjo/TmXJtn8tBcbXtpbcTUmuTRezbfmOFCcyM89h5n9ZXLbhReIiqdpNolCJdu8b4
 ddH/djUyMARnHsdx3g0W41KGqxyOOcjcMqWxrtWuksmfp2rEXH9isOSH6b62CuTZVl1Sba1ZGO7
 KJTThVE8XD6FQ0BNWf2zTJ8IwjjpgFhD2uWwUpMeL2SzED0HaAoIDlLxKMuH8b70kZwSPsNEfZu
 Taz0ckx4LyR+O1z9A5Sl+mJUbSE12ecvroHTNtwkbQAGb99+bVpzXP7vElCWQ+TiN4pbgjiQa9V
 D/0SY3i75EcamK9oCVA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0496ef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mDVvi5Pd1DWatKlo6wUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: E4ur3EESYxkuMpoBBr8a2D_NKT0ncr3q
X-Proofpoint-ORIG-GUID: E4ur3EESYxkuMpoBBr8a2D_NKT0ncr3q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/ze9ARR8e4EW
 ZVdIkfE2Z7y9F3XHRR7PJLivqf07Fqc3ZBvGC0chAmBgOhyY24Sr2I0Y3xY8jIRMKpg7sX3Zbeg
 LV7Hp6jhdeRuKtIeZZJ80QW53Ras25k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114136_841573_4FC8778F 
X-CRM114-Status: GOOD (  12.31  )
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

On 26-11-20 19:11:45, Bibek Kumar Patro wrote:
> On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

