Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7458606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1zBhLpge;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nc9uQR+j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYCHoLqg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=; b=1zBhLpgefwwQac
	tx2x112mDcvSqf2r3+m3Rq3NH5mnvTS1Xm/uIpfm79qq6XL6CA3MKLpLudj8ORBuWXu1YDBKGO0ca
	71JkY9kUSDDiOSDSS5yV/nis/VwIwTpTp9pYz2YlC3EMJDGOA9pH9yo2/g9ckVb4GX/f/aCMHXmVH
	bv5iDSkvLkngb9vAjI9dw/+C3pSXb2dpQ0uaNASUfDSWMhcyzv+H7Lptt05YIPHM9rBBkbZq8jKBj
	C2uC6g8UFH1IZW0t379URVoC0eX2XTzKuOE6qWiGqzyjReIqpjEKdGhO8RRaJ0fE2Z4VPLXq3KzxD
	M9jH9bGXV8NMc+k1FRSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAra-00000009Y4y-2wA3;
	Wed, 25 Nov 2026 11:08:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWArY-00000009Y49-0VqF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:08:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mdkE3127767
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=; b=nc9uQR+jLwGYfJ+v
	wCrebLA8CUnPykqKns+CQ2yrRQX7mBdPXHCMWPqrppNP4EEqU2xz/ZDxv4GlaaV4
	diSFgLYngeA848CL7VUmP79lf0CGvoFe7HMV9ryXoUlJgFCDYVA+vY5YqMNHvOzp
	AP64yguW96k89HPWqInNVzFmbAczwLCAuNLpnN+AtB/co6g5xKucvRnn7YHP17Tt
	nsxQo16Kb9HnPlxBxSSD/axvQB25PQ9cB8UzYqupv/HjZ1aliLqhuH91v4Qctbk2
	zFH/QuxXH5D6PfcOI6atlTGFW72NTj/SQ4NkYR6bvlOtcKnV3kbeDY4jlT8UZFVN
	H9JRJA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbug4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:08:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so4682643a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:08:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795604911; cv=none;
        d=google.com; s=arc-20260327;
        b=PekQiUExrQnjqH3x2oeAQBXxMXheN8SZ1le5M8xGDKsK8Sbz75BwwMXbeGlZdKQFlk
         iCWu7sBHICDH8fOO6EaTCO7/AX/guQS5KnfChKHPJq6JfqS5zSBjoyEdUwbGaDSsE9CN
         sL4rELKD2r2NEo25dl7hjSZDMaqunKVBRxv1gG09LLlgzPXWsq8/6CT7PhR5bYw4IsWV
         MqAUC+DVyMmCK6JCh+lpoemV1984apJV/glYVaC2/gTRZRmh2l+mzoSqK616zGPa/LQg
         WP3XsZjCe56m9adz7l3XQ51M6IUWak2U/3mk9E1b57/mGK26XpWA9vD4RzMQKpwYD/Cj
         epzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        fh=mjXD8C36OmWrV6GfqS43Eg8vGdYxkq0k2Xu/eV16HiI=;
        b=Oj9dPxLYzuUcOzxKtWOp0ybBEY+rSBqeyxVMeOzri7jF9Uf5GeAzFeWwj1Og/M+zhT
         2DE0TuQf+9b36MoHCbnH+X6p5+kWlJs5RUNSfiqYMgnn96ufV3cAzs6MjCxMA+yOtxiw
         HcWPOljWQmhdO2YIJUytB0/zz2DF8Mv4s+VD0mqLja3hHKESmvq3+0Eu/5pYgdIUapY/
         gXUHNWlHHFBPJxMhY0Nfk7VSOt9mM0JxAYJHHJWl1/bnONiwZa/MQblaUuvPX5eww/6v
         y86V9Tj2eO7+TNCRWYMpg33DRbeQdpZlepztmRKvg9M41TE9Nn6b7lSBYPdbcHTFHja3
         IkGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604911; x=1796209711; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        b=WYCHoLqgAn9+ZPniYr6rd1h0GofOsXvoihTJxGIvS59UKFqvGEiFiOor9QaRHiVZmq
         bZvPLteGwVLR+j1pvMPxYM4FNvdqTv6+iIBVad52YchPGnBhqd0UhdutNUdBVBQ/zjvb
         OvR1t8WnE1+Ze2dkDkrb1paynyL11Sfoh4cRZIsdCwuodfSre9Q0sPQedQ6yH+zADPW/
         yindj78DzvhJcWu+RRuV4e1nAlaMZA44gEU83F9Va2KqqgUNVd+Rv9MCmgmwf3/4mjpk
         7x8/irZoiyQMtopfGdHZWPryUnH62aDGbC4DhhazpFNh5ImUaHkivO5AVnQSDDMSRRkc
         m5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604911; x=1796209711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        b=1tvIymhox6ln5+I7WfTaGqmRcl57rVytjn+yWym8VPREA9p6vhu1BovrYlKgn7QqFy
         FHxz9a5S8xRCQfWZ6zp6YS7oBwQX9OLtfZLEC8a/x8m7RYE5jbHDphUznRYDyP3JSci7
         lvyeIAynidE1QBzvpliiwLDZLY+TeHq4SFZXM+s8twcD6K0B2agSMjo2a9Fmw8ypjdmo
         m7AlKJn4O6B7idGjhoGkcuKO8r8aksy2L7eDFCF7cq3dXoi1pq/+ANTjCdTNhOYhvv2F
         3mI6cAgtxuqcYl9b5Rvz3lBI8ZFnDXBcDpgDWCDNXZ8t2IChv5Yoc6qovleng+7qpFon
         13Rg==
X-Forwarded-Encrypted: i=1; AL+hErFU6OLgsvwZxe5tZgHeIbTF0Mw6KzHt0s3jxfjpLBBRSIB3MzSjPcWlJPWs0mFgrVFL4wvC5reeUlt4q/myMT+7@lists.infradead.org
X-Gm-Message-State: APuU4Z9phKMl3PijI0HDu0M7FZNSLsuTwKkoD8M2dJzoYajk4xYk8Mwi
	HZfWmE0jWhcF3/q1/+JDguVD0/V8Tn3lcz6tWoH0QreR/lFtPAtdY6P6T57i7Nv6Z2mZ4Txm/rm
	+b3qv7Jj9VxqY5rpvAiK9EwpiQloPbMdO0W++AzjH4jrurq52AZVnuQjgPYrZ89nkPxZ58ayXhh
	mmANOK7sTM3l2INVrAm1RSeoTtecaUF+Zqe/3p8HixUJu1R/qvFHx+
X-Gm-Gg: AZFdTZccCDPxXaJbcctVmwuD0MUxivX4IM4YwNVM+gi3u2vTpH8d8QYbbYruRrNi5bE
	OTCQ8EpXvyWoIyx2TI+ERLXbn1AIf92rFg2Jzt12neMACniIeig+0oiUpOv1RpMowncJTzPqboh
	zKScUEIjJBclNDo2E8LPEl7yRhy4raK4LXsUEMl18eZQ1sTb4DMDGR87NhmA==
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b41c911c91mr17608599a91.22.1795604910715;
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id
 98e67ed59e1d1-3b41c911c91mr17608576a91.22.1795604910256; Wed, 25 Nov 2026
 03:08:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <16bd6b25711f0e5a4a8ff7484ad3acba83a2a2fb.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <16bd6b25711f0e5a4a8ff7484ad3acba83a2a2fb.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:08:17 +0100
X-Gm-Features: Aa3M54pwdhQzxCyuIzV30L5QTtG5r_OlDFzkU_dedYyzSv3GvUcS-vx6Qv1tWoA
Message-ID: <CAPx+jO9F6MkwODVi10HkGNYCTJHG_0vc8Bc3FMs4go2q9+=_JA@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Paul Elder <paul.elder+renesas@ideasonboard.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX6wDOUID5EpJU
 wZlJgbARbVk1k4feR5AopCMY6hUFgBrivfXyQAQR2Nt+/9kWCkgdxySIZcbdv85jG1KYdK4y+6f
 0S1dykt5Auj7vPqXRzP8lbrq1H+cLEU=
X-Proofpoint-ORIG-GUID: jGWRibR797v3qLdaBXP5qSvDibOA7nLv
X-Proofpoint-GUID: jGWRibR797v3qLdaBXP5qSvDibOA7nLv
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06c1af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=LDBv8-xUAAAA:8 a=wQiWHD2DouBedGx1vnwA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX+tCs4dwxWEGb
 3OHd/TSUe+B7bw6Y6/92yY+DX1HNUrgH4tjqFwf4pHExHYsbpLWbZ95HtcVTHqhVu40ujbbZfVr
 Hfr2SN6bMr11q2KOgTGWOsZrsAs7jcCDyCi/kFmyqLxz1IvCytwpKJWz7FoSO786InOzcTzjZJg
 lAveEnoaUXJecxqDoE/AaPArTaXVZ+GJtnHgY8dWSKAphs32EJMTyk+yInBC0jiDzN2gQtxewqk
 aj2IjvNZg7xSyi4VFnKofz6vjIkc4JIxu8UcOKSxXfo9YsBsSWQ9PN+Y5w+H0gCdXxm4CBScKce
 aA49nmTmgMMVsC2tSPjEIkbRARetUlEUjwwVfdhxLyAeIkJdMi3ZWb5GSrXPu1tIuYwNH/8jPe5
 ip/QzDIMiLfNHnYFlFnX8GTL0wFnNjD8uL4pFfwRkPJ0yDhvO/gKpKUMxvcP2SfEVFrnCMf58F9
 r862x9YKamKzUVhkOVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_030832_166372_E3F5576D 
X-CRM114-Status: GOOD (  25.18  )
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

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2]; other callsites don't care about the actual error code.

of_genpd_add_subdomain() isn't the only caller of
genpd_get_from_provider(), hence this would change other behaviours
too.

In particular of_genpd_add_child_ids() could suddenly start returning
-EPROBE_DEFER, which seems reasonable to me. My point is, please
extend the commit message so this gets clarified.

Otherwise, the code looks good to me.

Kind regards
Uffe

>
> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
>
> [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
>     return -EPROBE_DEFER").
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v5:
>   - Add Tested-by,
>   - Clarify that all other callsites should be fine.
>
> v4:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index ee8075e90852e738..c242807f62579e5b 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>  static struct generic_pm_domain *genpd_get_from_provider(
>                                         const struct of_phandle_args *gen=
pdspec)
>  {
> -       struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
> +       struct generic_pm_domain *genpd =3D ERR_PTR(-EPROBE_DEFER);
>         struct of_genpd_provider *provider;
>
>         if (!genpdspec)
> @@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_=
args *parent_spec,
>  out:
>         mutex_unlock(&gpd_list_lock);
>
> -       return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
>
> --
> 2.43.0
>

