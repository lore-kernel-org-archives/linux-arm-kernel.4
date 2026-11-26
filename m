Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70441606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xiojVV7n;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lVnLx/XV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fS7WcQuB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=; b=xiojVV7nyNrYcn
	XzzBlvjsMI5kYS+pk27zXEjZTbmWRGwCXsEbh5ITW1IMAFO3A86Y0JIXPyyOyr2a67WoFzr72qQUs
	/z7VBZhPEAN28byyqmtN+YLjiQEi5Wx4+E8NEUt5fdbVS8gB86NGIAbquUu3WqvYBvWiSV/dpYljZ
	NA56Tl8fLKUK9t0/P1O+xd/FBXbgr5DlinDkJuPbg5VNxHtGDtEJs5rFy0I+Mf3OGEHGE/FZJAnUe
	5ipIy5kA8eu+Ic8B8pDMz4Lx6/ks7dfY0PLLvln/aZ7kVboFo/Rn0L741x9Z/avltLNYz7/Vox6Le
	9XF15TiBgap693ZzkNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZZy-0000000DNHl-0AIZ;
	Thu, 26 Nov 2026 13:32:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZZu-0000000DNGB-0ks5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:32:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVb2D3476321
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=; b=lVnLx/XVkcJaiSpp
	oLrrfQ0e7ix1RT9OrfS39lYUO3LgCgDlR0pPQctKZyXiAKUmKYttNwqctB1Su//4
	bZyJYRE+/0ED3DvH+FJVuajrn7ZDd0FGi5N/+2ZljKaXaPrmEtLOoEjsWIS3xssN
	0/eULf2JflCZhznLeu1S7ucb7S0C9BpL5fjA8X/qc8uKZ60b4Y3JHpJOqN3eNTZq
	gqkxowsyWy6f6WnxdLPsUbtwcCtf+rneiRq68AiSgHp4hg/AAzVGOrd9qa2lk9kk
	W0SgyL6W6JjziNki682KZA7YwyL/Mgc17iCmLWwZ69dB+CVkgmsvSJaWBQodPWgj
	rxiKiw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhkbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:31:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so4416350a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699917; cv=none;
        d=google.com; s=arc-20260327;
        b=O1tm/2xrMHoemEzxq8JuOteBEdnI27T4czZTNzR/cfQF1NJW4cb2QQc42OS8PnKS6p
         jUUJnRXn8VIz6lomwDgtrbxnLvCXyty9s/W7txohXoAgFP/Lt9yUi+Z4b99giIwkxotY
         U9dbowzMArPx/b1mFS6zshUKQEb81pt1haZIOpP0MW9if2+vqZYjM2oqwoXzMv/d6I2t
         sEotZyL3A5MyZo8aEUUyZRTmy9rRnDlhzqW9c+70d87+kOOKsNttE90Sj3ZP8GavJrh+
         +L+0xgehiZkphVLGJIhJGRZuUPf1HPWaQg0Loz8n2Cb4nQe3Pxg9I2WloXLLCZPEpHdi
         +pfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
        fh=qQpEkHc9uKJxnqSb26uUiiyBCIwq0P5eOUDT1strGY8=;
        b=sr29u0oTrYNQNL/JGGdsEtXO7G7Ytmbnq5r5GxxDGtHj11yU/zzJrSXwCg+rWUTHTp
         wggHa7Wfp6/sUb1uA/LwtWNJEdPBp3h2jryKP+aibFN1dK70chGICjhUagdQlTTOSCPi
         GodBY9D5K7ySnWC0ubpq+28jN6OxQ7UG6PO32d1bjlC/5IW4IyL4uK230a4l8WUoOdqx
         JOypOZltbq6T9IRfZUSMoe4c9BEbE2LYejASDg1uL2DK+fSF5wWaQ487q0HlsiJkcod1
         FqN/fWwDdNKVNVDVcocr4CSHMk3+5vsZzSrm8D+HMLkNSrTIUqVZavgy/ObwqFXWtW2T
         E6ag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699917; x=1796304717; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
        b=fS7WcQuBGlD14QxdAtLktq48kiBeVUg7sLqVo0UYtIq/DmR3V9rmfkBoh+dIytbBpZ
         IexEYBcyHc3BRGACLJ1MKmqqB3LkSZ7t9fKXG1tATHC4/m9xQkj2SMN8qPBiaWKA0SIY
         EpHC6catcLkOd3QQbfTZUNztrtV6Aw9AOnCXKBDyZj71YnQypcVDuLcBCXj7agsCKZbl
         GS+ccOpiWwUx4e1TTYOsR8xPOO+KU/tCHHHuqohC1fOvpKXQj+Ez3NERgzNNY2ic6Cmn
         Tp6WRLOv48jXfAwPwS1BGjgLSMBMy5L69NvrslmFQXZlAPWq5ApuFKE11/ERRWYnP/7/
         Rt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699917; x=1796304717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
        b=GMmBMjWobd2AS/FKS/BVZ5tyJdOvA2sKFdY5A06NlwHSv1fhKlXTcy28PDuV4pYAMc
         2ntOsRlGw2zLmsWAOu1M1nwX64v7rxWN/fN0hgYQCHl6atTixq+nfCxP59BrHbVBilM3
         tRdrFjyfR/hNlmN4qHMRiPFsbkoVuSxhXKIm4K4x+7naF5JWyamftx7XS6e9lGrm0WE4
         oN8D8+AYR6Fp3//LFvsK9r7Xgfk53F0553XP1bgZeUfHapEM17u/04IVICX/CVC2ZjG4
         nb8IYg89f/QclRU8gyYC81yU1rr11Vf+kIPY5TldQMqCsNUup2bWj8umDilGAGXjU1yW
         lLjA==
X-Forwarded-Encrypted: i=1; AL+hErGT1oKq8cVMYE5c0OJ/FxYqOtMtGGifpmsSdBmPb7mVM/aK0KlG9rveQ/uj8Td/48LX62JBFsOiDlfW9mWrdJsn@lists.infradead.org
X-Gm-Message-State: APuU4Z+F/DOZptJXm7AHRNHNBd9/1K3bvrrw+7kOcpFzRWa3w3Lp8n40
	mkNt24LLY4M+ZeuSHpDBoYwJAvxunYVu9oirnew0txJZxRgPWPkefDwJf3PAb0kQaRPzNJCW4S0
	usb+KS9XGCUX1bxMwsylbTzSPzSfpTzr4dlB0snRzFWE0bszLIHfNJ44OU8xHJlgOJdT/3NdjZR
	AoejO3RNADGiGI2Bje0ZpuNAa4HjfsWbvdAi3eVoMsHR3i92LbvbBg
X-Gm-Gg: AZFdTZeY2DrxwE9rARUNWmh9kezMKvwajc3OKmTL2RgmJEfhQo7CxxpfwH0LXl/7EAD
	Ax811M25370fcLHB67cy3PGIviCTZK9UyhVmbJxXkaADFuAq+vvDw0L6NTIqEUKLeKfIvj89RCx
	UAyjNT+fsGE+b12VmQP2tN1Bm2U822HrNfiyO4qeJb96696ugLEKbWclDFJQ==
X-Received: by 2002:a05:6a20:748e:b0:3fb:4a1e:2f82 with SMTP id adf61e73a8af0-4014ce58b6emr21264790637.61.1795699917061;
        Thu, 26 Nov 2026 05:31:57 -0800 (PST)
X-Received: by 2002:a05:6a20:748e:b0:3fb:4a1e:2f82 with SMTP id
 adf61e73a8af0-4014ce58b6emr21264768637.61.1795699916655; Thu, 26 Nov 2026
 05:31:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <confirmed-20261105-18-6a8421e1b241@gmail.com>
In-Reply-To: <confirmed-20261105-18-6a8421e1b241@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:31:45 +0100
X-Gm-Features: Aa3M54ozD6ck_D13iF_4G2ldlHlAUxaHQPOAD28BUKrT-8-JuoTdL0auTG-EAf4
Message-ID: <CAPx+jO_btJdPP7Z-S-VCkM4hes33QKEJzjw-p7OhTcGRXirtTA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: gpcv2: Take a reference to each PGC node
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfXwTJdMjEfRIeU
 ChLtWinrGY4KldnYZx2vY7pL84FQxkTJK7oXm8/+NxEJdHz0+h9BdqXygR8d2RzDIleA/5LTBcB
 bhS89L0NsNQFMJ8hc3WkyfaiQJsCLazhXLepZcS3xrNAJpq9B5xNE0OIqw4OPl3uXhPEiomhd8F
 ru1BQF4M/4IOaKNBMPm2yzdJ6rKp3f4ORCPIrEuQThHtFC2sxTTP+HZIBabQiMhlfXjgmBN2sbK
 XgCohHDsELHWwMlQ+HrerDhOyR26zfoRx7AOZO8XINVFikZQUKgsRftgM7Y8bvlS/iLVU2OSK2V
 lBlxUSnzwv7JPVSFa28NnwskUhwUlCTOI61rX6mDjXNAqL2yJ/iP35oi2S9gO7tZ0Vp12NSM/85
 hXsrdf7Ic+34cK9JyOP1hvOtI4XFqZeXegxa5rooXzMDif9ESGoJRKxwzIwo23isaNGgs46G3xC
 WbSe/2dhaSgSwxo2khQ==
X-Proofpoint-GUID: LabAB_biBJMp7Q2bAYWH9kMeKfI6p-Ev
X-Proofpoint-ORIG-GUID: LabAB_biBJMp7Q2bAYWH9kMeKfI6p-Ev
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfXzEPZA5r5eOPd
 Z+nCHsmTjqvW17EfsG0DpclsVHoGSHMmIpkJv1m7X4CTAi7k3YqREIojiKvT6oLy2Heum4KCf0g
 s+2Dx8TueLy+P6HFn0wxh7X7Ywge7eM=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b0834cd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=zyzk0L4BWZHpzulOrW0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_053200_387873_4C41A779 
X-CRM114-Status: GOOD (  21.32  )
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

On Mon, Nov 23, 2026 at 6:19=E2=80=AFPM Yige Jiang <yigejiang86@gmail.com> =
wrote:
>
> The child-node iterator owns the reference to each PGC node, but
> imx_gpcv2_probe() assigns the node to a newly allocated platform device
> without taking another reference. If platform_device_add() fails,
> platform_device_put() releases the node through platform_device_release()=
,
> and the iterator then drops the same reference again.
>
> Use platform_device_set_of_node() to give the child device its own node
> reference, paired with the put in platform_device_release().
>
> Fixes: 03aa12629fc4 ("soc: imx: Add GPCv2 power gating driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260530004541.E04701F00898@smtp.kernel=
.org/
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> AI assistance was used for analysis and patch preparation.
>
> Based on next-20261104 (8b7179210b22).
> Compile-tested: arm64, GCC 14.2.0, W=3D1, drivers/pmdomain/imx/gpcv2.o;
> baseline and patched objects built with no warnings.
> Static source review; no hardware, boot, or KASAN test was performed.
>
>  drivers/pmdomain/imx/gpcv2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 6a54ee734514645db7e0628bdddcf579d1f0d904..7b377bf0196491298e9e772b9=
7d15a2bda9ff83a 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1513,7 +1513,7 @@ static int imx_gpcv2_probe(struct platform_device *=
pdev)
>                 domain->genpd.power_off =3D imx_pgc_power_down;
>
>                 pd_pdev->dev.parent =3D dev;
> -               device_set_node(&pd_pdev->dev, of_fwnode_handle(np));
> +               platform_device_set_of_node(pd_pdev, np);
>
>                 ret =3D platform_device_add(pd_pdev);
>                 if (ret) {
>
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4

