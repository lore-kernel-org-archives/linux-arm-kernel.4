Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1D7606A991
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LyMl4kPl;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osPyt+7g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HeF9c9UY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=; b=LyMl4kPlVtSvl0
	3oY83Y1IbHHSMHPBc29kqSJuSe+cWfR8SrlT6JONfFrO8ZbU85K37hlIVNkUAeY+Yr/Aaxm+ZmJFF
	D8xNWbn4GlCuDyceXtiQ/yx1EzWXdjTTVH4xrAa7WdfPBP0gGJMJn02shyRXVecwTzOS+PY24VTwN
	OoY4djBHrHH+D4QkSfgfq5JlxUss0lTnNMFvhUN7JXJMnqlGzIP2417ok93b8oMyJBUPmUzetPA3H
	2fTol9F+fcK0Py5YH3GdmwUQST7DJ6U9n1onYEuXiM8305tAHlJiHSvos3RbL12v5lyjLGujEaN5k
	EpuAMwC81/cqto0oadZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMU-00000003gro-0zY5;
	Tue, 10 Nov 2026 11:50:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMJ-00000003gc6-3Xx8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:49:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAI4Q2881308
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=; b=osPyt+7gO87BqXgo
	kNGr/upeu6G4kfXdw2aX0zXqPXCmquPlDq7nH1cAvHfynsrirh3/rsThl/93nwqb
	iukmzL/WJs7n7I7lwidTzPDRmCg5cmNJtyL5G1g3vaqwABcV8Lds5fyuMnC9T0rV
	r6/BOXltqjtxg2woCn6C/SA01smybM/L5NPV5LAQWJh0PTG+/a4vVY37VvDW7M1L
	oK0mps8+EelvvEFw9hKqN2uasifsRwfnnFgTgIzuZtBRJp5nSKUWMd4L0l84Tg6o
	0yEYhHgHuumeCFndoioCnqeRab3Hx0oxWoCqYF/DQ+KePgOUpjwwMGHQM3RZ/wTD
	LrFieg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux8494gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:49:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so1677440a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794311390; cv=none;
        d=google.com; s=arc-20260327;
        b=jy37VlgWohDR1JBzLJl4qgmxDhJqebBm8CE7oks0xMs+IZOUDdGoGJixn+YjuWAWf7
         QmbCbctOovvH3LN2xkGjkWpirK/PEQTySrlZqXyKTxk2jehHId264zyjDA1SECpHpU4q
         +U4MWiwForlaPCUZCTAacpABjXIMwoT0Lbqc/kzPTEHFQMze39lDgBrnX8QEl2l8wmMu
         C2pDQnHuiWdFCTff84JDvxXS31XuncehgWfbgYgX6PLEngfI4ekXMPdaR6GLclVQLtcc
         v8P6+VcR/XH2T7qRzwi8Z+a9SmJ6jJSlr0uNpZnBxxjf4JlRsHpVyZc2D1Xiu+zPw2/P
         90Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
        fh=kdIjAXNUyECTO12znOGAs2FLd8xdf2R46LliM7ur3bo=;
        b=sX/mIfz5Ki6EE4aMQ7v6CtYvIo76sNhJyUQoArhZwCc1JhBjC+eJl0WV8kFcDNXdOY
         b8j0TmO20P0MMXyjM+PTxG5G+z3080kvJj0oBoTW26rSsCMSEXxgUdBqnoikvrY9/Xlu
         P+OhnVe+42m2K8aEnSUOt/clNbdwQDBQDTD5mgfbvmEBpqcEhNmH+Lr6ncL3iwNqLBMJ
         nDa1253pq80NcpjuHlwbHXJ50bF/PVm5irj7/MbdoCngN0cef4ywlRD7w5zpk+g121ae
         7CmYNODzlyJXebZaGZb6qr5l5FPvl+16SG6dPtgN6wH/vv51cle7J31dYUGgJ073WSN9
         7YTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794311390; x=1794916190; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
        b=HeF9c9UYatlZzUb9iKZpgohfjYCP7i8+Dcq6LfrDfHFXLdxa4rFSgzei9TUEjKOlPy
         TZLJlR7kHsqHGotRCiEgw/WJKnMZh88eg8Z+YKkcjJ17XZlN0l1Bik8uqZpZd7yYjIh2
         C0C+wM5JB/QGEwaLjx0S1W9UDl8ugjlrQ3DQJg9V9ihnqbmz7M+Gyf5Ye+LfbHt6FN1/
         8rL3w77WnIXGW/e3bfvua8roECgWyqLPU4PVWkhPR2tf/X48LXB2yFG0RhqYGsH/j/8u
         XBIagthLJgATEV4QHMpI+X/ZejqIZWyoHRqzOsoJjvvc7Hz7iNzFpwnrsntjCi8M4DkP
         LOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311390; x=1794916190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieBvRnMfyX6acNHGZ0fpmazyXE/Jj6j0kfgwX5F7vhc=;
        b=oSpo//q5wdiajJyYQdJ8BdRqTBAeq+fQlXzpBx2tHKjpu8w1Bliffr2YKt/Xep6mCY
         xjKpwI/1kShFzmTVn7cGZGJK97RJ5q6xrKu7CYcEWQBdDokur4O+6P7QAE8sKOQKvec+
         qLbPez5ztXBA/i3WOftZhYPF0d6jV6ucGfbtLYBxxlPWqChoJxtL5Tv+JV5L32SzeUvm
         njaMjTQDePp+I+46W6s8YNSNDYoWYq3DVxN4Qw4N4385AzGWk8JFqN/C68xMvypDRI9R
         BL4E7DhaF/Ohe9pVvmhiT3fNQ3bNAaF/PK5uoDFbQXFxjREbClKqHzqCPeQBCDEza99S
         fGhg==
X-Forwarded-Encrypted: i=1; AL+hErGVugAllcWTmcEFgcc2JNcYHMHvrD3foxKXERLhZ/VRAJdt7urTl3LSxbM2mGvC5cLYZcVJCKWveWSZsFLJVvjO@lists.infradead.org
X-Gm-Message-State: APuU4Z+fvmwqCfnp1wBogTIkGwPuPZ8YVFWSvjGjHwZpvTuMZB7icmSW
	s/u4dFnJfaFJ6wa4z9lvuFuTsMLCW7qZ2hkY3+2cVdjeqAvgRAs++mEVBebe5oFfeRBISwX2Q7i
	q4D212NGrkXDkOmS3Es9K1H9syU8ofKMdlBhzXpwz3QFSPfnWA0hyUYG+uuWmtMVtPyBAEpsXhI
	aANc1a5GOOJGithgi4dry6O8GRozHrP4oIFeyQ+ZkyzEC0duyRiwns
X-Gm-Gg: AYBFou00k6U0LcJnKLwgf0dvGVg8cFMBIakUQk/WjvLTkznTmy+b0ERLUbBBcTRE8yw
	CMNqgS/T3crsVfvD5OBZ2CRJ9AcXS5axxZF58ttPREcRmcGH9Ph60qOG4oP5m/GoLgqfAH4GOXz
	sp9yh3mXAobLszATyhYKM8fUPmTzwY3K9X2tT1AuPV10M0d8027DM8nE8jXg==
X-Received: by 2002:a17:90b:4405:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b1669f84c5mr2551053a91.0.1794311389510;
        Tue, 10 Nov 2026 03:49:49 -0800 (PST)
X-Received: by 2002:a17:90b:4405:b0:3a7:9adb:2a0d with SMTP id
 98e67ed59e1d1-3b1669f84c5mr2551032a91.0.1794311388919; Tue, 10 Nov 2026
 03:49:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <179318778660.81375.11263258280496155344@manyhobbies.com>
 <CAPx+jO_VxJctXCZMVdzeq4CX-Ru7ACM6=wQ7GMdG2+4F1pOcBQ@mail.gmail.com> <CCF5CCC2-2C9F-4E5A-8550-B8C64CD7F404@manyhobbies.com>
In-Reply-To: <CCF5CCC2-2C9F-4E5A-8550-B8C64CD7F404@manyhobbies.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:49:37 +0100
X-Gm-Features: AclHuK94rNqkXJQ-LJt7eo296GzqJBUJ5kGEs9mLdz46FPtkzJbBx9mV1nByLpQ
Message-ID: <CAPx+jO996hZ1H+RTYeVc66PCvnYOV=m3PNY4Xjcc=+jdcBVXwg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sunxi: reset the controller after an update-clock timeout
To: tam.do@manyhobbies.com
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX2NfUkaTWdPjB
 +SLkC4FFOrar66stcayWnCqiG6hhEH+xT8YCwnv5abRVb/li+lmpg1g9ir4Qy4e+wpqJEk+GEOI
 y1J5IdxXyXVs6nXAOwmqotuZxGrdV79RSadaxwnnut1RXPxhp/sBkja5RsepLSZJACyhN2l4ah9
 CjApxNKi9Vgt+0KslDz8XYCjONkSo53NqDJePkUu3SFkznASE+kXcRnaa1bMz26qKOby7ImCW41
 3lldQ06NyBAa0M8vUuUyp06IemaOI1MlWpZMHT4DZiHuBXb6VijodJcKyfpPKr/ElSA4D9VsbpG
 CTH30Dqg9zslfxS9I8wOjYWCDpsSYK30HDVShYBEC74hxW2pCrriZWAWcHmthFee4LkTAO9mJTd
 aLvAUkEsKFsonp5MSWokYm274yQefbdXt4W42203scPgGYpQsXQ5CakrAhxdN94Oj+n3W46yLyp
 ccSM8Ig+8XrOCmdB2gQ==
X-Proofpoint-GUID: 3IbObp78EwFgn5mjKkp9cE8MlyDl7-mv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX60+BKSFybEwi
 xuNQIONydomLyvr+BqZRRDFenXg+jQbHTDZuKxPbS7ExO7nYEfv4chNIYaLy9xwAShOqRV2HLMQ
 NeL1tMT515X5yTk34CsXYfDwG5S2BQg=
X-Proofpoint-ORIG-GUID: 3IbObp78EwFgn5mjKkp9cE8MlyDl7-mv
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af304de cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=w2OPf45SAAAA:8 a=EUspDBNiAAAA:8
 a=hraAJGsaz5TtD8VhunUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=-iXIJKm6ftRzmWoHelNS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_034952_046572_AE4B028E 
X-CRM114-Status: GOOD (  40.31  )
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

On Fri, Oct 30, 2026 at 11:41=E2=80=AFPM <tam.do@manyhobbies.com> wrote:
>
> > I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
> > loop in there that times out. The question is then, under what
> > circumstances are sunxi_mmc_oclk_onoff() being called when we are also
> > waiting for the SDIO card to release the busy indication on DAT0?
>
> Yes. It's the first update after probe, from the MMC_POWER_UP set_ios:
>   sunxi_mmc_oclk_onoff+0x17c/0x1a0
>   sunxi_mmc_clk_set_rate+0x1c/0x2c8
>   sunxi_mmc_set_ios+0xe4/0x144
>   mmc_power_up.part.0+0x40/0x150
>   mmc_start_host+0x90/0x9c
>   mmc_add_host+0x6c/0xa0
>   sunxi_mmc_probe+0x35c/0x478
>
> STAS already reads 0x206 there, before anything has been sent to the
> card; on good boots it's 0x106. So the card is holding DAT0 when Linux
> takes over. These are warm boots from the vendor firmware and it
> happens on roughly half of them.

I see. So perhaps check DAT0 during the probe and make a reset already
at that point instead?

>
> The supply explanation in the commit message is wrong, sorry. The rails
> are up ~20 ms later and the command is still pending at the 750 ms
> timeout. From then on every update times out until the controller is
> reset. Rebinding with the card idle never hit it (0/20 tries).
> I'll fix the commit message in v4.

Thanks for the explanation. I will wait for the v4 then.

Kind regards
Uffe

>
> Tam
>
>
> > On Oct 30, 2026, at 8:48=E2=80=AFAM, Ulf Hansson <ulf.hansson@oss.qualc=
omm.com> wrote:
> >
> > On Wed, Oct 28, 2026 at 12:43=E2=80=AFPM Tam Do <tam.do@manyhobbies.com=
> wrote:
> >>
> >> If the clock-update command times out it stays pending in the
> >> controller, and every later clock update times out as well, so the
> >> card cannot be initialised until the next probe.
> >>
> >> This happens on an R16 board whose SDIO Wi-Fi holds DAT0 busy while
> >> its supply comes up during the first clock update.
> >
> > It would be nice if you could elaborate a bit more on what goes on here=
.
> >
> > I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
> > loop in there that times out. The question is then, under what
> > circumstances are sunxi_mmc_oclk_onoff() being called when we are also
> > waiting for the SDIO card to release the busy indication on DAT0?
> >
> >>
> >> Reset the controller on timeout so the next attempt can succeed. This
> >> runs sunxi_mmc_init_host() with the interrupt enabled for the first
> >> time, so write REG_IMASK from sdio_imask under host->lock, as
> >> sunxi_mmc_enable_sdio_irq() updates both under that lock.
> >>
> >> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on=
 Allwinner sunxi SoCs")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Tam Do <tam.do@manyhobbies.com>
> >
> > Kind regards
> > Uffe
> >
> >> ---
> >> v3: take host->lock only around the REG_IMASK write in
> >>    sunxi_mmc_init_host(), not across the reset; v2 polled the reset on
> >>    jiffies with interrupts off. The return value stays unchecked, as i=
n
> >>    sunxi_mmc_runtime_resume(): if the reset itself times out the
> >>    controller is wedged either way.
> >> v2: held host->lock across the reset (not posted)
> >> v1: https://lore.kernel.org/all/179307312104.39863.1237281416347284875=
2@manyhobbies.com/
> >>
> >> drivers/mmc/host/sunxi-mmc.c | 4 ++++
> >> 1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc=
.c
> >> index fe4c0f6d73f3..55313780d06d 100644
> >> --- a/drivers/mmc/host/sunxi-mmc.c
> >> +++ b/drivers/mmc/host/sunxi-mmc.c
> >> @@ -322,6 +322,7 @@ static int sunxi_mmc_reset_host(struct sunxi_mmc_h=
ost *host)
> >>
> >> static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
> >> {
> >> +       unsigned long flags;
> >>        u32 rval;
> >>
> >>        if (sunxi_mmc_reset_host(host))
> >> @@ -336,7 +337,9 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_ho=
st *host)
> >>        /* Maximum timeout value */
> >>        mmc_writel(host, REG_TMOUT, 0xffffffff);
> >>        /* Unmask SDIO interrupt if needed */
> >> +       spin_lock_irqsave(&host->lock, flags);
> >>        mmc_writel(host, REG_IMASK, host->sdio_imask);
> >> +       spin_unlock_irqrestore(&host->lock, flags);
> >>        /* Clear all pending interrupts */
> >>        mmc_writel(host, REG_RINTR, 0xffffffff);
> >>        /* Debug register? undocumented */
> >> @@ -688,6 +691,7 @@ static int sunxi_mmc_oclk_onoff(struct sunxi_mmc_h=
ost *host, u32 oclk_en)
> >>
> >>        if (rval & SDXC_START) {
> >>                dev_err(mmc_dev(host->mmc), "fatal err update clk timeo=
ut\n");
> >> +               sunxi_mmc_init_host(host);
> >>                return -EIO;
> >>        }
> >>
> >> --
> >> 2.39.5
> >>
>

