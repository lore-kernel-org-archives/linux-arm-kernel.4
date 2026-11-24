Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B234606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f/Zx+B1t;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HFmRMel+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DojboaAK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=; b=f/Zx+B1tXzO0mq
	FUk2A5ivLJ29DnKjDVCXr1uNrRAXh1F3U+nvpkDZBkkTHUgaHQWfc4BNuwRxYqJSkvibzBG2BYdVe
	15bwADgzal9MutUw7alEUjrAgu3O8/yzJn0gj3z36nJ24lBc9ODk3IUll4bAjDbu3adFkiqGif6M/
	foYPISUdUCtXThPqqEd1lM9KJ2CHeTXdaDqDXM6V9P0a/ZlPnItV8x530UyGTc3VgrlcB1/Yyrugs
	rmpoHGdfGWuvrAT0iQt/oyniNe7Hf0cx+9KA6OIic0GfV0n9Bydhd3R7/RNPwI10Vh08P36n24P62
	+HOGK1J5l3CLwLX0rTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzF7-000000081Fj-24pZ;
	Tue, 24 Nov 2026 22:44:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzF4-000000081DX-0EqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:44:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb0rL886649
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=; b=HFmRMel+kSNMaBNc
	ecE/2xFlKYK0OskutL/ZqSgBBf413VS8uQk7MyhxrLmYFsklTZAN+3n9ErYVHlit
	UOvS8/RnRYEldAzYSy1k4M1Tcauqs64z7XjJZX/Y6GPx4im/wwHaPSfj3gC2PY8L
	nF43g3luwvIfJ4gQdcb+5Bxg07LaOaNU1iQnXtWv5Ltbi3GScOtDnatTXmmn3Jdr
	QWkM/BbGkKt1a0PFQdbMQqfn0StZW2I5p091+EiMZnDbEWYP2ZVLSY53AEJerchJ
	bT0+H2R8a1Ui5JW7SqkXQAHD8i5JKI9tBFDlZWJsJzIKYVXGiC7QMLJ5OeXD386p
	J392pQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhc7yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:44:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b5e3b5daffso5387439b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560240; x=1796165040; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=;
        b=DojboaAKwJNLmBAvUXFUv4h7mNn80RM49OwBYjbUm9KLjp4bxXrwlwLU1SEY82MuqU
         ES22c3iPdVytuF9C5I6U+/C+7FgxnEHKubo+1wq0+FRypbRBP7atfC5MV2zY+eR10sN5
         txQkor/RNkTncvSCTtBAcdJAwfSt2eiG1mdxOHh0S6a4imgDd7Lrzhy+5r8TvVqb+QkG
         NqaSw9Jq2uqo+cX+4rpYhQl+/pPA0i9OEyLPWvX6e1FkwlAc2/YNbC1pBiS9DK0Uqc8X
         aR2vNcAdv1dxOgQbYYVy9ld3vM4244Rp7ArOlI4p/a1geAmPoVq/M/fjOcHOn5y8ZPTN
         E4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560240; x=1796165040;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=;
        b=jivNv2VHfF9KDXH7dxfyQOL7YS2g9wJ4RhELoAa56krzmqXjklRVJ4OFMZ5VDm79Mv
         z1DIFg6Z+dJ1veNJteBfJRHpcu8eMGQY0yeFiTwOa13aG7rNYDAJMRU4gUQhCzZYnH0t
         nhpAlB9UNauUxSgn61Q0+FifNZICz0UCEgLf7fFFU8j3oBg31z+tVibwlvbv1G4LInXp
         eLI8K13AQZzC5MXKIKcTQGWOrLjtTarcZU42VDvrGZrmQkiLLboyiQeFATXjR+CYQzKX
         0LDmYhUfgko8QkyBI6Nj+QyZzvTKJi8MGRk3zkKp7qUtXcg3WZXvreZJl4DezKhuD0mF
         JSCg==
X-Forwarded-Encrypted: i=1; AL+hErFU2heqtBsZiij5z7MVhHPdP4iDKNzFsAWdnAi4TJd6tNtzxiL0uuc937pHn9IDd6DKtFh0PruJe3Yyyi0J9JvS@lists.infradead.org
X-Gm-Message-State: APuU4Z8SvqgaTIkOpn86I5W2IFoTlS67wl0F11zIHxjqE/h63n/upt96
	J73aQ+IEiTlv9I9ElqDgXvH47+RlT42XhNtxAvR1V5f15C6zYqWfjufV4CuXF5bhiKAGW8uB8DO
	bTXnHF/wx+sGdoHZ6fK6NuGW8CsDrc7FW5DZQdp1e0uBicg1nKKx3tG3fIMx9gSgmfFDFmiILMZ
	VS2g==
X-Gm-Gg: AZFdTZctvpg19/6/fCwxwPfLrMqxol3W+mSoUVixUYY74hLTx8rrLHVN/RnyNN7ieHg
	JREasF4+Uy/r2I0NMM5Qc9ktpj95aV+Pt43Vcw5iVWQKrKeTBomGUmgdbDtGnuVmPKoUX4AWjxX
	SwakWwItAoxm37ZiL4yPEXKy3j4pK6eh3lMBDzT1qLksDsAUFiQ9ea7RbmdG2JsXYpCNGndBdue
	9GVgjjXgVmccfe9gUoG1JIUfOZuO7NcITLfr7ihT9lEDpWOk2HbMjcS3HawLwuXfI0VYq6Z7VJS
	7IHGDrSMS9KwmGZUJRt5CbZRTHCNkGJpbhrQBIH0I5BI1WdyOPMAdzkyZY6LGGWKhLB2V+HBmG4
	+GFIe2ti139DOI0jAhSMnWImeopc+OIanbUYQJyRlP/BqxWNtbNAQCvTqC2bDkFZFyuM0aN30rk
	kwzzxXDxADIyO0n9729PZ7FzvyKwo=
X-Received: by 2002:a05:6a21:7704:b0:400:554c:f8cd with SMTP id adf61e73a8af0-4014dd67354mr15681381637.54.1795560240404;
        Tue, 24 Nov 2026 14:44:00 -0800 (PST)
X-Received: by 2002:a05:6a21:7704:b0:400:554c:f8cd with SMTP id adf61e73a8af0-4014dd67354mr15681370637.54.1795560239982;
        Tue, 24 Nov 2026 14:43:59 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm7644525a12.9.2026.11.24.14.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:43:59 -0800 (PST)
Date: Tue, 24 Nov 2026 14:43:51 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, sudeep.holla@kernel.org,
        philip.radford@arm.com, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Invoke proper protocol cleanup
 on failure
Message-ID: <20261124144351.000034dc@oss.qualcomm.com>
In-Reply-To: <20261124185111.1022322-2-cristian.marussi@arm.com>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
	<20261124185111.1022322-2-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b061331 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5v6MibOh_TyftPwQeGgA:9 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX+CqyL6rz76LR
 bzD2vgLakVIsw32kbwdrlPGO0myt4A8u3EsDqQg4HBdb8JH2UTwwCB8ukuBX0in12xsL+gJTI46
 kR2iNT7IQY35DOJk7nZMlTrIbkZeL+g=
X-Proofpoint-GUID: sm3gfMHshncqXKdKW48ya_yHPxcz6_cB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX/VcHbJeYkwN3
 UUlLn6i3M9UEmZuDb/z203fOTTA31ONoait85iu/q2hIQeEFaaeORMCR+c9gQKl4ovHr730tIOj
 pr8/LeT11oQaOOcQleTQxc5qoSuCnognj+GXOGguODf03cMFT1weUyulW0b2THQTcV4YzotlKti
 6GdPKBa1TdLC5r295fUIWzi/odcktwm5DI5sxx+PqR4F3SfztR7ezkiBhNlfA72J3czkt9fDy2a
 DahWE9DSaiOTajWipQcOZvmdiGxWj50EuZPgyP2RosuTbiJvx4g/0fUwU5qX87To5+l0xY0XVHR
 0J168PlJ+s4MP9+lHBLpT36fW8CCWYVXOjdzAeVNjhY+6PNGaZTOjkRzGCelGHYpTz6BfR3qxQK
 HZwkYH4R9zZ65wEldlIAuzvqb8uETSzzAIP5clVlfN2z9dEz85KBoph17/dnT+OJb88AlD7P6At
 M7c6DvTS1e7VVBI9mjQ==
X-Proofpoint-ORIG-GUID: sm3gfMHshncqXKdKW48ya_yHPxcz6_cB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_144402_112722_441376CE 
X-CRM114-Status: GOOD (  24.13  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 18:51:10 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> After a failure in the protocol initialization phase, invoke if provided
> the protocol deinitialization routines.
> 
> Fixes: 48dc16e2e52c ("firmware: arm_scmi: Extend protocol registration interfaces")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-12cc0795-af8e-4d0c-8f6a-780a6728de7a
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

This function is 'fun' for it's mixing of devres, reference counting
and manual cleanup.  Plus why is it responsible for the
scmi_protocol_put(proto) when the reference is grabbed in the caller?
There is no reason I can see we can't hold that reference past the calls
that follow which release a devres group but don't hold anything specific
the protocol module. 

Anyhow, far as I can tell the fix is right but if anyone has the time I'd
take a look at whether this can be simplified.
So with that slightly doubtful set of comments in mind.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/driver.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 05092301db29..2c4424aa0d37 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2303,7 +2303,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
>  			GFP_KERNEL);
>  	if (ret != proto->id)
> -		goto clean;
> +		goto deinit;
>  
>  	/*
>  	 * Warn but ignore events registration errors since we do not want
> @@ -2324,6 +2324,9 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  
>  	return pi;
>  
> +deinit:
> +	if (pi->proto->instance_deinit)
> +		pi->proto->instance_deinit(&pi->ph);
>  clean:
>  	/* Take care to put the protocol module's owner before releasing all */
>  	scmi_protocol_put(proto);


