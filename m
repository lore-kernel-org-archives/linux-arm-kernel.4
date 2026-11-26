Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE66606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BOgMWGV6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Hb3yvTDJ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l/HK7ujk;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKKscA3P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=; b=BOgMWGV6Fh3ZFC
	G0DWMYQR8DO60bOfRtd66SBfKR99iYtJqVA7LJBWrCi+dqivp5vegNOhI6KdBEGCvARqsxiXShcPr
	rDXzqclrFJdMZ2IR/cIsDKtRkbg+w5oTO1AqvqBTJHOgpC9nMDH7MFxVLqsP7z67KhhKW+9O7s9Qe
	xITQSlR9vatoxEmOnsj2LXAkpl6wtzmYVdcvUpd1wLLWXpfXxLWer/letWu9i5SFjqgHhJwHjC2Ng
	QaSWG5Gebuu7REyVEIH8dsqMwxUGdW4VFQlFxzLJlzAuoj1rc52Prc/hxMSiyev0bdKodMiiiwMF1
	+XhA58ZiebizsCwBNfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXXg-0000000Cwf9-28jL;
	Thu, 26 Nov 2026 11:21:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXWd-0000000CvbA-1SD6
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 11:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=; b=Hb3yvTDJ5qy6py9gsTR8u6kWkQ
	HNrLZryw61DKmJAbb2j18dCYVmrMPxHlFgdDmtt230vRuipcf32/lYguE26FfyEuX1jFke3mWlStf
	Ci4V9FemoP1W28w5rBKsk06tZNaqN8C4SrKxhsxHuSInlyRgAFGhPdyoEbLPWtR9k96+4+PbdPycH
	njhZi8WbzIuDIPsKNGE97cNo/byBN+d3jKxUmWr79derHDM+t1hgnxtWC2FZ03vI7KpSbb8x2cVa2
	v+ZozDnI8/A+KNWjjTJvfNxB4KaHfgea6l+kKF+lnkB76ncBeBGXSDi4t6GBZerOjs4r+aSrX89FA
	P9PxQ4xw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXWX-00000006Ny9-16Yj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:20:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBHm193145883
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=; b=l/HK7ujkF5oa4Abl
	q7LyN2Khml+Or2fGQIpbMI8M6zMZpCbZ2D/Osaya43rh/m6EmuMap3rDX4zolEle
	HNw8IAb/Dax65sGC3DkDhzJnbole+ZFE5jX0I0fWhrD1jSMRZibLrKsDGR/K88Ac
	CzFw7oc8ZEqG+kjL+PpwS2jFmPjzgBkqrPnEbX6cZufsmVGyCtB40y6p/OtYwxVL
	0Wpd6dvqvoB311vuWNhTCO1JLljTzc47W8cpWrD8L0Hbuhw98Vj9CdL2dDBWXr+S
	Eo96USNzB8uGo5h1L7QMOu0sMQLBkQ6gDAiHM9OfgDO2/jGAyXWvmedzOJTh1Jsj
	H2lIBw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662savjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:20:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4ca90ed93so3223249a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 03:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795692018; cv=none;
        d=google.com; s=arc-20260327;
        b=ldyACQkltJUcJH3pvzmAubCTKDRvGTTZ36PCcRP+O/J1TEPPGA5U92lSnEzeaARAMa
         KfMvTLbBGDa4XhdixOlQu0xcyLcRJ44A3MwDn3JmVs8lUFGCkd33nwFmcFVYycXjgNd/
         q4+jKgngdfDpdzQkaEkq8v56iwRaRhpcbHnGBNAdAhdeCD9IqXwVCp6EFeftvhEiCQjU
         FgPeye2gqZ9g+PyqHoGZRyxvZOcVEEgTlsqcClONkA0//aFg5DQYzBPhpZhImWivAen9
         HQcSw4eJ5Xh3WNPPDoagvxCifCMw1IzOcNiQ/A0DI2EMsSTvPECUDbum/TLo2h1lHUi0
         Ws4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=;
        fh=bGaMmejzR/4V8g1JKUaKFTseDVIa3Ijpls2xTakjJYI=;
        b=FsqxbL7uzH1ESRiV0HulJKNV85MwcQYdNc5oACUrMK3XIyHICcoktSdUMOBJOWXip5
         SJKhhgQO+ZvYcAECg83eF2jshNfHY40T1JRecuuXuqt61INDqR3cNYpqjLft8vBHVi41
         JUjDKM+AoDhlK7et5MB2bvu2zPDdrkUMhJtfpOT8evxCS1FKvftzsEFZCFX0uE6HIySQ
         LrcmdP+7xuj8KzRk54PRbGzjb5Exr8FRUPki90k7imaZ64tP3pzlD4B/8eL2DHLY0O7k
         BfbDxq7/hFYYHCxbIjNGjWpprBnJKvDrjXIiA/TOk6NYE0w3p0eOis4A9Vtt52NwQiVZ
         Qllg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795692018; x=1796296818; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=;
        b=gKKscA3PxA/NzYzMeg+rwTOligyLLEEAQHug6aSta/mQTmn7HlmgcwWTnbY0E4o4fG
         zkzL6qLXgGgufd4eCrsoETr1jI9AyZnANE9ol4jAiBjNfzD04lh9Fyx3ppeG+kWMUlZc
         iYVxUn1/UlR48D5OblE53Jh7B9hLPEYZ3nVdjo4zpeVS/Iol6M7oPXgXj3TVTyHFv9vp
         qZkDKgS1b8Oo3/c2AEX/MIXrBnd2LGYv4U6j2C10j5NZmemNl6GEob7axF7+QR8wFakJ
         BzUH618SbIOiwyKzCawhmdyVJWajSAPLbz/X9cjWJzqwVsW/LQhBeh0tVPYMXAozq/uR
         a9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692018; x=1796296818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=;
        b=qhU/4mB4wvwdOTWVmukniEAdIDvIqe2bk2zzRRgbJ4mKDpu/RnsK93EqAWhkc0eWld
         /UzasJQ8c/D3BnVsSasZLgCUchNJKSQEUy1erX69EVb2FHtIcKmEatdze1ymHimwXWuM
         T+B4ALgDys0tIcxIYIkPOa0G28Z/i68Tck/BgXWXsAWkwcAQVDTKBV1/XW/wIfzbvlrO
         5aKvlTn24ZR5Fziowh9Vlou1yhB4fP5atWtjZ1lh7psEkCOxEuZEe2+ns+OKCNRwpMdb
         uNfdTKED5cBHDOg3C71mnBnf7TEQ91bhycqcU6/P7bQdRkm/0QC1jLFFALD+kOFxvvav
         /1cA==
X-Forwarded-Encrypted: i=1; AL+hErHXAdWJHW4pT8qIOhB/tkoW64mJKZvsOI+dQa65obypgyNUsJ2jxILMyAYffShV5gP8T3piPzHaUE3ryUiORads@lists.infradead.org
X-Gm-Message-State: APuU4Z+5OD+BZNxdmIC54EQBm8b7nBf5lchGFhLNZXSTTJogr6hLf7Og
	xbt1zGcNkMi2wJ9+ZJ1WE5psJrHplW/ReK0+Fr4IlkvmLRgHdebNdHiWiOJ0yXPRFQNvZq7D+a9
	q7L7CEO2tR0gk24SmTrgIJblQJz7B51Z4AdcfgaLTEq4CY8VaCxDs1FVZNIwD+FWqahwV7OECEd
	dWbKRQJSv2z9q023V3BPNCgBAsfjTLTWjJ3Epdfdf0zVwM518vRwFR
X-Gm-Gg: AZFdTZcvf1N7vaIAhFyLp6r+J3X0eGXQvzn6zhornIW5puJpftNh/S/nr2wHC3ndwX7
	Nk5kP8oTVc1Q8WrJAPEM0i1RptjUxFeiKaA1PzAJda/vn4wXpSr2AnV9HV4JaPYHvL0bFT++Ep+
	kDf2xzkr8a4s0QrLk7Pwf+kCNhS00PeozcMnoTmn1Cqp6o+7QCwkTojCG9cA==
X-Received: by 2002:a17:90b:578f:b0:3b5:175:5aa8 with SMTP id 98e67ed59e1d1-3b501755ac9mr4329103a91.11.1795692017811;
        Thu, 26 Nov 2026 03:20:17 -0800 (PST)
X-Received: by 2002:a17:90b:578f:b0:3b5:175:5aa8 with SMTP id
 98e67ed59e1d1-3b501755ac9mr4329070a91.11.1795692017157; Thu, 26 Nov 2026
 03:20:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
 <20261104145502.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
 <CAPx+jO8_gCHgkeTB4aQDRjs1xwvXCB=zFjFBHB_UwqeOWSUEZQ@mail.gmail.com>
 <cc9c816f-eebe-4f29-a8b1-32c967c27722@foss.st.com> <CAPx+jO8d58tCoEL52baYMzjJ9VzyfpVNhruKAhrHrnEwuOoJig@mail.gmail.com>
 <47a78147-8504-4186-8e68-2d20d3832541@foss.st.com>
In-Reply-To: <47a78147-8504-4186-8e68-2d20d3832541@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:20:05 +0100
X-Gm-Features: Aa3M54qCBzOg0cyr4KewrZTA2vxkD-uFT-mziu9nF41gXnLv2lnfBKZ7ymw_lSU
Message-ID: <CAPx+jO-XcHTyAxdZTDQ6skJxdYRa8z9T5Nz2+naL8ZqC6pakag@mail.gmail.com>
Subject: Re: [PATCH 2/7] pmdomain: st: add STM32MP power domain
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Ulf Hansson <ulfh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b0815f2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=8b9GpE9nAAAA:8 a=rfZIK_W7AAAA:20 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=gloIJy42cwCfa957JhsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 0oZ9Z9Zlb7Y4_Hpd4DaayYwHisONAVPy
X-Proofpoint-ORIG-GUID: 0oZ9Z9Zlb7Y4_Hpd4DaayYwHisONAVPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX1KFZQLUnbOoA
 K6E49S42YzSV0awN5zTr2F8swlLxp0Kb/ltQstKO/KKV7BCvIVmMJ42psxg1BOwS9HSxNrLtIpf
 WRJuNsr7JrxiqRa5KfwAUCCxPtAziNSL16PbPcknMXNIxBCdohXmGxuEadyDqbNL53QFyveSOtd
 k3NfZ6DebJjHU2tutOY0bENSeV+vRNH/xWNxpHz7e7uEKa2P6yFa+86CkHqjVIPpjuKElD5eSzA
 7yZXIRT9RDrGJN1oWCzAVxqoU2FEnx/Nle6vMb9qoL+4VQIyM7Y/FSjFwH4Sqez+qTY8tKE1psD
 3B/dgP9c7rm0/yqS7ccxVGCQriLUH8Np4+Sx4tTuH8Cphecs/A5BPSKaiymKnVquPIyaBvRjKmL
 Rf889TlKOIlWTF9dHp+qnT60aNuLehc6B/0iAGArbiW+56JJNtXTr8whG+bR+YKgovvODCTedIf
 0fK4WiHWp1+hac4af+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX8qSS0/wUfkX6
 cCKRlgEZWVcGK5EbRT+ztw2hiQdnU6hPgJxOWm7TEI7jIPLhZfIkfSPhEoIb0tX6OSty6vA3MMC
 lcSLWtjNWLQpcCwTNXE9uiR4jiAP3lw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_112021_451150_F484A61B 
X-CRM114-Status: GOOD (  49.18  )
X-Spam-Score: -0.9 (/)
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 11:41=E2=80=AFAM Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi,
>
> On 11/25/26 13:35, Ulf Hansson wrote:
> > On Mon, Nov 16, 2026 at 4:11=E2=80=AFPM Patrick DELAUNAY
> > <patrick.delaunay@foss.st.com> wrote:
> >> Hi,
> >>
> >> On 11/14/26 11:40, Ulf Hansson wrote:
> >>> On Wed, Nov 4, 2026 at 3:02=E2=80=AFPM Patrick Delaunay
> >>> <patrick.delaunay@foss.st.com> wrote:
> >>>> Add a generic PM domain for the STM32MP D1 domain, using the PM
> >>>> framework to manage attached devices.
> >>>>
> >>>> Make D1 a subdomain of the PSCI cluster domain, so active devices ke=
ep
> >>>> the Cortex-A35 cluster in Run1. Do not set GENPD_FLAG_ACTIVE_WAKEUP =
on
> >>>> D1: system wakeups are handled by EXTI1 through the RET_PD PSCI doma=
in.
> >>> Would you mind elaborating on the system wakeups a bit more?
> >>>
> >>> The devices that get attached to the D1 PM domain do they have anothe=
r
> >>> PM domain as well, to support the system wakeups?
> >>
> >> Each device in D1 domain use
> >>
> >> - D1 domain to allow any low power mode  (Stop1) when they are suspend=
ed
> >>
> >> - EXTI1 interruption to manage wake-up patch
> >>
> >> For example for UART:
> >>
> >>               usart2: serial@400e0000 {
> >>                   compatible =3D "st,stm32h7-uart";
> >>                   reg =3D <0x400e0000 0x400>;
> >> -                interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> >> +                interrupts-extended =3D <&exti1 27 IRQ_TYPE_LEVEL_HIG=
H>;
> >> ...
> >>                   power-domains =3D <&d1_pd>;
> >> +                wakeup-source;
> >>
> >>                   status =3D "disabled";
> >>               };
> >>
> >>
> >> Then the system wake up for S2Idle  is managed by EXTI1 device wake-up=
 state
> >>
> >>    when interruptions are activated.
> >>
> >>
> >> Moreover LPLV-Stop1 is not allowed when EXTI is "active" for OSI, i.e
> >> when at least
> >>
> >>    one interruption of Group2 activated.
> >>
> >>
> >> To explain deeper, when  OSI is fully activated  [1], i.e with full
> >> upstream for STM32MP25
> >>
> >>
> >> - the PSCI power domain Cluster Domain allows "Stop1" and "LP-Stop1" l=
ow
> >> power mode as CpuIdle mode
> >>
> >>      - D1 is part of Cluster =3D> the device is D1 domain allow low po=
wer
> >> mode when they are suspended
> >>
> >>                                             =3D> active Wake-Up for de=
vice
> >> in D1 domain device is compatible with Stop1/LP-Stop1
> >>                                                   the wake-up path is =
NOT
> >> propagated to parent domain
> >>
> >>
> >> - the PSCI Retention Domain allows "LPLV-Stop1"
> >>
> >>       EXTI is part of this domain (not yet upstreamed) [2] :
> >>
> >>
> >>           exti1: interrupt-controller@44220000 {
> >>               compatible =3D "st,stm32mp1-exti";
> >>               interrupt-controller;
> >>               #interrupt-cells =3D <2>;
> >> +            power-domains =3D <&ret_pd>;
> >>               ....
> >>
> >>           }
> >>
> >> the Group2 wake up sources are handled by EXTI1 and but they are not
> >> functional when the LPLV mode is performed.
> >>
> >> We handled this restriction by EXTI patches no yet upstreamed [3]
> >>
> >>       - activating the wake-up path in EXTI1 device when at least one
> >> interruption of group2 is activated  for S2DIle mode
> >>
> >>       - with EXTI1 pm_runtime state for OSI mode
> >>
> >>
> >> So the "ret_pd" domain can't be deactivated when EXTI1 interrupts are
> >> activated for runtime (OSI) or
> >>
> >> part of the wake-up patch for S2IDLE
> >>
> >>
> >> [1]
> >> https://wiki.st.com/stm32mpu/wiki/Power_overview#STM32MP2_series_power=
_domains
> >>
> >>
> >> [2]
> >> https://github.com/STMicroelectronics/linux/blob/v6.18-stm32mp/arch/ar=
m64/boot/dts/st/stm32mp251.dtsi
> >>
> >>    https://github.com/STMicroelectronics/linux/commit/d216f8439d14e0a1=
1475495cf5445e05cc4a9da9
> >>
> >>
> >> [3]
> >> https://github.com/STMicroelectronics/linux/blob/v6.18-stm32mp/drivers=
/irqchip/irq-stm32mp-exti.c
> >>
> >> irqchip: stm32mp-exti: Add support of pm runtime
> >>
> >> https://github.com/STMicroelectronics/linux/commit/4a4a20f5c5aae461a7a=
14c98efeddbc9cd08c672
> >>
> >>        irqchip: stm32mp-exti: Add support of wake-up path for S2Idle
> >>
> >>    https://github.com/STMicroelectronics/linux/commit/1d3b854e7b95318b=
67afd2dc16b8ff5fc060443a
> >>
> >>
> >>> Just trying to make sure this gets modeled correctly.
> >>
> >> I hope that follow the genPD model...
> >>
> >> and if it is the case , do you need update in the commit message to
> >> clarify it ?
> > Okay, thanks for sharing and elaborating. Even if it's not entirely
> > straightforward to me, it looks fine to me, to model the HW like this.
> > Although, in the end you need to convince DT maintainers to accept the
> > updated bindings.
>
>
> they are not yet convince....
>
> But after Krzysztof review,
>
> I propose a other solution to handle the needed domain without wakeup
> support directly in PSCI topology
>
> see detail in:
>
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/2026111611402=
4.RESEND.1.If3d55e03486413ca40ac73f9bf07046e76a00f0a@changeid/
>
> https://lore.kernel.org/all/7493faea-092a-412b-8332-8fd68d20057e@foss.st.=
com/
>
>
> I hope that this modification in PSCI domain (code and binding) is
> acceptable for you.
>
> to summarize
>
> in code:
> -  pd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
> +  if (!of_property_read_bool(np, "arm,no-wakeup-path"))
> +     pd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
>
> in STM32MP device tree:
> cluster_pd: power-domain-cluster {
>      #power-domain-cells =3D <0>;
>      domain-idle-states =3D <&STOP1>, <&LP_STOP1>;
>      power-domains =3D <&ret_pd>;
> +  arm,no-wakeup-path;
> };
>

Let's first see if the functional dependency PM domain can be modelled
as you already suggested in the $subject series.

>
> >
> > However, there is a fallback option as well. I think it should be
> > possible to drop the D1 PM domain altogether and instead hook up
> > "usart2" (and similar devices) directly to the cluster PM domain. To
> > allow deeper states for the cluster PM domain even if there is a
> > system wakeup configured for the usart2 device, the corresponding
> > driver can call device_set_out_band_wakeup(). This informs genpd that
> > it's perfectly fine to do a power off during system suspend, see also
> > genpd_finish_suspend().
>
>
> If the device are move in cluster power domain, it is OK for S2Idle but
> it is not valid for CpuIdle
>
> For example when UART/SDCARD is not suspended, the domain cluster will
> be powerered-off

No it will not. If UART is active from a runtime PM point of view,
that will prevent the cluster from being turned off.

>
> with CpuIdle and with pm runtime even witthout S2Idle system suspend
>
> when sleep time > latency of idle state
>
>
> So Stop1/LP-Stop1 can be dynamically request when device are still
> active, even if device are
>
> not functional in this low-power mode.

Sorry, I can't follow what you are typing. Please work a bit on your
terminology and how you format the text.

[...]

Kind regards
Uffe

