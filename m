Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FBF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lRhnzY6w;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H9k5sBt6;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WSf8nLax;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B03yE4dW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=; b=lRhnzY6wfPrQc0zO/SL09Rk9vp
	0+Waa4yofhKZAasWAx7tZeD8h15A87XuFkhV2V2iFmHLBUvaGJgED6xiDqHHc0fjinBfVeH5FdhZ1
	/ZkFzSUh12uSSiW0PxJDiuI1qt9e6rG0tIOdNXGyL8ap3MANqKFzYQHGtyERYZJcVbeEskgE8CxXE
	3G9OFywAWn47JpsuPIcb+C31yXz5ppJ3G1c/hBpHyo05eIgPW0THIdMyv4eQ2IqTxFu/7bOu8T9NB
	QGdZf9FJlnrXGNNAAtpyOhjvaUPsiJRHgnWcQiCmNHIeJtw5H/r2JIrYgRcZy1he+IJfO7Oq82xeh
	TCW43zKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZta-00000004i3L-3GmL;
	Mon, 23 Nov 2026 19:40:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZtZ-00000004i14-2tt4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 19:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=; b=H9k5sBt6f3fBmbiZZkx2QVsUhf
	i2fuCXPD8tDh6cKde8zEu3HvDb7M+R5i4NiVsWE5BMgg1xT960s24dBUj6yEs7c9Y4lx/OZ83CUPA
	3edxyNDbIItaJ/45YcElVdRfudy2Ue7Hn1I3MpWEL8TwigNYyI5m18ObA7L4ofmXVttrlMzeXo3WE
	bhNj9qUZXApwPKbSq/0CNh6dA/qEOHrEY1wnry5iZQ40S5BFrAK9KSRlwGEMyVie8ZQwdTrc2t/Zd
	QOHQHxDkmBD9TcXoNaWWgVxqn40xzRJ2l8DyU+GAZK/JiGzLc4mp+FXbUHHBTUXJzwvAy/uRK+y/N
	69/MZbig==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZtW-00000003XQv-1ONe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:40:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1o223211965
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbTovhPnqtGY+9gis5cd+giQ
	qlIKSt7958zVNJnBgFo=; b=WSf8nLaxYf+BtiJytkdELMlLjzY4U8uDC4sNk2Ia
	R8UENZ7x3KeRV1NFPsgOMV8/o177s801pff3P9uSxgLjXM1daAGoAl2SNuzvCFJ0
	RcnxYbplrZ1rWcPEBMxbJXUFcBVqi8iBX8FD9VmNJCyB2MLRDTxs3pqT7xIpW7Fj
	CQlbtV1BQLewbM3+DleoXMV7pzKGjMn3BzFJ2HwwMf8kwn0l5RCr+Hvjpo94o406
	Q34fI1SdJg3aYlHiobthbcMgJY4czgF9t9Jc9F9GpJq2K06gVnmveaxGd9dqBgbJ
	H0tzJ9iQxpr0o8MfffMphYr/zL5pRJqQKQ56AhP2ChLhng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr57a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:40:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961511b61so623262585a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462804; x=1796067604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
        b=B03yE4dWAad/8xxb4V5EUWgSv0BAYXzrU25+kVEg1r5e4Vvy5wlbNckS2g3wGFe8bH
         ogJ8NPmzLiukoXIqObavuFF+s7Vj54GEXm6XauZ4onb7HPyt66oCiIIYjP0X0ResscVW
         T9b+qudRvYaD0XehPIxOG3tj+x81DomgeFjcEWwLOPl3dcFN9iQCAUjPFzO9/vU6qv7r
         NLPCo2RDvD/fX/gM/poRnazD9/z1i+A9ZgGHHyc5t8C/31vmqiKqJumlA+qVaomnSV8r
         c0kDn/be9OLiL0n6PVqSMu2zCH9mqK1LWCwzL/xJn6mXHxwaoBu7hsZn4J+f3eTbabwQ
         ofiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462804; x=1796067604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
        b=uOyK+MGkIn+w/M2Lj4I2+nhRpXPWFYlxHzkesLGH4Hzpa0tKV3pCbz7laTvkqTR5IP
         /qv9Lai4t18dO7z+U3+tw42/RTgCJvoNWdJ/IXclmscL4tpKF0wm3QSEx70NhSHpYYFf
         LR79jkRse7l2h3bvt6CpCSbxE/kQd1Ws4W3sOE3DtEbb9Z3ADnLolIH/a4NntZwyjgUY
         FXTioXxwG5VwfGtO1IpctxBdcTfDKLyT8UYNuN9sPJgnmo0ntQYdZh/XI+P8yV+Uxsn+
         BVK1kn4ih0xyidVRbKpnmxwyrdhqTCOLy0IuJTkufa5QuUcxOxvsLxILyjdWTB6FNP0H
         ROXA==
X-Forwarded-Encrypted: i=1; AL+hErE+Oltw2kq82OtD/pbo5KqP2VOo6tGZf1TsEADUg14xe+bS4jUPvX9OhQliDpecaWNWuWHydEOqzZXa7i4gkeN/@lists.infradead.org
X-Gm-Message-State: APuU4Z/4HDYzGTdcPcSu0Ozt8wsLzZ8lFPRuPDYFz+cKNFFuMhXLJu+q
	SbtkW/eozFZv41JM0q/WoQOGhwaz604n3lpdDq0GjkVGCpslqGIx+2Fe1g71xWgxpPV8ckFIPEI
	zBGIFL/xvmHGghb/QiP9ZdRIBczuNYqgnEcnhiNQgse2lTOK+2T77n6nOlVzdNBS3UERKcicI3I
	pS5g==
X-Gm-Gg: AZFdTZdhLXK+V3JhwqTCC4M6WNKQ7j+00XG/rSzhLx0DZ9YL7zhLmqtJwotEIi7PEXn
	64MHPuw294uNx3GHHkcjJvzobWpb7/qudnyTRlsHS4OvUuHfwkfh8DuxeGHl0RkwqUC8dODgF2B
	3Bg7EPcIASKRh37Y7xXuIVAybPYvhgTtfzXBwTsSJT0N8AuoHcwaW8xldET1mLkkFph6T5s2Sy5
	VP+gLyEQkrG1nrONN2xpwJCgj2FzTElk0M84yRhSrXPIXovZvOvSfp0eWhfxljs6c7M8MhCTw/t
	WlcMthXze+s2I8Db6C/hECtUbqmj6a6TyLe4TlMh8xJIldR/eHNCfTo1OZg3oHQnuGdqATQowyh
	uqzgsv3n4U7RH1QzIVKUF5L8cD+PDw53969EqgmGr6P/6jf8NNZlFnZK+yhWWdj6L
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1970759285a.23.1795462803363;
        Mon, 23 Nov 2026 11:40:03 -0800 (PST)
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1970752185a.23.1795462802646;
        Mon, 23 Nov 2026 11:40:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm19966670f8f.46.2026.11.23.11.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:02 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:00 +0200
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
Subject: Re: [PATCH RESEND v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <rybbgcckx5s2gqnzqya3kc3kbsqvyp5qqwd6ct4cl6dre75fgu@jxlgzjkork3v>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3AxiDwoLei5s
 N1jz41LzIuN6SdufVX5seyrTeLpcp8nhskciQmAAra68X2RCVkOcmWCzY3w3IKg7NLNvLoSA0Lz
 t5hJnKa3dEv468XsHvA6YdNz1VUSKIkyXQ1bXUzwFv448a8ZFj/3R30nvJk2kh93SBfH17k3lTS
 3QwHqTkcMGHyz/oYH+/klbMoo8SePv8WgmVX5kLUYKN/+HtXPFPCAyN81vUP3uFdC+Nqww3vmKK
 zEh7tabH2+GDhpsU+MtaPeNNrepD0c7UsGrn6e35LUqN+MyxuVf1GBkWuvaByc/bGd66xWtCNmX
 8qDa7Mz592UIsJ1GtRkyNXBiJhXpnVCmRvSNSnH0mcSn8C+aq3aIBDKm4KhtmHCVP7Kjt9S8adF
 PntDjsnpc7SWbYrJuwUmCv0cvv1FA3y1j7qpH4EgVQMcUp/FMW6Cvk3IDse+bZXEnpyvdUf57+L
 iMr/FRxGnpq33EWKfzg==
X-Proofpoint-GUID: fbbrJmlOs5guUQEDpknvjbs-J5c9MUX5
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b049694 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1L5Fs8CdhlNCfOXFGWoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fbbrJmlOs5guUQEDpknvjbs-J5c9MUX5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+bYsXouCF2dX
 CDvpfbucK55eG62/lPdNXxbg37W88JsJw0aMtXDGA+ldj0mkCtluSnptlZXUJx45jLbLWxjBrQc
 EXXPe7vEemCIdm4XO2rSlsFeW9HzsoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_194006_827219_A57CD67C 
X-CRM114-Status: GOOD (  13.48  )
X-Spam-Score: -0.9 (/)
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

On 26-11-20 19:11:39, Bibek Kumar Patro wrote:
> On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

