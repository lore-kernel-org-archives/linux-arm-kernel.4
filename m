Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED40606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TOTj3Za+;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ln3J9Mbz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BCtwnAAx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=; b=TOTj3Za+uRs0blZsGRWUT+chtC
	rfJHVRjBbqNC53msW7X/2VEsDH4ubdFVP6BOx/TXeZbSEsO+xW6/+8cq0f/pQQhpZmyL/BnXkKTa9
	jhLMqZhvwFtJKZLsAGk2SPMVAZeK5M2VVlbbqHC+VFCsDdkxoz+3ZJ2yrlY3wlb70t0CpRE06cF8f
	5Jkn+itC5xiOsNFqVBjBTMSNipO80kLq4IEJ/oJodhOUO+X5ImRx2zesvx3WZ0E3PzojvH/4CHsxi
	5E25dDpT1mDAJqBQSdDWQ/oORqWOPlhxFlOVOtqYfOjguXJWFH6/YFWUXu48fUSCnNzt/N6MXgUS0
	qEbWYw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZyS-00000004je9-3n4J;
	Mon, 23 Nov 2026 19:45:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZvb-00000004jAL-0cf1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:42:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNDHg647005
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TiJHHZoWYTxxWc307M21mACD
	+manX7RHfmlFNEd6ixw=; b=ln3J9Mbz/Ri2MWC4Bqf9PAdfIdkWPONzyUcCiZt4
	FFQbUFaYfbFupBqSQIKQelR+CcKaFRG3ls9jggcGnPr9kLsDb61FoUsEJhChY/Lt
	8A8u/9DA8IM/QYMAu/12GJbsT2s6ojTMmD8HVcVJ1oG6tQioFqYqEO5K4I/cXo3b
	sQMtVbGe/Otl6Fh+4Bd+lS5BsFxnk2AOQzz2Y0KWGLbHOfeZQT4RyzK+mLd3qYRL
	soTv4XwtplyZKWaTyJD6PF/hkYRn9Jz/5m7PQ7sOKMyUEsvo+Drr++uofaBhid4r
	df8Ly4zgMFDsz0ibhPfx/ObtuJAraO7Vs+nJqS9HO+SoWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg29s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:42:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55cc3c32e15so40715181cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462933; x=1796067733; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
        b=BCtwnAAxuHbEpR/uOpOiOERlyYh0kEfnSb4a1KKRfnZJ6GD09NkArTYhNclW98PqQ4
         boCMsmUd+beiMVCPA27HN/ApzfkpUCBRJnd+//e6gFSKJpEZlu17/3wC4g0ipYCX2XeV
         j2U+RPzIDyx2wpXMyms8P/qBtjfz1vQD8kNYdd3LBV6oLXDdcC99YP1asNbX/aQhfoMa
         wpeAXuD7k+zYHtp5VeWFHfIxC3egLHcRMbU+7pcTDADJxlqJiVOnz3OmlvkSoTQdqa9h
         6JS01J1DNpqJ5y2diHtW1C6lA2eDTuGtU6q2Xa5yVGpjHjKE3bPqpmO4rae9My6sImQ9
         FBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462933; x=1796067733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
        b=Rl6WbzUF0msIhRvQZ0mFv/FDLX38/9m9zUitXZI+4yHLvhpQGyCO9xubJ0otUU7CDR
         R1Kjkhf1REquYFEI7kXuuV7nbhgh7Lkb97Ewmfjj6BPukyeZLeubymP6nnTdnqLeOlpf
         rm61LYFS6JsUAPN9zlzHyIQosFGzm4qnn0PoviCZEFUbW1P6Xlc+edAmDvKsPwQzb2Zx
         tNahPu/gDHAOujA+XP2zUDWZpK94J3+AsIX7aowBYaCSuMAyUeB7lAw9b4BzXYLnMIt7
         pdtOpeTECmN65dfuDIKRrA6hAYNYX1xa9xkk2d+UraO1+iVsmokjqHd13ZgKiPdDnmmq
         +0Cw==
X-Forwarded-Encrypted: i=1; AL+hErHaxSDCYn8/cGaVzCd7eWJPVAVUxo8GMtusvLBpwT0gnHAnI68CerUjDOBay6PckKyTioKw56c/8dYM0+Ncero/@lists.infradead.org
X-Gm-Message-State: APuU4Z+kxmcm6/570tFcbVgN6zjfh5blcX74XlN3NRa9J6jgEGLLomAF
	Tr+siwir822nBelrRk8s/f5lX9DoPXbXTSMmgaWv/duVmsPu+uh8vBbBB05ls/kNDNGmLdb4nio
	nguzmihESo5Ul4unf3FQt2a/Ae7262sKsa54M9rkQHtP3UeNQSKNSbQEGWAZkgRwMzICvnS5IHO
	0Emw==
X-Gm-Gg: AZFdTZfivX7GtFldmQMZ7Pti5B2OB6Mi3UKWm7a5oVAgtWAyOKq58SG4cuBkW2FGjU6
	854YLLDa2pDgvkO1UVTZ6IhebVvVwqxLiqHCVAvbO8M5Xjz/hSq+SsoZEWZ6QobFAI73iRfPkUp
	pQD8xeuqm05nrDPGq8KPw0LLLTDQuTOiToV7oiJQD8eTbW3Tbm72EVbRQjgtki4qjUzVY9bGSAz
	koxLttvmygPul7bsvqFEN409xrUeOUXAikrlk/q8Qv5wVd/nYoqEFioCRzcxSZ86H1zYaQRUVv4
	a9Scy8bX7PIXeiagq0C5yn7cpzCctF+cxlqXc2zUBzSDXkNC9mG1Hm62p42v7NyzLBDhlmjVSnP
	mzFjanX7UN7f/ugJFFL6yirVaYnXV+ad7OJlXdSGHzhx4qlIhE4w4IqkWXgy91B4q
X-Received: by 2002:a05:622a:4d8a:b0:55d:2e72:1a03 with SMTP id d75a77b69052e-55d769b96c7mr239449581cf.27.1795462933035;
        Mon, 23 Nov 2026 11:42:13 -0800 (PST)
X-Received: by 2002:a05:622a:4d8a:b0:55d:2e72:1a03 with SMTP id d75a77b69052e-55d769b96c7mr239449201cf.27.1795462932439;
        Mon, 23 Nov 2026 11:42:12 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm25764593f8f.13.2026.11.23.11.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:42:11 -0800 (PST)
Date: Mon, 23 Nov 2026 21:42:10 +0200
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
Subject: Re: [PATCH RESEND v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
 interconnect for adreno SMMU
Message-ID: <6obybmhvyuxsp3jarjv4z57ojjfprwss3mer4vq5x56yhhl7kk@fk4ysedbakif>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b049715 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=P-COMtFXNwbjGjwEE7UA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX8qz4FrsnwwiO
 L/c8CqVFvr7KN0N75Fkk48vA93SMf1cfvsLciPFo1SD1+Pc0EIl3pkogcEArMCyyyLZXIbFZhOT
 5vMZek68Mq8JNYOTKaS4i2qTOxo3CpWhBMsEKVUygUWI6WLGe1yogMmvmSJTRG4BADx5c48fzrU
 enauNjCMTnGu+R4ZH/AjCi+p9gk6XqhkonXqjWK5GaFY+/VsawW1D7dZzzXVqnBEwX/01dA8l8B
 5UMZcEk69vu8ZNRHU5K88kljo1z9KUT9wxQ8qkwtEvPY5b4MzcTVsYKESoTS/VabmnnIfTEqoLX
 nRkyMap+o3gGObBXuY1RvUelsn8x0GU9Ze0ujbWJyY0TgEqAStMebOLxIGQW06n4VEEfYSd4X54
 /8XjTOu2ecIxK0pCFMmCdW1k1bTu1r0BJgSuZLzatLL+kbJlZnQbQpUlob9RF4GlMgFW1zvQ7va
 Lb3LM9W37TZuw1PBFig==
X-Proofpoint-GUID: b9LCBENYh5EEfvyRgHGogESfC2OVbwrg
X-Proofpoint-ORIG-GUID: b9LCBENYh5EEfvyRgHGogESfC2OVbwrg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX6f+twlYRiyG2
 RB1OC0uo7/Bz0Omn9FkCFLWZyZAqxTecfio9mjw6ziJBQGaZ3xULXGLUk6Zna0BOw70rELlD69B
 VUFhnMV4QX25httecMgNYx6E5zLLA00=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114217_624503_3117F924 
X-CRM114-Status: GOOD (  12.11  )
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

On 26-11-20 19:11:48, Bibek Kumar Patro wrote:
> On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
> interconnect bandwidth vote, the HSC_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

