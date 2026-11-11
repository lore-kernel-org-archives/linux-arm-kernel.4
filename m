Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE20606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tYMyCMyh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oao7cg3U;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NkbTqSLm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q0f/nKKS99c+OXd0pNSkdGGj5E5C7wcV8OUVHeCUNZk=; b=tYMyCMyhz1xsYY
	Cugk+1VbKSJfg6oDcJVDtBpqrdDsROkRYAM2vKq2VHL807r2MeTRTe1UxaaQTrWhpETuavp9Y68GR
	gIQy44+0VWbZD7KgOCJg/QLLVJl9MvRN023UjYOHyo0ZcYi+FPal3ZaEX8+bQnw0Yv16Ea0qLQCox
	UUcXn7nEcEJpPZEK2icLEIiKQg92oObUuxHzcHbKVS5+Qqri9+Jk7YJAHjODGf8jltWDNB+uPwRLP
	j6e0tjv+jbFQYmBmztsqR0QWsjGwlB/o6LNzpJN+Ebovp+EGQZmfNaN8XQXcg5+XhlnticK411lpb
	tFLJ9XePCUUNaGU3neDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6lg-00000006Wx1-3VAI;
	Wed, 11 Nov 2026 11:45:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6ld-00000006Wtw-4919
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:45:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAlMIX1052631
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0f/nKKS99c+OXd0pNSkdGGj5E5C7wcV8OUVHeCUNZk=; b=Oao7cg3UF7NY6s+z
	6sW8VGmSVL1tUcLz3+LDLQmI0pzReNMUHEIgkamwDqPzh/A0eObRQwhRTn+e4aTI
	1A80EEiKnMZiJTb9IaIAy/HvIgjnx5P6/OrgQT7hzBA2dRze6Tze0Z7HCkOdETHJ
	ednLib0DRUXjYHTDe2ENXQ7uPJGRqAq8DCgWe76cnvLvkIxsjH2rmqkuNz+/5e5P
	l1K1OFHHemH9G7qONWVEmv3rok3JdA20MD5zkVLQLMlemnp016+1diLiNAuMIYxw
	vr0lt58mfSwxUpidowIJ2ZLRRlWUgpW7J3r6SF+gNnLzBvkfKIu7dnUmQ/9x4s32
	aLLlPw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh2dna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:45:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so211652a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:45:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794397527; cv=none;
        d=google.com; s=arc-20260327;
        b=aHseUFZnFG6iTccXOKElt5RIcDic17yaNPbxvRTar2v4N/Cnxi27I0e0rKdHnClbvt
         mQ1fLmZlZ0ts+dchp11BoErQUZkok+y0+LhUtnnSDZ1jVlObgWIlpBxYsbtivBioJvWy
         Ptkk4gyW/nSTQvOqvGFH6LeXOZcNgV9+uSmhnVjzOzDil35VgnwHYt9Bc8C6BXvpaLML
         f3ZzpuCdTF8lqRp8XLUbovZemCZgvi2oCF80QAO92GNHL5BvViyJkNOXEZDmQ2mn3R3u
         XDhKbM3F0d0/Mj88klZanM4/u3q2WmZsBOnJ1SbCIvMqaohCSMUHxNyZlb4SDtZDyj/6
         Hfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q0f/nKKS99c+OXd0pNSkdGGj5E5C7wcV8OUVHeCUNZk=;
        fh=W1hHL4KueNXs99s76ttkrjo9jC1FApadHih0BJZAT/o=;
        b=a8aqcIadGhqsDGOg+9M4m1eBH3c0nfvi8d/VwfGWNjgY6B74JIM6hHoI24RriUXcV9
         08amUHuPJ8oVoIsP/my1ypZj5zbFKHLkWjsz3QatSDq0cmpNKcaqj+yrOclKCupAQ815
         JgliuaNocFR2H1LjJAyHQQtvVNA1vMiuUbT3nPgUwXH3FK7uOo+utj/h25DFxGKK7ysC
         4CY5sMz9jE0C6rjA8t5v5t23cAG3KkKV8mQYvkntu9CTpdpZ+bPcjvYYjzaD1I/gDcTX
         1t1eHnuU82pRzXbCFUBofi3mrQG3dmRZa+US1cCUrie2i0saGT36Lo0LCEcBTKLvUitF
         xcxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794397527; x=1795002327; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q0f/nKKS99c+OXd0pNSkdGGj5E5C7wcV8OUVHeCUNZk=;
        b=NkbTqSLmAs8UQaXF6DpXmXvRT2/ZR2EWfAcUxPDR2uiMiXbRH28vcFfV9R/egALuev
         nKVl6KM2Gb/+k7HBNH6OXnEVw/b1Re05V3mG2RYc/b4VtKCDqxKIQiP3GDZ1kDu7vp5w
         ps8riW3PJV8T2I+Cgio89tsb5tM52hAOUmviJqWEqvMcDrLXF8r93LG+V6+M/4mPf9/G
         FUfGQkXzS2FS+yAti63NLesSo/q5iJoec5zQB+LbsYvdmHA/7C+lCB333vh0ChAlJgTR
         jHu1+e81u80cWkYFpqeWZrY+rp20PTQdwph8vFiWwWGeRX5Gbb6ALt9Z9jgKsa5qLw3a
         eAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397527; x=1795002327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0f/nKKS99c+OXd0pNSkdGGj5E5C7wcV8OUVHeCUNZk=;
        b=aDYVzBt18oPwA77YEbltOeVCh65hglyhmjGMTZ1hQGIF6TsUt5No6rV9+UnNLj62Ao
         eBlNLSWcZeKcKJne5G0om9rwRqssXUYuNcg2JAEcwqdr3a12NyAVjiWnPq1gyxyjcfBn
         AsViHeby5kUoMmKQwIOuRppohaN7H2yPZkZngahN66Fquz2G6dEGaVKsw8qUhUHlLRRW
         Us+RoUBDrGOQtjGzN7fsaT1Suul+8K+6UJisMQLKVVjw9WhMhkDLNqRZNaE1hZ82YLPI
         RiMnh7ho5uLCxVwwTY4fGjpelGKCgX4J+ZxmK4CTnyhM+kfK/t5+nCr7nzaFSw+1kW3L
         3h8w==
X-Forwarded-Encrypted: i=1; AL+hErFiaO8hwl0nvis21y4R60v2dYWR7pWeInhFCyp6U2jdXVjWrUNiIl7fCzl6Av9HK0tIO6t2j9DL726TMBwaHit3@lists.infradead.org
X-Gm-Message-State: APuU4Z+du54I3UC8Ykx4nI57N03I5gp2zTBmVAg04fHiQZVylHXWndQ/
	TECkDm3GiNzK9014Cmqpar4PAivZAynWlXezjklsi9Blq5G+jHRIQ1U5WjNFTs2OFMuLhXsfyh8
	KP5g4L2oe7BRzTZu1sbvfZNxOdlo5PaF84uwYOB+REDOuZC8aDTqi5Mr1FP1WtbLS50X54PghHc
	V+3dp9uojDrxXED/E2ui174d0bkJMpwW+15xUuDzgp/itcbpSVoKEH
X-Gm-Gg: AYBFou2clRBfmIouVuBlqDRJ00j1iUutpN8S2iYdjqWeOsD183I1KCYoYTVzbLIkw6z
	e51JUkXTe8l2mrNPMS3xhnGVQ4ASaqqnrFJFCgRcIsIrNKxVgav9eAtxiaE5D7v9LCsRhyhcSLm
	HM038RgE3tHjnBjk7aqXM1G9dW3oHFpzzEtPuejwxmp8oSOENMZEQkxPn7vw==
X-Received: by 2002:a17:90a:d648:b0:3b0:91ce:6726 with SMTP id 98e67ed59e1d1-3b182f670bfmr2139909a91.21.1794397527178;
        Wed, 11 Nov 2026 03:45:27 -0800 (PST)
X-Received: by 2002:a17:90a:d648:b0:3b0:91ce:6726 with SMTP id
 98e67ed59e1d1-3b182f670bfmr2139888a91.21.1794397526705; Wed, 11 Nov 2026
 03:45:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030215427.488298-1-marex@nabladev.com> <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
 <51207e63-ec60-4805-bf6a-b10647ee3866@nabladev.com>
In-Reply-To: <51207e63-ec60-4805-bf6a-b10647ee3866@nabladev.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:45:15 +0100
X-Gm-Features: AclHuK_0eILUxZKoBqhaHYOj-lAecM7Lt5i6JT97Kq2dLHdRsEfKiZp-ve4mj5M
Message-ID: <CAPx+jO89Z0Z241L1jyB_3sUygdEwGicqT-WfHc6ppG8egHUO2w@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: stm32: handle mmc power up
To: Marek Vasut <marex@nabladev.com>
Cc: linux-mmc@vger.kernel.org,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, kernel@dh-electronics.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NiBTYWx0ZWRfX9h3phgyp6uF8
 HZ+I3ciw+uesZCv5jGik/HBqkUwMxDXBSAMw6kNtC/c824FGkxIxH4iGPcM1Hi499EyqSJU9RRN
 MXOFCPQ1icP4KABkt/WrwqIKL4EHeTI=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af45558 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=p-LfKV-GAAAA:8 a=8b9GpE9nAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=zk4-lHRcAAAA:8 a=JfrnYn6hAAAA:8 a=phlkwaE_AAAA:8
 a=sBGgpDb1PmiqPw1N_U4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=97BuGM4RKn6GwmfqMd6i:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=7cv85riZL9-k45RWW8P6:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-GUID: yM7OhnqXtOVbq_QwdQTpAXks2CJfE8c0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NiBTYWx0ZWRfX7fMunj/huPhe
 7PSdz1KUmm3cRBI4K5zkEI/QVST8goWaRBiq5gTE6s7ak0wtEAE8DH4W5VCTpqbCJuhETTIv7BX
 G2FjrmYen81ttQiIICj2RjjCQwX7h/JJDtplkY+WFikQSCqI0wl7ch1u5wtOHskTzSEQ0KzPbrg
 ppLUlCbCx+WnZlW+qwZixMfjz2iGx6cBOY7QFfvUlAuhKlgxzIoS9azuuxZ43m6JUk7x2D9Vhpu
 ZIV3mqs3USvoeTo9cJhNPNUnPspP4ktT1fv7DiM/OclBnkH+m/DqjpE1j1il2htP4KE6eq7U5xn
 nAB1752hJPZfxKrwMorNlP8McUXDKITdktojkBkLlYIMj4YhJAPdBQcWNYEf5MYhdCNz/8pxk/a
 rf5ZU/NtTntJJtLJpKyYzrxEoJAxA9MfIUOLav8c++fjhrN1yuDSBZya0vn7V1PRd6V0QTGcdAh
 hToCzB5sodjnRGlM0XQ==
X-Proofpoint-ORIG-GUID: yM7OhnqXtOVbq_QwdQTpAXks2CJfE8c0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_034530_147120_82529BFB 
X-CRM114-Status: GOOD (  23.67  )
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

On Wed, Nov 11, 2026 at 5:14=E2=80=AFAM Marek Vasut <marex@nabladev.com> wr=
ote:
>
> On 11/10/26 2:32 PM, Ulf Hansson wrote:
> > On Fri, Oct 30, 2026 at 10:54=E2=80=AFPM Marek Vasut <marex@nabladev.co=
m> wrote:
> >>
> >> From: Christophe Kerello <christophe.kerello@foss.st.com>
> >>
> >> Manage MMC POWER UP state like MMC POWER OFF state. In case of low
> >> power use cases, it will avoid random initialization timeout. This
> >> fixes a failure to switch DDR52 eMMC to 8 bit mode due to -EILSEQ
> >> returned from mmc_get_ext_csd() in mmc_compare_ext_csds() called
> >> from mmc_select_bus_width() after Standby1 suspend/resume cycle.
> >>
> >> Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")
> >> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> >> Signed-off-by: Marek Vasut <marex@nabladev.com>
> >> ---
> >> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> >> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> >> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> >> Cc: Ulf Hansson <ulfh@kernel.org>
> >> Cc: kernel@dh-electronics.com
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: linux-mmc@vger.kernel.org
> >> Cc: linux-stm32@st-md-mailman.stormreply.com
> >> ---
> >> Marek: Update commit message
> >> ---
> >>   drivers/mmc/host/mmci_stm32_sdmmc.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mm=
ci_stm32_sdmmc.c
> >> index 9dc51859c2e51..659a5040729e9 100644
> >> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> >> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> >> @@ -368,7 +368,8 @@ static void mmci_sdmmc_set_pwrreg(struct mmci_host=
 *host, unsigned int pwr)
> >>          if (dlyb && dlyb->ops->set_input_ck)
> >>                  dlyb->ops->set_input_ck(dlyb);
> >>
> >> -       if (ios.power_mode =3D=3D MMC_POWER_OFF) {
> >> +       if (ios.power_mode =3D=3D MMC_POWER_OFF ||
> >> +           ios.power_mode =3D=3D MMC_POWER_UP) {
> >>                  /* Only a reset could power-off sdmmc */
> >>                  reset_control_assert(host->rst);
> >>                  udelay(2);
> >
> > What exactly will this reset?
> The controller.

Okay, I see.

In that case, this reset also makes us reset preceding updates to any
other registers, for example the clock register. I would not recommend
doing that here, but perhaps there is no better option.

If I may I suggest an alternative solution, perhaps we can manage this
in the ->runtime_resume() callback instead. If the power_mode =3D=3D
MMC_POWER_OFF, perhaps do this reset there instead? Would that work?

Anothing thing that caught my eyes was the MCI_STM32_PWR_CYC bit that
gets written at MMC_POWER_OFF. This bit becomes cached in
host->pwr_reg, hence it's also rewritten at MMC_POWER_ON. Is that
intentional?

Kind regards
Uffe

