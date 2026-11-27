Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688EB606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E3dJNESF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VxWSobvw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eoW+lZTK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QRXaT7m33FfxGbFmgr3v0S/RlKQdbib0fZkTMdO5Vqo=; b=E3dJNESF3fSOhf+mZjZyUthuWw
	dg12uQYLys712ms0Pb0J2kQiDaLsbcS+evmxUqgajA+B+NqWZgONo/9t0wj9EsuhBtp1qTZmI2HZh
	VBC3bA3ryOYA1Y9sLatLSwOufpUjHhrkz95ZTpP/7nNkXW5Tayedfq9RbB7W3WmjxUXziwOHlC9cK
	9DauBUbWlLejNiD0JwzW20TMV1bND3nj2Ab/ya/5dvxyQGlHqr0DUDuFHrrngmHXAX6Vag6VcQMxX
	P9KM4Z+pyv2XR4lP2NIdgQl/kqsc2GJaVrnNywn7oUzLyK03OP8x7CZfquJFAJbGv8jUo8nNzAmQH
	o5LfDjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxQS-0000000Gg5B-45Y7;
	Fri, 27 Nov 2026 14:59:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxQR-0000000Gg4c-2HhF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:59:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1LmO3089135
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QRXaT7m33FfxGbFmgr3v0S/R
	lKQdbib0fZkTMdO5Vqo=; b=VxWSobvwbr9r3+aw63q5pAStU6sdeAmRgkcLZe6u
	mEj7o5+sWw0ncbbTC2bruORIS2h/QGsNmJOANfQD5fCr4HxCXRKJjxjAMNBxBifI
	vgMlyt/6LyMIMHk85o1uFkalIEG/7S9TGp+hTiHq227fgTEiYdAlhF5noKOQQsTv
	MpsfOpHpy1pzNvHUx4o+69gWdArpu6tuLwhC2cyK1+g4bZBGiU652Lj3lIBxUPpL
	fgJjZt7iDXLsylKCrHU1HrhBZIgzMpauaJvUdixi0oqIhr65mLfoc/BCRZlsaIhg
	ULw97GEHUMqKsiwbo9XCh69JPBHu0Eoe9z4WQl8mVJzlMw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh9vfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:59:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b49dd1e77cso4715563a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795791585; cv=none;
        d=google.com; s=arc-20260327;
        b=VKFHl7UcCwCEdkomleKbgGt2wW56m2RJPlGYl/2mZIonzKDmfM+QVYgf8Xvbhx7XKR
         xRlKgIY0SOsrjKTdsi4472yr10taO0DO8lnAf8OcI5ay08CI8ZNGlAZz8H2dT19oNhia
         cfFAmcv9/6cWUYIv3ufGk7dqmcH7sVicONCs1tOg0t1UskqwMH9QHsar9bkomV9x313W
         8j696RuTqEtnKZh58a6AT99HdqE1+QuFNCCbRErgISK1hQYf4l0DBkVHlVMB+7qWPD+R
         gAh+kRNbfYgS7t8eJUaDGW8sfirNXhGUFWTOKvtnMJWy23TwaOty1cbhe2a7rsQtGn6W
         JehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QRXaT7m33FfxGbFmgr3v0S/RlKQdbib0fZkTMdO5Vqo=;
        fh=oAFu8a78VoLmD80Yk9LylVoP6v0z4ScE8jzJV4Lw8fE=;
        b=bS7b+gJLHdMIQRBNsjc8GrliqNQvo4gt+nmaqbog/TYeoZpSFQ3GyUrf62iHWRyqQa
         AJz2QpWoHwda6nVeUvMSROL4p6TTpkKiLcRoe/rFKEy9Q4DeorTLCerUb+qngNEtX54F
         xXmXtpQMDzW16+Qk8qIJLxsPij891avuW1sLbUmLE3cgZQvFXrF58mg7o/5suvb3WmZF
         2p9BpFjQul0T82gyJGjTNNZWTlCXnlKKb0HUMmbZ56g6hZCfC2IhTbRnl2tV2vvxhNJR
         ka1SE0U03TL/wWc051Ba5BAgoGmSOoERCXbO3t9hBUgAulFnm5R5rMgoVPuIo8uy4zg+
         gahg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795791585; x=1796396385; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRXaT7m33FfxGbFmgr3v0S/RlKQdbib0fZkTMdO5Vqo=;
        b=eoW+lZTKhD9zzlKaZIEl9JcPyMgE8pgYf+lLl9lWLXlWkGQPcXAhbIh1SPoEkchz2y
         UdmW0/mmSz2Apz0uZMaJOuTi+22SWqGYp1Jm/aUFJWkfACi3LjfnOicOOcGsz9No6nca
         QFQv9loGw++KYHnrGsIp+nd9R0AYSPBYyv9Kq/MF4MplHDPlbGsqCk9aXMkuyMY+3kFs
         Fe3IN8ci6QT4Q89jjSxMQTdo+jo7lyUqsQSdCnGWVpV/J/zDgMXL5+wDrTsSKBK4izdV
         g+q8eBLCH9pyXUTIfW5W6/PCUHaKoUKZvwrVZusRgldZCYxFrbdO4sKLN0qnnilN1bjR
         WK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791585; x=1796396385;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QRXaT7m33FfxGbFmgr3v0S/RlKQdbib0fZkTMdO5Vqo=;
        b=lsKiXw5rorDjLz5UEFJJ1p2Of9RIQGz33nzpx3WM3to8EIqvCXY5+hut+qEIJFN0GV
         WUr3TTf2VluwOhHJ4+nmDGNbRj2ThKLVuQLYHDPnLX/5nGUbytGIf76thzhi528JDXWf
         bM0IGsZ1ZHJfJslB7SuznX0WQJDlVMKHWRvlvYfcy78MwP5GQXOnhd7WYoYcoH781vii
         ARvIbZB9vYXbCgwzohbS6wpJ/AWY+jp4r+FVymca278TbdUlLw9E2MINzwXnRmA3vstQ
         yptT+V7eAPiV+pJTBBTdFQkmD2TNZNdNhiaHebPoitLTer1VhaWFcTEYsJuLx7lxXvcG
         ibnQ==
X-Forwarded-Encrypted: i=1; AL+hErFsC/L7iYfKu6spkv0Em6JDFv0vNnTDRAZkw7dDsd4qM5miiZlTiohqfbLwftfzs6eYTOjuZn/FnGfwEJJFnzvd@lists.infradead.org
X-Gm-Message-State: APuU4Z+L2DTD6YDpJuuRmWM5X26/SyElv4dnnMkaieRRKIuUhB3LG7aX
	HVSoGd83Our0gMFGwIbZWac2RXtqLTI8C1BQ6u/V6g2Um4zXbbrL+KV3GJeCaIT4iylaQI81Ksq
	wBAzNtze2UisWuKJ/ZulOQsB2HT+dhibhID4AAaOYfgo131mSdy/ud8TFZrkj3BwU54c0QTbT7d
	uE9DWyBghchyROnarfCauQh5K6HBCX5Do790d74OZgQLP4rWup80FW
X-Gm-Gg: AZFdTZd+TdQqlIvo4Q4y4D+Vxqah2YlfqQKYUiEu5VzzxIT1dKr1GF31xqQOsvCIpPm
	MKZ44wj+/qOYaPgNDAbEC2iOk4epwVZZrviBNrXUvJ18U0ti2see/LGEZlyykE2Hz20u+f6WscO
	IfW00FoJG02SASlHmnbePtIsvc2x8XOB0F5NUaBnpAGSWFKfqh1pFL3W6OoQ==
X-Received: by 2002:a17:90a:d2cf:b0:3b3:b595:2473 with SMTP id 98e67ed59e1d1-3b41c906b61mr22660397a91.24.1795791585485;
        Fri, 27 Nov 2026 06:59:45 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b3:b595:2473 with SMTP id
 98e67ed59e1d1-3b41c906b61mr22660369a91.24.1795791585008; Fri, 27 Nov 2026
 06:59:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
 <20261104145502.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
 <CAPx+jO8_gCHgkeTB4aQDRjs1xwvXCB=zFjFBHB_UwqeOWSUEZQ@mail.gmail.com>
 <cc9c816f-eebe-4f29-a8b1-32c967c27722@foss.st.com> <CAPx+jO8d58tCoEL52baYMzjJ9VzyfpVNhruKAhrHrnEwuOoJig@mail.gmail.com>
 <47a78147-8504-4186-8e68-2d20d3832541@foss.st.com> <CAPx+jO-XcHTyAxdZTDQ6skJxdYRa8z9T5Nz2+naL8ZqC6pakag@mail.gmail.com>
 <900d21bb-f87b-40f0-80be-d21ce96ec202@foss.st.com>
In-Reply-To: <900d21bb-f87b-40f0-80be-d21ce96ec202@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:59:34 +0100
X-Gm-Features: Aa3M54pJa8nqckNkm0XhArNlPAOWnvyOaTRiqd_KD6wsN-IfEnqLCmj_JS1jLo8
Message-ID: <CAPx+jO_pj+T7ZY9-9+vm3S0EHXTsBY1L+O1y8wOWU0_t6r4=YQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] pmdomain: st: add STM32MP power domain
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Ulf Hansson <ulfh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OSBTYWx0ZWRfX+TPzRaWPSR8D
 c9kzms5ffGOJFBBUyqtfiZ147PQRoxOSnhp4hy2j/7r+/Zg1Ti2OFErhauH27iQDsX83yotuyrp
 QbVBHDJRhCb0YhGDLt3KuoZU67CtrSM=
X-Proofpoint-GUID: XC5smbk7QsqflWnC8kt1eb4h-HfcxAyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OSBTYWx0ZWRfX91LFDrLod+Ew
 z0fog9fgQfmCGjAgOrnu1/VBj3Wpf/0XgwamxFvfnOEvn8Ww68w/n8lNrRs+r55Y2+Z/RFQsaA9
 54CedwlxFfdaMgkmmoa3GKtJ8suN5AviJ5/FzZ6z/A0ZP81eDA5W7WF8oDP4Cm+WPblex6qiaLS
 GPU4RxmpvbaZM7hOu4+VJkKH3neZXKg86MDNYN+e6zAl3bT9kXQaM7OdCUj0/pb7/dgYqr/qOEX
 tr5G2EMMu71S0Z0TMSFh3DyOd0E55jqiV17g1520ZdcCZee1ShQjI2xTbVMbtJ/wGp0xIyEpOPD
 OlpUHnQUW0+c/tgmf0Aat6cRAoIOOUMdodUiDwTIymp4pf0kSN96hoWgAJRi21o+10++cEFzKAS
 rvj2SlBugZKaSd9yIJWkBkd5NA82Y+tBJ8OPnxKF2J+h+8wHx2F6JOH3uvs2SmcsBfkyT+8um11
 I/itsMAUTpokD/Ksdgw==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b099ae2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=R-Zjbl0nVnF-b6xtWdUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: XC5smbk7QsqflWnC8kt1eb4h-HfcxAyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_065947_704712_FDB91FEB 
X-CRM114-Status: GOOD (  27.24  )
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

[...]

> >
> >>> However, there is a fallback option as well. I think it should be
> >>> possible to drop the D1 PM domain altogether and instead hook up
> >>> "usart2" (and similar devices) directly to the cluster PM domain. To
> >>> allow deeper states for the cluster PM domain even if there is a
> >>> system wakeup configured for the usart2 device, the corresponding
> >>> driver can call device_set_out_band_wakeup(). This informs genpd that
> >>> it's perfectly fine to do a power off during system suspend, see also
> >>> genpd_finish_suspend().
> >>
> >> If the device are move in cluster power domain, it is OK for S2Idle but
> >> it is not valid for CpuIdle
> >>
> >> For example when UART/SDCARD is not suspended, the domain cluster will
> >> be powerered-off
> > No it will not. If UART is active from a runtime PM point of view,
> > that will prevent the cluster from being turned off.
>
>
> Sorry, I misunderstood your earlier point. I have now looked at
> device_set_out_band_wakeup(), added in v6.19, and I understand
> your suggestion better.
>
> For devices whose system-wakeup signal is routed through EXTI1, this
> API could let genpd power off the relevant domain during system
> suspend. It seems straightforward for STM32-specific drivers,
> but may be less suitable for generic drivers such as EHCI and OHCI
> if they also need changes.

Right, good point!

So we may need to add corresponding dt property to allow us to
describe an "out-band" wakeup. Maybe something already exists, I don't
know at this point.

>
> My reason for keeping the D1 domain was to describe the SoC-specific
> power-domain topology in DT, rather than requiring individual drivers
> to know about this hardware restriction.

Yep, as I said, I am perfectly fine with this approach.

>
> Nevertheless, I will use this API if the D1 power-domain binding is
> not acceptable and the devices are attached directly to the PSCI
> cluster domain.
>

Makes sense!

Kind regards
Uffe

