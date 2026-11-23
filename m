Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4EF606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k+DwewS8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SlfLHWi/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1XPcRcO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=; b=k+DwewS87R/WWR
	HYwnyYTkQwaKb09eaA8b1yCeHdKMYPv+4Qk9e926J3ZIhmnM0BbWjgr08S7AmlAzN8vzBe+phCzK9
	hreXJVpZYYcffFJ0RBPWtmVIM1JWbzqYktb+jghuEkKpHsZjXP/nj/dnIqlwnmgFoU9pNd7dRreTq
	gIQO3lIErh76mFiiuEVKAund5LmQgbu2NnnwqJaZHpEYEWxvaPmmR+hW3SZhZR6Dg2CgXrImSt8Wn
	VAqkOIDLRkBrx9yeuv8VT9L/QgZqlWwNOlPLmw6KiJiBhupWzVgiASfpPfEmkBWaWigkDCYTuObeu
	81RnN+HONkypAOLsVSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWnG-00000004B0G-2Yav;
	Mon, 23 Nov 2026 16:21:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWnB-00000004AyP-0pJL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:21:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3Nu1093799
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 16:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=; b=SlfLHWi/azcieUxH
	w+GfLXrOy8ebUt4zn5RipaVgHuzhkfZgHlYMpaAVq8dlK7vN0s8G11AQ5ZDq809N
	kLMckgPmXP5O2rqByp/YuwxS+Wd5vax/xuvdItZcyAOfnppmbAE9cTkCK6sp9n+e
	4VNFjZs8WTqtXRWhBrJyfIeyqNUgOC05T3bOUSwYRKWZNxUOYbWWK9l1U2e9CXmP
	0a3ZMeV/wBL9jA55Y3dLcHHhBsOJS623doTXOxdFqmQNsjJFUjY7ttGeKiEKN4pO
	5O32TXHnH9dsoc23YIdIj2rNVRbmpYLsBH7lNHMJqIXGZxzmBvuJfjXIicm1/q9a
	MoVprw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0s8r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 16:21:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b42ebf632cso2294789a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795450880; cv=none;
        d=google.com; s=arc-20260327;
        b=egazkhPfrC3+yFUJn+9kxNA/joSMifPsjSvlyr2NMnbVccgvnKhRQjMKqsXCphIr9L
         Q4Mt5HAJypDiqzb9dG4O3eIXet9J0iWzjkIrYGKVOPE5FNrVmGE+1OIGVHkAhjk96DZ7
         BN5JJw/JCdE17OlTUalRSPXoavCdZsPHn7pQxzH/u/0+QrTSpH47FAoH5lQ6XJsxplMS
         1acI1aYKSVXgqKMbYbWSCcSWLs4JDJEjxW3ofBWBg8vwAXpgzt+ZtiQXBeG7/myzRYyf
         ixVEnf6hcub7QOhnMNYe5c0tC5cGKNzGL2O0KmJc8i9a+HSyYh8e1ZKLNrKWNDlEhRYu
         FyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=;
        fh=inGsdEFQkaTbKUwDRwRJ35tiGrhYiB9R9O9drB821a0=;
        b=oPRtVJHvFBpzfZuHqQiRwsnWfKEiyUf5zFRqjineyKMqhCHWTwlWWRIFYXzoo4Qw8z
         5wVSlEFVq1vqzGL/wfqi01CrYMbolMQdvPm2tmJPJTTS8D8GLPrFPyoWsxvJwIJt5b64
         tdaFrqfY88AG0YDK/7LCox//HUGvEmbcUtU03iitB2RVB7aIEdU1eaktue++ejyue73h
         UhRxFrKrNsymEEqP4JmdT/r/9A8VmWpC3RfMrLPbsRMLLxinSzZ2bRdHG0TDrYeW0wO0
         glOFf4FTR0yHUxBp3k/0nug/vv79KhvK96BqLuRfV0M0Z2MrttDzZfzaiB6NQIWYYYdt
         rRFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795450880; x=1796055680; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=;
        b=e1XPcRcOIevXmD+wImGFlBzNoPI2XZolYWuC5EZLW59NP3UYwPcBCovda5bp4mpegP
         zYxpTwUxPGSVgEo/Xo260mZaTNs4bnCwOH3nEZ/s4c0tecu8KEyO3HdsP0gBcxZHHaUd
         zIKAaXFbiyZMbW5CejfcXBApkSLl2b22vLkJaY47UijH5XOsGKLyxf9bFQ2I7tVB35/b
         PLY/CKMHcR3qdnejQEkarupOCoqtU2MjWrhDshCZwwQ34YUnfESnJFdauYL2J2VXMoad
         eVo/FX8RM9rlVgfFD38CMtmj30Cl8GJP8if6wzF7cW6uF7NMLJx8K0zKk62l8EV3lYbI
         MN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450880; x=1796055680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=;
        b=itlr7EUS68FMhzH1mRL0sWgny2D/LsmZGEzCXSSc5RD+XBSEg0sXFeS6/p2vRzi2I7
         4lP7WD/9S2Op3MQvhQQ4DMCDe+J9P6riWZhDoPYEOnMODYLToPM7WG4lqHfaWqonwyfY
         x9hTXaimrqRitZe1AGkaM+lKzDVIizSLV5mxiv8F3402CrZ4Y5gHul1PSTcWgwfionF6
         DVqNshL+tSu0haAnZ2ckQjF43JPU5VvFVwJnxwtqzF3FFoaDeE0njegyQkpboru+dxC6
         P9p4hdweARjNmkLt4lXeAndga0bBiCVJNDlaTPamnsI/Eaktjms5NrX3JlQEAXBxIRSQ
         i3YA==
X-Forwarded-Encrypted: i=1; AL+hErErmNAmBEaGHJQG6EhVL7We/2cKyHLpCuM2xTRy+BV9yQnACnBkAjyvlsrDqVBgn5Ml6NvWTCupJfq1w7Deu+CH@lists.infradead.org
X-Gm-Message-State: APuU4Z/psn6ONY8QMxeOVtWj5ZIACAer+4I5Za464FJezbQnfwz3ZQwO
	ijLYkqCq/O0CTcv/KeaV03ELSYZyBKhwlPe2/tfr2UA3VdW+MktoSX2PV9hAOG5QPaEge5d2Ki2
	sYEXYlkBA3wh9AQAFqZ1cNissIWsCsdyo89PRNILJalK+gOarE+9r5Y3TCnqbPIQ+qnzrBeWBXl
	ZWuB33fACTA40hJ9Uj0o7bE+qxvmiAmRDgopzsAJfBBSnDYrraYLX9
X-Gm-Gg: AZFdTZeCh7MfqW/zKxCuWKPULcCh3AeWhAgDbubwK3JY5HMFmnOFHPdsHZkG6VhIjNm
	msZGhQKQNMEY06XHgsHZBj3e0GJ/pacucqXt245dr+Fz0Ifz0XgC9Fnh+RjRjOirvHiTE80hDnj
	8IKh0wlDs2FfT03Z+eeFGftGDKd7M2+ZT+LvB0e78AOqyC83xocfK1Qcf/1NcuiK3dkUy4TntpN
	Ngxt2RA2YX3/yKO
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr9851293a91.12.1795450879799;
        Mon, 23 Nov 2026 08:21:19 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id
 98e67ed59e1d1-3b41c98a389mr9851267a91.12.1795450879025; Mon, 23 Nov 2026
 08:21:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com>
In-Reply-To: <20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:21:07 +0100
X-Gm-Features: Aa3M54p0-foOOggcU7jnv7PtUHqqVznLL75NrrbIJ3AZrrpdKquyNVfoZD-nGbM
Message-ID: <CAPx+jO-Zo7qx4wwbY6WhW1_DQTh-WR7P34sht-2-O=v9iG2WNg@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Don't power cycle domains on probe deferral
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Enric Balletbo i Serra <eballetbo@kernel.org>,
        =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>,
        Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: aIAcpfrM4Oep2OW8BWPG0Qx6ygRuE4rI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX0RQlJ6DEQGgw
 W6piAXWmbHXVdW9Zx1xY15VonMqXYjTZW+DJW7M8nF0oa8huzP/IB3h2fYHakAwn/yvqxSb2Nrh
 qj0EriQdHDHoegFHKdpQKtyby544Nqk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfXxoFkVNpYg4Mn
 LxcMxHYJW9ImJD36+jOq65U/Ua327U9Pp3RB/jN6GslJVfRJ6ik2V5kNSlfTHQ45gBuwb4P23nV
 81TLTjPVRQQ08VIfjD/qiUq3RALkQCGFuy2OZIwexgJiPCklogdXMfQ5pXrf9BSMek9m8yq9X2b
 pwz1uXQvlwtopTaXcXYaXU0ToQP0hHkx2p8c3wFqHPja0K41EE4+LtYgstRsmOpbVbDmp1qk1sm
 4NiRg7oUJ8+PcWsIIFDT26ixlgTMun+JP/E6DviDRhwRMRdISjsX284R96+uKiFbgwI/NozB2GH
 I4SBIYEKg4T++Wrz9y+gjGogZPrUZnD+xz38r1fwL0YSJ76NH5pbD6F4USrYTU/iZsuofD7bqRe
 fuoyPnl/ZHb7MH+d9fvVKHI1bFHwnRpxjKAP30nJfziJsIe7ZeJQgy6v0PTgHWPJ0S2Kdvx/M+o
 j+90qKN/QUAzps0vLew==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b046800 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=s7NOb6aoII2F6go70RgA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: aIAcpfrM4Oep2OW8BWPG0Qx6ygRuE4rI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_082121_236334_3CAEBFE1 
X-CRM114-Status: GOOD (  43.31  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 2:25=E2=80=AFAM Ryan Brue <ryanbrue.dev@gmail.com> =
wrote:
>
> scpsys_add_one_domain() powers each domain on as soon as it is added,
> before the probe has looked up the supplies and clocks of the domains
> after it. When one of those is not available yet the probe defers, and
> the cleanup powers off every domain added so far, whatever state it was
> found in. The retry then powers them all on again.
>
> A bootloader that leaves the display scanning out does not survive
> that. On the Amazon Fire HD 10 (MT8173), mfg_async's domain-supply comes
> from the MT6397 PMIC, which registers after the power controller first
> probes, and power cycling the MM domain under the running display hangs
> the SoC on almost every boot.
>
> Power the domains on only once all of them have been added, so that a
> deferral leaves the hardware as it was found, and on cleanup power off
> only the domains this probe has turned on.
>
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Found on an Amazon Fire HD 10 (2017), an MT8173 tablet whose board DTS
> is not upstream yet. Its bootloader (LK) leaves DISP_OVL0 scanning out
> when it starts the kernel, and the MT6397 regulators register about 50 ms
> after the power controller first probes, so the probe often defers.
>
> The deferral was forced for the A/B with a local test knob that returns
> -EPROBE_DEFER at the first domain with a domain-supply. Each boot attempt
> was counted from the host's USB log, since a hung board is reset by the
> watchdog into the same kernel. The hang does not happen when the
> display is stopped before the power controller probes, which is what
> our downstream kernel does today.
>
> elm, hana and the MT8173 EVB also give mfg_async a domain-supply, from a
> DA9211 on I2C, so they probably take the same deferral path. Whether
> their firmware leaves anything running across it, I don't know.
>
> Only MT8173 (direct control) was tested. The HW-voter cleanup changes
> the same way, powering off only what this probe powered on, but there is
> no such hardware here.
>
> This patch was developed with the help of an LLM.
> ---
> Changes in v2:
> - Rebased onto pmdomain next, on top of Nils B=C3=BCchner's "pmdomain:
>   mediatek: Don't power off default-off domains in probe cleanup". Its
>   KEEP_DEFAULT_OFF check in scpsys_remove_one_domain() is kept as is, so
>   the cleanup no longer passes that condition itself. No other change.
>   The patch does not cover this case, since it skips only KEEP_DEFAULT_OF=
F
>   domains, and MT8173 has none, so there a deferral still powers off
>   every domain the probe has added, and the retry powers them on again.
> - Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-m=
tk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com
> ---
> With the deferral forced at mfg_async on every boot and the bootloader's
> display left running, 61 of 63 boot attempts hung before userspace
> without this patch, and none of 5 with it. With the patch, the cleanup
> left MM on as the bootloader had left it on every boot; without it, it
> powered off all seven domains the probe had turned on, MM included.
> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 59 ++++++++++++++++++------=
------
>  1 file changed, 36 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index 1b5cc9eb920a..6ec77ed0dd66 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -984,12 +984,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
ys *scpsys, struct device_no
>                 pd->genpd.flags |=3D GENPD_FLAG_IRQ_SAFE;
>         }
>
> -       /*
> -        * Initially turn on all domains to make the domains usable
> -        * with !CONFIG_PM and to get the hardware in sync with the
> -        * software.  The unused domains will be switched off during
> -        * late_init time.
> -        */
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
>                 bool domain_is_on;
>
> @@ -1001,15 +995,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scp=
sys *scpsys, struct device_no
>                 if (domain_is_on)
>                         dev_warn(scpsys->dev,
>                                  "%pOF: A default off power domain has be=
en ON\n", node);
> -       } else {
> -               ret =3D pd->genpd.power_on(&pd->genpd);
> -               if (ret < 0) {
> -                       dev_err(scpsys->dev, "%pOF: failed to power on do=
main: %d\n", node, ret);
> -                       goto err_put_subsys_clocks;
> -               }
> -
> -               if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
> -                       pd->genpd.flags |=3D GENPD_FLAG_ALWAYS_ON;
> +       } else if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON)) {
> +               pd->genpd.flags |=3D GENPD_FLAG_ALWAYS_ON;
>         }
>
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
> @@ -1087,7 +1074,7 @@ static int scpsys_add_subdomain(struct scpsys *scps=
ys, struct device_node *paren
>         return ret;
>  }
>
> -static void scpsys_remove_one_domain(struct scpsys_domain *pd)
> +static void scpsys_remove_one_domain(struct scpsys_domain *pd, bool powe=
red_on)
>  {
>         struct scpsys *scpsys =3D pd->scpsys;
>         int ret;
> @@ -1112,11 +1099,10 @@ static void scpsys_remove_one_domain(struct scpsy=
s_domain *pd)
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
>                 goto put_clocks;
>
> -       if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
> -               if (scpsys_hwv_domain_is_enable_done(pd))
> +       if (powered_on) {
> +               if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_V=
OTER)
>                         scpsys_hwv_power_off_internal(pd);
> -       } else {
> -               if (scpsys_domain_is_on(pd) || MTK_SCPD_CAPS(pd, MTK_SCPD=
_SIMPLE_PWRSEQ))
> +               else
>                         scpsys_power_off_internal(pd);
>         }
>
> @@ -1125,7 +1111,8 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
>
> -static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx=
, u8 num_probed)
> +static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx=
,
> +                                 u8 num_probed, u8 num_powered)
>  {
>         struct generic_pm_domain *genpd;
>         struct scpsys_domain *pd;
> @@ -1137,7 +1124,7 @@ static void scpsys_domain_cleanup(struct scpsys *sc=
psys, u8 *domains_idx, u8 num
>                 genpd =3D scpsys->pd_data.domains[pd_idx];
>                 if (genpd) {
>                         pd =3D to_scpsys_domain(genpd);
> -                       scpsys_remove_one_domain(pd);
> +                       scpsys_remove_one_domain(pd, i < num_powered);
>                 }
>         }
>  }
> @@ -1374,6 +1361,7 @@ static int scpsys_probe(struct platform_device *pde=
v)
>         struct scpsys *scpsys;
>         int num_domains, ret;
>         u8 num_added_pds =3D 0;
> +       u8 num_powered_pds =3D 0;
>         u8 *added_pds_idx;
>
>         soc =3D of_device_get_match_data(&pdev->dev);
> @@ -1449,6 +1437,31 @@ static int scpsys_probe(struct platform_device *pd=
ev)
>                 return ret;
>         }
>
> +       /*
> +        * Initially turn on all domains to make the domains usable
> +        * with !CONFIG_PM and to get the hardware in sync with the
> +        * software.  The unused domains will be switched off during
> +        * late_init time.
> +        *
> +        * Do this only once every domain has got its supply and clocks,
> +        * so that a probe deferral leaves the hardware as it was found:
> +        * the bootloader may still be using a domain that is already on.
> +        */
> +       for (; num_powered_pds < num_added_pds; num_powered_pds++) {
> +               struct scpsys_domain *pd;
> +
> +               pd =3D to_scpsys_domain(scpsys->domains[added_pds_idx[num=
_powered_pds]]);
> +               if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +                       continue;
> +
> +               ret =3D pd->genpd.power_on(&pd->genpd);
> +               if (ret < 0) {
> +                       dev_err(dev, "%s: failed to power on domain: %d\n=
",
> +                               pd->genpd.name, ret);
> +                       goto err_cleanup_domains;
> +               }
> +       }
> +
>         ret =3D of_genpd_add_provider_onecell(np, &scpsys->pd_data);
>         if (ret) {
>                 dev_err(dev, "failed to add provider: %d\n", ret);
> @@ -1459,7 +1472,7 @@ static int scpsys_probe(struct platform_device *pde=
v)
>         return 0;
>
>  err_cleanup_domains:
> -       scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds);
> +       scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds, num_p=
owered_pds);
>         return ret;
>  }
>
>
> ---
> base-commit: 09078f3f8a6fca5c3a2d674b7059f4d7b46e21c6
> change-id: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb8240=
0
>
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>
>

