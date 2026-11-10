Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC52606B9D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jqp0DffB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjd+j2qw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NjAc1UB6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vdE+aUoRB/9Y/tI/sh5Vrl8DHxfhl/imM7gAR4Jqcas=; b=jqp0DffBBGaECRiu5S2VxN4ixV
	W9k9MO8eFVHUDFJ59vJYsiMdemHIQJMbRqRk47a8qdI6vHFXErYzXFutPr9NZrO9L+al6w23Y7q+G
	08bThM7dXj28TAxjSWi14u+rFwvkPXGqVWKhwb2p3xxQhLl7fkYVoU/W9hG6/kUftjV8iqJZ3RJ/r
	y2W37H6lPqOzFpqGOrH7r56jl0iv9sedfomsz1sXB1qw80Gg7T6ifxdw2yBSS7CyAHyYjtV+guS1p
	0jY/kg35+QtdOWQVKF6VFWqOsBlzbdrutDBzhOlcFz5MP+WzMh1ETzZu0jy80ic319BKnlRWAbZnY
	OaKxkc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOp-00000003KKS-0k6K;
	Tue, 10 Nov 2026 09:44:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOn-00000003KHz-1W9u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:44:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8W6e62833675
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 09:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vdE+aUoRB/9Y/tI/sh5Vrl8D
	Hxfhl/imM7gAR4Jqcas=; b=pjd+j2qwJdJcrbj9o5ABpubS50+2iHpAbx3QsZq8
	1d2q2RlRBJEalsu7/HxcengRpag67otltjJSK22LY8SMKYNSUjyauL2DwFqfQ/VR
	JHUD1XggUxctF9Ue66MR5KmKJZYek+E0FT8E2mzeo6hymyiVb2vgWrkxfVN9dwOD
	kfSoj68eSxlq4q03h8UC435RyP5nL9F3Z5mZ2f+KBIszvhuqd+rF+Ngn7ifcZwie
	b5HiGZIsiHW/K055LFDaYdYJx3D7MgG2T39wyMvnhas2Y/hIZi3HXEdbwG8t26Xh
	VNqKEGK2deI+3jDHFAFXGVGYdja/mEvAbbSmH++F2jnwPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufr989-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 09:44:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so363215585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303855; x=1794908655; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vdE+aUoRB/9Y/tI/sh5Vrl8DHxfhl/imM7gAR4Jqcas=;
        b=NjAc1UB6gZDrKDZciSOd+ogRAlY3NMJQH7GnTnoREXWZb6lr2ZBNZ1QmtUGHjm837J
         IYma4KK80tj12lkhthl0QJNP9CE9I+sZALrbZmg8/A03Uz9awFZAG14gRyztabAZSJd0
         fK4+Ek7Tl8w7dF0VT7tPYXppiRyekYT7zchh+uozxV8e/ARKkENUOsRE3s8kyPLdaS7X
         8lT85/Imy3C5FMOVVQuxD1+BpI/19EdEisp+IbS9NnQBg47sy5x9JBaO7X/dMCVdKIgb
         3a5zMDKTCsC8trSw2ykHGMtFrSrINcPIroZGAqu4sFwoIsL1/bw8giVFYLj3pywCCuhE
         Qz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303855; x=1794908655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdE+aUoRB/9Y/tI/sh5Vrl8DHxfhl/imM7gAR4Jqcas=;
        b=rsyaUgjg+C9o2NjaTLv4MucxfmPysfh/0XzVQW/GngAQ94HjzvJh2EcdhxDEic1EOC
         SFUfY0uWeS7wIWSDhtW78aFnFwJJk6pYaC26GLlAkoAZHjExX3n94oDPfMeblcs1APtB
         UpX/1TADaKxa2MOcUNfx001EV2gszh9LYUvSnsXOFLln5OXVfDC6bqT6oZv1rtptsT9r
         taUjQ2wymfswsjRQRrte7H+yFDpVwoLnzwRq2LO2iD18YlU9ZxYIOpECAyc6UOQhbYVR
         jIR8ruayYvYlc/YB8nJzElWrskO/9Awy7bB5jWB4PoLZlUczVHb4KveP3UYscPoRhEL4
         66og==
X-Forwarded-Encrypted: i=1; AL+hErGvLlOfqlxVljYS16LAd7adZUP5smBS9iMee00Bkn8KHneuv7pa3aHc3s3hmpBLq3O6k7+9GFieVTOmOzjSvUuW@lists.infradead.org
X-Gm-Message-State: APuU4Z/jT1WiOz7TIhVuxrkMuOiqeXpqvtNUmhnK21EGmKfJoCxus2Yn
	4H2iI+LEI6W2DTwPxPgXra/P2dWq8S3/FN/IXom3JabQbthKFBLepNQBxkBrusTCpVMQ6TlnxMd
	nu1yMS2d7tWDrJIZLfH3AOYy4sbiQD4zUSa6veFuM/Wfh6Z01Wawa5ZPlX2DHOeailS0psrYX2t
	rN7w==
X-Gm-Gg: AYBFou0ybMu1dppZHMkY6KwHw+4dNi8FLyuSP3fkJZByBdx0mJjfmu0hfU0hDFhGvUv
	3MR6FPgEOfJNUOgJFT81XvRp3gdP/4mDdHTw6875DvDh241t+bjTuDPnfGF6cW3PN2WdTGNsC0/
	F9r87yeWrJJjEgkKQ1FszSc99NTKZSGrXf9EdbmKeVnJSE57M6fIowEUCV9hbxtL7vbnFZxcn13
	AvWFy4EnlWn8n5lOOYaeUtoIPBVLsGtUTC1ssL81/vIJpmdVmme2Fd4jBCOfDN9tBvQ3dve+Jo5
	i+6wVVflZuXW4484mukdmrdE9OyWXpcnkLcPlNeC/Z19ylOFIBDL/nLFFt82GxR07auqwlSuvt9
	N4FXC/tePvi4fdul3qyW+tUgxh5LxmTSs4XDmjpaNqRvSReAYnKJlh5bQ95FYWqMa
X-Received: by 2002:a05:620a:31a9:b0:944:6ad:1b7f with SMTP id af79cd13be357-9479f22a764mr306205585a.32.1794303854750;
        Tue, 10 Nov 2026 01:44:14 -0800 (PST)
X-Received: by 2002:a05:620a:31a9:b0:944:6ad:1b7f with SMTP id af79cd13be357-9479f22a764mr306202385a.32.1794303854177;
        Tue, 10 Nov 2026 01:44:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm60996725e9.6.2026.11.10.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:44:13 -0800 (PST)
Date: Tue, 10 Nov 2026 11:44:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Message-ID: <3drlpt2ox56togk6tf3bkejsmznfujgutkpzd7t7zimhvgiu7v@g7gddlszxciy>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110-fix-trace-noc-probe-issue-v7-5-2f06905c77fe@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-5-2f06905c77fe@oss.qualcomm.com>
X-Proofpoint-GUID: xqgEKu6Iy9-go5bbFDWUH9o_rxk0ijye
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2e76f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=p7_fsQVHwOYSS4OMyj8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: xqgEKu6Iy9-go5bbFDWUH9o_rxk0ijye
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX7uS45/rSGUVt
 5LVt34p04N1KiLb3+EukwO7gKvh3ybzpFKDznF+a8fgmCSBk0C/pVb4falNZcZepk6YUbgi4ZOJ
 bUzdYH9tUXdW1iBJFNoLEJ9nzty2jII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX6da89gqV0TkO
 9tz9uT6ZxK5mRjnr8r82WmOYLvGZakbtdIQ5+m1aZ076DINTVqm6iorgWUoewDOogQ3RA1UUf8c
 PGyHvViGSB97KJPmoFDeEsbINnb+AtBUZdMv9GVzV+4vDPZBo6K7svO3Qp8W8+nw4CMHTJdLzop
 Wd7HyHQU7kD3lE43XQP3J46uhY9+O6eF3yfgJz9cEj1ngmJ+uDyCwQyoX56/w8TapLRGlOHzn2v
 QAeIVJluY/OwZVdU8mHQbepClxnGN2X4dVOdBJ84cBsk5cfkQZ9KcWMNWN+vZN4/XRTYRcb+9q3
 w4ZQ/KoHn9x0lmzUp4sPRaxF0YSPH07AO1kh/GymoGIPXHi/3dF+R0LuJchIPJRnfGuBcj8mBkH
 DoHMDvU01+6NjLPX0KbHL/xRvfxUNA+wWhQR3OeTY+Vl1hZUXbaDvardtSbp6bX0jnwoR9ssCEL
 +nXNc5XJsCN+FFDbSdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_014417_416912_90D36EFD 
X-CRM114-Status: GOOD (  16.40  )
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

On 26-11-10 09:21:18, Jie Gan wrote:
> The traceNoC node is the system-level Aggregator TNOC, so it must own a
> valid ATID that tags the whole aggregation path. It was marked compatible
> with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
> an ATID. As a result the aggregator had no trace ID and could not tag the
> merged trace.
> 
> An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
> the ATB sources within its subsystem (TPDMs and other ATB masters) and
> forwards the combined stream to the system-level Aggregator TNOC. It
> carries no ATID of its own, because the Aggregator TNOC downstream in the
> path already owns the ATID.
> 
> Switch the node to "qcom,coresight-tnoc" so it is described as the
> Aggregator TNOC it is and is assigned a system trace ID. Rename the node
> to "tn" and use the "apb_pclk" clock name as required by the Aggregator
> TNOC binding.
> 
> Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

