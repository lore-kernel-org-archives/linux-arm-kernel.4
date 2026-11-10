Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B2F606B2E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y4HjSgIp;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iuDAJXJ8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fR7EXUvm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6Z5YcW7xlIzzHsxLmHKjmX9pKRKSjf8ynNvjp0PPJ5A=; b=Y4HjSgIpY3MfyL
	4ZZZWtpS7mMKqD2PfNduwll/Vo+tL9UemfHuJm2rQplH6F3dDmWcCyaPWwH8+n998jxxi+8iMuhbp
	mq0zSbewcBqOwH/qEMkYxX1V7wufeO8+7sC9rwfdK+l+cxlbo/PjU0vZiI9NQpLcCFCAZ63YI++xC
	GXb08XR7DtCqA0W/helpykz2j3xWiIqTerECEx7SaQ6o4CfdfJhc+SeoQI4AzAugqFLG8epAczSyA
	A4cnYvyw0KdsZrB/kV8Se3oE9fQSScRO1CuyTnBe/DN8uo8/QfRikDLQ8mHyN8LIgKD8/P+4DdP5d
	C2ITepDPzTolnIF82Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQly5-000000044PD-1G2P;
	Tue, 10 Nov 2026 13:32:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQly3-000000044Od-29mO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:32:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9qUs3228346
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Z5YcW7xlIzzHsxLmHKjmX9pKRKSjf8ynNvjp0PPJ5A=; b=iuDAJXJ8ws2c8/K2
	9/o3QwBAzIrsi8dKAitTKKwMebOCcGsdncMrYeleUcLsB5j/j/rgFl0IO8SVhh1c
	0sqUwqtdGa+Y0kO7rCpBuFWHEqHeKMzEQ9u7irbHB7QEIyUXRrDCkZLjBfHvtTWp
	qmSAP3EjY3nc1/DUMsjVLTggzBiW2vNBIq5Gl/8PEMWNF5oLWkm//dElZKDsn8ad
	kykVh3RoE/ai7o6uZoxYUzi64iqxzi4/+QvTT9cKqom+ahvKRxgkh3OPWee3d60C
	/mMy9MCtEJfafT1UXMQfxk/xh/tvNubKFkJeXTRTGkXpDILoxRVCkqhf3CXw29pm
	Z3UFuA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d96d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:32:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so1055121a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794317574; cv=none;
        d=google.com; s=arc-20260327;
        b=IAlJ9upQnsyWZlWPdN+EnN9OfPqwylSN1JDSArKwZUJMgymTTMVjEnN3MRNt5rCV16
         5HXjKTuVs2AubUhBKZSPnNPlFR0dG7bclNVKFm8cTY13q2afqsZUfRNZphCZx5m0paws
         Yk6OPsnXMe8vMxyZTPgaPql+29aL25X1T5c+7nctF58NO0ZqGKX1vty5GeXb8TfhLGiI
         dF3A4dfxG7tAWqocuFUX819WXUxWtwpPBVXukjC1F48fjE4lwJkjTgbGbg1kmDC1CtyG
         Sig30T4G4T8rKthRgWk50yigsvC0IjiJSr5Z98qIoC5mcd9UfhjWL9Xmp7FKzmMJuxjW
         SXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Z5YcW7xlIzzHsxLmHKjmX9pKRKSjf8ynNvjp0PPJ5A=;
        fh=SRgYTP2Xjlu/LawsY/aKXqoDc/8AV6MRDbbnQE1b3C4=;
        b=psLPYy9VWW0tMQsWtjjv4db84TvoXDkC7WiLkBa152eRhSLvQi3ZKNB+BtnGPanbvi
         /M8wGouZOdbgSszIrHxhnlpVLO9lJV6llbc8nkW9hFyEAWNY/FJEaanE3hgTrmnjiD7a
         He+Gu0OUkJzgih1N/ePIERFpFjocnZvs/xdb2y77oA87JbpY1gcSxlJ6/AJRoI1k+azv
         voE2l0jz4N3ele+DfOFvWa8Ad1GPIGpRH5UKx0etACcx0QsNp4fZsHl3KUR4VhEYWy50
         iroTS7Grbp/CLyAoZ/bGKJdjUbeD9ondUPr/L/5Lr+CLzYbX/QoeZ6iQdnIDGAc+Vsrt
         rSwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794317574; x=1794922374; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Z5YcW7xlIzzHsxLmHKjmX9pKRKSjf8ynNvjp0PPJ5A=;
        b=fR7EXUvmkPPq8di4vVhRIQTEzMdK+pPn9sxB1mN9Q0M2u88Vf1loUn1qCXxshGgEHo
         876/FQJkaoXc5i87/QCZxDKET6kf8kgBCGp8cJFT+rLvFY4BuPLqjzCjhHMniXFQDZiW
         bi2V++yUdfoqH4a7bvM1m7DePjVavvwDf11c3LsEBqA48BMEnXA/0HHhU5glBBKe1XYs
         bfA9EzkZyxJTmeXg3BAt+MG7OVG8hJhe65EBCD5MgYsXxyrxTQ8aMo/Sk3++LKLfAwSC
         b2h5Nr1ct4G1CGoS2kr9/ANMWzYEmYC9JC06Dw55/XYOuM2XxIXhHf5q54J1L81x5b0h
         9b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317574; x=1794922374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Z5YcW7xlIzzHsxLmHKjmX9pKRKSjf8ynNvjp0PPJ5A=;
        b=IgFLRXSB1cuFxBHPF0n9ipSDzhuhmm0ayZfBqybXoTOFiU3rzYNUkD1tV/QWmXzExt
         n2kz8DV7U5HYTQTulvYmFq9GGbB+VidubHkcrEOajqoXPerwsxsZrYXBy/qXEBZvimZI
         EY3o6tDsCtOJPtvwIBvmJyzGGhCVlOAiI26YjAmODZlaiNY30ssnMwE4hHKb96SjmsjO
         BGXcINk22OkBOo6R/kZlXSxKg0CvRoIWTGcJ2iar8Xfvivo9HMVA+0dltUSVvdSLufw5
         OoeOtg1LGvTL11SRlXReX9JIkMXoUZKOhIaxEDquCW5m8TrTBvKFohZU6YpCrB03gvc7
         XE+Q==
X-Forwarded-Encrypted: i=1; AL+hErHs503PL2WJUNdX27h2pChE2RWEMRgIHXwWnatfieip0NKPHxJHdUdjQliXSZpKtneGz2EHCZJDUdtouSP+Es5X@lists.infradead.org
X-Gm-Message-State: APuU4Z++E414OQM7jhd44QeiUvdki00IKPZEAZxlqOQkMeiLzz1XU/s5
	E0x22sXk/z8OJnhoCvjBZPhRQLumVjjRc5ylpLZ1qHKJF3eLfM3rNK0EjKgT5N/bnrHbijxlu2L
	HJFhv1KrvNmQZ9/IO8uushup9eoj7nA1m8GRfWtxTbbk/kPhkpSIc0cXo/tx16pBFZkTFboLDeF
	TDE2Jh9YUgppnM9i7gY862DeHXIJqDiBZAFwCZYZOPqO7LJHHZ1e/2
X-Gm-Gg: AYBFou3tv71hykDBx/M7BOP564oqYnwRN2ujt1f6s+5JbgyMyhKDutP2nXOgRQ3a67G
	5FbL4gaNmZ4G04YEQ9pMGjtwJjxYkTbuKYt5jSUzSkEtRKmHlQQRTj4xyki0GbivSmmgnXVJtXz
	/X9FBUK7EDJv/2qrMqBTZS/2W0yavzoAheQoqR+lcf9c7c5kxPkplZQ8aTAg==
X-Received: by 2002:a17:902:da85:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2edb9162f6bmr24070765ad.24.1794317574406;
        Tue, 10 Nov 2026 05:32:54 -0800 (PST)
X-Received: by 2002:a17:902:da85:b0:2dd:ad73:5b68 with SMTP id
 d9443c01a7336-2edb9162f6bmr24070525ad.24.1794317573847; Tue, 10 Nov 2026
 05:32:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030215427.488298-1-marex@nabladev.com>
In-Reply-To: <20261030215427.488298-1-marex@nabladev.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:32:42 +0100
X-Gm-Features: AclHuK9cSqFPuGhIfXjvW3xjTIABdJvSnxFQcMIeO9HCW1ENUGZJbxffDIA9Fdc
Message-ID: <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
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
X-Proofpoint-GUID: 2_P-uCLwaXNN5ddLW7_hKUtMMG3KMMHT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX4LEmwKR+0DvD
 9Pm0nq9MOaZYXeIJCR43xoL7VM1xf+MpLor9w8g0hJ6a/8AShUqGw7hud4uPXAEISOFZVjioPqT
 NLCtcvWz8C/JcWpmPo+NfgD2si0QE0w=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af31d07 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p-LfKV-GAAAA:8 a=8b9GpE9nAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=zk4-lHRcAAAA:8 a=JfrnYn6hAAAA:8 a=phlkwaE_AAAA:8
 a=T00PcwSzXyzIdGW_Uc8A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=97BuGM4RKn6GwmfqMd6i:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=7cv85riZL9-k45RWW8P6:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-ORIG-GUID: 2_P-uCLwaXNN5ddLW7_hKUtMMG3KMMHT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX3Qe3gWnIrnV+
 OHQ9Nh69DM3afanQfom3ZE3toYw87oPbz2FL8UL5e3HkpQhAeMMjp0ghghPW327yGGx6R9rHrk3
 sunW532Ltw2XFRsMiFfdhAma8X6h9Jf7pwjqpbC25nXeS0Lm+u7nkoNeXtIJHy7AQrHuKYRqpSc
 XBVaEusNWoLisonoL6OW/6BbcHqEKpTUi91ZWxZus+X5YIO7RMcavmEA3sxY0mAdpCrnElCBWn1
 CQiuG+zrEG1SWzweKkzK/0rsfzWK22sEPFtegLumeJb6MfzdAfnWIXo1QpmqAq3qQi4I4xLN4yn
 szA26zR3sPoXdj2kBVMSKlowp7BAQ0Ko2zzFQWLhStIz98pj5dcbrWnGenHmGKxwzh/P+bU6F/U
 zTCRhQPXLy9mfAQwaVWY3rgZhGradI6B/JXnncHJBS6VI6pE6AUBqIjx8tpoHS+3VClDleDQO7h
 UEOeu5tbVPdOCogOyhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_053255_559861_1CA93974 
X-CRM114-Status: GOOD (  20.57  )
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

On Fri, Oct 30, 2026 at 10:54=E2=80=AFPM Marek Vasut <marex@nabladev.com> w=
rote:
>
> From: Christophe Kerello <christophe.kerello@foss.st.com>
>
> Manage MMC POWER UP state like MMC POWER OFF state. In case of low
> power use cases, it will avoid random initialization timeout. This
> fixes a failure to switch DDR52 eMMC to 8 bit mode due to -EILSEQ
> returned from mmc_get_ext_csd() in mmc_compare_ext_csds() called
> from mmc_select_bus_width() after Standby1 suspend/resume cycle.
>
> Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> Marek: Update commit message
> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_=
stm32_sdmmc.c
> index 9dc51859c2e51..659a5040729e9 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -368,7 +368,8 @@ static void mmci_sdmmc_set_pwrreg(struct mmci_host *h=
ost, unsigned int pwr)
>         if (dlyb && dlyb->ops->set_input_ck)
>                 dlyb->ops->set_input_ck(dlyb);
>
> -       if (ios.power_mode =3D=3D MMC_POWER_OFF) {
> +       if (ios.power_mode =3D=3D MMC_POWER_OFF ||
> +           ios.power_mode =3D=3D MMC_POWER_UP) {
>                 /* Only a reset could power-off sdmmc */
>                 reset_control_assert(host->rst);
>                 udelay(2);

What exactly will this reset?

Kind regards
Uffe

