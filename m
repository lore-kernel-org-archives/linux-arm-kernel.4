Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F6607A5E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fANEQ8s1;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dd2YORBp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FD5ikz7c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h7ZMjOHZnub7I02GGs2+ZNq38w9ZfRd8s4DzV2qSzx4=; b=fANEQ8s1FipRHj
	wBI62CYmbNkxg+ZMah7NBrt+YKDK5p3ZCkK8lliqryeJU8Cw1UV2lqTEWV/ffTkMePKQzkmKfB6T6
	HFFhMO39sBVhegWKFokpONhYY88TXLIsTVrYEMkCQaxbMs1UoxpPJsNXROXLcWf4fI+WyLRJK/nwP
	0/c+PGhgkXNK5fsUPnQ83t4f45+pIOlfzpr9jMBlv0mlBa5p5EUzjtRtu9O6GexhwLaabSqh94DZg
	Zc9tsdy7CIDdlUFRZ4yrjLu0VuMz91BiNxRaObPhroBrycS8AfYX9UENi9P5CZTLqs15lE0H968UI
	0MbbLpobI/F7lgoABKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvOh-0000000DnK2-3Vvl;
	Fri, 13 Nov 2026 17:49:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvOe-0000000DnHu-27zE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:49:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRRCB3296039
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7ZMjOHZnub7I02GGs2+ZNq38w9ZfRd8s4DzV2qSzx4=; b=Dd2YORBp7MJYX8GR
	WMxdTmllHObR7E31WjlBbKI/1aHD9DXvwhN4/JFeb9FOinbvyqhZzG9w2U2krmuf
	U5L9GnSKOmR3KbR67NLZpwtNC1yl/9DQVus402t3tDOVbInxwsfvsujM/rKo6oR6
	nzzDC3r/Jyy5vw5VS7ol+iz3dXp+mX5XRvgzMPL0ywUzDgf81zCbt5Qj8vr+DZLH
	hggBhc9r+rTrBQITwdOnzIeqXfzkrqNZ43BtLiosV5iheoX0+JvsHSHkt6nxJNKY
	nYm2koN3rnjwYAgXvcC0vk4p2S2W1/tsdkCDfTVZh8mTgj37DFuj7ZwY0T1tMXNM
	vWWkiQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6temq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:49:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so966596a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592146; cv=none;
        d=google.com; s=arc-20260327;
        b=nYm+OeWtMcyTF7Ibp/RtnBiioICrYwswQGjDdqZkrYOTpYujCrkQUen0jtFuMFJoaQ
         KQ0tHzuQ/1fpTAQpN7iy4G/UZiQMvsJd8PNNiuSfKxVQwBQ6keXnDYLAt/cespc76U0m
         +zutLE2rzJSEDSQ70SYPBUsPobBHWOQuSENjS1CPGgFMEDaqmeb3aATyrOF45BF55yGQ
         PUwMxlYMMbAs7l030YrdKX/gqLrpTEnaZjSpXl83nIipvy527BvVOcgB5+Qylxu7IAfy
         qeOBCy1D6Or1o+fvkx7u1tGYt3eo3p6eOd5qCq6Ze3Lgp31M1SkLYG8aYtZZZvqZsKOm
         ZqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h7ZMjOHZnub7I02GGs2+ZNq38w9ZfRd8s4DzV2qSzx4=;
        fh=/ulGk5DRf+5rDnxdQ0deVYAFVK45jcT9pW5JawzccUU=;
        b=qP49HvyJkWTnenBN/vYF1ilNtMef0TrQlAVX80r1Y29dm2orhtW5fSo+s9KPHdDCyi
         Tg1w9+LxVAyRsvWJaGUAuHxNi0FaxX6T5QAnmcS4Wv5c66ZKLn+ygPvGBEY8ANPlmTHk
         dA5e+Kvo6NRlSNE+PeyCbisvA5iiAcNqeWeafosyV4BCuE3gZUe1sMM/yMCrPhRwDWD5
         TKKDZ626d52AZfyfJNQ0r2/AKo93uFUbaPY6oek493bbSvbYBb6IQRms0c0O67UGjFOj
         ZRI9La4uJyoQz8jWD5Tk5/Z2qX6A7dqQ1Jh4OHpQq+vdH+TK6y6l6fLihUcZl6jtpJQB
         Cpyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592146; x=1795196946; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h7ZMjOHZnub7I02GGs2+ZNq38w9ZfRd8s4DzV2qSzx4=;
        b=FD5ikz7cnJuZr66pKhvZEkKvkAcQNhNUEoHayMX8ZzEw5q+hZr+hUbURWKs9UQBlAA
         oBgKU/MxQDaNZk5JjRYnGIL/B4wbSbKA7xAcArxSZDd9UYoKVDe/oUyeCrM9rjbIdkQz
         hWxptYmuIYOh9A78TqnVVgQw6itD5JsMBNOTJZS/3e3JTHJxUVY6EozTHIsgxd+CbayL
         oNqiXMt0bUoV1SgqQDLZMlU9USU6T1P3SuD1qcI+s7r9syrqLazBSCPCnyVsbXslslPd
         ef338J0O/EUOzgg8XV850mULTkS29EJx8/sAveGBT8m2L8awSQk92zE1XmQzV/ypOlpU
         3TnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592146; x=1795196946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7ZMjOHZnub7I02GGs2+ZNq38w9ZfRd8s4DzV2qSzx4=;
        b=lHwt28j+gud8K2kGrPNLHLBt6dNsDUMO9A6J+xs8vEyrERUui/DsXBE+Rx1cHBGr49
         HfVY8OXwa0PcK+5ptcvN3d1mDtIxuCy1AjnAdUl8e99xcy32z6bN12xNn7kjXSjnlWNa
         6HvYZRW9OynARQUuO84v1zjcfJRDBvkS4dswQEmc7Zdekv3wz1NxLk7OTEngvuehzBGE
         N+7GWMfBBUMO5IlEpxuYSkcE3HGwfCUmrPSg8FPGHpXu5P7EuCWOM85UfkRkKGPJJaVS
         AJawUcrl/Av1PMCpq4h0QMTMj55yBVidCSwM9NfBrONogujF41Jg+kcPclHga9dnEWug
         0TVg==
X-Forwarded-Encrypted: i=1; AL+hErFIZ9DNWQpHT/E9LVOM3vw8diH38+zH48vZxzutqKMi+LPZrjen2GNOnmWMkX4ea48nNX6deHvj75KNZs/itiiF@lists.infradead.org
X-Gm-Message-State: APuU4Z8WedilorpQ3vn9a5dfBBTjQV1U4Fj++WymQwXli+s6Tj29emno
	L2o/9SXrsl5jzH5rYHOxK7A2UhB8o2W98IXRuMKktA8YLVaj3KRTdwmD+v5xhb68+IXpLrJfmn8
	OGKP6eFPgSDI4V8rX8GMA0OcVXOiZzEmEP88me/poEjOgIiljcqe79/lRNplbhfkSp/PP1L1AkT
	4lYchd1kTyIuhNJCIcgcPfzOlBiV69CWTL6tfgr6omm+aQazEMzZdu
X-Gm-Gg: AYBFou1WBY+TIsOzx4YHYCjmDyvoOdWaeJEpygdoAREffEVAbCSzfyS2+cUlpzbZhtp
	bAxKgAd/k5GTDaROpM3umHOT3rX5drYaM2uuYyDJD95Nk3MTzdGTArkLZT7KqogBYLasW/CHaSK
	q7vcPS4ILMfHzR0reoWbvyQb2r9EQZRgx1YmYrK6FSb3ptidJD/oAfWd2mxQ==
X-Received: by 2002:a17:90b:3eca:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b1b0ba6480mr3020205a91.51.1794592145906;
        Fri, 13 Nov 2026 09:49:05 -0800 (PST)
X-Received: by 2002:a17:90b:3eca:b0:3b0:b64e:1e34 with SMTP id
 98e67ed59e1d1-3b1b0ba6480mr3020179a91.51.1794592145385; Fri, 13 Nov 2026
 09:49:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101-rbrue-suez-upstreaming-mtk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com>
In-Reply-To: <20261101-rbrue-suez-upstreaming-mtk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:48:53 +0100
X-Gm-Features: AclHuK_o-18EjhupOpQOHXsSHQhEk8A1OgSO8CQWrvzqq3tyYIcyEkcdDS0ZD6Q
Message-ID: <CAPx+jO94U8b_PNJbbuzzFtF2HFeM7sYaT+oZoLJUfvThXkFYjA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: Don't power cycle domains on probe deferral
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Enric Balletbo i Serra <eballetbo@kernel.org>,
        Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXzuQRIIUSpKLv
 guHhUj9gpdC6t/SriKCQDe8qjsCRE+mKKJ+liqrhbfRPJ2ywGkR+2H6Cx6XKe9oyR8ZBPuSGAkU
 jGOZLJAosW4B1XpxxFC4eKnz+76kMDdOEBFj9blr5nbdf2nZ+d9cZrFFpJPGbUmfnVW9odWOpYw
 WR/VcQDfVbGMNlE/3aeD8E062UetmFdNK2qTiQBnCJJUhlY1QbiP/ON/lkoK7SI1V2LQ25EeUom
 YJILhRF6BEtBVjeNNFSHFjL5a/o2MtrC7p4u8I+YPCEWILEvmEWdHaTwYT7JYZZ1k5NUmoB6GUE
 oyK/hRCAM2lb+6JjiUASCVcjuNtq5SuchTHVRb6c5WtJoSJ32tSANoKRpzHjom+KSluufJsFhSE
 L7tja/XQqV9Sqd+A1AjSB4ZjdR13YbZWC9QrpLDO1uI7gQa5l+ifgcAFL87ZJseaCrUp0NJnEqp
 tT10sxEowar7KlqXnYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXzKv4xGHktKKO
 lt8pkOQlUmZ144QWatV5a9KN59BZtEVirbRNiKczSXbnYRSQIlaXS19FvJesRYG5sm0azBAoyg4
 sj2yEdif/CHc2XP5gIg2KKHuWuYnwbE=
X-Proofpoint-GUID: oIclonfPWlhGqZVDjAaqNVp57n78FrYn
X-Proofpoint-ORIG-GUID: oIclonfPWlhGqZVDjAaqNVp57n78FrYn
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af74d93 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=qXiDfWie0P3iMaLS2MUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_094908_662126_5D061904 
X-CRM114-Status: GOOD (  42.91  )
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

On Mon, Nov 2, 2026 at 6:44=E2=80=AFAM Ryan Brue <ryanbrue.dev@gmail.com> w=
rote:
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
>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

This looks good to me. However, the patch no longer applies to my
fixes branch, due to other related patches being queued.

Please rebase and resubmit a new version.

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
> With the deferral forced at mfg_async on every boot and the bootloader's
> display left running, 61 of 63 boot attempts hung before userspace
> without this patch, and none of 5 with it. With the patch, the cleanup
> left MM on as the bootloader had left it on every boot; without it, it
> powered off all seven domains the probe had turned on, MM included.
> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 60 ++++++++++++++++++------=
------
>  1 file changed, 37 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index f0fa79e01f9c..6a81aadc18f3 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -982,12 +982,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
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
> @@ -999,15 +993,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
ys *scpsys, struct device_no
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
> @@ -1085,7 +1072,7 @@ static int scpsys_add_subdomain(struct scpsys *scps=
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
> @@ -1100,11 +1087,10 @@ static void scpsys_remove_one_domain(struct scpsy=
s_domain *pd)
>                         "failed to remove domain '%s' : %d - state may be=
 inconsistent\n",
>                         pd->genpd.name, ret);
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
> @@ -1112,7 +1098,8 @@ static void scpsys_remove_one_domain(struct scpsys_=
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
> @@ -1124,7 +1111,8 @@ static void scpsys_domain_cleanup(struct scpsys *sc=
psys, u8 *domains_idx, u8 num
>                 genpd =3D scpsys->pd_data.domains[pd_idx];
>                 if (genpd) {
>                         pd =3D to_scpsys_domain(genpd);
> -                       scpsys_remove_one_domain(pd);
> +                       scpsys_remove_one_domain(pd, i < num_powered &&
> +                                                !MTK_SCPD_CAPS(pd, MTK_S=
CPD_KEEP_DEFAULT_OFF));
>                 }
>         }
>  }
> @@ -1361,6 +1349,7 @@ static int scpsys_probe(struct platform_device *pde=
v)
>         struct scpsys *scpsys;
>         int num_domains, ret;
>         u8 num_added_pds =3D 0;
> +       u8 num_powered_pds =3D 0;
>         u8 *added_pds_idx;
>
>         soc =3D of_device_get_match_data(&pdev->dev);
> @@ -1436,6 +1425,31 @@ static int scpsys_probe(struct platform_device *pd=
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
> @@ -1446,7 +1460,7 @@ static int scpsys_probe(struct platform_device *pde=
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
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb8240=
0
>
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>
>

