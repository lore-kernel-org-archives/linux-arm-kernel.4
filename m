Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6362A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yEMfci27;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IbfO81VA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WR5lZAld
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sZmn/sNxwAfKWKSIqSCT0pljBWlXHOxHLlaVhxvwNo0=; b=yEMfci27tzmvXw
	iHTvwJtqXP6pY0ph24QscMyNJ3E2Ae0BZSsIQTZfNy4O5UtKPKVOCGlYa+WPRLpOIuh+GLzpDa72x
	a5ClT+4LxuK+9poBUzeZiwF/m5oLACcW7hs45O3W4oGbzdV+vIcsFCeGc41JRr/9A1FeWRSdxTUEX
	aCi2Q6s8h2svDFe7SmZpHup0yeEuDKpLXmQz1C3BQyWlCOdF9kIyGqltRCENxjIafte/qqaVQEyia
	wW0+CaxvQ66UfObwj5neskdsV7z9KFMmZWlT0juWg9BT7/RfQ1ptz8njV8Ud+Dq48dHVBFDF9TPwz
	ji8t22JAv9qNaWdwmnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVZn-00000003tMF-3inc;
	Mon, 23 Nov 2026 15:03:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVZl-00000003tLO-230Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:03:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKr8s2621986
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZmn/sNxwAfKWKSIqSCT0pljBWlXHOxHLlaVhxvwNo0=; b=IbfO81VAygWqws1q
	TyYwzZLUHWgB64GgdO9dyaTt3zpAjoZJTDLgfEK+Re46q144zQ/jXm7UXcLujI3H
	3704UyUwCzMPStRZkWgk0SAvSYRVpYoQqPVCPMbG1rBBjNGXvQRthDqmm/VLgGmq
	eua9pk6y4yQJJboujmd9FOPeCnKeMLAi1zWreYZmb4BfbxKi6k8Usii2edWf3Qf2
	TPZ6mQvAySOhb7U/BEnLigjn1K43367diJYkpo40vAtzLfnyiP79fe+z1XO1Yckd
	yeY0KLT8BbSG1ND5//lKn9wXU+qJrzCeCaaZuhg7/Ttmcx3Impz72pohCAly1rYE
	5wYCbg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9y95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:03:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f03a137f6aso29045795ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795446203; cv=none;
        d=google.com; s=arc-20260327;
        b=XVMHghfzvxrajM0+sAQELoeGmSKco7miCHS89B/oh/+XhZsgEZRlXIpqFYI6a7Rucp
         KKdU/LFNUTOUyOtHL2hT5wZFCmBoxbpcJlV0IB29qFZNGLdMN2x55T0WS0Z4lh2WInZG
         SsrJApBAm0c31oKy6H3gW5EHWaTEoXjg5V7cMBrq5oSt1xAhfFDij3QySZDVB4jwjQuC
         7yyUOjXU7YhUHp58+Uo2nMqgfCeRE0CdR5raQYfgvTNtABtjBrxEgGNxweWBaGVlEO7v
         PoqXW6JF9yFJihxQ/nIhJVQGOckidnU0R1a7l7Onf+DwGMy32LOuqsRo8KMLwvAxNfjt
         /kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZmn/sNxwAfKWKSIqSCT0pljBWlXHOxHLlaVhxvwNo0=;
        fh=nKzAx9P/ndKLRCbeFe+C31GDUxbYNllb8yrr6Mng+Nk=;
        b=QIpjxtThxU4LV8el+TCW/YPVl2mvbDVMXAwc7p4KkB9LWNl+KFEsgMwuxSq8I8FPUl
         XjTctghhdux+CJRlh4kEREt7gf4+LaWFdmLzPvBdKR7uxysbaSCf4BnzFoSRzRhevUHa
         rVoBsSl46p4gmHgQsq/+UeKgO4cre8HuRfiTbgdpYzvyzpZ3VQ/zzVVH8K5jDDWKqvWW
         /o+4FYkJKOyYMfMjv+Wwl7lKfvAPiNiAVOtK/iKXtSNdBIpiRErsM5UZuhn+nC90etmB
         a71VHGpG79BtVOm3IH59hFh1YMY0hCliCrGUzxJmg7dytkid2rGnefT6yeJ7DFHUXbmy
         mOZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446203; x=1796051003; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZmn/sNxwAfKWKSIqSCT0pljBWlXHOxHLlaVhxvwNo0=;
        b=WR5lZAldSvjfj+lOaslyoMTbLLNjCchECLmXwmyqGRUij0psg1dDnqTzWvWUkK80Zu
         4V4yzi4pZtFbZjqRFoKt9Qh00zV/J8WSGfM5o6c2bUR4/wyAC8ppWp5HHeKnDbQks6wk
         1LRdu0ScaAJrPwNISriwS7WZSHkeIM+l3+OXulbpN3mHs7wxTqiTgkM31R/Vq5suvv6a
         t+2K2tf5STAbEdpfy93iKaoS4yYfe/XfJXNB/C3ghDL/LLZn/Fzpbd2aWMdqO3llkkgN
         P8zqqanDEE1E3NnxZIYmxqUpdJVv+1pNY28/89/r8LJd3TOoh8kqzHasFKbAnU01wzia
         C4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446203; x=1796051003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZmn/sNxwAfKWKSIqSCT0pljBWlXHOxHLlaVhxvwNo0=;
        b=EP8BEDLgf/d9/aZniLxlPuB8ExrwMNFehS8L0vgvDD4QeqtZs31+JxrOIJZ24wvULO
         +CLw8y5DAzzlgByyqYsAurgkpMdv8bVtj/4PhpZpJnVyq6MEuc86INtmLfNCrGxLsK+E
         U+udQDoo9HDHgeqijB6zYviuWr3BKjW/+N7vfWRfGST4PPMKMyy9YIGfTxOJctMeyIAO
         tDQNhutlFg2zqPhRe4Az7clpBEtAISVE1fiOxaISWJgjxITtJQk12RcHwve+XqNYo7SP
         HaEqY00Je0PJxGszbkyPuZ0zj8HQNI95OnOUIocpRjHbEySbeSSpiuuTQP0aqA59TzXe
         LnJw==
X-Forwarded-Encrypted: i=1; AL+hErGJH/XTujcAYHHQfpahOVESms68ukSrijH0L45eMJi+fpG3VeuMhjPnqeV2c8riFwoECZsnDIS/vwO36LlOGvCq@lists.infradead.org
X-Gm-Message-State: APuU4Z93ekBq0QnZvGtgU9O1L02ya3kVl+5BLAtc1IFgVrfs35//sq6O
	JDgQzomX3389osbrPz/kusFD841SGq9prQAVs8q8mvY41VfeIIP2eT7CN46qwewPiCA21Z1A1Sz
	noKnu+Kx/t1hiwSlxXXyacs6kIOZlzi/xE2DVHUmpIGMmgpBnUN5hSOx13Q/7UNqm/sz+qHHHtk
	12ajhubwEkw5bEE4C3Ota4uO4TtkimhdKyPAbqFkQMBpdqF8gycSuP
X-Gm-Gg: AZFdTZeswUTCaFAqOoag0EH8lkM8Cko/bCGXBds2xlQ2t7kKnT2lNQpLiWxpwAkTuzm
	0Ow2IVFbsSpxSTbQmTdiHUvaNO9lGgf4kTIBy2/ahabBT0W8AwZu5SdtJ4QQGnjQ2NgChCsTAxy
	rDwSfLhrJ4NUuWAsFD9PUgQZbH5xIhkbzCCh7XwexLGKTTiytZqlpmJoNcof3CQkw8kvAt2gzfQ
	yeGAyCOrKk6BQFt
X-Received: by 2002:a17:903:1c9:b0:2ef:fcd8:df75 with SMTP id d9443c01a7336-2f03f18847fmr120968095ad.36.1795446202899;
        Mon, 23 Nov 2026 07:03:22 -0800 (PST)
X-Received: by 2002:a17:903:1c9:b0:2ef:fcd8:df75 with SMTP id
 d9443c01a7336-2f03f18847fmr120967425ad.36.1795446202035; Mon, 23 Nov 2026
 07:03:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113-pmdomain-rockchip-v3-0-b7039ca30b87@gmail.com>
In-Reply-To: <20261113-pmdomain-rockchip-v3-0-b7039ca30b87@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:03:09 +0100
X-Gm-Features: Aa3M54p3bvaqL4-4P5a9q3TQOKbyz1uWNRpSG9PtFinKLWfQ4vS-W5Tpi3kneLA
Message-ID: <CAPx+jO8KYfvm+=UXKYZv+xBAmGNUU7xtYH9+cJRtOrnQh3GmrQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pmdomain: rockchip: fix the probe error and
 deferral paths
To: aiyengar1990@gmail.com
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Kevin Hilman <khilman@linaro.org>, Caesar Wang <wxt@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yao Zi <me@ziyao.cc>, Igor Pecovnik <igor@armbian.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: UCuain1xVxl_W2GUc_JeV_zPzQv_JmQO
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0455bb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=0OowS_b49qHy5rEh488A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OSBTYWx0ZWRfX7QcOtMzDL9Hs
 RW5SYjIoHHlKC9ootKo9mFqVN2hyK0fP3SFrU8edFJD/gpZCduI112wh3j9wc1Lku5dleY6kb7d
 dXKVu8aOF6Pxg3AK2s5QqVP8gg1hNHw=
X-Proofpoint-ORIG-GUID: UCuain1xVxl_W2GUc_JeV_zPzQv_JmQO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OSBTYWx0ZWRfX1wGgXVDwU7fX
 z0JUMJn70sX1hX3CMZy1ZUkz/EOAEoUxFjiPdZZEzM+TUjrDvndwOmwO6Avq9WU3WDizPfkQzjk
 tlUGTwae/5ynagcI3h8571+HUjPzrmx3GcAiSp11CEw7fUoXiHnPfLO5ZuMf5wGoa4q4YwSy6LC
 0ZfdQ80XILsN7OADQ+T/4UaH70ccZfn3ouutb6npniIpthlO4JGAdyO30EgblZDOaVODY7m/LxY
 NujX9JuH8Tm1JvSxQRe6FU0zIryL2PQKZUzq1cKCXkTIqGejWhStgW+ce0GMHV9pSDn3ddymwOh
 /bFcO6YuytoAJJvreh5sy/7pkqYS5MXk65LXoD+3D1kFioVEJ6kqqLmhGSUyQ6WPkR6VpOdXfeV
 8oiKxcr+4yqtT7OcNp3sSp6hN7w4WOA+3+3LXMALANjwP7/FaOLuabwM1dGEmaBFCfFRlYpKLvW
 YOUgwxAjk6sCBn4IYfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_070325_534209_9DFF9AB7 
X-CRM114-Status: GOOD (  26.84  )
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

On Fri, Nov 13, 2026 at 9:42=E2=80=AFAM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> Fixes for a Rockchip power domain controller probe that fails or defers,
> for example on a domain clock that is not available yet. They apply on
> top of 1/2 of Yao Zi's series [1], which has to go in first; patch 2
> replaces 2/2 of [1]. On the pmdomain next branch, 1/2 of [1] conflicts
> with "cycle an optional power-domain reset on power-on" in one line.

This sounds messy.

I tried to apply patch1 on my fixes branch which failed. Please
re-base this and send a new version.

For changes that are targeted for fixes, please send them separately
from the other improvements.

Kind regards
Uffe

>
> Tested with v1 on an Orange Pi 5 (RK3588S), v7.3 based kernel, with a
> test device tree that makes the PD_FEC clock appear late: no freed
> domain left on gpd_list, no -517 errors, and the controller binds later
> with all 26 domains. The v2/v3 changes are build-tested only.
>
> [1] https://lore.kernel.org/r/20261105001257.1368266-1-me@ziyao.cc
>
> Developed with Claude (Anthropic), which wrote the code and the commit
> messages. I reviewed every change.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Changes in v3:
> - Split 2/2 into the fix (2/3: deferral, pm_qos error code, callers'
>   messages) and a clean-up of the other messages without Fixes tags
>   (3/3) (Yao Zi)
> - Shorter commit messages and comments (Heiko Stuebner)
> - No code change from v2 apart from the comments in 1/3
> - Link to v2: https://patch.msgid.link/20261112-pmdomain-rockchip-v2-0-5c=
d942a23df7@gmail.com
>
> Changes in v2:
> - Dropped "pmdomain: rockchip: put only the clocks that were got on
>   error" for 1/2 of [1], which fixes the same bug
> - 2/2: drop the callers' messages and use dev_err_probe() where the
>   errors happen (Sebastian Reichel)
> - 2/2: a pm_qos syscon error keeps its own code
> - Link to v1: https://patch.msgid.link/20261110-pmdomain-rockchip-v1-0-6b=
9fa6ebaa86@gmail.com
>
> ---
> Arun Iyengar (3):
>       pmdomain: rockchip: remove subdomain links before the domains on er=
ror
>       pmdomain: rockchip: don't report probe deferral as an error
>       pmdomain: rockchip: use dev_err_probe() for the other probe errors
>
>  drivers/pmdomain/rockchip/pm-domains.c | 131 +++++++++++++++++++--------=
------
>  1 file changed, 76 insertions(+), 55 deletions(-)
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261110-pmdomain-rockchip-3497a2e7fdf5
> prerequisite-patch-id: c2f0c5eb6651baa744f66342db63485a6685fb71
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>

