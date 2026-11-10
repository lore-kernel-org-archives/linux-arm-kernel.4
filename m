Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1060A3810
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HB0V2ANi;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d27fe/gl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hKNgR+Rp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=; b=HB0V2ANiGKLgSy
	8giJY0RlG9tJW0OyIoHq+cURJocFFLJimXyfDeYDqFvg/H2b4wH1gBKTkHmnjOhM2Nkq7KFeMNE3M
	e0DqXm+wE7KGtgZJ9DkcTmJSV/1dxn6uvy7fmHBs9dSXzW0gN/qUKg17eJCPHwm03Qrjx8mlv2MZf
	tarrxAJMlxzN6sX/TtPHsNsaCfH5+m1rFH/Q6di34UnsaMj/J0HCiXM1UNqQABcYkrWwaJ2qXAZE7
	chf9BBM37Q6yQty8Gyi0idpMu0mF1Ow2doX6/RHKZADxJiJ2Xn6FcbGzqUFS+UZlhgDm9F5CzDjqm
	GU4jqJ8GNDQeiIy+Onvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVW-00000003X7b-0ePJ;
	Tue, 10 Nov 2026 10:55:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVR-00000003X1Q-000Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:55:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lDls3392609
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=; b=d27fe/glQtKvSlKW
	CAKbr0p3yZ+zq7kpWozN7Of0wddOy+GbY8+15C74oKoRd6X8fM/xNQfXPyA2eF6c
	70y54o1E5S+YPwH+hVQkiQWDpXyviMaXUXWBWdcGYfZRdhBj2IDPVPvn1f26O9WH
	RcRE9boj8DQnBC5yoRcDxl435ldSMAPqY4JrLiQ0+7bBQB/8m7qwhQzr3u0BiaVr
	Jtyle+CtQP0IIxB9fbJbou3IYe/4rSFaev5s43I7bsNNtIUCFPmq2nvcqNcE6C/g
	YZneFWIHNazWtm00fYAEalEeb7Y2NL+Z4qUb87sEQ6plV6Ev0f8jGcwseKsPdWic
	ZRqm8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg33hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:55:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so1748581a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:55:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308111; cv=none;
        d=google.com; s=arc-20260327;
        b=i9ToU/IpZjZXr7z+T6skOlYWP4u67YZFOUI1a/S6lzSrVhYh3eliY5FTkRo08Ke5kR
         npj6X3RqHPsEqXCqKTP4K52F06CNh2h398sJfKDv6EDYBKxA9tPQlhSl5NpVqBRDnuP7
         VryMbIsXJ2qexsVSLqBFpYtQbRQoj9mZcNJzMqA55hu0hV6/ewAHDxnccYQOJaFthXZR
         gt2xPQSZgWr6d0v8UuI/nSK5mqSibArEr2d2IGBJMBrvodE8jkbzY38Kc5i+V51oKGm2
         Lpq25bpGkUnqGIfyGCrh9qYXYbTNuiQc1/FcCSwLj4Sg82TWZjV+HsOdn1sQvxefQjZV
         7BcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=;
        fh=7ymPZjaSCf0IO2nQshz3jycX8vqzTOUmvOznsRBG5uI=;
        b=K/JeuZ8VD+Fq4IUSkTnH48dX6jd9V22ed9qqlIy/rVoCMbB2yBPjHG8GuHwyOERbQm
         0ZaDjfDIImF8H6Bsxy5mdT3SEgIPRnG9kTEGoQga1Qeja1nQ6MWjdeYBP/ABPBSc0/in
         X1fqs7wa95kykx9xAT7hzDmPOZ+oYIV820A1Cdp4te95l3ldlyv4S1AGYhtVgTBzezq7
         fJeM4CcVfb1r5eCoxgo7ARYHYJ/4JlMUGUsCivkoQNmS2PqVdf1DMZ1mQKCrJlPrkOda
         4c3JEmin2JZsdYKB60wtRwlNCmBk/qJvyvMOOtGvqu8w2CAlpCnaAsyX1ekL9BVQzL2v
         W4Wg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308111; x=1794912911; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=;
        b=hKNgR+Rpcd1pxLbn+/ZvhqgP1RtPtMqG/dZZ3FR95BEH1xn1Kx0X2AKDBlW9W5Myyi
         AlIT1redIO5WAr1cz0lSBNXrpsJVZODkRbnQvY01TYRQ+Z9biEKXWB+uNTAWeOoHqQWN
         ujIkrImFI6M41VIqew/Ks33LzqVkuNHFavc9utlIYXL58362hsmCo/nkdcJfQeksclm8
         Wmgo5/1EXjgvwVal73ztppEHFKJIVUllCiApLT1aLgqCD+J5B578pwxN3zxnueimNwqq
         W3xyHolrWIEwNCnTJpc5vANc+3dB6MlVnzoKndLWgEHaZ3bNrxaG5dqwtsFNzcGbgqVh
         m2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308111; x=1794912911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=;
        b=rDgLyDKdr45IKgRgR1k9bqS1DMvyqWyBiJVJUmG+Zk8fVpLNIKS639zBl48Wngo2HT
         /yV+tDxPoYDguoJIcALHsXoMFV4Z3NEsc9EF8GYAcC/5+u9HfpgqUf5eIV3HZKXnpTVw
         uA7b7rWLrL+xw6afsd2l7kQZTuw7dzHOVtA/wfjboYw5rWKx1Wpre2Iep/nkSl8tjDZs
         sd4qTu54LDX0O8YtLGoOATnhL1Y8Ef7xoCvtzn3WXMvYe6JhHH09/WBl6vMhRRUXDBr5
         q3cWCy6xTE2+1daF2QNX8gJMcfJmfHyezldw3po0/1VmoBjo1eO32fASMmd9jWbixhxW
         XqQg==
X-Forwarded-Encrypted: i=1; AL+hErG9Ka1GEeWSJjNMHvi6P/OTb3BMnzZG1mS1gobIvcoTvHLUwIKpzvY/qVvcdF5GsPCZZrvhr8UocMu6BByWsOsd@lists.infradead.org
X-Gm-Message-State: APuU4Z9b/uEK0jDvF8qtipJqk4csGpe9mzl/+fvaZblQRhNkYno8ymYm
	Px61/XPSvUOiq1RZonBiOLyMEhMiJxLX7XTVra1dtTY/+95gUvBBKWoBirn3MHjYfdtD9awnj/R
	9ZuHvIgJeYXWGUtdJfr9wepwvnILFWhKTuqRYK2vyJrWn+TWLjsVD1yZJWwqCwJbPUy5RqaarAj
	4dDXPc1TxpQxjX/C6vx2A6D/+aXd6werlVwz78Nbu0kfXKb2CMRar+
X-Gm-Gg: AYBFou0oE5IBIE47agfDv7Ns1nPEUc94IEA/YFA8zoqFioGyqYSBddLfgHi898uQYIW
	2yEjAIixIVYIKAgFxwXblQy4Z9fi9uAqF1EDO8O3phPDQ44lppCAMf7avIwmgfuulkUP//QDOkm
	TYNOCATlkYiAhbjfRODyRGVQ5o3bF1Z84xXHEFoFIjpb8MLwsg3XuyBfklXQ==
X-Received: by 2002:a17:90b:534c:b0:3b0:a757:e370 with SMTP id 98e67ed59e1d1-3b167a3863bmr1285318a91.42.1794308110737;
        Tue, 10 Nov 2026 02:55:10 -0800 (PST)
X-Received: by 2002:a17:90b:534c:b0:3b0:a757:e370 with SMTP id
 98e67ed59e1d1-3b167a3863bmr1285304a91.42.1794308110234; Tue, 10 Nov 2026
 02:55:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006025318.503422-1-nils@buechner.me>
In-Reply-To: <20261006025318.503422-1-nils@buechner.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:58 +0100
X-Gm-Features: AclHuK-yZm3sakUxzv0BiFEttCIYN0ZmBsfWxz8lFwhcgpjwm5RE5v-I_qmF6-U
Message-ID: <CAPx+jO-18BxWDeKWrib+GaKNiy_DAjUqtT2-s2d9YgYtObJgXQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: Don't power off default-off domains
 in probe cleanup
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX4fiN7NXzUZCm
 K/BZlkcTM8qO+9UMyVUWHjvQKwil7xyak9VOQrYc/jvHCNNVZzVxCqzanz5abjOmgC8+Dm9hpox
 Gsd6kgPDjxLyVknxzCGxOHSzvMsLo/ZiMknSOZowUlgfwinCKzOZD4sAeya1dypzBRJWTgzqavS
 FT7fFo6moxG/ulhhKgN5faYYo8TYFpjfByfULAY145oW2OqbUQxbxWWKgo5r0v6KJYDD6t5st7u
 WxS6ZbNMHKAa95SRXxGj29fIg3ewwd3UOQ2PurmRD6Gk0FOGzCe9j8WHQQRreQzYZjf53ETsrAI
 JVCnZAxUgsd36G7WbeGjwNAxLaJ5Ystx1ZohPe6lR/V9Z67M0rFisi7daWOkVxGTQSqg+dNgLyp
 giDUgnyzL08G895MCUqwWS8RKaBV3oqQXZjZFSDcy4Z9dTtmnZXQ571+rHyQ8jvbrbYK3lD+2F0
 WI618ASVgJtZIyx11rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX3TBFY4o4fwfN
 5v9LG1lGsRT8/okc/Auknh5dndyQuMTeMCOYfk+SFqckjGbf23l8c4TbKdCMjv5B+3JUjg2PNCJ
 ZXd4LOKv0V3TWDNDDMY1KgV1Dr88VzI=
X-Proofpoint-GUID: sVqUPLr1NUArn6j817L3x6c8m0KnScve
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2f810 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=t40qi2bwvM8u8KFdrioA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: sVqUPLr1NUArn6j817L3x6c8m0KnScve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025513_154791_6DC20FA9 
X-CRM114-Status: GOOD (  32.30  )
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

On Tue, Oct 6, 2026 at 4:53=E2=80=AFAM Nils B=C3=BCchner <nils@buechner.me>=
 wrote:
>
> scpsys_remove_one_domain() runs the power-off sequence for every domain
> that reads back as on. Domains with MTK_SCPD_KEEP_DEFAULT_OFF are
> registered with genpd as off and are never powered on by the driver
> before the provider is added, so their clocks are not enabled. When the
> bootloader left such a domain on and scpsys_probe() fails (typically
> -EPROBE_DEFER) after it was added, the cleanup disables those clocks
> anyway, triggering "already disabled"/"already unprepared" warnings from
> the clock core.
>
> Seen on MT8183 Juniper once the audio domain is KEEP_DEFAULT_OFF: six
> clk_core_disable/unprepare WARNs with backtraces on every boot.
>
> Skip the power-off sequence for these domains; only drop the clock
> references.
>
> Runtime-tested on an Acer Chromebook Spin 311 (MT8183, juniper) with a
> 7.0-based kernel (the hardware is not set up to boot mainline);
> build-tested on mainline with W=3D1. On the device with the audio
> domain marked MTK_SCPD_KEEP_DEFAULT_OFF: the six clk core warnings on
> the deferred first probe are gone and audio still works.
>
> The change and this changelog were drafted with an AI coding assistant
> during a debugging session on the hardware; they were reviewed and
> tested by the submitter.
>
> Fixes: c1f3163d8ff3 ("soc: mediatek: pm-domains: Add default power off fl=
ag")
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Nils B=C3=BCchner <nils@buechner.me>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>
> This is a follow-up to "pmdomain: mediatek: mt8183: Fix silent audio
> from premature sync_state" (sent 2026-10-05), which marks the MT8183
> audio domain MTK_SCPD_KEEP_DEFAULT_OFF. With that applied, the firmware
> leaves the audio domain on at boot, so a deferred first probe of
> scpsys runs into this cleanup path on every boot. The fix itself is
> independent and applies on its own.
>
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index f0fa79e01..2b41bb8ed 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1100,6 +1100,16 @@ static void scpsys_remove_one_domain(struct scpsys=
_domain *pd)
>                         "failed to remove domain '%s' : %d - state may be=
 inconsistent\n",
>                         pd->genpd.name, ret);
>
> +       /*
> +        * Domains with MTK_SCPD_KEEP_DEFAULT_OFF are registered as off a=
nd were
> +        * never powered on by this driver (nothing can use them before t=
he
> +        * provider is added), so their clocks were never enabled. If the
> +        * bootloader left one on, running the power-off sequence here wo=
uld
> +        * disable clocks that are not enabled.
> +        */
> +       if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +               goto put_clocks;
> +
>         if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
>                 if (scpsys_hwv_domain_is_enable_done(pd))
>                         scpsys_hwv_power_off_internal(pd);
> @@ -1108,6 +1118,7 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>                         scpsys_power_off_internal(pd);
>         }
>
> +put_clocks:
>         clk_bulk_put(pd->num_clks, pd->clks);
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
> --
> 2.53.0
>

