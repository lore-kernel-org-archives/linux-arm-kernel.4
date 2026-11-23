Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A3606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TGrGKEYI;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZaT6D2F6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MS8P3YT1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mMQUGbXJMaa86ZgCyPHuQDcNhrKapcPCs2WtP/7YI/A=; b=TGrGKEYI4DBz2dSqAsEwFwecZN
	WsibUQOPovyI3mdrMyhWIvzLI4YbdkcheMK1ygKoxXFDxYgRZPMql1JZcRWdau553FW3Uibvqy/Bm
	b8mCY6IuSZ/UdWfWZzFvWkoH5nWU0gjkOr9sczC9owDg0QqCE9Ujxuw2m0ZtWO4qR8cam9UYq/HUO
	KFsLPr8++Wm/e6gr7419FGE9hc756RAfomguxl0qry5IQPa7uxH9n40eANzZoD4NBox6pqHM1Y/KH
	1PTjdRTNEqezjeRIZSDLj7nzwwkNHI4i2evjrb1kKN6y0zDj3M2l0VA+jUgJYocsjiO85+xyP+Dlo
	tVqs37Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZtM-00000004hnv-3X7r;
	Mon, 23 Nov 2026 19:39:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZrm-00000004gWo-30fK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:38:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3jw1093800
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mMQUGbXJMaa86ZgCyPHuQDcN
	hrKapcPCs2WtP/7YI/A=; b=ZaT6D2F61c3tpeFzP1M0/Q0nDKwT+BVfrEyV3B5F
	1j0oxcpR889WG9WT0HCSPPyS2ur7dkrCRaVUW69pD9HmcMBGD7N6dJ6zErYcnVUJ
	t6RI/rXE0bJ9XX3fzGxAUypVTVjnVNVWHtlubj2KpWWdKC0EOGjvKEJtFvQ9YM8s
	6kLRQInrOO+of9zzfr6tsdJktDrmAQ+mAP8JhWPC/gsi/fAegyZ9degluqiU/J5m
	raupWZP6uPhkciD/8WF27njC4+VUfc81VImaGvkLi3ohj3tbVCk/lkne8AH1FQaB
	b0x2P/XA3VHj8hR/wyauyTPno4FwQLlg8XpPo1OFxImB5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t297-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:38:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so555989885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462697; x=1796067497; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mMQUGbXJMaa86ZgCyPHuQDcNhrKapcPCs2WtP/7YI/A=;
        b=MS8P3YT1I2NskAyK3oTXt3jev3PrVxXZ/1pfGOIG1bBo5CxwwE8HEmw3T66uUBjz40
         sCYw2/LqJrjgg2PDgkkh9TUQtyV7pmHjGlgHLUqCdf86tJ5kzK8EcFRACcatGlt0LV3q
         j8yHMHM5F3odLfAu0KfXqUqSSSWRocSBhjGf2/TjQl/qM0zBcLhhkEx+6njOMAFiRGG4
         P4pkTzGwJ+1Lh0GX33KCFa1R0RMyJdGG+GNRhqXgt9vQI7c0pHnrEawbpb9uyDRMRW+5
         AUBvAW7RJMOcerdNQJJ7B0PLK5vx/911lpCRayS4bke2IyqyQn5bKOfrxBMXXVlF/9SC
         Ecww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462697; x=1796067497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMQUGbXJMaa86ZgCyPHuQDcNhrKapcPCs2WtP/7YI/A=;
        b=oo0SrhtTppSmlIZstAF7pb+0AsBhSc5Sk+nQz2aYKfY7p2TfSiUxKsfZzYeBIDYPsq
         BWA8GgViHM2TRl1Uz2EljaT/lsjVaeRFgRNnkoeDFHLNuiBkUxFRVC2Lh4dEeO9ZCBwm
         eDU5USkcKjjeWpKmiSRQ/vZ6bkzIi4zYzmFUagII7L6EY+gEcYjHqnpdNd9f3IuNhoQW
         +7LxIZq/hP/H+KU5qd9wHdgEz7nlHSH0zaeHl7aqPZfjy089ldAI10mDhg+CiJ7p24/n
         wt05xyeBkJxcA/nB8IhJsRt6WDemdamBIjs3b92j4bwkrJysZc+uGcMvU6wyuoS7aCvb
         +Sbw==
X-Forwarded-Encrypted: i=1; AL+hErH15pDrtOFX1eaUNOCBFwUUiTLzHwkPiNQ9NbEaL9d116rOj4joz4TR8Ngsb6P2+8EmTiv5ymGiRXnnp3gBKFbi@lists.infradead.org
X-Gm-Message-State: APuU4Z9O95zUMCLg0X6k0/igKXDv2PKBqkSTPd1xQQBacM4G1yMycv87
	by7eb9xPtqutjXPU2S220m2PCsF6Cy//K3GF+/ZeljzdK3bBDkHVUqM1IgPb6jyUdwpxGV9OKJY
	7myI//kPFvm9GBGikylfc1ACIBvAbHnfhD/cvwWA07zJ7O9uWkXXO0EphM8YNd6tVvFORxRcKuw
	Kp6w==
X-Gm-Gg: AZFdTZdErJC6Y9PNPlw3E10vsNqwAIjEOZJ8N8DpuLOnojYQW43x6ITpYhMth5fVA+7
	XRwcPotf3verRkCAL5JTGVOGK6zUbKKi8iEWArUsFrVhvrD8kgzkXTI2lBMpI0eQWfhLhy8M77/
	dDfmQvva+bpTnJMnHpUrNgTpcwjv+Mj6GpxBXyASeP4EjktL7VG1wqKJ+3ot2q6echKs33ixSi2
	c7i1BBCb/eW5uwyaHDH9B/6sT2SL3e5pfktcu6+AWY/e1BDN2xdYyPK9sJ9Y8TtURhdN5DPbCdP
	J1lxaY8z4RKnXz2i7U8nKy/bwCWVZVBoX7VyRYd5DWlt8bZUa/XnbYhyW/3hTiaXpcRfS+WotIv
	3xBuJAehHAjLkwUXv5wJ3kgRLNEMok41CetilRUFOUd4a3kq/OdN3ijYG1T2wVS/2
X-Received: by 2002:a05:620a:700e:b0:949:b8b0:1b11 with SMTP id af79cd13be357-949bab1df30mr2390114485a.44.1795462696964;
        Mon, 23 Nov 2026 11:38:16 -0800 (PST)
X-Received: by 2002:a05:620a:700e:b0:949:b8b0:1b11 with SMTP id af79cd13be357-949bab1df30mr2390107885a.44.1795462696430;
        Mon, 23 Nov 2026 11:38:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm27067764f8f.24.2026.11.23.11.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:38:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:38:14 +0200
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
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH RESEND v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <ovctaahjwayrio7glzjdtdveo6si6ldiddunokpho6w5ipxrve@ef254zb3n6tx>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-3-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-3-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: MJUsWL24zQVL5mAWiTIAOkXoyLj529vI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX9NvJDMsWRkq/
 8o4en0AaqrvP0Vfizw7/MzjbdtFdgQ61MVhpiLUkNmlM+tVpqoOLDYx0p6DdzZucsc0LecueCZ8
 9f8OSPJm6AbN+IHTR1maexrNyDTcL7s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/dHYuyC6WC1R
 2VCn+5A0fxNbuCX2/R1NPq00yunjKmAEDGVQ/pLSNSgAIeDgJrJLpy/VogqWCVz+jplM/rptFLH
 2AnWqNf2HaEP9gDiYkiXohL/dCiGetRyc+Q9zJCBgh7QNZ7GtnsRAjoEwiu6HqB572fpskQjO+u
 oSWdb1uWk2I5bm3yKm3ON86ITCL898jKwU5qoXaPt5FWyrdldODhtv8AdCvx9dz54+W4BiZKJ4V
 NbL+w2fkcQKC9Z9E1ZMqLbi6NISnaA1jSKQq9vRra22vn3BM/Wxtld7Js+oN8BOLnQ/+xwB2NZM
 J6je5wpj1L5rpWfo0wVey2DG6G91OIi+pmYAYGzW2X5S9dIGyUxNDPijguj7QfSzo/KI4mg8uJ7
 t1aL6KpN5aJBMU1qphaEmPlGdXtHfLQ5LhCtnd5umxR6iqLVk37SGEPmbOUTv2oVVVydSfgj5A0
 z0U5tDLMmlFfvGIYakg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04962a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ukIheBjJDxOVZQT4PtwA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: MJUsWL24zQVL5mAWiTIAOkXoyLj529vI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_113821_204329_0935DF92 
X-CRM114-Status: GOOD (  11.32  )
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

On 26-11-20 19:11:34, Bibek Kumar Patro wrote:
> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

