Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA21606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ox1lxytR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1Wa/ptT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NQ3jxnJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yrS5Iv4M1hLDYBXpggYsN9KN/6PH2GzjORuMGRLCX74=; b=ox1lxytR8UphKcG0IWHyC+G3gC
	Is/f1m1aLKO8IDPFCzlP0nFkVYlgriLZxnaS8GhIA4qGzyAXyEmZKksBnWRludYM+6+7Gh6L/A9pv
	6fzN8TuUcFzQNCYGZFinPBIr7bS9aXDInM/m5+4u0eOU2Wq4KhBb6fpG+nLLXC1KuUq16QJDo2ndN
	7Y/dcllmopERXwf8GXWMB3Hy3Al0SAQQkXPVsHTdCNQmbEO4GAtW0UlJY0fVVf2XK4n5ATJ3QF6SE
	nBwlva4h+v0q85HSID7ITNCZQmCIH1YIHyYRvP6RkMAKhaWI7dPh66pCzC8d1MenLqnjm7Jmvjr+8
	K0suCtTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTO6R-00000006mVl-0tAN;
	Tue, 17 Nov 2026 18:40:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTO6O-00000006mVK-22VU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:40:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHGYUCP2743397
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 18:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrS5Iv4M1hLDYBXpggYsN9KN/6PH2GzjORuMGRLCX74=; b=a1Wa/ptTk5xxcNDH
	YD60QQJBgB7viIFMo5pZbE8kNNjXRdb/e3he3Bgc2acXJzc06lnPdTJR5JRIaGut
	uCy97R3Ri13EAFRWfELeApk7OyGOlktkVv/qhaHSJSZKsdB7DYyKyLTHcqtvlh8R
	M51TT3zMtqtXwTPfmrGrxtE7nV+xQkW9j67L2l8ZTHhFsNVthpDC/6f/T+EU1oi2
	PISsudee21Aeep3jT7Lr9DFMoSs8ZwnmvSWrM5peOdkjWdQFQGOm+uZqnStVe5Y7
	8Ayn9l3Uwed2iCqi9YTaIZAQU4yOj/YMHSkWV8n31kswUhQcH2iAguuBayEkjkWU
	JYAWNA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tjm0kt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 18:40:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso560153eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 10:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794940818; x=1795545618; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrS5Iv4M1hLDYBXpggYsN9KN/6PH2GzjORuMGRLCX74=;
        b=NQ3jxnJIbbPq/LttdboNWpD0ufC7+7/RO3L9AxXBHVVocOhdGgcPs9RVPw0Fuyem+4
         qS78BF1MAwh0mHqD5OqA051/mc4tUD6VZCp4m0Z357iMwJmYiBh/9Pl640dOEPeL2fsO
         J7KO/QH5UlOoQL1Wd+Exyfkt15k6C9G2kozPjeIBFgxv8pKXNOmqx0MnQQraZ1+BGhfP
         mEWg7A9Vjohp+ZujIGL69nhZdqJCYjs+HgWFKN3vA/ZaJijr2lWMbI8QsX7BqR+cxLEj
         tUETfSRZ+nm7WdylIqNLmCZebPdy6l2svV0VEHlxYpGnW3inaJtdYo1//EKFv3bHXTmA
         IXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940818; x=1795545618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yrS5Iv4M1hLDYBXpggYsN9KN/6PH2GzjORuMGRLCX74=;
        b=MJkOS4TRdGSKD7pHMgcRM3D1LST1O4e0r61NgI/88jz8fDpwt5yQuXjjY+SavhAthX
         eoeQPJdjYx75HMD9RR+pHUzcbuRDxKU2HNvD7zJbYItwy88Ema7FcGnv56348n/R8p2j
         c+griwizq+WGGYAU/ZMk0qDN/7chWIziaRJ6t3Yx6Kenfv01ct2lVT/OEaGc2s9emZBe
         7GrOHRS3sHG4BUVOdaankgkR2w6+iBj2UEMd6ppDepVlQFnWcOfQPp6ZvNsqoWeQtaCC
         phXuwdawCKTjPxI44DHZlTiQhnXzjZKF8liIUtxS5TMAXeq7jM5z5QESaQCwH/fuH6pK
         /+lA==
X-Gm-Message-State: APuU4Z+7TnK7YDbB+x2JHDmRxdKuC8DCFghLr6TDRAL+e0fCHLm9IM9v
	J9srVPncviTaeiQUJIM8wwSwBTVe3ozQMoykFWJJ+gapGQygZm+jVSI61eTXjOjFPEVfkYMKhMj
	1iRmjY+cSGcHQuJdz2Fy30E+gFtcHeIZR4Eoxnfttts8kIBb9Bu9wELD6Jq1/0CgfdwdV+D8jQj
	VY7A==
X-Gm-Gg: AZFdTZcqgLe8K5Gd6hJMUpTawX6k9W6fODq6XQZm+9KCN/xyrsA/qNdbJAwMwYIog/T
	kSn+T4rSv77Vba4vDCkmt8+ag9XfOgZihGV5saWoJXzJsUVKpotZ+as11EW06sthjlMjWO9eVuL
	OrS2NpFvf49TyP6rizKqxZS82s7EcxfvU4XOhM4W2vf01GIxdMwXi/xMhqWtMyQf8R6ELwj4P9p
	hDe1KK9Xc15fugFvAJgrSRLDgL4Wsl/flyf0LSwOIByjdtNLM6Q4Q3YMWZuPfP592eWOaBdwEGE
	0tEIOI+J+rSZzbvC7a6zEDRWIxySYoWBCSbPgm0tzR/hkHOnKs+cGtuL4k173fWYZ/CnFnqIiLJ
	VaC1pKd8Bh2A49zx7dFcDjgHrvXh0pdZjmB6us+9FFBqjSXTIBab08jY9Ig6dZd2ZzZZLYJAQUi
	5r2rkC6EU4kW4vZPzBMP5erA==
X-Received: by 2002:a05:693c:8944:20b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-3827f5ad3dfmr272563eec.13.1794940818109;
        Tue, 17 Nov 2026 10:40:18 -0800 (PST)
X-Received: by 2002:a05:693c:8944:20b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-3827f5ad3dfmr272542eec.13.1794940817648;
        Tue, 17 Nov 2026 10:40:17 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm49331384eec.23.2026.11.17.10.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:40:17 -0800 (PST)
Date: Tue, 17 Nov 2026 10:40:14 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Liaochang <liaochang1@huawei.com>,
        Marc Zyngier <maz@kernel.org>, Radu Rendec <radu@rendec.net>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
        Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>,
        Ashok Raj <ashoraj@qti.qualcomm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
Message-ID: <avyfjl6ZLbpilWkK@hu-ashoraj-lv.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
 <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
 <avtMA9bb9vwezquP@hu-ashoraj-lv.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avtMA9bb9vwezquP@hu-ashoraj-lv.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfX3S4V9sXu+eRj
 8EKRT+yt336qrdnhOMUWSbDWSevSqv+L+Q4mAdPBNeV6YvvcL4P5KYDCWJ4q6rXN0C6CjXmkjrl
 E5UeaSkq+mGaSUIqxT7eUZR5m+CbJYyLUNCEnFvhqkb33MlZnpBNC12WTpNusgMuvzo3/jXPVeh
 O4XnPUW++a3Skz4Q/NQZak9YtdftZ8SypsGIiC3hNrFMNmk8zSQ/XIoBs1P40SlKtvHHl9b4svh
 piBBOzv1jpZhU4ZGAGY/p/ddlJ1dx2lBbqY/CHzbeevzL1RkkUUBWEjyuCJtYcxPkFnCggpeni7
 r82v6sBU6YLt+AfUBSASgf2iFDYhqjzw67Y1Mc+1s9QNtrAWM3MTrU7IJVQ24Ilcz62qfipNi+O
 egTG4USP/Kq2ZwM1HgjqYISUL9AnNlAiYD4EyT9IdwEOVgxALpzTTS3GAgZCOFCUfmJxJjURsuM
 MeuZEu7RpDtt64RIDSQ==
X-Proofpoint-ORIG-GUID: k9WVQqiHTO3nD86SLTU7NSKye-TykhCQ
X-Proofpoint-GUID: k9WVQqiHTO3nD86SLTU7NSKye-TykhCQ
X-Authority-Analysis: v=2.4 cv=Br8IUoX5 c=1 sm=1 tr=0 ts=6afc9f93 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=tLX9keqMrxrGrtBES30A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfX8NZ7s/kUOPeR
 xAhDiDHEFRdGOCF88Eoq/7GIQX83Fewoj37Xnwt9oyS1z+sHteDqSbVWzWmL5ObcJZhLsUQb22J
 PlcmGHmq+wvRSXKYLRZfWJVdIc7/99I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_104020_654947_D033AB17 
X-CRM114-Status: GOOD (  25.26  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 10:31:31AM -0800, Ashok Raj wrote:
> Hi Vladimir
> 
> 
> > IIUC, one of the main problems with a shared NMI (as opposed to a
> > per-CPU) is handling shared state. [...] the same NMI handler could
> > execute concurrently on two CPUs.
> > 
> > IIUC, one of the main problems with a shared NMI (as opposed to a
> > per-CPU) is handling shared state. Consider:
> > 
> > CPU0                       CPU1                       CPU2
> > 
> > ---------------------------------------------------------------------------
> > 
> > <NMI>
> > handling started
> >                            set NMI affinity to CPU2
> >                                                       <NMI>
> >                                                       handling started
> > mutate shared state
> >                                                       mutate shared state
> > handling finished
> >                                                       handling finished
> > 
> > IOW, the same NMI handler could execute concurrently on two CPUs,
> > potentially corrupting shared state. Once again more than happy to
> > be corrected if I missed something :)
> 
> There is no risk of the same normal, non-per-CPU IRQ action handler
> executing concurrently on both the previous and newly selected CPUs during
> an affinity change. Genirq sets IRQD_IRQ_INPROGRESS before dropping the
> descriptor lock to invoke the driver's hard-IRQ handler. If another instance
> arrives on the new target while the handler remains active on the previous
> target, the new CPU observes that in-progress state and does not enter the
> action handler.
> 
> The affinity update is not a synchronous “wait for the old CPU” operation:
> the interrupt controller can route a subsequent interrupt to the new CPU
> before the old handler returns. However, handler execution remains
> serialized:
> 
> Previous CPU                         New target CPU
> ------------                         --------------
> set IRQD_IRQ_INPROGRESS
> drop desc->lock
> run driver's hard-IRQ handler
> 
>                                      affinity target is reprogrammed
>                                      a subsequent IRQ arrives
>                                      observes IRQD_IRQ_INPROGRESS
>                                      does not run the action handler
> 
> handler returns
> reacquire desc->lock
> clear IRQD_IRQ_INPROGRESS
> 
>                                      a later or replayed IRQ may run the
>                                      action handler on the new CPU
> 
> Any required pending/replay behavior for an event arriving during this
> interval is handled by the applicable IRQ flow handler and irqchip semantics;
> it does not cause simultaneous invocations of the driver's hard-IRQ handler.
> 
> Does this make sense? 

I think what i quoted is true for regular interrupts, but NMI's there is no
IRQD_IRQ_INPROGRESS serialization. So that overlap as  you quote might
be possible. 

I'll need more time to stare at the code  and rebase my RFC and post a
coherent series that uses it to get the full picture. 

Cheers,
Ashok

