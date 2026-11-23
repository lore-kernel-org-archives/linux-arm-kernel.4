Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA57C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d6fQhlH4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=La0mMGbc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQre1/8c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=63/5soKOfoo4s2XYSXdk8j2rZkMsI8L/GaEuPyPYmys=; b=d6fQhlH4UP91k1fMAeyVplLet8
	PvyHM+C2guqyfSbBOOPpmYf84bIl+o4t9U0507L9PxCqiSVvIYpnLCHhdgr0Zgor0HrlmiMuQQ+oh
	6nO7/CFsMX4NCVl9y2ziR16SxM2nQm+oGnQG0yAqbP12Bci1CoGptGLReUC6WuDXXJ5vvTGOR0+ay
	WAxRnYFhnCRsgGC5SLAuqZGPPSyT0U7Uzyrg/mxQnkc7ZbS6wlRmR5zvTpZQrFxa4OGhYT/qZc6Ig
	sO9d9eL0p8GEUeuisSu3KB6fonu3HGpnchF1cpOllgqzLixOUZR/IUqLSJJm/VmGphd6UvaUtOq0E
	5JT201pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZuz-00000004irT-2wGb;
	Mon, 23 Nov 2026 19:41:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZu9-00000004iUR-1QUG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:41:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNKgZ3440246
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=63/5soKOfoo4s2XYSXdk8j2r
	ZkMsI8L/GaEuPyPYmys=; b=La0mMGbcDjyRM6KXJZm4Sev/JOtC6OOzb7kNxA7J
	iBvGE0jgSSgg+XzZ/vmXHAQjgvscl5Pn0/AQGorYnlhsTzCpuCbcS66h3yorSYZn
	cU0MIRcbKG6hQHlxVx0EzJryehosH7vGqRnOYCr9jaqxIOwA0ElkT2MFCDD9ycIq
	ccEoQ3tiyhG414G+PFhkZUdDSpWfOzsamRqBYaFGNtzV80IhPcKzch1UD17wiqCr
	wLSemY3/km6mytfTXmxEJ0bvMM71W4FmEPJblxG6RcdbmqcrU9Zkj1RikSUoQa1q
	IzNfVIEfbB9yAOfaxA2ydIaCIg0ePI+eGq/20b7NB0F0Aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr8293-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:40:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so572972685a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462844; x=1796067644; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63/5soKOfoo4s2XYSXdk8j2rZkMsI8L/GaEuPyPYmys=;
        b=ZQre1/8cnBVHUajvKFWx594N+oSvn3yU7m+Mbg6pT4HQfukCGfpLOTIqrbm7SDmfYG
         HKtWgX8vve93dlW+CwgpDy5KDzwtjvnPuwJqXYxrRFiO7Usisvjz0Ay6JA20RHxAI6Aa
         WGzBWgOMlH3ULT0gdjEzoSv6P2BOBftLnBLYO3mDv/WM0UjBZ37XyBnBhLVNxICBd+sb
         OfIVjaReBRIbXejxoBVd8pWkQg+dw1T/06CdXttcw65XD3BQWYkHYMqjAwJuBX/fAuQf
         hjVY17JgWXEF8lwUSHEPb14FX9VABvDv4FQJmwV+tMHiTd8AKvI5qQUObJp4Cq/7mcLK
         NQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462844; x=1796067644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63/5soKOfoo4s2XYSXdk8j2rZkMsI8L/GaEuPyPYmys=;
        b=i57R6tt8jHykJWNRo3KFRHN52cGPrdanD1Y9HuqMCD9WemDCruBSZW+upqm5Qe+vm+
         2ZbCAcF2pYMQnf3rRnhc3tHPPRsSng+NP96fq//dKRDnJMSh4oxiIeqYNrvytB3ISRgD
         96DyiKtr4s5/rLJUm6U0DtoS97U+ZnYGMf+2BWTao0QTyBnWE+Q7+hfsBlocr+60kmpr
         uMGSuqxeQvDDiwE1CbWnxvYW5zgmjvzHvH5UJUbPW7ZQu8BBMFOqGOpli92OQSN5i3il
         6sK5NkdIkUCz9sT3o2dvOj1rQOzWSUClZVauz+hJDACVkGPBJNoHzowrnuXOGjSDei+w
         +mhQ==
X-Forwarded-Encrypted: i=1; AL+hErFrQUrZ9T8GIapXfQ7MkjsVmMeWbv4tIeTBKMQrPhvBsJaPjjqE7j0/eTcTgDAL1ljUau8nN/GAZnTgeiGlmXms@lists.infradead.org
X-Gm-Message-State: APuU4Z+yq59nFwSuzdHRs51jIy1TGYb7QzQO+BuFjxnXdhEH8pNcfOtM
	AR5hL7r9iYzLd4eyaw6gOt7fDVnYQb7Cu+ZFHuPtJX/j5nvQMw2F6L/Ej5KvnG3uZvoBj0bpLii
	rbpLxmDPfPpDtfpcJ05rv1PNbcZsiPBO6vMo5QOFzBVEP3IYA0BaI5mwtQoWhXMNohsB7PNJrzK
	YdZA==
X-Gm-Gg: AZFdTZdaxwk6X9MvbcoQHPAlMoqb4mD12IYLnmk/Osx7Vrfz/ng/RiQrrtSTB/Eeijt
	XIOz1MZ+jhK+Zc48tXZpyahTnOeuzXw0G5tKjedXe8tjjMNZzNxxaHMsqXzqAqUSUZWPapL24Oe
	sHh/fw6Q3nM/2MoKnHQQzjUYYbo1DXRRky+rvDIo2MaT6EK9Fa6B4H1rzG/YpTGVQEFazRSHdkz
	j1Ppme1lhFz5PhUwl4oq7OxJ27JOTiiIISAnJtaiSaov5VDfw75eDXsqHNoKvWFCWXUlVpE9CGO
	WuzR5Kzq1Xbn7j3kLWcz/muCAYiTEFxxvAgHPDe50AX8RdoVyOgW7OTGuepw/yy0F1kY1NQAlYT
	IM+tTzijKMVyfRdWOKylK0goWx+/AQlXWlC0hTGy2rQYCToF4ykiSEzm0K35bviV5
X-Received: by 2002:a05:620a:318e:b0:93f:59b8:e28a with SMTP id af79cd13be357-949ba9b8046mr2258825785a.28.1795462843733;
        Mon, 23 Nov 2026 11:40:43 -0800 (PST)
X-Received: by 2002:a05:620a:318e:b0:93f:59b8:e28a with SMTP id af79cd13be357-949ba9b8046mr2258819585a.28.1795462843184;
        Mon, 23 Nov 2026 11:40:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm25447645f8f.1.2026.11.23.11.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:42 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:41 +0200
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
Subject: Re: [PATCH RESEND v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <izxzijllmqsw7hswyhtyir35dltvgue4ahwn56izi4ez2p2nv2@qyz5ugzrhg2y>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-10-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-10-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX1gBU5UE1PyDw
 VFM7/2NccGQ5pTTpmEBBY1iogZKA4VW+wnYZq+9KslqBfVuvF2+cKb8jQKIUn3t8BxSrTqZddK8
 my4Lx8f+DSPKfekflyvM5LVsf6NupfA=
X-Proofpoint-ORIG-GUID: BcVH06ytXgbaPparkY7ffMK-jJ2k4q5G
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b0496bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4CcV5GfxdE/G
 eKPDDumniq12vS3mIXT2+KZv0foKmTiDmf5fWdkQsGuBy/DeOFMeqTg7U5h4thnMKdofdNiW+U7
 sJMhvWAD5AfKnhbhj//se1GZ4OyJwBbW3W+C6y6mu/zt44SFjvNlhux2Mb/QdK4maXKQ+NJVHw2
 2tA+X4HtkBwN5/x8QEjZY9vHGEmAsQBZVaYBXcv3Y8vRNAABdTPlvJtUKHTfvIaiANdDs1nVMh6
 vqMGSBLlV/dfLS/V1ZFoP22jlDsmIj2yMA8JRovJsu6mKZOYLz/lsRVmNVkQvSehWz1Abtys99u
 xC1/X/DUQ7WesiDno5y8cwt9N2srmMw9hWmNVH5f5Bqx7r61MbGUDF3EU2wlPgfmPoPmGLqzJgo
 KwRZs18LABBwG5PFWozl9JjAcKol8q+ubOz/V/ai22QfaPFE6y8BvxRPt8VNTHIsTWDoOa9ve5Z
 lkksBkfiNiJjP7GcZ+w==
X-Proofpoint-GUID: BcVH06ytXgbaPparkY7ffMK-jJ2k4q5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114048_165377_472A4F20 
X-CRM114-Status: GOOD (  12.18  )
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

On 26-11-20 19:11:41, Bibek Kumar Patro wrote:
> On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

