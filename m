Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A84E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3hJrHsT/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjIFWy9q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJvR+9dw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qEA5KXj0f3ThiS06ddbyc/0mjBi0i81V2WjSLw3INmY=; b=3hJrHsT/+KED7y
	qtNyvtiN5pmAz1Q7HWiEd6yUrXBqc79r8yQiuAV7VNmbRolRRsO4OtqTktUwq6PFVioVjnSNI0bo2
	/BGUhurRZ6v2/VjciB0TkF1SsBeJie0jjLQy+vwFLB/jy6DkKiRyXI9IQw6fLKZ2zX/yCqrRquQSa
	EDNFx00StAIL+95SRBO8cvQw694ru3Q/wJmSW8viKF0oMwZmqMoMcRh/Qe68/Cjdeo1IP4nTebKQP
	q7Y7RVgG06tc9ELSLhfSgdZgo312aIHwljUVRv6FPGvCsVbXTrGsPdNzahGuXrlvwEK3gUY5QNYTs
	YGRGQ4nrvJXPHY8xj3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZaL-0000000DNOf-16Mb;
	Thu, 26 Nov 2026 13:32:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZaG-0000000DNNt-1kbL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:32:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVMJW3177347
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEA5KXj0f3ThiS06ddbyc/0mjBi0i81V2WjSLw3INmY=; b=OjIFWy9qimT+503d
	yjZC74sVEqO+182EJOCu4552hHfsFtFXTMmzq9aJqOrKx/i6BgN+19SDK6ikqTaN
	zf7KyH15lAvrtPoRhLzPhasxY8iBonsOvtKazucRlDJYFKwjKpzlNo+gepWHOxDy
	z04mvMH32ubMgi8Z7b6AWz9qH66NC62BaHxZUYrw0MMgt8oYUI6wo+EtbZbahp47
	nPd9kQx4DeqYZP6NfHmDRu745AICYva4WymUPZ+zTvMzLBwhIjipLw0mOe6JquA5
	XTJDr8bCHon82OJ3zZvXF0ggfRIi/XGnCBWQuUf4G4NypeKbRkUtIsG3iKMXyZge
	Ul7NuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbaet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:32:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso6046357a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:32:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699939; cv=none;
        d=google.com; s=arc-20260327;
        b=W3zaScCu8eObtrF9w/TYTMdF0F29CYC6HXuaU7bZdwsplxU6RyGT88PUIzHACJwah7
         kuUYw5vNnAyMZcHyrPuvktCpPkZJ/iZq02HKwvoO/yJduJpipUdxgjPGhokgo9Y/ivAp
         nRpZvQC2qqkzr/h3ABIMv63rUM+egheXm51ZjRD43lrS8UUV4niKPUJc45s5Yxa0qEQI
         k2D414AVX4aHRS2l7cjVESX7aokQf9qDXBMffcGkloDsAu5o/VzwMIfR2Y1U/I1wMhpj
         XzS5oxJp7adQ5khX3SYDP6B3Y9OPoKhY8ybvK0aJNCnc6nSSYt2p0KF80zsPaNgh6sw/
         M7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qEA5KXj0f3ThiS06ddbyc/0mjBi0i81V2WjSLw3INmY=;
        fh=6ogTRx5s6mLuvNOG0gnuFVgN3H67Nq+eTnEWjZLaFRk=;
        b=rm07eDgkHZ3MB7G5ckm3dFSrv/db7p6eLj9n8F8Pg+FMUcNH00I3gFpgQEkq2JuLIY
         76NL9oInJWETtWGcVG80t3khvAQTBFTf1s15Lg3RiudXFDyXviDesyZFIUDF9ymTJSzd
         JE8X5Bg1dK/y/t6g7qtBaZ/BdZf1WVEn3cg9r+gr+xP6OPmSQ92QG+4Hz+qCqL1Vvj17
         /GK1kNj212Wfm221uZoUt06QE9ie+bEj8teWdypV1DlZ+xdGHK8gUxjmn0ADIchIJXua
         pip2YWj0TE11moIQ4lh0w+z3XovQN8FbvdniCy1VjmugMj3NsDDBcq/IYr8Pum2zFau6
         7Hug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699939; x=1796304739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qEA5KXj0f3ThiS06ddbyc/0mjBi0i81V2WjSLw3INmY=;
        b=ZJvR+9dw+FULuKpget5fyXSk1F+dO+CZ7KYiTL7nR+2l7r3mbr1DHEic8kGf0+gqP+
         L/mF4xAgPPx9LeiYQOojjqQ5Ne7lGFyXN4+H7wY+/CiBHhUVbb5vVy+7dk6GZSlW9p1L
         Gjg/9PrY3bEV9wyO2wfkDSftOr8jJwVv+9ehEoHs85j53tgoIn1unLDwLuorNE13fYPS
         UMy7fzsllamZ1fpjNWfdWjhDAeXz188PQIeoyCUlQbnLIDEu8ZB5uQzV7ENfjQEnOIpD
         S/tPVLM67YAgE/lwxz3SaIMdhFpO8ExWfKMcWxy28cEpUEep5rheJA9FHly3jcTITpLZ
         iWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699939; x=1796304739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEA5KXj0f3ThiS06ddbyc/0mjBi0i81V2WjSLw3INmY=;
        b=GixIGFcADeDKNpVGR0aLZGbUhxHnimlP2ZGJjGjvrX6lfI2oVnu4mS/qN9AEeWxo2P
         BmIX2MqpEHtibdQX3N7UzrcWqRmMBCGZM2SuGfXY+6j7rQzcG5BoG2LoPJc5tYfGGb27
         20HEW4N7qUJE7ZVskH4B8D5wjvoy4NgAp4iISjIorWPM7Ni4GQEFTMSxD6x3pU49I4gd
         BBKJRi1A2SvwM7Sh6wsdoKnb+C5bTJ7Er5YmrOHqm3g99k8vOaHRiOHAJcnXp9cvzY0B
         4bmTLP+soo1Bg70UCBe16jSpSlHQ9XAClXegHFAh2EnQ7em4hYZDRKP1fELlTCPmNaLi
         3HKQ==
X-Forwarded-Encrypted: i=1; AL+hErHmQJ7ERXUUdwCSmYfZIcUoxq9KCMbQORnkiS2SrbMd8WheD5gwvgSDaSx5WkXUxE2WIIpGRwMjfkdLrghFtuYb@lists.infradead.org
X-Gm-Message-State: APuU4Z8ynKjkeeRBuHVqtXfRotwiRcs4HijioM8zuJ77h3lIMl3uTkHx
	n8ELdepSd56KhhYtRFY189gBEbgbNVK3tUjNii7gOi13dDR1JRcUsF7eL8GemY1sV7Q4ajyP331
	qm32tMcLSbnTt8Xb/OWQcxemvjwFeah8Yv2ay/OAjlfIMrvuac+opd27UPxeN4+5lZwZWQCZym0
	DIi5f7Yz0n8DXgk6DynxuUyC/KwJ7bXpp/xTqzN6Wa4ITxGB+90ZMY
X-Gm-Gg: AZFdTZcFSnPfEK75QisbzgaT0RNAnj+PiP8EQ/RXElJ4nhOuot/06hWEBfvwDpqlYt+
	BPvpOu2yGS4KMn3Ztd5ctfVbNWoXSMiEngdE0wCmnTMzEPsj3SJK88l4xlhHWzBk9LR7uKQa3+f
	AsuoDpU1XM9+K/Ysv0S5lwVv6FwS6SE8dZqCPWPFW9O/atxC7nBqdaQmKBjg==
X-Received: by 2002:a17:90a:e7d0:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3b41c8d5a52mr19387634a91.17.1795699939238;
        Thu, 26 Nov 2026 05:32:19 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ac:929e:691 with SMTP id
 98e67ed59e1d1-3b41c8d5a52mr19387591a91.17.1795699938695; Thu, 26 Nov 2026
 05:32:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:32:06 +0100
X-Gm-Features: Aa3M54qyMkmbPaP98YC8FzT7AHfFztRyNksaNUDQLw1O60koDHwGD5wwKboKV-k
Message-ID: <CAPx+jO9kioaEq14zdqVRp--eqvwS87MG7j6Ztg30Xs91wdOEHw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] pmdomain: imx: Keep the domains left on by the bootloader
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
        linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
        Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Kees Cook <kees+treewide@kernel.org>, Marek Vasut <marex@denx.de>,
        Ming Qian <ming.qian@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Xu Yang <xu.yang_2@nxp.com>, bui duc phuc <phucduc.bui@gmail.com>,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b0834e4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=r4OjQRZgDwFT0wjx:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=iP-xVBlJAAAA:8
 a=OhlDQ7rSrotYEbIJSlcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-GUID: 3kY80jcLah5rnjTOBT5ybWJ-0Y2WqbG3
X-Proofpoint-ORIG-GUID: 3kY80jcLah5rnjTOBT5ybWJ-0Y2WqbG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX3DFjsFWNj0ug
 MH6GzJnrINMltfyK2DD0mtFqVf30GE5vhdkdg/VT2DJc/hS5saRxw9CHmXPJpxW1HmhIDEkOLme
 M0kmluDok/IjCXThIqYHO6omnRr3fLNQOrcMXq8VjuByiYaFIDmn+WpoAGzW5Yi5EHMe7oVbSKI
 7ofK51Jw4h+gNGg7MAhHZrsKRRX0lnsQZ4xeoDJKDKs5dogaEtyLgIPca7ALW84peJK0SzrhW+a
 iKjOcSZ0StLq120uP0we8LxrxpmaEHUTchGc4IecDnPukvVJDeQsNTAh6YH7V964w2wP3V5P77T
 fXLi4K+WTr7Yi/fBqAm0qfZEFlB7X5zV5HJVTHGesWjtzKeUEMSNIFe1YIrBg/txMDSXp/IfwKY
 DMZ8vLEfj4/Hm9rPs21G6/M0L6XgKMmbATGdzqke550rHFD3WLt0eo3fm+QFZrphQeJwWJMKANg
 TpPc2kH0ta210mEJwkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX+nUaLib57pPB
 CGoIVQ2Xa7xDgONVaq6nrPlwN8KQYWjWKFhRGSQYWoWAVvfky5deSDRUc1sqy5yf6Vkb3ZxxK5c
 FTVf5rBI00fKH5wlDtfd5y/NT1VSCzE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_053223_091266_4841A91C 
X-CRM114-Status: GOOD (  27.03  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 9:51=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The i.MX8M power domain drivers register all their domains as off.
> A domain left on by the bootloader, e.g. to show a splash screen, is
> then powered up again by its first consumer, which on the i.MX8MN
> turns the display off and hangs the system.
>
> This series reads the state of the domains from the hardware, so that
> the ones left on are kept on until their consumers have probed.
>
> The first patch fixes an error path of the blk-ctrl probe. The clocks
> held by the last patch are released at sync_state, so they stay on
> until all the consumers of the blk-ctrl have probed.
>
> Tested on i.MX8MN (BSH SMM S2 PRO).
>
> Changes in v4:
> - Register the power notifier before powering up the bus domain
>
> Changes in v3:
> - Add Reported-by and Closes tags
> - Drop the runtime PM reference synchronously in the probe error path
> - Keep the bus domain on while the state of the domains is read
> - Remove the domains before releasing their boot-on references
>
> Changes in v2:
> - New patch
> - Release the resources of the domains left on when the driver is
>   removed
> - Take the references once the probe can no longer be deferred
> - Clear the boot-on state when the domain is powered off
> - Release the references when the driver is removed
> - Rebase on the changes of the previous patch
>
> Dario Binacchi (4):
>   pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
>   pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
>   pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
>   pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state
>
>  drivers/pmdomain/imx/gpcv2.c          |  77 ++++++++++++-
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 156 ++++++++++++++++++++++++--
>  2 files changed, 223 insertions(+), 10 deletions(-)
>
> ---
> base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
> branch: imx-pmdomain-boot-on-v4
>
> --
> 2.43.0
>

I started by applying patch1 for fixes and by adding a stable tag for
it. Deferring the remaining three to conclude on the reviews.

Kind regards
Uffe

