Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5E6606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dJUsbS+H;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VUXwsLnE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AzSu4msG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=; b=dJUsbS+HiI3/c5
	3HAAt8ZfsARxWqDw5fzx1WpbqKZWfqDna4+Bf5tYMyvQSsCO1ckO/BUBKILtIcicVlaU2SbFLBbcr
	XsRQ8raOlC4e2M9jLOKQ94EqtiQdn0nGuCkiBx6DI6lT7jD5vzQwN0TlGL8xRysT3laAu8uwUKQiB
	fdE90oVx2B0eI6uMueYJneA2IRx4yPuiwb58qkRX5dXLwpZniSVgX4fXRhIq1e0vj4zK/mDGkni5N
	IC2MGS+1r7fXIJOIdCCLMcJVZBHtA3B3sBLto6b/IbEPFuB8gqni/xGscO8EQdGkrsIkF28kD0VTm
	ZOq2LlnVshgsTz8j3WSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWchW-0000000DyEi-3l2j;
	Thu, 26 Nov 2026 16:52:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWchD-0000000DyAc-22qa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:51:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuIN03357425
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 16:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=; b=VUXwsLnERin7OHsu
	YlLK/cimg/N6nMwtb/3rFcpTDCS0vg6LajJtxShugWutizcqc4BlTZ7M8Hk+AzA1
	2h0ErmKLGxEdvk/fVu2qs+h+rFQQDjNHaF63+PaWnhJrxh3M9wud0nV2y3SpYSnY
	yrQYkXmANJX6tF26ZAq2Y1Fju3zWRtKvoYUUYnb3oTjQOxEB1vTMEjepS8BcF6C5
	N26j5DjPdfos/ks8jEk2Dph01gCbVcXUhZvjnJZM+I0uXYCIFvAE8KD7sTI0vNpr
	256p1oKqxZX6sennbCWMvGUG6Z63ikwLLWptj3M/2qnhPUBGs8HI86z7FM7XH3K2
	AeMgMQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfbtmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 16:51:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b45655b428so6073372a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795711901; cv=none;
        d=google.com; s=arc-20260327;
        b=Ab/sZsgfkWxl9qi3FmSjJdjogxeroQsNvtYFsr3ncceZpzRhpj946Jr+/HmA6XSx3Q
         JJa2U2+YhFpmT25GNgqtEuk9XnpSsj966N6PWG4X7Nb7FqLqzAPFripF+a8yoCCpvzms
         oUSWwv4JuF+0jD7M7C570D3zp40ShbvOBcwnGEu6z2FmLlU4sEbkgz/zFZytZstANDVm
         3s/BUg61W6qpQMkZB9w47gask6OZNxD1B2M4JXCslLOu5AWZMzVFqUCoy9oAf/f1GPWM
         VSNiEq3SGDV/tnJe24hq5K87F9LVjBUHqH5URdS+Ig9ltqhUQf+6Xj0bWKY5wkatHrKc
         jTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
        fh=1LZpYtWKH1lanIpA4H2GapaJmKr46kPmIIphBJPFB0Q=;
        b=BqhyrR+0OTxk1xYb3q5aFUfflmalnhln+94QS/u/zFHKRpepDWkpSJKSsFIMPtiXR7
         m3ahcVJRvV3e0ok4zIsqBwpJjffkl0mA55rBSoLU6oZ4p/EV4BkZIFO2dQ/CPBgS5+Nk
         DmB46jDqbmKoH+Gdmdkd3G3mrt3QgeVQWL5Yw6+XsQaxoO3/0okLrLm3xLhwEDsAsu4Y
         fQwTvshx1ecIXKcrQns/9aiKRlrijqJDA5++14SIg7i7bl1xTOWoJd+1aReF0IcYWf8K
         Lc9kbOrdPuClsSNdsVbk7XcW69DmCDWKn1nj48yqd9zg7mVM7IjSFYnAPj2534gNmBBq
         lQyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795711901; x=1796316701; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
        b=AzSu4msG/u5JrvA8Oqh9lDf0ePaf8PkQihgXj1wqJ3Rn2O8Aj4fvrpH1VPPpwcU3Uh
         Y+Hd7qDzWZWXvtDSESDdgdbnhV4VvNTzOm+kyRrgNYImnNxNBVE7H04K7g6BAbvYlQ3r
         spmT5b35xfKEf97i/xb0Ew3C1dpvn9RfIakVMqhcOcmk5bofJF5evX1t7PjY9h4EtLpt
         4Zyq2FzALRjRALwQ5faE3mOETYP8A1vcwL2nx9J+zrQPhzT7c4Mcw4RKjvmtepmyzkax
         vY3J9hXvz9ecUREjVtikzYXuY0h9jht/NphGm4ntJSf77hVbWKTtJRChKeB97NbLOAjX
         hGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711901; x=1796316701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
        b=ysDv+dJ5hsGLWrjYdc6e+0zEH8YPYdR6OG8DDlLV+bwBRAykA6LTO/ZweUjSK7K/2L
         RByQavr3CcRPGm1kGHi9z5FL0YkaiCZOpEU7AdkK31h01QLVSFIBHs5NHqqAqij8nZvX
         qmiL08f+j/4SxO4gQ2+nsZ0PqiWFeNyWWUPAByD7PP7P/NNhaq+koSXdO27LUD/LQ9F0
         8uRkLVrFQdHGSeMs8n3aq5XkjnjVqtx089Ii4t4b41yRwE/wwQeZ8KD6F8TBIUIFRFDF
         vLWFFlLyKwp8FD3mLPWBNo7oVik753cdQKLu4tkf5sbpdf0goWIg0D8Yb+5hY+Dc4iLE
         Sdcg==
X-Forwarded-Encrypted: i=1; AL+hErFrtz/xAK5xadfkql83aTgVgd1C1w5SIYeCxFST7dGgGnawYCf8wpdv83Rsnn0VUD/WUycUa48BG8v3r40isbm9@lists.infradead.org
X-Gm-Message-State: APuU4Z+5zrZIGfLJTPmJnNt5J4LCchSFoERQD0spV2tpN0s1nJ0jyL+c
	v9Tx32g1jNwwosYwp/eEdmH5AKYpEFH82xVN0bhmvvYiscp8iKT4AJKsbNcijgAo5uJBu1ivTOD
	kwoMeqTx/1YBsBgxx9YGxkfScTfWMMQtRv3kWq+hkKKgnLChnf0Pj6qLn5D7Lu9REDHn7Tisabo
	3Cy02jLAeq7bZ5gkyx2O9xZBYYOv7bC8yDhx3DOHyLty+fE/YI8s+8
X-Gm-Gg: AZFdTZf75d3pN5yBMf+WLsdIVCqV0PAE8wM0RdldewnXSMMrtPZKSLZigy24OMYhLZE
	4ajn1SYQv6TZdYTB2YHpeLWqcuhdkcYU+7NMn+ZWV+td5AOr1GMZsukG0qWXeh2QF0Eq5uCgpY+
	Zk9/1j2Hhn/Y7wF42k8kNgOTE62NiMI2slFJAKndkb8OMa5Cmd4q9XlKDXPg==
X-Received: by 2002:a17:90b:388c:b0:3b0:a378:1cf with SMTP id 98e67ed59e1d1-3b41c9b2d39mr21437071a91.22.1795711901513;
        Thu, 26 Nov 2026 08:51:41 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3b0:a378:1cf with SMTP id
 98e67ed59e1d1-3b41c9b2d39mr21437054a91.22.1795711901047; Thu, 26 Nov 2026
 08:51:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 17:51:29 +0100
X-Gm-Features: Aa3M54rgEbRi4FWdDNfEkN6ZYS8yeQYigoLC6T4hTzlJeEwKiPC6M76vYk98AsQ
Message-ID: <CAPx+jO9=UzwQVnmUfTpOoYxYhjEPv9V9AyMOCWv7iXDw41bZ_Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: sunxi: fixes and preparation for A523 UHS support
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Anfernee Cao <anferneemelokc5@gmail.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: BeaVlAddFc3G_JmyquoomCFvAbwzclRl
X-Proofpoint-GUID: BeaVlAddFc3G_JmyquoomCFvAbwzclRl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2NiBTYWx0ZWRfX94L9DsjGf5KS
 qSaJS1SUI/kf2x+K4tupneXVvWCfL+J72pWVe05QF6Jye/Bh4YVmgUfBzr8CkPbHnTsmePU8N6f
 qvUUE6bc37hbNA1t9LmwyfmXD8nQBAw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2NiBTYWx0ZWRfX+URZlPLWdQ5Z
 jbAgLNQjZOQCaWhXI4c9vWDDpuE4ZhTqtTmrD6PfzIRs8D17TOIXrY+WfqMY6x926bgkgfzHIqW
 ySCAXwlEJFMl0wj04+gIY7RC2ouRCI+sISscZPoEPCD3CNJjNO3KPaegBJCbwqq6Ucz+JIL/0yA
 LdyZ1bhrohV/BvWQ3IDQxbOKzY8y1TGwno73fS4cFnzhoPq6xsN2bF9Yjty77UyBum8xcOT8aRr
 fdEQ+Dl7Tz6+IXRQJLu+SQp/MTI7vS05fxxBFYwW6NW8YPuvK/NCxGgzfsCG9ePy+0Fy80bU904
 YwYKrrukG+MdbG7Igd/pSIqBIPaOOdyqkx8TY9Aok5xhXkudnl9ntTN4uJC05++3d5OhjRQhsZb
 iRAvbxG3jrVU3wSoVeNRL2iwX2rbBay42Y9iuScy4ZiUgdODutvAzL6wkTkbkpIrshvbCW/khrt
 u5aZMnr1KP5amU1YXpw==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b08639e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=8rAQGYXpxwjhbX_W7ZcA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_085143_645541_5719EDA0 
X-CRM114-Status: GOOD (  22.42  )
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

On Tue, Nov 3, 2026 at 7:31=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:
>
> This series fixes a bug in the sunxi-mmc driver and paves the way for
> SD card UHS-I support on the A523, which will follow in a later series
> together with the A523 clock phases, delay-chain tuning and the PF bank
> supply switch.
>
> Patch 1 fixes the manual stop command error reporting: a successful
> manual stop command is still reported as failed, while a failed one
> stores the error in its response instead.
>
> The remaining patches improve the DMA setup and error reporting, which
> the UHS-I work builds upon: a DMA mask matching the shifted IDMA
> addresses, IDMA descriptors built from the mapped DMA segments as the
> DMA API requires, and CRC errors reported as -EILSEQ instead of
> -ETIMEDOUT, so the MMC core can request retuning.
>
> The series is based on mmc next, but depends on commit 5e32202f532d
> ("mmc: sunxi: fix clock and runtime PM leaks on probe failure") from
> mmc fixes, which adds the error_disable_mmc label used by patch 2.
>
> Tested on H3, H6 and H616 SoCs, on multiple boards, including Tanix TX6
> and OrangePi Plus2E.
>
> Best regards,
> Jernej
>
> Jernej Skrabec (4):
>   mmc: sunxi: Report manual stop errors correctly
>   mmc: sunxi: Set the IDMA DMA mask
>   mmc: sunxi: Build IDMA descriptors from mapped SG list
>   mmc: sunxi: Distinguish CRC and timeout errors
>
>  drivers/mmc/host/sunxi-mmc.c | 122 +++++++++++++++++++++++------------
>  1 file changed, 81 insertions(+), 41 deletions(-)
>
>
> base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
> prerequisite-patch-id: 8d600908a2eb84acfcd034482dd6e345242f1464
> --
> 2.43.0
>

Patch1 applied for fixes, thanks! Patch2 needs a rebase, so please
submit a new version for the remaining pieces in the series.

Kind regards
Uffe

