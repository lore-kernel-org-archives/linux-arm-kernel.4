Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B483560A260A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mKvrACul;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0mLqlxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZEyw8Mg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=; b=mKvrACulH2pQ01
	saQYRDwtvYHpHq0Mccxugw/hRvWx0sSq8jfkvuu8OXO9uoTSwFYMKeKWzhsV+SRiR8EJoPlsK8yiN
	NvasbONx0LhXwL1usigKB00ULM0Fl3WL0ovDJrmDv42VPJNORgk7x8sn8blHDJzua5wZCEldIMr03
	n3jmQ+dsoFqKc5m2Y5PDjLxXlXJ2s9J+pBa5y/MsnyI/G8CHavRtyjY4ersfLr0C4uDnEtm0rRpuL
	zHx1n3WoDbyjZ7ZpzcWLsQCwZUOn08h3hFc5fIsjotGdZgSQteI1W6BxaRfHLPpvrEvh475q1HfCb
	ySUvllUXYCPOCmb0Jh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm4y-000000045S4-1Ocw;
	Tue, 10 Nov 2026 13:40:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm4u-000000045QP-1Q4B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:40:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA1sA3196031
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=; b=o0mLqlxoSJH4Vg+j
	xmwO9g4nHNXv/rczj6LLRRYhI8zuBowS5nt8SyRGQ0SPUTsx8d0zsE8MV9KqcoCw
	xbKZjqX7pye5oSoHGDt2R9bnFLoutzMs2bNQ06GVuZJv0Zap74CZRwLobZDA3CiN
	H0jDzriebLpxV80HVbkIElkKidp6vx4UMrI9aYBdpjx3NTstUyFC9WfmmEVbgFoE
	rlh/slodkkYFGELZgaA+bTRFCHudApaw/fKC0c1d5wUNWKNJ7vQuxP8tx/schRNJ
	W2x6aQzLEeh0M8LwOMntJ32rl2rBfy7c9semCBHWqm4acybcmQz5hWK5E/BgbX1w
	xcd+dg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03cry9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:39:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea71803effso20451695ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:39:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794317998; cv=none;
        d=google.com; s=arc-20260327;
        b=Jp24ErxmQTCI/irmY6gRhDjMU9yYlnQfWh/6Xq/w5Szwv53f4an5DYfqbMxRZIjJzH
         Dd80dE9tMxqo176g5STOiPmib3tkLhM5Gr4V/1L9J1L83Yh38LkywM+97pPcskntCW/z
         D9Dr/6ivpLgNmLiFu/aEWROInag+O2YvtQvNWxpI9LxdMm0gdR/ks2SkDlyzABDL7aUj
         LGPEz7mMEyyk9hCxFlf92B893/din2A0XKeHLNjCgwPVmAj4pN4B2HHRuysNssSCq6DN
         NNRT8ILETSv7bfMVbwdK4E9sTAwwYPN7DiTEEn34dSXIBJgNmpbsDHH9fD5GPiAIAX5e
         2iOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=;
        fh=sRZsHf8YbzNhMi8SsqtjU0LANfe5fD8VEh8vnsS4am4=;
        b=aJZnMdyUpUss6QY3RrMyhbVLgBRgUWvaRLq9gQhX/ICJdo4fI4ZJ/+UU4jgjIKAExF
         hPOuZInI0Wvh4gEtdWYtmO87xkNXyBfMxfpLoV6Fz5xskG7qqQKUjeqUANbNY9I8yG7C
         WjO+RES3kyTMHUqSle7rUW9oq0Jt7spgg0dHl8dP/tg/bqjqOJIma/7Dyod89WkUTN1j
         DQGqqjMTSyp61xMPuctQ7HU26HgvhObq+6TuewBX3VsT1W59L4eFT90eD3zY3WaMngUz
         aij9VWegxGMO5iokiJxlaVY9gZAiy3yDEB1shwsEwqWIigcr5kAqH5ll2/TJRcKVWsOi
         ey8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794317998; x=1794922798; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=;
        b=GZEyw8MgxcBzYBHePyt44YY3a8QIGGdytYZyOi1wXJOy0USNdFUz0mBgxC49tJJxPX
         iP6ysOhdPir+UNQ1HCSMqR4CliA8MMxb247Ig1qH2cAB4KQ3GL+Mts5nPzDDZ/4Uygdn
         o82Ot+wWCUR5lBYingXpQ/0AkMfUlZWBEp/WtABI60MBboAohrytY3UN6FBd8ongShVW
         qeGWBzki9iOjtjur4Ob95p+kS+TJKViiNODmQSKdd6a5aPGzWbelp9t7LBNqxVEX7Gyk
         adxey+lRRYAw5CcIe0E5x+3fc5E58Zu6HAA3wZvVcRjgc9XgHpwE5/3+uRT/FVKFQuvZ
         Gu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317998; x=1794922798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=;
        b=JeEvlI0n8syHBP4NmHbDiB1ndcx2XClTDdJNgzYngl4ur+ub3c8m7eBmeG6yPLWipQ
         fA7R+4u6jh9P+Tm9SJ5uTElPHHAivE0soWr/v89Ay9v2706M9gEs8NrlgRjoHar3g3PB
         R8YbXJymlYmctB/R61zS7w6Pk99aVYK/9cLQKOPVdn6utlmMGrqhd/4NJNC3eGF9XwnO
         tCHx14bFgl6v+4zOaomhXZAFVl4Ghib5RShDU9C/PeUwt2e3FFQBReGug8+1DPiYGy2j
         DNcpfGlMn9yyjed0ipuZ82+CQQC/kdHO9xBIrQtaCSXOKPNTbxmokszSsyoza4nwRxot
         K9zg==
X-Forwarded-Encrypted: i=1; AL+hErGUf6ib2XIb+4q/u8mj8aVPvE7vXH2uoK3UuE3glGbz/GfTjX0TUrMvy+1gnFA1sx6vo7b6YCHU2o+Jr1NBfCf2@lists.infradead.org
X-Gm-Message-State: APuU4Z9QdHaHQMVVR9mq+Eq231g+SMeAvxla4pVq3pFgSCt4N9uTnPA/
	6s1nvKM7Gw2B5fd8xUHVqup4VkwuSxl9wMNMNNQGXZ1jirt3Zb0UJ7ILX6qKSKKLqWfZVmtYkEI
	+H5vcz0g4dogJjRSQZnR8Sx8/I8VWc0njdF8IYQbTKoLqmKdXLCMnSX8oZ2rfheq22r3iuFBRuB
	cGZ3C3AL07sI0l1rffdOORxKWliLPJuSOHR/71gEakKTJHkSGAj4Tq
X-Gm-Gg: AYBFou0DM1tEFOiY7lP8B+srnay4LLcQ02JkavJZOxAyDtbrifelUjLzjA2wFMUej4F
	nWmD+MObcgkXR+/jWVrS69Vbe84TAkZYeZ0X1OKMqKZ4ILvHCpkhPIY5MkI+iDUM2xGP+Z/qadr
	I3SJW0YiLQYCR9vL/Lt/zIw8b5Me0wmzaooSoHtmQ76gPyjKOAlHCKKWLX1g==
X-Received: by 2002:a17:902:ecc7:b0:2ed:29eb:177f with SMTP id d9443c01a7336-2edb9164bf0mr23948715ad.13.1794317998327;
        Tue, 10 Nov 2026 05:39:58 -0800 (PST)
X-Received: by 2002:a17:902:ecc7:b0:2ed:29eb:177f with SMTP id
 d9443c01a7336-2edb9164bf0mr23948385ad.13.1794317997703; Tue, 10 Nov 2026
 05:39:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
 <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com>
 <CAEDN0nDjYLE5hy7gVLQ3hv1WESVJQWgc7T_8aLqzRui036A-_A@mail.gmail.com>
 <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com> <CAFBinCCxfp65Fe0D1UnupghgiOkTB0-m=+L0kNSOUm7DzRFKcQ@mail.gmail.com>
In-Reply-To: <CAFBinCCxfp65Fe0D1UnupghgiOkTB0-m=+L0kNSOUm7DzRFKcQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:39:46 +0100
X-Gm-Features: AclHuK9Cj5Yfw2Skuhr4nlPjsEojXxiMikKw6Cl-Wxr-T9dRxocHgrBfMronDNQ
Message-ID: <CAPx+jO_oAnJFY9hodP6gxPCD2ch0=+0MNXkKoJXz=3OzeAq+iQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: HELPMEEADICE <yuanzhenpeng210@gmail.com>, linux-mmc@vger.kernel.org,
        ulfh@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: pib-Mrk2_WLh6aqKTpM5AvPuJvQKeVxH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfXzXPnv6s01XLU
 2iz6PSA9KncOm/6ZzLiJkMiCE56iG2Kooin8wUICPINTeFz6T53UB/6mhfHqNuMDimvod5qGHUF
 Q+ylzytQtSKaHHQFPdFJXax4iRCWJKA=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af31eaf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=mK_AVkanAAAA:8 a=pGLkceISAAAA:8
 a=BQpyg1UmJCR0kPwaJroA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: pib-Mrk2_WLh6aqKTpM5AvPuJvQKeVxH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX87s/fM27jF9t
 6h9I65KtN6myv1IqbkC1EQycM8sqdbIisW1ISzUrBHe2t9aRiPPqk5ELpfs+djjdCHze3nbARUN
 jRCRetVhIkF9r3YQWUhLwiXAO/7fhdJWGoQ4/NJ1V4gB3R93DC0H9VfEUaZD8+3nMjJm30JeN9N
 ff0DowgY/dzOeVHBUz3HZEJ27lH2Yb16kjR21XkjlVq5h/eZ8NoPHqPQY8sXDPtvB8k9tPVsbbh
 iTIK9M1rc+TJ3GTqg0ufbpc+UGqP7zVhLvWbC0yBOhBV8tgprpYe/P3i1ncZcTVh2nomk2Z2E5U
 4aFiNrJ6c70HomeruCzrZr+ptnJ0Dttn4FzWtx1AFn0+Y32pcwVyOEyPu4pKh8FlggVw4+dA2lp
 NJnP1+MPNm7yk2g1qaK9tMzsBMy0pCb2N5ZmexDp0MoanmMn/3iFPj8xFoRwHWiS7xIqmuzLhH6
 QnAvkXlxr8by5H8xcmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_054000_520898_73A19988 
X-CRM114-Status: GOOD (  24.60  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026 at 11:52=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi,
>
> On Sun, Nov 1, 2026 at 9:55=E2=80=AFAM HELPMEEADICE <yuanzhenpeng210@gmai=
l.com> wrote:
> >
> > Hi Martin,
> >
> > Thank you again for your feedback!
> >
> > I've completed the comparison between the original driver,
> > MMC_CAP2_MERGE_CAPABLE, and the 128 KiB bounce buffer implementation
> > on my Xunlei OneCloud (Amlogic S805).
> >
> > The results show that MMC_CAP2_MERGE_CAPABLE alone does not improve
> > performance on this platform.
> >
> > Runtime instrumentation confirmed that:
> >
> > - dma_get_merge_boundary() returns 0.
> > - host->can_dma_map_merge remains 0.
> I see, so that will prevent it from doing anything.
>
> > - The block queue's max_segments remains 1.
> > - The merge-only variant behaves essentially the same as the original d=
river.
> >
> > Here are the sequential read results (MiB/s, mean of 5 runs):
> >
> >                  Baseline   Merge-only   Bounce
> >     4 KiB          11.81       12.20      13.01
> >    64 KiB          12.88       12.80      57.52
> >   128 KiB          12.97       12.80      67.68
> >     1 MiB          13.11       13.05      69.43
> >
> > The bounce buffer improves sequential read throughput by up to 5.3x
> > and sequential write throughput by up to 2.1x.
> Let's wait for Ulf's feedback in the next few days if it's something
> that should go into MMC core (either by default or opt-in) or if we
> should keep it driver specific.

I think I need to see an updated patch to see whether it makes sense
to move this to the mmc core. And even it would, we can always apply
it and make rework on top.

Kind regards
Uffe

