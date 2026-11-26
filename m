Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0949606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6i4VrOu;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z0zHOKBc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fOTaJ6xf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=; b=Q6i4VrOuS9hW+P
	N9LJtp/v8NYSC/qpC/Y3T8CrB4Oy0YrOplpq+bzfttb+oTlQ/EjMs7wbvbhVHT7CRH7KT1bDf36Ci
	nmvUhuZ3jp9pTzUZPvPenDuH/FSee8YDLaA93920tadDOGmNwqJn1D2u7Zbx4fIRmS/UPHECUxxsS
	j2hPrPfseIzCSUaotj/s+QP61Am8h2apv6yfPlrzEUbs+L+FT4hTKkloqK2n+ZZRmcevDpCegF+UU
	NXu3U3dsLlzkdlOqVutXowEoUTHIRJLSLT7ub4IzLyprtRlMQuzP4xPUiUUmFaDCQ7iRPDTVjuVmJ
	8uXqYfRbFWLDGqPW9VzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMwO-0000000BcGA-0igK;
	Thu, 26 Nov 2026 00:02:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMwK-0000000BcFT-3yio
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:02:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APKQlEv848440
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=; b=Z0zHOKBch2c98mCk
	Je3/utDj/6DWW7Y3mEh4ebKMbUBAnaavE6sDooW2+yKA9WF4MLvDCNrrxnZpGZUk
	OCOaCafv5XyyspMKsT2+53w09NWBrzc9Wa7YzSJm52FS05FF+OD/hFs7oJNTkaDG
	8ETlQnfH3znOYTrfL9ahHEdaL7TThnxZAtX6v8llGz4LG8Q4WsNR9KZXYcbRwUrs
	vB7TlXCf0fbJaXsGW7H1GBXdsux12YnT+wl5THZqRhAtzz38m/508b+RnFdSVX1a
	tJrlYI7Jc4D3yK8XuQ9C9zj5x6CBZU+3cVCC22dgAtIBr8wiMR9diMZCi5OJ3Xb9
	Ulfrcw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf8j3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:02:15 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e0a55e4b4so1747903241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 16:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795651334; x=1796256134; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=;
        b=fOTaJ6xfTi8MIsauB8LnpSy+k8Mj7L9CMR9Z43FG41TaxjAfmtIw6t/Zv7JF4H4Idq
         wsAR1/3cqQvfwo78nHkYa9MdQKiq2L3cyezKG8cuN/a/dcL4q013yHxnZ7bzjgMQ/pC4
         Ry4tn++LSDyOWutscCooEdnF+gaWGFTqEk8V16pagIJQYYPmzTD1fRH43c5yN842KbS5
         Mf80HTto08CwcVWuJFz+FB9sf/Y+Vl0Bo8uRyvojSTOuYSjoJTesrL3I9q5Kfe+wS2jM
         wMSzoics5EkuBcB3hL2tYOBW3nWMm8mf8sw3o2yGnuy7MbRDPSGGfJ07jvHLncE7IYC6
         RAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795651334; x=1796256134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=;
        b=e6sUfW7CcuA+QJnoDX39TYiTzKOzkD9d26fPtdVlH/F11soFl6ivSj+WqFzGQlIciH
         DRsv0a2ebo0HjBe7p5Qm8thrFdCurh6+4GbRtT9QYGB7WYNV9CD67LpPlcXv5N8w3V1G
         +jOOUSLMG3Ij4m/H5hMtplcDb6c/mGnCxbiNJTXAR38BcADGUn8g76ZBpUdeTaq5BKXq
         +t5z40gZUh2pqULCn75c00DxyB9AIcyMdeliDL5W0u4GfJi7sceBWlGfxJfBuAO+6kV1
         7ViHpphOtDwTCsz33CaxXDWmZtjYjX2uj8juypfOFRqzHfHPkW8j08De6Ok75rNEVOgy
         t1fg==
X-Forwarded-Encrypted: i=1; AL+hErGuzdM0x328+OCp8I4dgEanTwWFGhBoYk9RfAAHECTkBmZYjSkyl/Ulzbrj41+WLzt4zoirOgVxWXynPEwgeW5E@lists.infradead.org
X-Gm-Message-State: APuU4Z/D99cTaUYY9/59R1wC6BBzw01BUK6WPRg4fqwAGwigs0LlXEYh
	5i/VGlTJ6qd9pUOkIVicCE8Mrv/4xMM7QEcemj6GG8ylU61SQqR1i3alHD5PtPaQN6zSWYTl4Cp
	m6bSyoRA71lD7YBi4+j4Ztb4VBU6dgYoVgbRAMU1H6z/wBotaq9l15OEhESlWDFBYUuKzTzvefm
	XwWA==
X-Gm-Gg: AZFdTZehB2MoEPZLjpdMZXnXD7N1crG6Yiqko/TRjcXcrwZ+wTytTxEI9PgxKUVV/3p
	w0BTZBMM+2o/1NJmWByTYr9ee9Ia2UVJ66JviKBdNaE6NWdue/++ImZitlPbbnrWQrLHkPus4Np
	mlNuOUpFAZdUN/E+P47k0Z/g3sPQDUIfTvDF9q+ZCN6FmgwxuHAYgY8UjsZnltBaCYuyOkmtOy7
	O7b6X7FfuEfYAV8U5Z+aOEON3Uql7MS5DBCqGSU6xHYwekJWn6BqW2PfJS3JJ9tPw0unGgzqqZu
	rqBRWVFrgZd4Wscfg5j2rBRtobj8v5NltXeUOWALluaOfybjEftriAu/Hd/3k0so3Gh0pe92hoP
	bxWFm22ItnahKDjqJI93thx3KAgEGCaCfBBCRp7hhkBaSsHRsrPp+gRIBfJUt4FQhnY8dgGOICj
	HXI2QBYXhdlcNwpJcyy9tLHqFW0sdhSTeCXHs=
X-Received: by 2002:a05:6122:e44b:b0:5ec:b4ec:e93f with SMTP id 71dfb90a1353d-5ee8aef5b41mr10335405e0c.10.1795651334286;
        Wed, 25 Nov 2026 16:02:14 -0800 (PST)
X-Received: by 2002:a05:6122:e44b:b0:5ec:b4ec:e93f with SMTP id 71dfb90a1353d-5ee8aef5b41mr10334927e0c.10.1795651330438;
        Wed, 25 Nov 2026 16:02:10 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:f3bd:f67e:d6c3:ff0a? ([2a05:6e02:1041:c10:f3bd:f67e:d6c3:ff0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm761206815e9.13.2026.11.25.16.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 16:02:09 -0800 (PST)
Message-ID: <1e12ac6a-eb73-4f54-8a79-8da13d6c1638@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 01:02:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] clocksource/drivers/timer-mediatek: Enable the GPT
 irq before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kuisJmJJiGu3xhCbLJhBbNVhM5FYYpGZ
X-Proofpoint-GUID: kuisJmJJiGu3xhCbLJhBbNVhM5FYYpGZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA5NSBTYWx0ZWRfX1Ec/wBI8m1WH
 EtHh6RfIk76FxEYLTK19e4n/ajRlAVmb6HpUcvb3kCSo8vrt2XWr3XMjSkH2WozApGIbAobP9I0
 U3qR37Uj6u8MBZdV3ZFYBgdbaW42j/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA5NSBTYWx0ZWRfX/QJVXyB/SDnX
 RPqFqNLyzD6dC3gGO4aj8yFdhx3zzI9whQko5SpBhc/MHquWuUOq4pI7u/6l7bkeC18lf+m0YRv
 t5jhzI3VyEeeH5Nvx9IRRHTOoCp4I3n94GE50TdNUyBoUWqGR7NnAyVgRfur356dNY+Zb22jV0s
 Wg6FDQT9yeMVT30oMqHaANtlelwT0FjBXt9YDk43TgRop2lQ/CpT66f6GB8i5wPGwzJsgVbmi6h
 xdWHnd1J5LszWLVx9unXj0j7j+fGfznYj+uwQqC++QWOK7rVxoS5rh17SMxjbHtaRiMac2q6/OR
 Q1fexnfhTg9SFEYk5VBAhylmqwZ2VhLzjCqC0dfEY1DoU9Stkvn5wFIMVqAQBCve9I2+OkbXUJ+
 BbkvHeoSKgzRcJTfEZcJPU6oMloaeMHGf1y6pcfzBoN8MCg+J2fP6IeU9lnImR2GS5N9LB/32N8
 yxkbwcrS5Ef6nzKiKZg==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b077707 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=Ll55pq3paLvcCbb_psMA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_160217_138101_D613D373 
X-CRM114-Status: GOOD (  35.33  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/26/26 00:22, Ryan Brue wrote:
> Since the driver probes as a platform device, the GPT clock event is
> registered late in boot, when PSCI CPU idle may already have put CPUs
> into a state that stops their local timer. Those CPUs wait in the
> oneshot broadcast mask on the hrtimer broadcast, and
> tick_install_broadcast_device() arms the new broadcast device to expire
> at once so that it wakes them.
> 
> mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
> clockevents_config_and_register(). The forced event fires while the bit
> is clear, nothing is latched in the status register, and the waiting
> CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
> state in use, this hung the boot in 20 of 40 boots, and in none of 16
> with this change.
> 
> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up.

Please have a look at:

https://sashiko.dev/#/patchset/20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4%40gmail.com

> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
> Reviewed-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # on mt8167
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
> MT8173 with PSCI CPU idle the boot then hangs about half the time: the
> broadcast device is armed at once to wake CPUs that are already idle,
> and that event is lost because the GPT's interrupt is enabled only after
> registration. Traced on the board with prints in
> tick_install_broadcast_device() and mtk_gpt_init().
> 
> This is a resend of the 11-03 patch with the review and test tags from
> its thread folded in. The code is unchanged, and it still applies to
> v7.4-rc4 and tip timers/urgent. As a 7.4-rc1 regression, it would be
> good to have it in 7.4.
> 
> This patch was developed with the help of an LLM coding assistant.
> ---
> Changes in RESEND:
> - Collected Reviewed-by and Tested-by tags from v1; no code change.
> - Cc Daniel's oss.qualcomm.com address and Chen-Yu.
> - Link to v1: https://lore.kernel.org/r/20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com
> ---
>   drivers/clocksource/timer-mediatek.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 842d6ee4259e..1b2cbcc2795a 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pdev)
>   
>   	/* Configure clock event */
>   	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
> +	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>   					TIMER_SYNC_TICKS, 0xffffffff);
>   
> -	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	enable_irq(timer_of_irq(&to));
>   
>   	return 0;
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
> 
> Best regards,


