Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C6E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u16SKOpv;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1nAz1PX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dG8RP8A2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Sl+H6myFzS+PLgrCo6MpKw3V1wNePOGNvCERMaPH0QU=; b=u16SKOpvqmNJtb
	o40O6lrManhBdrFjg1KSwVmdutObrc3FNP2NaPjug+F4rgrRbQqYUgUb4sCP2DviTKAsoQXdZPdMh
	eZzImFz3R8iYMxf69qtfYAMdK2HF7tm02d8OH46MBEkncpRk2YlqB9AHZGxrZCnyF5JWURNvPVWT7
	7kViDq9azATQBbM6J7V+RrzncX/sebS50zyA+tMFMgTthBUXBvA5liU9q8cXfHb5JERCnynh8Sx5A
	e4fleKada5d7qSiLtCyG5UNyr8p27T2/NJqvwH6WSxe/8482lxgxHgWUTvntDIX69hG2qYUNR0XVk
	+IM9Ay3dz3/wWYNTJ2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7aX-00000006h4H-47y8;
	Wed, 11 Nov 2026 12:38:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7aU-00000006h2n-2Jzp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:38:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZRdt1250830
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sl+H6myFzS+PLgrCo6MpKw3V1wNePOGNvCERMaPH0QU=; b=D1nAz1PX82hWEvZm
	zlE+Uj9z6A+GuhkXBfOYZZwvLm0aBrQeeC+jzBAz+QlZPo66nNePlKUNLmPh824J
	Gg01qV6wbvQ8LNumDuwy324F6mwUu2asPtSYP6uQX9RjFkfEqrP7cFtxFutdrjJ2
	1nyOayWjur/PdNuJzmDWWo1+SxRm/7hmluxo+KtT0A8VHJOrvL71zz9catuAerBO
	G8ry64nSjZo7rFNZUe0i43cjOo9aHsS9li7QPPYkkWOY0yBI60Dk0ba2ENK1E2gE
	kHN+za2+YylpB5Od+ZvfRkSjAMVtnlHtR3dKb47FXoBiA3f2KGDgbUcMzDrZFL/5
	72NZnQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5ma39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:38:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so2435112a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:38:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794400680; cv=none;
        d=google.com; s=arc-20260327;
        b=gVlv7Jz9N51px2GQanFAawGPgxQOBSWVKFI4dW+G5NI19olsCFaKsob2w0EePdYybJ
         ltv5brsPbjP1kUDm2D6ZDjnxwzvjSjxTL/ZusCvQOBje2RehWnQwab1/svjcgsJaAWOq
         AJCAJFDV9pXegWycMkjIh7c7gA8nsIOl3ctW+ThEdsRCsvmgvczEil7hVVxhs84MerVW
         yTQ6ZfQiyezSMgKs+etT3cIHmgi3Pcmuo5OUKFlRICLEwSCckJJPmJeg8+1AjMhVmpOn
         A3rCQLWnsMJclgnMfG8dtFitLDLfVVBZdxLpko+yH/qj9z+ddsqym0exnG3jXRMXqBlc
         x2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sl+H6myFzS+PLgrCo6MpKw3V1wNePOGNvCERMaPH0QU=;
        fh=SXNlW7niX1nLWl77+SYrUgaBy6FFtBBW5eSF2u1HEs4=;
        b=Ye5UG911Cj+lHNq+hSb3T4vaOAGbtylB0WQPi266QbgL2MEKV/VVcLFf32KaIy9k5l
         rb2DeY+e7ehBg20hss9teVus9IKO7Gu57XbiN6tyvKVa13l27P1vzwQgjit4G5A94xve
         s504DVBDHFzoZWUfS9F09IyEF0y3XSgic51rDKAe/PUB0z+r+wWYE0tHBcYAPDoSugq2
         MRUWaFMynQDVvhF75NOSz1cGOxJpwfRzPBbg0pfLz9sFZg67PhJvurRumA8oW1VUShjl
         qN/4r7rQeKVU1T0nwXenA66y1LQCFzIniwyzrZOrL+pC/BrpVasQuSNEqWlLu36uA5rX
         WdoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400680; x=1795005480; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sl+H6myFzS+PLgrCo6MpKw3V1wNePOGNvCERMaPH0QU=;
        b=dG8RP8A2F4KFrPwmO6SerdgBYTrUGS40EbuoVjfsyhdDpXJS+e2TBQtMEnIF8VUyaX
         opSVwqEjOEdKR/AjzeskW333xJbVuOnYHv5TZJotIr0W2U232C75aeENURjc8kQWdhS5
         iFeEuVEZMbavrp38CrAFt6pqF1RrDAWvSdClE8UfWjxirsD38AcDbItFwjN8pIYOkXSs
         iaInXA/uGku2kEaXMMzR+OIbGdoJ4m3P+xnkP5B14jLo38yUsPdLcV7ud981nX7/tTAL
         HFDE8YjuyGGagCm08WLrGk4hLoPxl5dvEppdhRgvB3zD8UGuj1A/SdZ/9FEGZfQiilC+
         9IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400680; x=1795005480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sl+H6myFzS+PLgrCo6MpKw3V1wNePOGNvCERMaPH0QU=;
        b=kOuZDPkGsAyRGmwW6hUdgyEI06SgdILVKflJorvyB/JGALMtj+QesV/WPgKwjemzd0
         pM5of0rvHHUMd9x4WNiEhtFj9IxbSsuvpeTi1wlLUTjR/cMEM+rti1G0P0C5Qbub7OQm
         E2bXNRtAFGVUDVEEGjvMiN2rLZBjAOmDd04PnnHkdYtQLjsmsnOH3S1Xs158pvTVa5Pl
         aC4RGAv6ZkL/70wuSkknBQSIwiLjImJOhad7kR8xtmLOYrHyR2IRn9GAC4yX7II/LsKl
         kxPCRVHHLtYtl9A9t5zuKzIE+wEgaLiI2lCV0dgNtPACa7anWliMeTo3oiLpfhVEHXbx
         XxLA==
X-Forwarded-Encrypted: i=1; AL+hErEkkMvm3aP9Pmrsh4tiBiIGn9KRpVUaAFavw52tb3cEVbauA7R8J5RjfMPcw+NZajlUVybJ9t/N69B51J/GJC0N@lists.infradead.org
X-Gm-Message-State: APuU4Z81D+wwIIqeKKcLlkCQ2D92lHTBqe8m1zhnMgn/O5sxyZRXfI6+
	0dSvL2I31J8cBe7uMCVfBVB1zuhlzfLHjN+FMqC3c995FjdGeJ1DEzPrnhy/Xtz7fjdHLDWAuWe
	pLcnHUDWF5WUHZFs2un0KTN36r+5y+t614pftu6kF1P9h9OCc++QBzOrvwVId7N34drnwmtLDg3
	C2iczZ0A50/Q0v8P1hAx1KH/fjBAyJEOxW5uolnS4FMGZM2QpaSVwK
X-Gm-Gg: AYBFou3sTJHiNNiVXZzjGy0CaojYLFtwKnXiZot8e6bolOKsrmnipgR95fEK5jIZE7/
	Hz6dhLdR/DFDdKwv3Y4DrHeAKiT93pwn3My+Hm5a8HCUUjal2DhG1FXu7vcRzPdcQvxXKicD/OZ
	myC0oQxdXQ5KL6akRJSJY7uSIC+PUknPHpkSnUWr1gLSiahLT2FS3yDqnKHw==
X-Received: by 2002:a17:90b:3e8e:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b182ebd6d8mr2253715a91.29.1794400680079;
        Wed, 11 Nov 2026 04:38:00 -0800 (PST)
X-Received: by 2002:a17:90b:3e8e:b0:3ac:a139:1b13 with SMTP id
 98e67ed59e1d1-3b182ebd6d8mr2253645a91.29.1794400679508; Wed, 11 Nov 2026
 04:37:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:37:47 +0100
X-Gm-Features: AclHuK-cqjptPhOeAZDAprp1BC5PiabrNZcICPPmo2aCEWkLiSCBH4JZZfu4Ecg
Message-ID: <CAPx+jO-cq68G+wnqjyaZ00P3d1SVftjycH00jiZ-KGPK-2nCYQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Shawn Lin <shawn.lin@rock-chips.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        John Garry <john.garry@linux.dev>,
        Hemanth Selam <hemanth.selam@gmail.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>, Rosen Penev <rosenp@gmail.com>,
        Fan Wu <fanwu01@zju.edu.cn>,
        Marco Crivellari <marco.crivellari@suse.com>,
        Pan Chuang <panchuang@vivo.com>,
        Zhan Xusheng <zhanxusheng1024@gmail.com>,
        Rakuram Eswaran <rakuram.e96@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Ethan Nelson-Moore <enelsonmoore@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Runyu Xiao <runyu.xiao@seu.edu.cn>,
        "open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
        "open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>,
        "open list:OMAP MMC SUPPORT" <linux-omap@vger.kernel.org>,
        "moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
        "open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>,
        vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX2IC7RA8WInl+
 P5ULWGdYT4YJeqI054vUV16dJSxp4ZPq0TnquBqM4ATrWmQfMw3msHaQV0WxFioYtcUGwPQZ9hR
 l6kcgUjjPmhKx/ykelRmO6nLjej5yVZJo2Iw22yB/aZ0GACGJ25c1T08IFJw51aVj/BIHi70/GB
 6pPmFf2IGtESufzddazLQqg1X+qis6JMkmmfWaPPcJAR0mJYUC4h0iZMJIhbcF53Ju20fUVYzC2
 CHivYpE4oAa/VuL9kDlekB1aLVdIwfo2+pYMSpF3EjVQOZScKqW1M0VFlafrhYR6MIz34bc6Vus
 /o5YFe26D8fIlspK8u3FFBDXLkGwIjKj8BhSwxvT4muoL/7nvrjy4SNeuVoKiXXdBduFphnxjyS
 Y5kw1SOvacEeaj3wf+h5FoldRhAakBiGsQvLZw/PYUMS2HF1V6MMqPVaEDnFqxcnv2CrNWmKBov
 UoJFqCCT5VMn3zse8WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX4f/3phKOswpJ
 HVNkvihkCvyuYITbNuG1FnRrT2JPTCU+cDtbI1CmR/ekPUaD+lsz1/DPmHUM81R9PjT1rCu2M0/
 9EdlJxZjRnXyKZvdZucdpBPxrzhQyFc=
X-Proofpoint-ORIG-GUID: WvFmThp_q77_nZaQWHaSJR8CFgstRc7u
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af461a9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8 a=KwruqdAL4-zTymEPFJgA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: WvFmThp_q77_nZaQWHaSJR8CFgstRc7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_043802_713352_35CCB912 
X-CRM114-Status: GOOD (  21.98  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 6:21=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across MMC host drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c             | 3 +--
>  drivers/mmc/host/bcm2835.c               | 3 +--
>  drivers/mmc/host/dw_mmc.c                | 3 +--
>  drivers/mmc/host/moxart-mmc.c            | 3 +--
>  drivers/mmc/host/mxcmmc.c                | 3 +--
>  drivers/mmc/host/mxs-mmc.c               | 3 +--
>  drivers/mmc/host/omap.c                  | 3 +--
>  drivers/mmc/host/omap_hsmmc.c            | 3 +--
>  drivers/mmc/host/owl-mmc.c               | 3 +--
>  drivers/mmc/host/pxamci.c                | 3 +--
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 6 ++----
>  drivers/mmc/host/sdhci.c                 | 3 +--
>  drivers/mmc/host/sh_mmcif.c              | 6 ++----
>  drivers/mmc/host/uniphier-sd.c           | 3 +--
>  drivers/mmc/host/usdhi6rol0.c            | 3 +--
>  15 files changed, 17 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 98933be5f1744..de4ef7a675892 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -1172,8 +1172,7 @@ atmci_prepare_data_dma(struct atmel_mci *host, stru=
ct mmc_data *data)
>                 goto unmap_exit;
>
>         host->dma.data_desc =3D desc;
> -       desc->callback =3D atmci_dma_complete;
> -       desc->callback_param =3D host;
> +       dmaengine_desc_set_callback(desc, atmci_dma_complete, NULL, host)=
;
>
>         return iflags;
>  unmap_exit:
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index efd1903c3ccd4..9a2c995577d46 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -506,8 +506,7 @@ void bcm2835_prepare_dma(struct bcm2835_host *host, s=
truct mmc_data *data)
>                 return;
>         }
>
> -       desc->callback =3D bcm2835_dma_complete;
> -       desc->callback_param =3D host;
> +       dmaengine_desc_set_callback(desc, bcm2835_dma_complete, NULL, hos=
t);
>         host->dma_desc =3D desc;
>         host->dma_chan =3D dma_chan;
>         host->dma_dir =3D dir_data;
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index ff0b25d287a94..15c65aeea8030 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -884,8 +884,7 @@ static int dw_mci_edmac_start_dma(struct dw_mci *host=
,
>         }
>
>         /* Set dw_mci_dmac_complete_dma as callback */
> -       desc->callback =3D dw_mci_dmac_complete_dma;
> -       desc->callback_param =3D (void *)host;
> +       dmaengine_desc_set_callback(desc, dw_mci_dmac_complete_dma, NULL,=
 (void *)host);
>         dmaengine_submit(desc);
>
>         /* Flush cache before write */
> diff --git a/drivers/mmc/host/moxart-mmc.c b/drivers/mmc/host/moxart-mmc.=
c
> index 28aed13549a64..15689717c76bf 100644
> --- a/drivers/mmc/host/moxart-mmc.c
> +++ b/drivers/mmc/host/moxart-mmc.c
> @@ -289,8 +289,7 @@ static void moxart_transfer_dma(struct mmc_data *data=
, struct moxart_host *host)
>
>         if (desc) {
>                 host->tx_desc =3D desc;
> -               desc->callback =3D moxart_dma_complete;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, moxart_dma_complete, NU=
LL, host);
>                 dmaengine_submit(desc);
>                 dma_async_issue_pending(dma_chan);
>         }
> diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
> index 097498a3f8ff4..e6271d67b6f6c 100644
> --- a/drivers/mmc/host/mxcmmc.c
> +++ b/drivers/mmc/host/mxcmmc.c
> @@ -394,8 +394,7 @@ static int mxcmci_start_cmd(struct mxcmci_host *host,=
 struct mmc_command *cmd,
>
>         if (mxcmci_use_dma(host)) {
>                 if (host->dma_dir =3D=3D DMA_FROM_DEVICE) {
> -                       host->desc->callback =3D mxcmci_dma_callback;
> -                       host->desc->callback_param =3D host;
> +                       dmaengine_desc_set_callback(host->desc, mxcmci_dm=
a_callback, NULL, host);
>                 } else {
>                         int_cntr |=3D INT_WRITE_OP_DONE_EN;
>                 }
> diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
> index 7c7c52d9e8e72..6a2b3e6d9a207 100644
> --- a/drivers/mmc/host/mxs-mmc.c
> +++ b/drivers/mmc/host/mxs-mmc.c
> @@ -234,8 +234,7 @@ static struct dma_async_tx_descriptor *mxs_mmc_prep_d=
ma(
>         desc =3D dmaengine_prep_slave_sg(ssp->dmach,
>                                 sgl, sg_len, ssp->slave_dirn, flags);
>         if (desc) {
> -               desc->callback =3D mxs_mmc_dma_irq_callback;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, mxs_mmc_dma_irq_callbac=
k, NULL, host);
>         } else {
>                 if (data)
>                         dma_unmap_sg(mmc_dev(host->mmc), data->sg,
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index 527b89a5ed707..4e72e57d11971 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -1050,8 +1050,7 @@ mmc_omap_prepare_data(struct mmc_omap_host *host, s=
truct mmc_request *req)
>
>                 OMAP_MMC_WRITE(host, BUF, buf);
>
> -               tx->callback =3D mmc_omap_dma_callback;
> -               tx->callback_param =3D host;
> +               dmaengine_desc_set_callback(tx, mmc_omap_dma_callback, NU=
LL, host);
>                 dmaengine_submit(tx);
>                 host->brs_received =3D 0;
>                 host->dma_done =3D 0;
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.=
c
> index de5a3b70107d8..ba60b81560fbd 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1279,8 +1279,7 @@ static int omap_hsmmc_setup_dma_transfer(struct oma=
p_hsmmc_host *host,
>                 return -1;
>         }
>
> -       tx->callback =3D omap_hsmmc_dma_callback;
> -       tx->callback_param =3D host;
> +       dmaengine_desc_set_callback(tx, omap_hsmmc_dma_callback, NULL, ho=
st);
>
>         /* Does not fail */
>         dmaengine_submit(tx);
> diff --git a/drivers/mmc/host/owl-mmc.c b/drivers/mmc/host/owl-mmc.c
> index d5b8a110267b8..8e0520d338c47 100644
> --- a/drivers/mmc/host/owl-mmc.c
> +++ b/drivers/mmc/host/owl-mmc.c
> @@ -329,8 +329,7 @@ static int owl_mmc_prepare_data(struct owl_mmc_host *=
owl_host,
>
>         owl_host->data =3D data;
>
> -       owl_host->desc->callback =3D owl_mmc_dma_complete;
> -       owl_host->desc->callback_param =3D (void *)owl_host;
> +       dmaengine_desc_set_callback(owl_host->desc, owl_mmc_dma_complete,=
 NULL, (void *)owl_host);
>         data->error =3D 0;
>
>         return 0;
> diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
> index f8427f071c009..06483f7355206 100644
> --- a/drivers/mmc/host/pxamci.c
> +++ b/drivers/mmc/host/pxamci.c
> @@ -212,8 +212,7 @@ static void pxamci_setup_data(struct pxamci_host *hos=
t, struct mmc_data *data)
>         }
>
>         if (!(data->flags & MMC_DATA_READ)) {
> -               tx->callback =3D pxamci_dma_irq;
> -               tx->callback_param =3D host;
> +               dmaengine_desc_set_callback(tx, pxamci_dma_irq, NULL, hos=
t);
>         }
>
>         host->dma_cookie =3D dmaengine_submit(tx);
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/=
renesas_sdhi_sys_dmac.c
> index 426308b73b490..e5ef3bae88d59 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -196,8 +196,7 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct=
 tmio_mmc_host *host)
>
>         if (desc) {
>                 reinit_completion(&priv->dma_priv.dma_dataend);
> -               desc->callback =3D renesas_sdhi_sys_dmac_dma_callback;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, renesas_sdhi_sys_dmac_d=
ma_callback, NULL, host);
>
>                 cookie =3D dmaengine_submit(desc);
>                 if (cookie < 0) {
> @@ -272,8 +271,7 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct=
 tmio_mmc_host *host)
>
>         if (desc) {
>                 reinit_completion(&priv->dma_priv.dma_dataend);
> -               desc->callback =3D renesas_sdhi_sys_dmac_dma_callback;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, renesas_sdhi_sys_dmac_d=
ma_callback, NULL, host);
>
>                 cookie =3D dmaengine_submit(desc);
>                 if (cookie < 0) {
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index efb4c7742fe21..18aca84834fb6 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -1298,8 +1298,7 @@ static int sdhci_external_dma_setup(struct sdhci_ho=
st *host,
>         if (!desc)
>                 return -EINVAL;
>
> -       desc->callback =3D NULL;
> -       desc->callback_param =3D NULL;
> +       dmaengine_desc_set_callback(desc, NULL, NULL, NULL);
>
>         cookie =3D dmaengine_submit(desc);
>         if (dma_submit_error(cookie))
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 8bd9cdedafa4d..9fe49fa8f372f 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -299,8 +299,7 @@ static void sh_mmcif_start_dma_rx(struct sh_mmcif_hos=
t *host)
>         }
>
>         if (desc) {
> -               desc->callback =3D sh_mmcif_dma_complete;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, sh_mmcif_dma_complete, =
NULL, host);
>                 cookie =3D dmaengine_submit(desc);
>                 sh_mmcif_bitset(host, MMCIF_CE_BUF_ACC, BUF_ACC_DMAREN);
>                 dma_async_issue_pending(chan);
> @@ -349,8 +348,7 @@ static void sh_mmcif_start_dma_tx(struct sh_mmcif_hos=
t *host)
>         }
>
>         if (desc) {
> -               desc->callback =3D sh_mmcif_dma_complete;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, sh_mmcif_dma_complete, =
NULL, host);
>                 cookie =3D dmaengine_submit(desc);
>                 sh_mmcif_bitset(host, MMCIF_CE_BUF_ACC, BUF_ACC_DMAWEN);
>                 dma_async_issue_pending(chan);
> diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-s=
d.c
> index 1eae2f4b6c1f9..d75ac6abd853c 100644
> --- a/drivers/mmc/host/uniphier-sd.c
> +++ b/drivers/mmc/host/uniphier-sd.c
> @@ -158,8 +158,7 @@ static void uniphier_sd_external_dma_start(struct tmi=
o_mmc_host *host,
>         if (!desc)
>                 goto unmap_sg;
>
> -       desc->callback_result =3D uniphier_sd_external_dma_callback;
> -       desc->callback_param =3D host;
> +       dmaengine_desc_set_callback(desc, NULL, uniphier_sd_external_dma_=
callback, host);
>
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0)
> diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.=
c
> index 3bccf800339ba..8b2bb44e2f86a 100644
> --- a/drivers/mmc/host/usdhi6rol0.c
> +++ b/drivers/mmc/host/usdhi6rol0.c
> @@ -592,8 +592,7 @@ static int usdhi6_dma_setup(struct usdhi6_host *host,=
 struct dma_chan *chan,
>         }
>
>         if (desc) {
> -               desc->callback =3D usdhi6_dma_complete;
> -               desc->callback_param =3D host;
> +               dmaengine_desc_set_callback(desc, usdhi6_dma_complete, NU=
LL, host);
>                 cookie =3D dmaengine_submit(desc);
>         }
>
> --
> 2.43.0
>

