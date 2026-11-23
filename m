Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB742606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ikxz4Rt2;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jlR2J6Ge;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E9lrvUYQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=; b=Ikxz4Rt2z8rTZ24pkwifAqz3wD
	/cDObtq9c2Ov2A6WCwiuk8RpF4YNw2wwXAlHu7gKxIODJ4grZucwkvFF7cqGRY075Tfjsl16zUS4p
	znvdfb67NbdLAAJGffIaKKQC9tM3SkOlNAwkhnH/7pshEesZ5aAsQQ4PF15+CeTEN8r8TbLbjM/Nu
	FwwXh+bQzniZeDUFMTUGRS9+HoUqN1FVaEe03XjqWJQq7/8GHc9Ou5U2L4D621Xh3SQ5x4HuuU1wq
	NTrRiotxcZqGAZa77KJym75jE3Xczq4NRV6avM5apT9lBfklfZOgzhXNDAesEiAhH2f5tq0V5ovRh
	zEU4Ch2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZyT-00000004jeH-0WOR;
	Mon, 23 Nov 2026 19:45:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZxE-00000004jWD-1teR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:43:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3CC2377385
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fcrUVABBd5BeMh3yq/6enDr0
	xTKRX2RD7vMv5/wMSTg=; b=jlR2J6GeUOvDnOTPhh3wO8ea+tdICFP0OpQ2btOC
	O5un9FGL2kd6S+hOypQb7vGG18+TcYQvUp5jr03s57D2m47fW/1Q6hYTr14jEcAF
	Gj6Rh9x3xtTdw2PteX7tjHkeWGXAPZHW+Dw4NexuvA9hhYmO5033Kwdq2KVL+K2u
	Ns6ja+cE08Q9ygOHZ74KsGKHFtVYNxvwHbjtIgcZOmeQBXK23gNCajT18NHaeHY9
	f3ZpkRiJf4RTGA6IDuWEPG3Jt1MQIK6AVBjnQG3uyYvwHSn15O/O2rGFrIx9LRTd
	SLfth1XV7FJADTB6bqovH0S3yNW79HiHeOl+oAf5OCC4iA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut4uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:43:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fbso534922785a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463035; x=1796067835; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
        b=E9lrvUYQqNI3Mf/ZiYZZR9ixaVYsuYlgy07A0NJ1R1bU57o1wZOM/2oAJJHDSmrUpD
         VXaMNML/l5AaZK5ohsMceqm2Cxm/4JycYeYnV9pJAymuPko6X+CjM6WbhdPWSxYSM2FM
         2ujwYo21PABXP8rZJ884ldq3VrsCved/VZyHRz8GpYYdHEZfdwDK9u5N8FE1D7QyG8CY
         wr970+Sy9+K7vIwWVso8buLAO7sThcoAgHo2/aF0uaZe+BW6UFaa77F2PUURx3ZY9XLC
         ISCYkz+wyBwcmhe+nIW6Rcerf/iaGzyKmk7XLqNVbx3BwrBizINhYx2T7kIXHJNCjEGJ
         +vnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463035; x=1796067835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
        b=gECQ+v2BXe3AQLkzdqekU7j3ZqdQjkKkqZK8bhtXJGv93lSTs8lFtssbIr3ppJtiSc
         7/xlI19MXhI7NjTv5zoNkVs5TCdueBhNSpUfBJkT8a0K6UriABtX7ZcThgyla2ecReRr
         T0Ug+dkH1m2Xaml0Nq2lPaQdCUpqqeO1Z64Tpzi2H9o1iay7oyHhC5b54eCm/SNwoQvc
         WR4mAXpHq0tpP/0fMANWfzWbeYNS4LJm6bydpenqWIak9QYBaRBY30Iw0QvgVctP4uSq
         hF6Wl6bbT6mITp5avXxtUAjeZnuHPfgEiiZfnZk39HKAjrnzllYvb30G9eVtO6THmC2B
         skEw==
X-Forwarded-Encrypted: i=1; AL+hErFu7HaJYBVr8cp7YdNqpB7w0pcwcK2rhS3RdR3L9610FqMBIU1JRfHzpyLqkw2S/7d5n2FfTRMq/jAUDl+If62Y@lists.infradead.org
X-Gm-Message-State: APuU4Z+5shvNZVqpcli5FujWn8McyKQNto+auupTViaTzlQ8aHfBC1Pc
	Y8B6cv8uCa93ZItKkklNfqBjH6bekRNiXpLCqxCRSpWD9Pc+GMFmLNqA1S692sBiX9u9aa8/blN
	CFJl1k6MLp/xgt7yLbVda/QyQ/qAl/US6oWgpFvwx53noTF3A4ajbibNsQtjjzQLhuXaacSwSgT
	9OBw==
X-Gm-Gg: AZFdTZcblkB4InOQpAZaMa/DOjTT3NBjbKZI5Qikic8XwRwUC5k3wIxAIcids7hT3oM
	vcQRS2KuCYhtjhBbGbyahYQxdoMGQbFbefx2OwYyruQOQlYAp2ROLc5RNRKcduB8h+3KbVBFA8L
	4lIu08wOpYLzALzgPmGh7fUXJgpBadYXBuMTnYSzRcn6AFGpYImxjHAbGoeIxLcW0phw25yNmLC
	tWcprsdI+KACG8y0Lc+ScpwRFAN3evSZCxWvFcuGCTVqvcLqUz6W0PdbmeBgOxgXJmRNZNYd1Zt
	Un4MwKJxQq15h/sS6l7oZUFK2Bz4TD/p7prUO2pcfA+5Um6qHy0zSv1gIUBz9sgyuEco/ipKj+P
	Cty4czsxFKDMVUfGvPXcOLWIefx3aREsHzGuK+uhqgI/RIWMUj5Dhox4O/4+etNo/
X-Received: by 2002:a05:620a:8396:b0:944:192:85ef with SMTP id af79cd13be357-949ba95dfc3mr2013018185a.22.1795463034424;
        Mon, 23 Nov 2026 11:43:54 -0800 (PST)
X-Received: by 2002:a05:620a:8396:b0:944:192:85ef with SMTP id af79cd13be357-949ba95dfc3mr2013012885a.22.1795463033726;
        Mon, 23 Nov 2026 11:43:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm23340306f8f.20.2026.11.23.11.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:43:53 -0800 (PST)
Date: Mon, 23 Nov 2026 21:43:51 +0200
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
Subject: Re: [PATCH RESEND v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <6yjftfrc3e5xsxqpzpab53x745utqey7ivz3hws3l34qmlxdho@jbcmzbhdq4aj>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NhFP0AryPy_EtEGF91xB_-WOOzVTgdxF
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04977b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: NhFP0AryPy_EtEGF91xB_-WOOzVTgdxF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+lsq68UQsdd7
 oryrIouLorCK1JgKADf+lCXGi5Cwb1Ce/9WPzgItP56wBblQTMw3cVRlpQfJSLrBjKQ07pKs5Fe
 LVvmnepBHDzzbR5Ltsc4wCl6xtHvHQw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX08uAcfvUBa4t
 aExfFG1qHAoJxFIFjYnKm8yMaZI+/mx5dLovQ2SvxDNoLpIMrG4VS2d5D2h7kYa/7gICBWahcld
 fWF7x14zky0qLIlkpiBc8M/QooPn2TaFJmJfGSfCA62QA9/qH8c+whHEcqQHUp158FrrKCwpmJP
 ZoBO/CbBFZ89XgVSn4c4jVqdxSXdFZkeXKcfrOWPh7LB6hwFd6AbwZjz7AZCmHOnhuW6TgrvySc
 hqlKgXu1Zd06yGDXFE3KbTt1ldpWiLASnloUrVxE+4HklE3RVgdJ37ML/l55/PiH5mk0HK7KkAC
 6romGqfFY8uXGiLTM3CoydDK1nafVm6RW+CFLgcRK5vhLHOB+VgnU6KsvraCY9Ym9Nsj62+ilrd
 ELD86fZoLN2LBiDBs0P4+dvAhmIAnHdLVjM285FZ8W8ST/uRmLsDLAgFDbAbC1fb6KEhn9T3i3P
 /I21nPMf4Hyq0euMK+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114356_628053_88FFF9F7 
X-CRM114-Status: GOOD (  12.59  )
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

On 26-11-20 19:11:50, Bibek Kumar Patro wrote:
> On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

BTW, can you please check Eliza SoC as well?

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

