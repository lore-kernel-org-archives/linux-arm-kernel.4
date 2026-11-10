Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8410606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l6XztLo2;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Ag+rVwYC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9fJQ8pE56HbkX1ZUYrhxVkU34TSFLmlaQeYQsbPiSE8=; b=l6XztLo2Q4JKIr+dVyAmaZn7Ok
	lwEsbaJTOH8+nOP1qNjlREpD8WQu6seal2Ihj/arqUltVigQXtMgpgQQQB2QiVXgzMbBUICMQB4rV
	dWG0y5iCi83VrL7BAlwUcYoBeEJs5c0VEO+TuSAyayUUcYTujeYBLLRecxTbXrXG/Hd7WUExrZhtR
	gTP5PCeY0MwGWbn0auF02N8liCa8CWS6XFk9gdRBX3MDq9RFS7byibe3BnuOJXBVjjIxP0Vz1XnLY
	HPNVuYdyUjktoNtb8zuLhoixpsRP45eO6nxYMSGph/elTz9zLf5XJKSGma2eR3ZTVX7h4ilgRXBIt
	m4NMwpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnZb-00000004LAD-1nxv;
	Tue, 10 Nov 2026 15:15:47 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnZY-00000004L9F-11q7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:15:45 +0000
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAEpnrA322911
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=9fJQ8pE56HbkX1ZUYrhxVkU34TSF
	LmlaQeYQsbPiSE8=; b=Ag+rVwYCVCl+dxG/6YaoTME2XZXFS8Ml4qOb5f5aN/hY
	w199uroagCaME1+uFLtNnFAevh6nIaE7N6SdxyuIqPEzsihdyilq3gNfj2tLvc7Y
	CwYj6nK1ulB7O+qsUFlu9eTGa9OE4EZDnpGW9oR9oYd2+Q9yQYSZ5XcW4W857xKA
	of3asewuVr5iy+bt2jXG31R5/GDJr+Vz1z1+UgMLv/Hc7J8rfM+SQQ9IUcqk7BWj
	vJML5QoEszM31qN/FHzndOZWlx779vHX8lUU2K/Thr3qouWvsQZDW/VwOSz3Po6q
	WqcqXl2ynbAcO3IooCiB8n/wp5vBX0I8u7TArYoJRQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hupu54d7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:15:42 -0500 (EST)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0d36c1db7so31968577b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:15:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794323742; cv=none;
        d=google.com; s=arc-20260327;
        b=FpleYfcYW8zXFiDJtURCukz2X7Kh84t4NWlTANgwrhJ90i8ifnYuOYCmuSHcgpJ/IJ
         gaKLTZcnRXVEBdTN4Oelcs+JH/JwyHZTeyqrDfcnCgl0Bd0JKLQslhO1Rl4r4vVwFZ8I
         U1rO8+5egj73sxxw0x5/Ozkj/o3UU3593UryLpq7vPpzz1tB4QgFRKlCiPwcQcJyvJ3Z
         Skt69bCocuODIvMuCMLznH8Wmz8spfk0B2RZP8oYtW82I6l7dbEX2JTHdKIuxSc1QG21
         CHngN4BLWVQuNEveNZfz4Ffhc080GJQkLVozXUhrO/YHaGRg11lZZ9xJEVSwwkj9rZQt
         JZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=9fJQ8pE56HbkX1ZUYrhxVkU34TSFLmlaQeYQsbPiSE8=;
        fh=iquwvqzrGo9pu+gHCLtpZqedUu3GuEM/axIqfcDy8KQ=;
        b=qKS/1R3H3PA5JfVHkn0f5LisEga9OgAE8+Bcsa9TTaO2QbWaIt9w92z7cQdSbUK6AT
         aBo8Yyq2yn5ueTJOKSrU8AlaPwYOQbOpb1Wg+9iRLnQvwtZNl9cCNmDNo+aoBrXSMm/B
         AWai6/CvQhwZR4zRwPWeSIS1IpFYw7285fm2JC5NGqu9P/jGOOKfDYEp5PgpYWry94RM
         2FWAkG3hFWwkkoa30q+fulRn7rNejply4XOldSIHudPH5yAkypkzEiX9qMpUqSdCjiRi
         cyT3ZgWRiNyheHxOGWBPDOchmbn3ZrlVVOwbk8pdzqav3shAwNeQch1uDXy8wm0MrH5p
         gJcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323742; x=1794928542;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9fJQ8pE56HbkX1ZUYrhxVkU34TSFLmlaQeYQsbPiSE8=;
        b=wvNdIosCWkncsr3PTfJyBMzH2x9m8wfcGTwifAvtidUB8KE8Ib4MmaT0KivRiFPTki
         Xh5nc655wBiebQf4LJh25YGApjNV1s296LURPKR4XIUiWzj5a+wUjn1iW0sRKVZ9ka6z
         ViY6HEdaUtQNau3fIydfDsfA82YRJA7c3B9o78jkxRR3+uC4WTAh7aT5YbZlRjiP8zLH
         FXpwj1vWSZeHEj1QcRVvcwxO2q/lkefkoPCtfSVLHBLLt3e6Hv73db18DtyY89J7kOQT
         hWoHMslrTrEsXLRx/K/z+/GE/s9N82UpUkk7t7muJKxwOMcpXKxjdksa4KqMxxullIhd
         8Teg==
X-Forwarded-Encrypted: i=1; AL+hErEXOpjVQ+6jdWuxxPvQvxJ0IMXlP11q6yhB0GqTpjYGKug1EAY+QOL0Z8yRqCZKVFWr3UyCAb19cu3RlJuKZOGE@lists.infradead.org
X-Gm-Message-State: APuU4Z9fPtJKVWz5GrqfR8BxgQiZYxYYD48FikwzgVuyAvlIfuRNOzyn
	/mYeEMnkg2Txtrd46xpGA2RG07HLvrDRxGBkgUr/s9iYR+9Rjqvr/g7z/eyyYkgCeOP+7A9RAqx
	D5X2PKGZiccfCIGHnKY+qfc7TkGmO35SCloHmlQ+mJf+N/vIMRNrqwQLoiSRZ6PMEftQPk+dJs1
	OLsIzFK3txUW81bHpC0t0uz/zlmgDUfHcZLraYJ/jKX9qq4zQ=
X-Gm-Gg: AYBFou3mckPeAGcyHhE3M37YfkTctLy3IByd/PvDBWQ2pxUETNxExy4+XEekl9XxmqK
	LF+8V4ikCZiBVtpvQbm7WCwftSCJHg6QJTnqjFE1SCIt7nQSxtkLILSkfLY20BO2H9r/ZB1lvVt
	QVCg7dEDKEXYEJUZE/PSgfekiViMG8uRGJqosPLisQYxPgfREtwcS4Bd7qp8uA17YbbGvT6EcdJ
	pZllcji12/TkHvkBON1/wspjAejgN7TEs7fnnfoQNUlyc4gyDS9oFeMCW/7JhyNQmBjLPOCJ0sE
	hGHn/PTSPvvTOcbmlY96VIZ3ZIsuthADkA==
X-Received: by 2002:a05:690e:4846:b0:67c:1aa:2030 with SMTP id 956f58d0204a3-67c567efb25mr1187122d50.67.1794323741915;
        Tue, 10 Nov 2026 07:15:41 -0800 (PST)
X-Received: by 2002:a05:690e:4846:b0:67c:1aa:2030 with SMTP id
 956f58d0204a3-67c567efb25mr1187109d50.67.1794323741481; Tue, 10 Nov 2026
 07:15:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109-smmu-l1std-cfgi-v1-1-65e5203a6516@cs.columbia.edu> <avMxDbv6JE0dg93E@google.com>
In-Reply-To: <avMxDbv6JE0dg93E@google.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Tue, 10 Nov 2026 15:15:30 +0000
X-Gm-Features: AclHuK8DUCRIoYG_4OUqBuLRYwkfdAVKQUExB3-Zc9tH9YZI_6jnEOtLYF7fci4
Message-ID: <CAPOPQMAThQLj8Q8bMx7oyCTHehV2KTugeLNpdUrHQ2roPw1TZA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Invalidate a new level-1 stream table descriptor
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2MCBTYWx0ZWRfX2/j274GC15VN
 5UbIVTT6VnwJuEpHpn5tf0Utp2MHPYOjemxFyVvu3Ip+qekIl8zarNpgavgOM/7flng3wWe7cax
 aYsXlYBerrvrAajfL2OEcJF8640V8IC2U79anGYGDLn7inVazFiT
X-Proofpoint-ORIG-GUID: eLD92LGtP37tqo-K3EBRE_dnJueRm-4i
X-Proofpoint-GUID: eLD92LGtP37tqo-K3EBRE_dnJueRm-4i
X-Authority-Analysis: v=2.4 cv=NvZE4MdJ c=1 sm=1 tr=0 ts=6af3351e cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=FlFfRw3deazO6x7WvR0A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2MCBTYWx0ZWRfX4eWNkhe7vec2
 eeAYk+9raUmhC6WFmSeZz0hD9Dw1D8LTERVgNpivGrY7yFAqwrVkygXrZWCYGMKdEiQNR8dkU4o
 dufKjFSjbgW1TW1dVrc+CuqxYRc1zDGdTad8kfQV2mMA/CGabI0MYQJ8jIEoSIvoW159FfPyYJf
 jS/YSyM3nUJdA8F4iw0c0fRv2/RvYFU9Ol8X5BCbN3qS6wXwvYXkFqD6F6r02/2nluzKBm7bzHZ
 n3cu32GxY5s62iQgDcn0bhazygfInTlnKKlZQGYSKMOTfqtf7lNUKWZn4lakM0/mMsKX+OI0QwZ
 W9B6XPVMC4TGO0pTSQWQZ5H/qU7qu394v6XxhcXe7SjbixGEx6IEXcdaN9uxOducB7mJvfYdMrv
 RYIpQrKKFp8ae3Yoz5A1v1F1mioex8vgswCdEAKztASQjvaTShgsqMG6sdZACliVS7l5j+Crt8E
 xoFZxPQg7k+NQ+bN9nQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11962
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=10
 suspectscore=0 adultscore=0 lowpriorityscore=10 phishscore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_071544_312304_9D890409 
X-CRM114-Status: GOOD (  10.86  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 02:58:21PM +0000, Mostafa Saleh wrote:
> Which checks out. However, I am curious why this was not seen for
> over 10 years with the current behaviour as I doubt any existing
> implementation will do negative caching. Is that something that was
> observed or found by inspection?

Thanks, Mostafa. Found by inspection against the spec, not observed on
hardware; we don't know whether any current implementation caches an
invalid L1STD. Either way, the driver should follow 5.1.1 as the L1CD
path already does. v2 will take both comment nits and your R-b.

Thanks,
Xuheng

