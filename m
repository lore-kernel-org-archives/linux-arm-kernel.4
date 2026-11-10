Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F31606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vt1K6BXb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oe7X6rYC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bp00LnJu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=; b=vt1K6BXbHFneKZ
	D0YD6z2hSsMivyeXNKd+nqiQwVmun+WPZTPw1KOgvL1amTKXlnJT6BFTiW27zLd+JzRZwdaCFfIoo
	seKPEvrj3dISkXBiSuvLd6iVeFdym97jcLlClZ2uEDQ4WxbGHZ7RmgxfcVdzWP4ay/M0OjgMMYUsd
	asuJu3tJewAAPdFvjUsRTlePr1rrALrZGm3pjbZXnSJGaJlyRBQNYXXeMzQDGE7+JjkCZM8E3PrTp
	u8xNZ4FkNFubvXCAuw4kawggvY8TitpH+dwcF/P64HbsA7aNErq5PsqzdANKOUhXGlZDHehSJKD5w
	KjSKkwrBPANGm5KIMPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVb-00000003XDt-27Zy;
	Tue, 10 Nov 2026 10:55:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVW-00000003X74-21BZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:55:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l2vx1681010
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=; b=Oe7X6rYC7ba/GxLY
	1OYvKjjZ6uf3OAffFNrlbabF2j6cVGaxzg4fn6/E82YNIxSg4iZ1C7APW8DdxE74
	ENiN0wjxqWTlZyELXOx21oPG5L5rh7pROa/FzwVB2r4PJFSq2xaf24BA5eVpoCqd
	n94N7ixOpjlD0E1R6Eu+wPx1tSRWTK3hiGZzlCoAtUKRUdCNFfvXMxxzcYwQPtfs
	SOPfW6xghtNdIDosOPXruQRUcpbAEF7vY8V4G+onFhTXci6VXJc0uVczIg31KFCg
	ZOL6jgxic4Sxf+mbUym3+gb77zBlCMN3xILGCGKR66T0CV+zSTfYRjfSKZTJWotV
	FVc2Ew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkjumb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:55:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so2175845a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308116; cv=none;
        d=google.com; s=arc-20260327;
        b=nqcZaqL38VV5mFfMGZddAdiGSMoGxRnAxJERE5mbfwyYJ3j59Z7V1lgFgOR1l5PwY9
         O4X3lceRdSZl0TlfXxkfq+4IxY3EoqgMgGqkyph746BGsTUKKJFj39huOY9BLX7ch5eV
         VX+Gv5DRIBAshRKxtNtEyDa+Jh/uIbQBID3kL6Vv+4KnmKSyOo9+DsclWEetZ9w9QuDA
         tcpSJQ4cQQqpzyrojQx/zg5ptuV+HVT8j8u9gLfLZw0pAm7/B0tdc/j/2DJkh5fAoOxm
         rZUsfviidEwqMgkmeBZ5yZWSalafm5PrpTuoMinJHZyfjtfMgyqqhQVxoy9TcdJ1n1Ti
         USLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=;
        fh=QaMcDfDSY8oEAe7R7nRljj3jBXAMI8UaUZhaQLB3Xig=;
        b=ak/AwzheIHUBm2EJlNo0NgdcD8epkssIPYoja3/NqEKKCWZKWAHtyNUX8rRXkEDTk1
         jcPFy9xQ3nBhZbTa3FDhsBzo5qHWimWVaEUFM6KN7D7Pe70jrdyNWlyQC7KDoH1QNeC1
         B65uCbrFK7t0jXLmawPLtBsl86ZCwQFR/p+WtIug/pfll+Huk8oSOfVutiqTw0VXf9pY
         Ur8ELa2Lqyzj3Vmtu8j5vjjna8VZcSmCrZ45dRJ3JR8gj//ecsTHsoJl4TYlnPwgHcXw
         zR3buMay8vV2oJEeRoGTiE40P3KPFnKjJyeibB09I5ymqpf3ACeyQu2GXKv3t2YV6RJL
         INKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308116; x=1794912916; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=;
        b=Bp00LnJuZp+jctgnJZKsdQToMYMAHzQU1ynaGOFc3iNdE3K2K9U0B4yZf28FBc0rPq
         k3IJ+HZW2L1BD9MRSgElTFunt8gkiwDjLcyIbdAtfadhOya2/DUVijepvAja52bTSU1n
         iNIRuPY8jE4xPqWKpgFw4JJRv2xk4qDP2FmwtyuifWuoOA+tAbm8nES2AUz4EwHTifQA
         q40NZsfRijNl67C/wtSkE18nDLZk5i3ULKXEYggScq40x9r0zy5NMCGiWyfAjlFAgcFv
         IMuoXTm5cVv4PbFyeoKl5pro9bbTMccrlD+LZ2jw+rk+VWER7xedn/EOvb1pt2r0m9Gj
         ajeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308116; x=1794912916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=;
        b=FgZe/K+GXPTPsNFL6ZE8IZI82dEEiR1658OhqEGf/KM7w7Q2OikR1hAdH0btqIldfl
         SBtRn2Ls2HvL9PX5SSIVMswKynMUBtVLSvEfXGNGXY3UHZP1mRGtVLZ4EE++t5Yu/VT6
         5XrdBmFD5EvrbgBeOC0mbMZ2nonb9ITDX8S11U9xGKIyBbo12L3IratMwryn+GKY+glw
         ytvLwvDeipAlmLztzXfpQVQR00LvgMrYcT/ty1BtEa+S7ots7shssX7NcUA4m2IIwVA4
         p75oJAVKPzvzO1TwvEM4sbocxUhNdmnjyO6QLAFd82UrBjHv3Q1NdlSr5DWQmZE9/PCP
         BCtw==
X-Forwarded-Encrypted: i=1; AL+hErFlLlRJ5mYe6WJ3WKDmm7ih5l8RLDw1rayEAqW3chJuceV+f6yOwITwRhlz6feS4m56ztDM0y8wsg/nmu6YbYAl@lists.infradead.org
X-Gm-Message-State: APuU4Z8oW7ZwJ/ZGg7bQzgz5ZwLNoiA0WCCQJYymEiAYpR95A6uoiuuw
	pSqloQt+kqAtFj4PSfROkfdZxKlJ17hxyMGRvAMe9Llsgs+yHcGDn64t4HIX/8hwEvXvEjuMBht
	ZfK9Qt2a4sngMakYMyfGqypLbHGbLBcritw04EY/PrUQ51YORUKhxAvUQIi/+0m8107hy3Oxrk+
	i39C9x/ooaZgwLFUj/hsj8K4byfvYaIFgGEeFrGdQwv9+E4lPdY43z
X-Gm-Gg: AYBFou1c14ELlzp0IVoMK5a5HtamGim2AkTDdoMHuNzEWpvF4D24Ar/dxJpvEVZcA5e
	hyuVYh2mtunIXNXN9RrA9jhmpUY4/njIvfUmz5M/KVkIGQhnMXfrVLFegu95R77Jmu4wpYmondR
	nglibq3ep2V0zD0dqwpy5KJSRgali4/K2qZfU/kheio3yLyvx/xPW2EEgSXg==
X-Received: by 2002:a17:90b:164c:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3b166c84952mr2169241a91.10.1794308116397;
        Tue, 10 Nov 2026 02:55:16 -0800 (PST)
X-Received: by 2002:a17:90b:164c:b0:3a8:9d0d:ca50 with SMTP id
 98e67ed59e1d1-3b166c84952mr2169224a91.10.1794308115925; Tue, 10 Nov 2026
 02:55:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261005131923.291619-1-nils@buechner.me>
In-Reply-To: <20261005131923.291619-1-nils@buechner.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:55:03 +0100
X-Gm-Features: AclHuK_HV3ZZmq-KfeYfcuWg-ilNBvuN8Akbycq_to22pxvhsiankk74K8OHQ30
Message-ID: <CAPx+jO8KitFsFdDFfza5WTZGwVzOOtB+Agr=qKESHf=54q10Ow@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: mt8183: Fix silent audio from
 premature sync_state
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Eni3-ViSLo6yEmmwswl6JXKPHqT-GRrC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX5YXzSxrQRfp9
 4YfD7Xr0TLnrrrZnJqURpR490O4iCQvkflbRFjJ8+l6OnB9/ihf2oL9GG8mGPSJomECT9w+dY+n
 fQP/zZtV+fIWoUe1ht0Rz6z010G7c1w=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2f815 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=byjLVS86Mrn06biGc8YA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Eni3-ViSLo6yEmmwswl6JXKPHqT-GRrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX0sy4GDjsUAJs
 /CXkfUP8hZpwkvK9//fOifPnTovwxcxtKml/Q1xxLdMT4IFx6ulzKxCQrh9JnWrbjRoeSdLxSo9
 fN46VdMKzp9rRBTOI39MPVDQamjYI7Hc/u7Uv720syWC1Rd53gZotplSwvs+/EHFDPiqI/SckON
 xTHSt8ax769ozQPVWz1FtWXP/xr9IVaIEl4Yd5H85KWXytr4ZlzbeNtKStUOTZJoLbf8HgW0v63
 jR9gByi+9XNy6oe2x7ADLqZzmBn4cK3WAXAC3s5mNAuwXPSzqduwXx0hDEu5RPBDSWMrJSqjrsa
 44gxMzsSIj+RzmnMri+ph1PooaEZSMIL2CvY8Zye0ol30hXZ9Y9J81uFMp1awjy4V5+k3bRtC3z
 OCOoNKfLDESxeDMLWRsYzc0mRpbp5ffynRAZg0WqwUfi7tLwj6H4a4pGL9dt0AxR6oMSa9gVAO9
 3dkoDeNz1GS9aXa5v/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025518_696862_48531DC8 
X-CRM114-Status: GOOD (  28.49  )
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

On Mon, Oct 5, 2026 at 3:19=E2=80=AFPM Nils B=C3=BCchner <nils@buechner.me>=
 wrote:
>
> Commit 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until
> sync_state") made genpd trust that a power domain already on at probe
> time is correctly, fully initialized, and stopped forcing a real
> power-off/power-on cycle for it until the devicetree provider's
> sync_state() callback fires.
>
> On the Juniper board (Acer Chromebook Spin 311, MT8183), the firmware
> leaves the audio power domain in exactly this misleading state: genpd
> reports it as on, so this new behavior never runs the real hardware
> sequencing in scpsys_power_on() that clears the domain's AXI bus
> protection. Register access to the AFE block over APB keeps working
> normally, giving no obvious sign anything is wrong, but the memif DMA
> engine's own bus transactions silently never complete: its current-
> position register stays frozen at the value it was reset to, the
> period-elapsed interrupt is never raised, and ALSA playback fails with
> -EIO. The net effect is silent internal speakers on every boot.
>
> This is the same class of problem already fixed for the MFG/GPU
> domains in commit 818d56ac1d ("pmdomain: mediatek: Fix mt8183 hang on
> boot"), which does not cover the audio domain. Apply the identical,
> already-reviewed fix here: MTK_SCPD_KEEP_DEFAULT_OFF makes genpd start
> the domain in GENPD_STATE_OFF instead of trusting the bootloader's
> "on" state, so the AFE driver's own first pm_runtime resume triggers a
> genuine power-on transition and actually runs the bus-protection
> clear.
>
> Root-caused with a git bisect across released kernel versions on real
> Juniper hardware (audio works on v6.6, fails from v6.16 onward),
> narrowing the regression down to this exact commit, and confirmed
> fixed with speaker-test playback after applying this change.
>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sy=
nc_state")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nils B=C3=BCchner <nils@buechner.me>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mt8183-pm-domains.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mt8183-pm-domains.h b/drivers/pmdo=
main/mediatek/mt8183-pm-domains.h
> index 5e33b8628..8e29e5117 100644
> --- a/drivers/pmdomain/mediatek/mt8183-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
> @@ -22,6 +22,15 @@ static const struct scpsys_domain_data scpsys_domain_d=
ata_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(11, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(15, 12),
> +               /*
> +                * Depending on firmware, the audio domain may be left
> +                * partially on at boot, with genpd detecting it as on wh=
en
> +                * it isn't fully initialized. Force a real off/on cycle
> +                * instead of trusting that state, same as the MFG domain=
s
> +                * in commit 818d56ac1d ("pmdomain: mediatek: Fix mt8183
> +                * hang on boot").
> +                */
> +               .caps =3D MTK_SCPD_KEEP_DEFAULT_OFF,
>         },
>         [MT8183_POWER_DOMAIN_CONN] =3D {
>                 .name =3D "conn",
> --
> 2.53.0
>

