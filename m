Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5C606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RklmYApt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DaxiCRDw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A89XSZw4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xpqEcbdryqmNzCYBxrtc+JnocUXAgJ2tF34/if55qtA=; b=RklmYAptTTROSM
	GgQumFcCFvbI20v7tsGMXQMcz+wFMYKlkDqnsxtFhpnZuaED8sIabXlkp3jn2eqnVJEo2MVytyNzz
	rCXfsVILQ3o+JQ624HeK3zgZfXhpceh+DY6ruPFboZQPb7Ip5Yhfz50BW0+ZVeXhz2RRvMZgJRDa3
	hqYsnE5A91SWlJ5GkuLY6JC2IWZbxqOS6jtRxRhhPt56pXbvR8mtSW7pFH1NsEHQLwH6lRUigvwok
	35JoahUv/gkzcbG089EKm3ODk3OZrBJc3+IO/MjL03YyYmu5/lmAKl/NugC+eWxU8VYEMAKtiIamN
	Ggk3tLAgKZP5C+A5il4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCGq-0000000FvEm-00md;
	Sat, 14 Nov 2026 11:50:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCGl-0000000FvEC-0Pk3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 11:50:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w8l4464604
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpqEcbdryqmNzCYBxrtc+JnocUXAgJ2tF34/if55qtA=; b=DaxiCRDwL3PG3tCb
	P2TkTlCM0rl+gfK85hrsUxG4n2TT9RA/LtbQMPOxeNQi4Xh6rwHSEopBiiCY8l7E
	ZBKdDt4uyDIXHELwKdDd8b44MRuh0pVIdutbdk377XIRVhwiEv+IwdrDfS80eKe3
	ThUGOB3zGZvFG5gIckQK8noAFQcVvXgtIUTulSX/unndBrFQIov93q9yEWoNoZZ2
	8OgVhLb1pxzMiILe7mr8EFsRiCwBU3uHvc4aFCWMAajyl1Cp6VvZcjBtVkQ+ge2U
	SAgKuZHOz7f4wdfZAymOKF7jfMcY1Q7RE/x4E0nrgJJl81pk1TmsuEflwVgTPSet
	SikTJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdrns9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:50:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so1439762a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 03:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794657006; cv=none;
        d=google.com; s=arc-20260327;
        b=JWWvdWnFYMBIDj8LAMYRhRsVMx7gTGJcOK/Gzh+yyrDD7AZMZM/HMWuTDIDusJ2H7B
         cZ8Q9TL36u4phXNbGuJQ0iq34Z+CLDFBpsb+k71mr/rOFxmxuyvw5OrEM7WHvcB+FgKA
         ezwbSG1YFPDTviGeIsgT+k5KUyqL8JCGGLJ2b5fciWvn38WD/IZ1RT5rM1SzZttMpoeL
         mAqOP7SUqTPaCGYzu7W69/lFxa7amJDDCSMzEJFZVy7QSPTdqEJyzZL/Gsaz7t6fVYIO
         pBsR+JTvnuC1yNLIUoWaTfiy0CmdHuBTHmjPS0cmNOp20q8O6k1qzfVtLWLUJKNGe0JU
         rqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xpqEcbdryqmNzCYBxrtc+JnocUXAgJ2tF34/if55qtA=;
        fh=yhsd50qYGkdw/3cS6aHVNZmacyoqDz8KVeYPZg/GhoQ=;
        b=Ci2sqFs3Gq11MJh+t72CR8wamktNm9EHasBRfjQlEeY35m8Im9HAF+Amh865gZdTwa
         ktA1ydC1eAwXAHZJUYIm/F6JQD0sN4CFJ36QXlb2OjBjTm82bocBEEWTOjGpFT4Kzq47
         nhxd8yvUEIIeT4gkIc019U2OckuxVKKH+nSsYZyHvKai0zyewwkSuU637VJW2mM6LWiL
         ylfYet9CovMF0HbG0bWaaHkVUCpGZNQSDOcxerSkD6oj3G6OvBXqUsBzeqcOzz20QJIJ
         XU5olQHBNmclMM0pZpkorUnYm4/S00WifG2kDQg05wnT8+a5gxqc+iwNPIMvc8OjqFAY
         cLAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794657006; x=1795261806; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xpqEcbdryqmNzCYBxrtc+JnocUXAgJ2tF34/if55qtA=;
        b=A89XSZw4uEhnkUYomjhcLxn5rlvORRFKRYfqmvRdcVk1Eh7ShRnhArLYYhg8moNsgN
         zRHhymJ549XPobstT71eX6D/pnFvf6D8LZEthe/fgstcV/mdf+LXV1TV3FX6ltONT6YI
         xbnGcl8uBJgRe/9tOJ935csEZB+a8bv2wTyV2u2mfWxJKpCPV2kyapHCKQ+QQf64NtY5
         W6yUpyfEXcndzvx7vbl51l/55wS7b6VqQm0v7HkGrj4gq4/uLqouJoiwvTM6sqMEKmvT
         KG/xNU0HHcgr1I4O4cN1lKOuUPVl0ZrdcFvqebbAdBDPz6FiTh1UugYdb7q/YxIDPek6
         teuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657006; x=1795261806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpqEcbdryqmNzCYBxrtc+JnocUXAgJ2tF34/if55qtA=;
        b=pLMBFUdGSwehdee6EH4AVILxS4AvewEkqbS8gQ6U6hUjg6ebG31OGHnyRTCgHhMfwQ
         IvWhSMzCdtoBQZcY1EuoOXMt0TZ2MdhRVyKYBiBt5FwpFVIvNqLoy1U6QtJFEaid9+ma
         1yKUb9zmPuRfNrBfFoHF/eHc3vg57+ZC/EAUxhpun1xQ0jTvOW0hC9rlOnWhd6x/FsGP
         ftYNETOz3QUpp7aR/oXIChpljIAzsYvbh6znMnqv4pHgvilMgM1S4kuMd1AmIdh698YG
         D0kosKymNvTrtm8gILpO01NbgpnOqcTWdgByjY5WVWJprN8YpoPvq7M93r/a/GsXIQRm
         poyw==
X-Forwarded-Encrypted: i=1; AL+hErEKz4fih/vc23lMzfrMO4VEz6zRAIOqfF3qj+zNRbyJI3RjpvCwEH5K9TraQPbkBv+K5QDXYs1x6bXin+BC449c@lists.infradead.org
X-Gm-Message-State: APuU4Z8SIyninUVGIz3X/f4IiWPUns8P21URh7tf/yx4cA1j9UqmZvk2
	7ZwTYnrRgQebOO9KcYBt3A3rzAfdgykArI9BNMrpXZ7nOQxE9DcZ0SJfExGq6vxk+Ai4pLLPPP+
	/bfyGJWAT0ZrqoYZWSOlFLQl4MAZqT43Zus1DNJzlp7paHTyagRS5mDKyHLao7NPoOnxPwaC5xU
	OT3G2BpAIR7pj1saG7cygPEW2Cc0Pc04wNXzEJVlAWkGGwhc/5yMFA
X-Gm-Gg: AYBFou1oYDjC6c90HuZTKCHp9sKZfHHDyKLBhhuNPBpjCN0BO8irRuF5gQoXekQf3uA
	x4pN4pex40T2NS/8MJdxUzPDrunFpR99DAZEo0Vf4/KnQzEcH3oz6NIKZBygmuwPCS9d3dn+Jwq
	ENZ9p3KNWXEjicNzC6pMloo2Weu6lptKT9RSahrLmWOUtvekkIHBzFhm8D6A==
X-Received: by 2002:a17:90b:53cc:b0:3ab:31e6:12fc with SMTP id 98e67ed59e1d1-3b1b05f1336mr4921132a91.0.1794657005611;
        Sat, 14 Nov 2026 03:50:05 -0800 (PST)
X-Received: by 2002:a17:90b:53cc:b0:3ab:31e6:12fc with SMTP id
 98e67ed59e1d1-3b1b05f1336mr4921116a91.0.1794657005151; Sat, 14 Nov 2026
 03:50:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-b4-ux500-pd-genpd-v7-5-v1-0-4b4f256f340d@kernel.org>
In-Reply-To: <20261104-b4-ux500-pd-genpd-v7-5-v1-0-4b4f256f340d@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:49:53 +0100
X-Gm-Features: AclHuK_axNgphK7IhZrFmTH49ktgMX-pB6-EJIJzy-Lm68sB7H48ZpM-YM9QxRM
Message-ID: <CAPx+jO9x8h5GU7QN5DGzdyecwCBQSQNExgdZwkc1+Uk8Xdk+Rg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pmdomain: st: ux500: Implement DB8500 EPOD power domains
To: Linus Walleij <linusw@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af84aee cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=u7PySJCRRj_KX966CyMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NiBTYWx0ZWRfXx6JpjoiuSfJd
 9wZ1VSetaaYb5BQYsQLrYGHXKyPtmuj3mS8p0/M6IWC/tZSAQgBgcDbsluVZN4v0XHGeny/QR+P
 4Xc3z0NhvIM9m0Z2yQ++5eu8jqbcFWY=
X-Proofpoint-ORIG-GUID: s4K4-aBlLOnbAO2ZQZ6ud83SkrnHx6a6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NiBTYWx0ZWRfX9Xeu/ZQZ4UD6
 QklRoAgIDNP9+bq3IgQrMsi+mFqX7viGB4G4OvcuuBYtJUM+Sv5Og4TdLfUEAkIOev5NKY5Hm7y
 kQeySv5RpUXeQuu+FF9k5NGVAnp7+JpM7yFsgdRcUdD5+6L8urYlD2np9VSybyWquv6RVVjJMhU
 qkHrxq+JERAPH2HyBCKLtgIXbGRvxc5ZPp4weYvufN0nWui62O8TlPYA4CgQGFzEI8YEoiB79hW
 W9jLv/ni9pxYtHBtSxKMQtISV9lc6FrRjrcjxu7n8o7gld/QcmP4s1bx6W47h4FYz2T8MAfXONH
 Q5jo+VaHtUTgvZfstH9zeeTk9KOPfQ0LYnTkR1QtFL4Vjn0q4J9MSgUIMksJLoZthPTwa215OqB
 yD1hjl5UlfIskET7v97GUxSTbr4MPhh1b6nDA80s5t1EJV1NwBHByQ/f2xZaL8L2aRXEPDNwywl
 KuBC1524yKt2oDsMzRQ==
X-Proofpoint-GUID: s4K4-aBlLOnbAO2ZQZ6ud83SkrnHx6a6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_035007_151289_EAFD7F27 
X-CRM114-Status: GOOD (  20.54  )
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

On Wed, Nov 4, 2026 at 11:51=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Populate the Ux500 power-domain provider with the DB8500 domains and
> implement hardware EPOD switching through the PRCMU. Voltage domains
> without a hardware EPOD remain bookkeeping-only domains. Keep the legacy
> EPOD regulator driver mutually exclusive with the power-domain driver.
>
> This two-patch series is based on v7.4-rc1 and targets the v7.5 genpd tre=
e.
> It contains only the provider changes from the wider Ux500 conversion.
>
> The related patches will be submitted independently to all affected
> subsystems once these patches are merged into the genpd subsystem. This
> includes the MCDE, DMA40, SRAM, audio, regulator/MFD, binding and DTS
> changes.
>
> The idea is to land these independently in each subsystem for v7.5
> once these patches are landed.
>
> The patch is split in two, if it feels unnecessary churny, just
> squash them.
>
> I authorize the ux500 Kconfig change as maintainer.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (2):
>       pmdomain: st: ux500: Implement more power domains
>       pmdomain: st: ux500: Control DB8500 EPODs
>
>  arch/arm/mach-ux500/Kconfig               |   2 +-
>  drivers/pmdomain/st/ste-ux500-pm-domain.c | 269 ++++++++++++++++++++++++=
++----
>  2 files changed, 241 insertions(+), 30 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261104-b4-ux500-pd-genpd-v7-5-1048f61bc405
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

Looks great, applied for next, thanks!

Kind regards
Uffe

