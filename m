Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB51606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nULgcqXF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOigGna7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GkCZ2IgL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4PCqqxbAPdHLMDmL/jc+BeC5eGbqxuOHjdxp6tKk8VQ=; b=nULgcqXFwsfBw4
	GKGgZmBo0UpQdHuMVgN5aLtYHjiBV9A5UgdMXSSZHavy931wFK9hIDLNCPR+jDm9Z0opWde+dKjB0
	17hMt5IRcAzUporv7wkq60jpTHp20JzEbRGtgU+4nfAa11Zx2q3qQCiCL/QJmZqM8+W52n5LKemtS
	XyDdC8778QcuKs+EpBeL3BycDrJg4jqFSGVIE2WQ9iqEdMIilNRplK8VEXtLaSJ24yjEVwPKj4UK1
	pYsLkKJKL4JbSEQe8GS5nbQD8btkNZfuQezl5kOR/167q9s1fTJJTXfYOVOZJB1rF3XFvatwur/No
	9h3wxS10MpHz9aCxAepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWErm-0000000ALA5-495z;
	Wed, 25 Nov 2026 15:25:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWErI-0000000AKyD-3caD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:24:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEME4V2099763
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4PCqqxbAPdHLMDmL/jc+BeC5eGbqxuOHjdxp6tKk8VQ=; b=XOigGna7XHOQIbMm
	GNzcHCAVLmMSg3BMLWbKcIUDcT4fSVApjAmbklR+6DTRGWWZT4QeGyR/gSwXXGNz
	FtcIyrW53cY55DrAMJDwJ5vq+delAmX6I/3VTWHa9nXj9HpG1rxVYRKxYOHOnh2d
	6R0rQN8nvkR22MxYoqwvFMhPEyne814gQ9NFPl2raSuMMZi7a3yfwORcxgkme5cY
	j2tEr8Mo8VkHJjBSDS/DTbPrBulmOBFf+egCVCLnhY0CZhkE7zUGwysTuh/Kx4ma
	sVhObKkDO1nIE/t1DhpV/cI0SUTmWOBbJlbo9yLeudytEokGWbTjPHAzF1c45Bpy
	mEAkig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61arg9jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:24:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0ac2d8225so24723895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620271; cv=none;
        d=google.com; s=arc-20260327;
        b=B3TMknuSlQjo9lCGVOWPmu5pM6lTgJpTBg/sFG1yrB5tbHNEKaOzfYuDtO/OUiWRk/
         LLT3tjb9+hkry5diORhsBPhateRqLjF4iM1A1fm6dxm609Pyw9XpBK6bDK5SRVdyFzIn
         Rvl9MvMZoQxHNKPuN2SRDCDyenN9TUp1cou3IGI8nIV5DPqdlfCrdU/1ySRG3cTuj5IF
         HFFNAt/HDdzoLaRy144r+db4DG3yhG+IN0rAUmDxKCSnd3QMawy5DJYgT58g93+LEmRX
         yMWE9H0OZ0u7plZ5UKsApyNLKCsWcHumgDv0qB0a1HU+oMD5j/4VwELlBFagPa5SHYqT
         +Wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4PCqqxbAPdHLMDmL/jc+BeC5eGbqxuOHjdxp6tKk8VQ=;
        fh=hYSl7bTis2uyM/npiFdcaxmA3tLeMl7RcqSQAMr7S+c=;
        b=LWsacl2BqFK2ugcJPipgwz5Vnd0H+hf5zoUHfafc2brKYx1MlYHLPXPP+xoEv/G/sC
         Febu4ohwSO/78G3Ug8pPBX8TkltPm2fZA0kya0U45rQOJqFetkGjtXa7j6SPdCUl1eRY
         nXjnGp1W83YM2Ofo2HANEcvBoQR6Fz9Q9WTSRJFaKBnzPHlT9qtpXPOv5cdMFD0/C7/4
         DD4KosmK+9VMIWnWXt/RH9Q4l/TYL7LxPCdln/IA7Wzn7j5InVYQfOuAkYUJoHdLYwXd
         yRaaskGFuf1TZA5tLMAdR6PoUTSiYrqznhE+clSnuGTvb11g8lt2jT4OQ1b55ISJ5L4x
         T8DA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620271; x=1796225071; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4PCqqxbAPdHLMDmL/jc+BeC5eGbqxuOHjdxp6tKk8VQ=;
        b=GkCZ2IgLP1+rRCQY9izwUaBF3NOXRkCfrsJWQvZ+IuIyPPLdqPP82vG6yzLHf4i6bW
         seLEusrfhd+epk6qVc3XsT4P576k7IVrxUfmH77mKjezrC3+lnx5/ZH+zsTcq0INuNeU
         yxhRUVb68zHZ9d6zLohyF6Lo0mNfBzPHzMq8LtVN2COJWGj9T8iTpBSH4UQXJpDlr2gj
         O9MAKPcjC70jrwD0lK0PPgDdA5m9k+SZkpQ025ajB+kdyHusLr3gYIohVkNZskGkI7Re
         lDEfEw6TTAKibsH4aY7cVFqzWxkgz/H918OZb71ug47KElyDoT0eAKvlU4iVviSZ7ndt
         7HxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620271; x=1796225071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PCqqxbAPdHLMDmL/jc+BeC5eGbqxuOHjdxp6tKk8VQ=;
        b=SH5PVePKsf+kzzuQO4hnWPIp4024xuixH6z8KK/bVvgkSDjGQDtarRmw4SQXAU5FVC
         esFmxMrvxUXMLaDGY2p7GYgExZf+F+EzeKIr+JGDfDhrj/v4SecDPTCLxFRMXI1MgRI3
         4KCi9t0KWtYwY6rKjcxfsVQGk7+ZWVEdat+Iboi8bdhnOw+jebXEPhHZG3YndSJMZkvO
         9Dr+mRxuMjUDtehx4mvHDJ9D5+UGqa6rWWFYHOTfL4y6AxBwkuKILy0JK0LvcIYxdf2V
         c50tZublG33R+MXnjFYoxGccBd3SoUXs6F8021qS8GK7osWffQVguooaH5XG+JJa+YeL
         ICLw==
X-Forwarded-Encrypted: i=1; AL+hErGZaJV2h4A375MWm06hyVtRT9daQoEL1YmCfi+yXgZR/kH1q3Xj0cYsqrAdO/VIyMy0T3QE6BYtJvVaW7k6xXNs@lists.infradead.org
X-Gm-Message-State: APuU4Z/i0m7z9pHZOdmxpUup5RNNihUTTslYYVt4fbIGSzccx6nVkl8r
	iyF2RrTW0hi/UPVa+M/DZBMp9ebf35tUbNoqQmXzqW8TYtnW/d6jVZ/SbCCZlrWIthQZSLW1GWV
	b7CwcWTjTV6hgCIUsNnJ8QrFvslIT8T0PZx/5YKsybn5SOtS6YE9cxWlQQLePHRkkOmzm2miUD5
	nlr1ri4qlDH6W3zhkS7gH/BxWIF/lQp9pqBEkVEbTzI2UrIiKtfVwxIgClDIAZ
X-Gm-Gg: AZFdTZfwVITP3HkSpbMXjYZ/k8MWb/xA0uXKnR/w5q8NmM2eWGLlK/MZS+ae+G4n2t9
	bWUbvuZXyBkkcGjkPSqEvdjcPxyh6DSCPfmAw1zdn7SzU+Xyy21kEy+8mg8MsAy+H2RgfahGWvC
	+WF4RBm8T0lvtewCnAUgXAnX/FBxD0SGm4SKsmumdS5ZCEc6zxOGg3tAnfoQ==
X-Received: by 2002:a17:903:b4b:b0:2e2:d09f:d770 with SMTP id d9443c01a7336-2f03f18fcdbmr179271855ad.26.1795620270933;
        Wed, 25 Nov 2026 07:24:30 -0800 (PST)
X-Received: by 2002:a17:903:b4b:b0:2e2:d09f:d770 with SMTP id
 d9443c01a7336-2f03f18fcdbmr179271375ad.26.1795620270479; Wed, 25 Nov 2026
 07:24:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795094118.git.geert+renesas@glider.be>
In-Reply-To: <cover.1795094118.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:18 +0100
X-Gm-Features: Aa3M54pJ48YM6_SXlU_kkTSYJ2hI-57deYpRMNsa0r9P3GyWSoliI7hEQs8n9Ag
Message-ID: <CAPx+jO9dY9yuJ5VUmuNi7t63nPNuYj3A7EWkwzsrmrZbiUQQFw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: ti/core: Miscellaneous cleanups
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Tero Kristo <kristo@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: zmGThooNSiJHwV7yUF7Gm3MUSlKwXfWP
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b06fdaf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=61mVU_RYb79rVc1cBGUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: zmGThooNSiJHwV7yUF7Gm3MUSlKwXfWP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX/Kb6z8m+Tiij
 ZZicWFig8B1M4LbDqK6TG0trdjIYivrIL94XKQrfojiDi16o8R/vLlUBrAKqeKdlBiZrSruBNjq
 3JnUuRFcz8rKpkwHSlp6Q8r2jW2KsW4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX2bjnW2RQWvkx
 y+lDTniWTVMIx/CkFJv+cc5vd/S4yYtOpPgNs/mXpMTlAkWCtPy0M7JtJkECr6WJjFFYcqEV5Qq
 uljq0wv92X2ZU2+Jc8UpHtF24xf50qo2B7pyb++R3XTC/mGhIhZiT98akne8Vwulkd1ERp3kxiy
 jdeqUWuksR4Jk+f4i7i4vuB/f5ZARV1xN/6h4EexmuZfuVGil6Ti8z1q46L8WL8ywJKkhxszITi
 F7UcDsbG+melyyh87WpvZOZqJltb+PdxQvbFZlbeMO8BBC8Mx/czL7B9SDZuSSS1r1UMfVCNI7x
 QrMWquXDWR/A3NHTxVJWU8oMH6vLKZNFE13ylxY8+AVlxAoH8piodtVSg2CiLkdbKpL1y541rib
 +jmq481QoomePJdo3rGJ20J42l9u+3QDmCb5iYyHWf12HA7eljyTNZWZoBzCQS/PPtW2Y8th591
 H3UkGCZVM9JPMxDdS5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072433_034079_F38DFE8D 
X-CRM114-Status: GOOD (  17.86  )
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

On Thu, Nov 19, 2026 at 2:23=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This patch series contains two cleanups for the TI OMAP2+ PRM driver,
> and removes a now-unused generic_pm_domain_data member.
>
> This has been tested on BeagleBone Black.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (3):
>   pmdomain: ti: omap_prm: Use pm_clk_no_clocks()
>   pmdomain: ti: omap_prm: Remove dummy generic_pm_domain_data handling
>   pmdomain: core: Remove unused generic_pm_domain_data.data
>
>  drivers/pmdomain/ti/omap_prm.c | 15 +--------------
>  include/linux/pm_domain.h      |  1 -
>  2 files changed, 1 insertion(+), 15 deletions(-)
>
> --
> 2.43.0
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>

Applied for next, thanks!

Kind regards
Uffe

