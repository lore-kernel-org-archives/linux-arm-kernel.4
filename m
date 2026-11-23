Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rl3Yvgl7;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMCyqOPk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NSH/Arad
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=; b=rl3Yvgl7UdckktG0DWSYC0o/go
	RpsMMB22RfH8n8HtAhkNpI64mit2O24jgT9bKEVB68Xvg+ERmnq9RO3qhmYUSnqwzZ0gVnXmjFT8n
	ht25KXEJqAPLME0VBJPW8Q4nwW4dCWlQVvgYj6/YOehs22Mv1vJ4kasVcpZwbD3KQRMmc/YP494rB
	49NLnUt49+53Xhx1sL3eCMW/I3i8HNK4atu8994Tpo/5VDdPbIEnhYj1LrLCsBn4HYJja56CmoI40
	ATrbjScatgvOBwFWKr42cvd9A1zCs6oAV0FvuBUSzWNH9/jbZWP+uDXTPw2oNmseOse8tGbV+xh9I
	ezx63P6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZuM-00000004iZ1-3Scm;
	Mon, 23 Nov 2026 19:40:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZti-00000004iCq-3gwc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:40:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3jZ847532
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gQHF8sxJpg0r9mXjUhBjnOoW
	S+bWertP7VU7oU3l54M=; b=FMCyqOPkDlj6tsqZjM4E0RAqGGWIbRdO/5LunG3P
	9fW+J0svBtb6tGe0T4vZqDc8Pzf9UpWwPb7x7ZpthN2ksxxnHTdMJATjqCbf813P
	IftAagPQoY+mpj0VrfTDPMQnrfJk5H01S7I40JptHJjtiSBK/zmQC5Uy3/3Wjrgr
	mHAaAXspWIXHJ3EXQWB37e20TLmONF1kZweg9rhR1lrTE3xNK1RmNu5eAvHQX0Il
	h5tcCNfDlPLC0uXMq3pLE2ccqCiQ/LNGmcq02aB58MtfabrlKp791lgDI530WMlo
	zh2svND80S96HZZYj3i2iex+6M5ldQSD/XDbeO4hiZpV6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g74363x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:40:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso670407185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462817; x=1796067617; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
        b=NSH/AradrNvrYJ1SxkLdVGu6p5Sm+ZTq/h7Ds/uJJDP9jWTjm7cTiBz2hUQMlo3GFA
         IWskAXYpQTaFXjdrCLeIlah28keR7OTdanXETe3muwONNfSkuee8sSVQfT6FnudI/PJ/
         MLWy/NkFkws0SM2zqS7cbZ9RFu3D8SnZBCYkx7Zs16mtRaZOcJkTK6QpybLGbcspeHUe
         MfyD8JY/xUu5eP+Qo446OSzQa9HyuDqNR9ntQqWs+qJEXxGKyyfn04NGNoP1lh4D7cKb
         YzaXAzlwhG0fWs/od+NDyUUXdGPZaSjcFZDCiiAnsferdjYA5C1YcVmmPsflXKNLVOM+
         be2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462817; x=1796067617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
        b=PglUps8rFIol3qRbg/qDxOYQWGo7fkUcVFA5dEcHsgBHlu9vNkhzZ/rp8TgaUwZFvX
         ymn6bgRcIIr3WqyGhdl6QEiOng7zDtWrOsYuG8JcPsej9V4FukYpJm18ipZqeIAg/K/e
         o8x47XphS8mMW76PnXoWxxjfLLormXDV5jqLRYS68Py39yH/1atq+l5SgGPIMtxFXpg3
         KxrjBB4gTC7aPFj3yP1uifcHKOLsdvOiKI6rngmxeGEeGmwQBGB0wXZ+C3Y0Fd/SwYbw
         gd1RE4BxF8Hk3nEw3WHkwuXRMiuhi8HRxlhZXTyY70GXfyl45PzhmAcpAjSizOq0b7P2
         afcA==
X-Forwarded-Encrypted: i=1; AL+hErFSXUoKUo5ivpVHdru7GSCVkQ9vYbpjuJ0g8VEN8sYuuL1ruXU5S6t2MZAztAZpEpDPO+CVmmB7/RPF8ycHo4R4@lists.infradead.org
X-Gm-Message-State: APuU4Z9P0b/lML9viyXAynu6v1YrI5J1/XGbFR2+Go4nqFNS1fxEpXBg
	DCuoYTx+PCsWR2uP73YlOc6B8VM1vz+IYU501aBM5k3aWGWZGhThR1zrFqDXtCcks3NICL8wFHP
	gHQB7Gidkme4zo7vpsmlCCmIijaS1wMtverf+VTqwrV+MlKS660puDRvD4GYsWabVUlMQkvYQVe
	LDeA==
X-Gm-Gg: AZFdTZfwe6AruWzUVXwHJj+GiJ+tBp4W8m2vEUSyqKaXO+iinS1qWGpPM5paXrkUJr0
	p2ovUx8ItQkvouu/Oic709LfXavnRcEr6keCZEcycG5NjEWfkWwcsCYGCwl7WKwkcQstpH9TTbl
	Nv41t2s7reeDkV/rudtDawbwmoXWXDP+SiFcKRQKwL1SXShF8x5eSWIo0MYNKgrkLuWd0BHq+ZZ
	KZKOJrdAvFZyRIFM0roTvM+5Yu8se48mo5sfF06EDv1LQYf08oNftN/rUUgxvNjj1ePjgx++q3/
	ndV7YRPVgDvVClhadw9yDVuAnU2XoQhPGSf9l5uUUksx2ytWqZ6SRxd0tcYkRdM8k5VvSsC8sXW
	DCcdD+sLJjs8xxhLkfK/F7ZHtvHLB7dSuB8+cXG9A91YxpMKY+ebcJFUKajCwrtXY
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr2256930885a.3.1795462817009;
        Mon, 23 Nov 2026 11:40:17 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr2256921985a.3.1795462816158;
        Mon, 23 Nov 2026 11:40:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm27856759f8f.21.2026.11.23.11.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:14 +0200
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
Subject: Re: [PATCH RESEND v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <gcgah4os654tusrceekh6e62dlgmtqggtlgolua4zewglhrpjk@4rnokaj2tzlf>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: guE_tPiW-R1xTs02L5UEgiLPcl4roY7N
X-Proofpoint-ORIG-GUID: guE_tPiW-R1xTs02L5UEgiLPcl4roY7N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX6EG/+hOlrXba
 Pr08TRwrYL/+eZLXjHcznNeZLSA0tXDL6uMafXeCUPNy/EnOf8isIs5VJ/iP1kpithsw3gSoKzF
 da2XEsHNX8872u6FAadhWheOvaZlvKM=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0496a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX1dpd0ZOp/AGn
 /3dh/FC3vL7zNjspjS8q3CQDpgzY2XxxWjfSVrjtUc2y8zxTMbMRknBMAq9leUa7yK6cCsGLjcH
 Z9LMUcZINhBuYE0fwvY2ODmkyIWVwFlfsJcCCqJL1heJ0gdO4ihaDzead/3U7XloORmneGhpJLf
 EuFnvhm3xFGVrEjNwyZy9JDykfYN+jt910u1DNGe6/Vy4QBxWn6S+2+q2fm0+0Yx+UNQhavjHtk
 lGhvHuNI45qaz33OyvQ+3v5+YTG4BMReYMJSaIxC5pg9QpOX3+PI19KHSOZuK9QYUaqBw0I44nB
 JK7RbJf9/jYSiJTOoBtFCdFnTdgDK6wT4+mIwcShFHLg2mGSzBlZMUHwlP/cpEbBIyU4dIBWl2b
 rlN8D/UrqV8eDlvtVoGMfIvtkoulHE4bN3A1k+OQKAKn6K5CJiKSN34hp7h7o8aQCIXhjyPLmSk
 J/rQ4r4O1lGyVn0gjxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114021_089000_1B52B4E0 
X-CRM114-Status: GOOD (  12.09  )
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

On 26-11-20 19:11:40, Bibek Kumar Patro wrote:
> On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

