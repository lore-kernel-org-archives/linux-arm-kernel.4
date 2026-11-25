Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6729606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rqkmCf3R;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LagV5qZU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BHJ50OU4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+3Wp0nakT6agArNabE9QzN5k/sUhhh9EJvtHBgL7nNM=; b=rqkmCf3RJQK45D
	xlaSJr4XLS9cAc6eumgsfBdhVzpwTYm/zciiu5wc87iaG71tGe3j38ychKKotOEVEnBmd0LYNYGTT
	eDiYl9TKSCmx7NnHzo29icJUnJLVNggDegAUB/UIoSvvGx0VKXtOxICgQOrJx88SAdPNG82VUKUHD
	YJ0x+P5k4Bl+Tk+0eL55lv5bmbcQSQ+6xFj9mfd6PcmIKGbPsVHHWKwsIEJ0JnFl5O+FOYR8q8FLz
	MdzxZGlxLX4IydwZhQ54dTLbtaafYjUkofrT2Gubbfx1mBYG/zerR/ZHDrjDFjUF2VzVeWnl65TEk
	P6nHzTu37PWRt6eEMhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCED-00000009qxi-10GA;
	Wed, 25 Nov 2026 12:36:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCE9-00000009qx9-23gI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:36:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mi493642175
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3Wp0nakT6agArNabE9QzN5k/sUhhh9EJvtHBgL7nNM=; b=LagV5qZUOt2uWP6h
	u81683iqi1UCjTeQxGnUvJ2fBiBtCRMEs3p56yQZvkBc3ZioolvXxbqZ36uXp+wF
	zGbUwFlNFlUYXCtONQs7HCeWVQTs8Xv4pPajs5B9pkloApMnkfUjAySC0Up0pEFn
	AcK/hPz1BoWbDEqBGlHMN4SB+2zjAmGnrnxuEWTLEhim9I6I38LC4q7im90ApWq8
	AyBXxZuLi7BfE/5rKlJDkEj510kmldyFZHE28RP1a3Dhln5p1LD1JYR7HsAnvZhs
	OqW2W1TpNhM+fS11eVw5AEeG9AMgClfvwBF9W29/KZpHJFBC+KIKMpVcNxdvJi3H
	CzxowA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aumg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:35:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so4596351a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795610154; cv=none;
        d=google.com; s=arc-20260327;
        b=eF9l2UzWmBc0nEGmWh3Ss6egiFYCr96yWu9HiEdPkSfO3hy6GgvExYWZ6Y7+1Otq2E
         tbd6nMFq/rSlUamLDwrZHOwUgQ3uIBXoDYrw5AFk3Ty6aPMAfhaQRLlRqxxSlRlFJ0kT
         KaYu4eoyNBZBj6av/XpDtHb0Ivpg0qBGyT0TbLn0cvUsn5wCeogNOEQuBTxM54eL+DMX
         5dPUghu6xqq5wBttVBdZEZh5j87my44OHL7SgQPsxhFzepNGMqhNkTVnu6qaULpRtsb9
         71vb7EzlL2bhrO4W0RsipzuU59XtmcqIJcMT9UxP4yXU8H368kjq8sRA43YX6MdsmKim
         Eo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+3Wp0nakT6agArNabE9QzN5k/sUhhh9EJvtHBgL7nNM=;
        fh=lOpD07yQD9tWmFhRx7G6SdvTop3BjD0LfS8gtTRCbG4=;
        b=fb6ZNrmT83vEtKIJDEnvfQPcPOWjeeAdkpxEDC36PqGHxpSHu3XJTP5OoABkUq96mq
         rqCSBJc4VOY9UqUq1prwc45KJUabxBAQlKBkAMJLco7UtSKL3Hj7GC70e/2WzSrTwVtP
         8MkEzWIZJ07IwU6xW47hKmPLbdANLFQJioygBzraUpLgj8LBCrerkJPsBRQYOYpUk6Ot
         RtMNSczmWOY+09u1oIScejthLJhkNmqmtgYccnIIuFsrsbV6HwPYropEG2E/Rj3FTm7b
         7/SnjLGshX+JGJeqLCj7T0HO7jH8qi02yDhQLpZoszZnIxIuaZ2Yo8E3Kshx5NGmHGaw
         q+8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795610154; x=1796214954; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+3Wp0nakT6agArNabE9QzN5k/sUhhh9EJvtHBgL7nNM=;
        b=BHJ50OU4IpKyJjbpFUzn8Pl036b9hYyIMnKGkYTW3PzX6Cz0qx5NzadQaLNWoR7CD9
         ouCSeouPRf75XS3J3x4tCq6ho2xnaB60TPKZ6Kfe7QIe1mWv16GZl1a/VDosnngnzQhK
         hLNcun4p779fx8w5uaGfEgRoPHZswRtRpAtzhRYM8ehXE3MKi0jMDDvW6eilgFjH2nhK
         kur/k68dwu2jrywgsF04lR2aUUehYT5JfoQm4CRQ0ojDDLunxBbsyS6tQB+ZfjpN9OTQ
         vU9bCqNhms1gwJ4DPnOgfKM1H1j08hjClA60+HpAo9Nm82wl0sa8LqqiPutP5F4fOO9b
         1kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610154; x=1796214954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3Wp0nakT6agArNabE9QzN5k/sUhhh9EJvtHBgL7nNM=;
        b=AsjvTt0PB4I3IPoHHqlAoPhU0lgbGQ0pGEu/HMdX1FeU5VKuVAz9uvu95aYoHzo3PJ
         rGvbI8eEdB7li8MOVM+DkfsPxr4iXXGtTuRXhF1qwmZEfswXha62juiA/n8w4l+GJMdB
         ODdQ09NaGFi07KSELNudWljKSyS128sATtMkePxj4cuJmO+JgxnLUKBTAbvMG3pxWhjz
         sY9gu2t1ohtACpiWjJvYXmXilmeO/TN1wPyoNEpngRpYrf0GyaBu2HRS5bf3lHGwxjdE
         h4lt3rJEJyCVObXqy5Wz3Cc6Z6Imd+C3hiMCNREwYDjhVD64MEAQw94sb7C4Vcqo30Fx
         njlw==
X-Forwarded-Encrypted: i=1; AL+hErHq8thf1ZORljLiW3O2+c5M8+/hrqOfkmNS/lQL3r4Px4CZFUrjuDkvFq3M3B8q0pCuHDG7anw9x8QU8WhwDwbY@lists.infradead.org
X-Gm-Message-State: APuU4Z/cEnS0//5D+iJ1Oe3E4i7KEre1XhP4We/J5Yte+PKLnTZq5pM4
	U1yMGkgfmf/6Zg4qzA+CRarBFBtyYp2kVmMPmuetzYD//7W2p8TkMw4dRFt/WRp4SG/FkgcpZuz
	izVb0Rk1eKCewUwAqRgX5ySj2aNO5qwMZ1g126rQ6ll2vJtZFCspKf1nipkoXDlyjKxppOT5DZw
	vErMuxEd3ZM4V7+JN6UpFn7Q5l+rcoov1ea/FNyuBd0dYNmEJEhAQhywdPNG3tBzE=
X-Gm-Gg: AZFdTZdDBt/8Z31ZlRLeD6I8+KCVN/5qbIhTZsGmPiHcXKXxQgfIuCBXjblJTIRKL1a
	kP9M8iUb2OPgUYeO+/Vxd8JDsHZsaJAynhf9O914h0X9dgQuqEM3tmStK9MNv5dFCsycr99uo4a
	vfv0jcvkAyQXrvLGNgrGbmc+97EkH/iFtXL/f8DvGXtzUl1nyCotOxlB1LjA==
X-Received: by 2002:a17:90b:2cce:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b41c909001mr16588221a91.21.1795610154210;
        Wed, 25 Nov 2026 04:35:54 -0800 (PST)
X-Received: by 2002:a17:90b:2cce:b0:3a4:967c:6947 with SMTP id
 98e67ed59e1d1-3b41c909001mr16588198a91.21.1795610153699; Wed, 25 Nov 2026
 04:35:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
 <20261104145502.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
 <CAPx+jO8_gCHgkeTB4aQDRjs1xwvXCB=zFjFBHB_UwqeOWSUEZQ@mail.gmail.com> <cc9c816f-eebe-4f29-a8b1-32c967c27722@foss.st.com>
In-Reply-To: <cc9c816f-eebe-4f29-a8b1-32c967c27722@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 13:35:42 +0100
X-Gm-Features: Aa3M54ofjiIlywJjaTlNlnZrdM2sYCijlbq0js0DVsDfwYEcKAT0z4AyXuoBXvk
Message-ID: <CAPx+jO8d58tCoEL52baYMzjJ9VzyfpVNhruKAhrHrnEwuOoJig@mail.gmail.com>
Subject: Re: [PATCH 2/7] pmdomain: st: add STM32MP power domain
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Ulf Hansson <ulfh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06d62c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=8b9GpE9nAAAA:8 a=rfZIK_W7AAAA:20 a=NEAV23lmAAAA:8
 a=YQXNl9ZGkXhj2O3QN9AA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: q2J_LpdUs46_i8TH7eCn-JfQvNo8V5EW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MCBTYWx0ZWRfX0U7FSF93CQV6
 0sQjY1sUu0kTOG5pSCF5pcmZ9qfKzqn5U82VH0/cZeFSn9lMwqQOeLUtgad8Ub4JQMVObP4Mjf0
 y8+AfFdeE0pVoAJ+pOx6TjPVtjFQuOohDjSSVu2CyH52XfCYyVU+AmdgCA9oLEaT62S3tTg/yL9
 2Cn3PQkxcOqbf0ESnw1p8ZzgpXWpsnKejTyQfIk8p70htWmcDxNJuYI7gQX3E463SH9Kkl0qzKa
 n9lplj1/pd9CmDn75MrVZKQq+69jEzu4VRFv++UcZktZCaPBSo2cPAvpvcfHaUQRmoIkD6SmDn7
 OJwKTW4SKH8Rg3vbKpChAkn09107nH2/xKHmm8TYsYrQRokDxivf6EFndliIKm1iTNlDtoNPu4h
 KPsmhyxp3RIasR3bvn3xYa7zgaxr1X4A4pfaqDeXkbtc3TZCieg/RrVJsjFGXfUjL/H8mXfkoid
 WGw2yaLH3M8/HZ3c8DQ==
X-Proofpoint-ORIG-GUID: q2J_LpdUs46_i8TH7eCn-JfQvNo8V5EW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MCBTYWx0ZWRfXy0F7Rortz5gZ
 gaswX3SFgpNeaMJNIWe+PulZ9ahwsXYMhddYSBOlCEZzZaOaE+d5QXMTPA5niIJRtcjpIFMzArF
 dP5IyjvML5QYs15jtv2djCduK1XHCao=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_043559_024336_9786A21F 
X-CRM114-Status: GOOD (  37.98  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 4:11=E2=80=AFPM Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi,
>
> On 11/14/26 11:40, Ulf Hansson wrote:
> > On Wed, Nov 4, 2026 at 3:02=E2=80=AFPM Patrick Delaunay
> > <patrick.delaunay@foss.st.com> wrote:
> >> Add a generic PM domain for the STM32MP D1 domain, using the PM
> >> framework to manage attached devices.
> >>
> >> Make D1 a subdomain of the PSCI cluster domain, so active devices keep
> >> the Cortex-A35 cluster in Run1. Do not set GENPD_FLAG_ACTIVE_WAKEUP on
> >> D1: system wakeups are handled by EXTI1 through the RET_PD PSCI domain=
.
> > Would you mind elaborating on the system wakeups a bit more?
> >
> > The devices that get attached to the D1 PM domain do they have another
> > PM domain as well, to support the system wakeups?
>
>
> Each device in D1 domain use
>
> - D1 domain to allow any low power mode  (Stop1) when they are suspended
>
> - EXTI1 interruption to manage wake-up patch
>
> For example for UART:
>
>              usart2: serial@400e0000 {
>                  compatible =3D "st,stm32h7-uart";
>                  reg =3D <0x400e0000 0x400>;
> -                interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupts-extended =3D <&exti1 27 IRQ_TYPE_LEVEL_HIGH>;
> ...
>                  power-domains =3D <&d1_pd>;
> +                wakeup-source;
>
>                  status =3D "disabled";
>              };
>
>
> Then the system wake up for S2Idle  is managed by EXTI1 device wake-up st=
ate
>
>   when interruptions are activated.
>
>
> Moreover LPLV-Stop1 is not allowed when EXTI is "active" for OSI, i.e
> when at least
>
>   one interruption of Group2 activated.
>
>
> To explain deeper, when  OSI is fully activated  [1], i.e with full
> upstream for STM32MP25
>
>
> - the PSCI power domain Cluster Domain allows "Stop1" and "LP-Stop1" low
> power mode as CpuIdle mode
>
>     - D1 is part of Cluster =3D> the device is D1 domain allow low power
> mode when they are suspended
>
>                                            =3D> active Wake-Up for device
> in D1 domain device is compatible with Stop1/LP-Stop1
>                                                  the wake-up path is NOT
> propagated to parent domain
>
>
> - the PSCI Retention Domain allows "LPLV-Stop1"
>
>      EXTI is part of this domain (not yet upstreamed) [2] :
>
>
>          exti1: interrupt-controller@44220000 {
>              compatible =3D "st,stm32mp1-exti";
>              interrupt-controller;
>              #interrupt-cells =3D <2>;
> +            power-domains =3D <&ret_pd>;
>              ....
>
>          }
>
> the Group2 wake up sources are handled by EXTI1 and but they are not
> functional when the LPLV mode is performed.
>
> We handled this restriction by EXTI patches no yet upstreamed [3]
>
>      - activating the wake-up path in EXTI1 device when at least one
> interruption of group2 is activated  for S2DIle mode
>
>      - with EXTI1 pm_runtime state for OSI mode
>
>
> So the "ret_pd" domain can't be deactivated when EXTI1 interrupts are
> activated for runtime (OSI) or
>
> part of the wake-up patch for S2IDLE
>
>
> [1]
> https://wiki.st.com/stm32mpu/wiki/Power_overview#STM32MP2_series_power_do=
mains
>
>
> [2]
> https://github.com/STMicroelectronics/linux/blob/v6.18-stm32mp/arch/arm64=
/boot/dts/st/stm32mp251.dtsi
>
>   https://github.com/STMicroelectronics/linux/commit/d216f8439d14e0a11475=
495cf5445e05cc4a9da9
>
>
> [3]
> https://github.com/STMicroelectronics/linux/blob/v6.18-stm32mp/drivers/ir=
qchip/irq-stm32mp-exti.c
>
> irqchip: stm32mp-exti: Add support of pm runtime
>
> https://github.com/STMicroelectronics/linux/commit/4a4a20f5c5aae461a7a14c=
98efeddbc9cd08c672
>
>       irqchip: stm32mp-exti: Add support of wake-up path for S2Idle
>
>   https://github.com/STMicroelectronics/linux/commit/1d3b854e7b95318b67af=
d2dc16b8ff5fc060443a
>
>
> >
> > Just trying to make sure this gets modeled correctly.
>
>
> I hope that follow the genPD model...
>
> and if it is the case , do you need update in the commit message to
> clarify it ?

Okay, thanks for sharing and elaborating. Even if it's not entirely
straightforward to me, it looks fine to me, to model the HW like this.
Although, in the end you need to convince DT maintainers to accept the
updated bindings.

However, there is a fallback option as well. I think it should be
possible to drop the D1 PM domain altogether and instead hook up
"usart2" (and similar devices) directly to the cluster PM domain. To
allow deeper states for the cluster PM domain even if there is a
system wakeup configured for the usart2 device, the corresponding
driver can call device_set_out_band_wakeup(). This informs genpd that
it's perfectly fine to do a power off during system suspend, see also
genpd_finish_suspend().

[...]

Kind regards
Uffe

