Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A477E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o2cKO5pe;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kX/EhceN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea50wgW3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=; b=o2cKO5peFdEpfpYImsfU3JF4eM
	gXpL/Syq10HRwUmMkOjfUXqDN922b6D8t0HhFwPn5CP9a4GF7R12YOEc7+ipY+eX6R4bDbYf4MSEN
	h4pM7ibf6Ub3Rc17wkW2luUtOf0XY4knsNcJ4zxFEwLzbWIV/9U3nlksUeo3RjFuw8rolff6gqiWg
	0w3nf5KtmJnTSVZVh/RdjCliuMmpJVsd8O+NQwINzw0iDq6CLzgUrn+b5rTNAx1GbWYy90ORGk/2+
	lqbXb+HkiDkrIYLdgMT14D6JtlAlvznnHHRFapAozjlhOkbUzcfEpDPfUFA/pTyLI9G88QRhhI5hJ
	0lpUUvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZuz-00000004irt-48oJ;
	Mon, 23 Nov 2026 19:41:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZuY-00000004icX-1tTs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:41:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNJrJ3440235
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=okCL8kgOe4YWBJzwczqiUxr3
	lV/zkclx0rToDi20iXA=; b=kX/EhceN6e5M1VQxr5l21L+n06WZzx/2LLMIL5Ld
	XtIA/5riM2Jl8wuizaO0P8XhHrgtUOsA8yaZ3t6/a54JhVHAA/OLh8WiCHIXESWa
	hIGoueXqk0vHyoxCMbcbsgsdWZKyNmjQsBeuz5yVALNFUJKPfWT4rwUWdhZ/CGT2
	dQeCaqxXwj6o7inhvLyl1E+qhL8QzNK2yqtMPBT6744PH3eQy2ERUNGI0zPd/Sei
	F7C5J11ioBiCjGE80iTA5BWhqBXhMooxqJbOYhhL+yVn06Ak4Q/pYF49bARcWBlx
	6Thf8jHIuTWjRsi9e5Nvzsw+p/wSSaEBlFmBSXoac0ChLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr82c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:41:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so738770485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462869; x=1796067669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
        b=Ea50wgW3Iy/Y8pM9NCCnwOUlLYDYKB7TGzWwEn5gJSU3S8SX+kcKW7T5pFWuIzP4VR
         2B2PevUi/minXR24Eped4aD3SH/nlHeuDf3miEBj5dfEtemqpT/G8Im15SIQwKLgkxZZ
         piNim4vDHjGa3ilEvLH7HzXBT7+naoaHoavQ+KFn0L1/hIZjym1niaGraYUhEM+GVHN9
         UUlrIGkHWEWQnfG79SGSWCZ6z3+VMvCJW5fhS+uu4Pvj7Aco2N/EUlApBIIT+B/GEucw
         IlTfquEQVIA8ncigZDYLOPlc3w8ItPOKt3+OFiso1I3GMrwa0j83b0E3miFO+slID3/c
         72sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462869; x=1796067669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
        b=eL4pRU7bd9ZIlxqMzFM3/XNgyz7aR8y/ZVmFInUgrts3QwDwVppABfGW6AVR1LOdRg
         tmMV8ricnqR1r5yW1xVzaPAixJxegO4CsxXRm3rG8uy3UUP6OcFjFV21mEaSo2LpW6AN
         1sgPyD1+hk6fq/7B7aLyAmksLuwhny4gl+lvq8pnenbvG2NNQC9kmNmkFHH66q1VsT7a
         0MZ5inpMsWX+UZZ4lssdyPZyYrQ9ACaHFfOVi7jABIadOlYMj+EZ7crOwc7wtGlPBRr4
         w6ru2u577buc2w3SvbIRhiCaMhjmflWPP7+cL5nJhcSYZGwvIiBVztt2lEaaa9Z4/vFi
         rUdw==
X-Forwarded-Encrypted: i=1; AL+hErHYiG3OX/DcsDClDoJy0s0klmvM3VI4N59wb/1gFU693NwRQJ7vgvE1RsbM55Dw7ZHdzVCE2HeLvhSajHjQr7V+@lists.infradead.org
X-Gm-Message-State: APuU4Z86CswhypVwEymDzUPwSwyJSsTiZBDBQTXGcLlmHoy5BaJzqwYl
	oS65am1uIJR9NS7GCWI4XFtDpw91kugrP/nCTIUbZH9AVeyrjqozvbTwzU1/0wt/ZCn/W039WtK
	Tc/Wb+YZOglT+fHWoteR1FTqMF61vp/lVWqyIvEKNOUye0fC3te1Y33v9TQnW6Wtb3725a0VBJ8
	/DmQ==
X-Gm-Gg: AZFdTZfbyi8HNHkW6nlaRw336BMAV/4K4wHyHonBN96WkzpAyq0Wpbj3hUFfbZ5IFvs
	6ouJ5mcW67EXKCU0veyZ/vEeUVLgPOGMKwZ9qHIsVca9YNZSNYi2MToTMy2201w1T6oSdE5iDq7
	4xANvSkod0N6qdpE8ffLdM4oZfVOa/firfu3FgV26fHiROtDpfacBeHhXxCiKg7M2cR22u8IiWn
	8DsQ83VymijmUqfbaxUfXhfsz4Zpkgk4hyRLL+7JW0NOm3ajQuOKkKdPjGJTV7c0n27a5LUNCMZ
	QdC6VWAM6c1jU1kXCKY1FS011NlSDc00sCqNayMMg1xMXXMyJ/tiOLutOtnG0eyeB0DkY8lMUVM
	/DwB/t3wtsFe2TDn9rmDJZ2eQgTcCb+ncr7DcNFUZf4MFrx89UTilcT3hN/qrc7Zc
X-Received: by 2002:a05:620a:8812:b0:949:78c0:e186 with SMTP id af79cd13be357-949ba95de77mr2032516385a.25.1795462868656;
        Mon, 23 Nov 2026 11:41:08 -0800 (PST)
X-Received: by 2002:a05:620a:8812:b0:949:78c0:e186 with SMTP id af79cd13be357-949ba95de77mr2032508985a.25.1795462867959;
        Mon, 23 Nov 2026 11:41:07 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm490807405e9.0.2026.11.23.11.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:07 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:05 +0200
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
Subject: Re: [PATCH RESEND v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <lljflqhizl3wlw5pusaslpxwmfe4taxadw2prfogsxr77voe4v@ggolvdeja6op>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwiDsPZze565T
 T9ArEkPs6duq7VYTZGGQKurkdsCD3PT75ArJzF1nGwl3+wfkRjjmOBWGDVK4i0vQt638SYcGpBQ
 mVOBHTHnxyIlTBw2TSnWt3rahySZALY=
X-Proofpoint-ORIG-GUID: l0SkW2IvNsj80GGJK9eKhcod1tVZI0o2
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b0496d6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+gSNdpHOY05j
 nwqcycum03YCr9vqnxvJfk0qSTM6MjP7zgbOSQqlhDmgwKnJ60fAsbSyll3aXYUxRjP5r/+sqpB
 //+MlR0Zha0rEKVMQ4BRFiRHzdceTcfqKQu9jcXpBJMms0ir1WIrUw8YQUmkd6JY612OHfchn3A
 evLyspsiwTGBsowyPqEUZOBaGk4FV2MRR7WPLmyBbfArOQl0mfCFR6eMd0ESBLemFePD9abfTox
 GNlh6S9tFrI0v+dYsaPDWUxj9qjr0VTXz+woB4Qldi1U1Lv7eknHQCzsUQP6rQ4/1VI6FowbIBS
 O+AKzLWwgXMzPyCQxBybQezirP2TeGfN9v5ix9C2NtrQEK+6DGiZQPa0svYrvZQMekEEojynMun
 sdzUlHK/w5kFsEg+ihR1YNHRHKLN9JFHDfzKtcb01ySb6FoWtYDHYtgllDhlXBC0wayS0wb/7DG
 KniO/CsNeQCOzSl657A==
X-Proofpoint-GUID: l0SkW2IvNsj80GGJK9eKhcod1tVZI0o2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114110_547410_405F831B 
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

On 26-11-20 19:11:43, Bibek Kumar Patro wrote:
> On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

