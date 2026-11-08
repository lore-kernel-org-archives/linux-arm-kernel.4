Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB292606D808
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ebuu5vLW;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=I33SFePs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=; b=Ebuu5vLWb3sebH
	NIG19BfWRkz8zpfhvDQt5hVf73YsYKrgjTsohcGRDC8LFlTW6/zwWvbFXYrG9KaGiqP2E1Zy2s129
	ARFiIfVlHaUFoEsL5UEqtLkQqft439vG/CVX3ybUw2dP9U5VXGajkg38K5fgFrC7vxKX8BzdMpc8O
	K23vNr/86Nxrp2183TKnhlV8Gl0uTTFPk+701IXJvfaqvJPnSeVbMyZloDXUdkWGPfmP1OqioIFKn
	vSZrrl1LrrG6CTINqZE5ZBc1eBMmx+p3xTTdbcpwkM9SWKqDKEFv7LNbDQ3jmtiqlEBksbZUmwNbI
	OeLE7bGerfUaM3QgaJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAhT-0000000Gkhi-3tZy;
	Sun, 08 Nov 2026 21:45:19 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAhQ-0000000Gkgc-342D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 21:45:18 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-67bec5dc8d4so127801d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 13:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794174315; cv=none;
        d=google.com; s=arc-20260327;
        b=rg983+s9nS5YkrIYbDxWuhxpwNXANvQ60OjYN4jHs1vfa+RL/djndN9auMBBXIMLuc
         Roaz/WRBFPFTl40sjgtzM9dIK9Exy/w7JuWpTNJWrhNdasoVKpNsDpMFNWOksZ+ATspo
         rp1uOBILcNHCG4AE7B5LWu5Obv867i21O1vRTZxwvnhT9RN8GxBtc6eXMztU8sXfwctX
         ZbQtFXx1zzOl0oBGCSSkzBmQGLrRhJVN4ZKsam64VBuMKFuAfJb93+MG9AAqCHsiUhQK
         1xDdYrc8LxD2OUYel89ORiMLppnXqjUAUWq5DYNYIYc24cNRQU037lqtZSyBN4j5YwOv
         areA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        fh=/UaXBaAN2tUSeJ+j0RWQRuAMy/Rom/jn+bA4UOXbDJI=;
        b=CWiqoUbCTG0g1kfNOhXQkNdJVbnZCaLTkIRpPANUwOlI02UEA6DMgWfIIeXBScQwnv
         h1/Dh0Y288IRn5Nq/DE6Di80uwiyVITAq1d2+vqCt1Wb1EAqJKexa2FZ0LLWi02TtbZa
         y3ONpZrgUsk6s79hGQs9VEJLVQy9YEpf9YV4bCJb5zF68clrWpG4c8FbIgRCe2U9by7E
         UhNeyc0zJP7QZwlPp/vz/UuHcLbC14A3knEnacy60RquH4jMO50DTj3ctR7C/8UmC3vj
         RJGZvAPVFIEqzJjgksgh597ZKNe+RCdfBCkquNyUDkqvoZnToX5e4zCmV4JthC4Rbk4i
         N6qw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794174315; x=1794779115; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        b=I33SFePsOKYJmwvFPyo1BpmQaV76PW6sVkR8P2RI+Nt7PAIvAss23ZA+tn4vWR6UsH
         CqjVwM82+QtR+OzNt14AVh6tkdqsDpbHSmwknrYrks6irdM/VUqwPTSJAXk/DHRk+gt1
         ZqwqcsYg9xf70BZN+oy/7J7WEWFFEVdSY+O4+HbZV3pEIS2G6ZrHa2Zaf2GobdqTVOSP
         DdlF2ryTFUJD57KO9hMQlstr31JwbbsK7sY7hymnhkV0hlfwqVCMv3TEarVbbRJidjUV
         aSErMjyWbezckt4Bcqn5zeIPveV1WMyWErnnNRz4vrHGMtSZaGpJ1FNLahdWCj8qM6dk
         9bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174315; x=1794779115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        b=oeEodojZqMSswXbT+LxsLwPLEoW8dUzVunzgn60JwP6vwKlwnOtNxXX/nvkY8bOkpI
         3PPo/be1LfkTvgWLebRpzA9tiHP63/2AdAf8ES6/SgKb97aP0//Hn3FSz5+iotw7a+Wo
         QZ3xbVx3s7yqEKHdOpZUHQO0bTWxviGequvRteeM66bdxD4YZXu5OxB3lmnx16qX8oVn
         /ydYFocl8cM9hmLG/N7nYgkoIkMJRD8Pp+EiaBOjCn42b0yRj1he7HtNh3brMBhLOsst
         KzZUq47cRHVHb318nUvsjzSOPSeBLGVCFN4O6ydsySfiKAnW6h1ihSPCOk6ystHpUq9j
         XlOw==
X-Forwarded-Encrypted: i=1; AL+hErHnPvTkXkTzvyrZj+iOlb+ynQuu/ih/N4e5ROVXwUUT8wo7bQHNbQiulhU7gmcFwr8jaIG/W/SbpkaLnav2gsoQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9blULALUepeBQevJi9NDTLqWcxqhHdV7QBlAElXNT4UDcFNdvD
	/dQC9TT3R3R+ZAUdgWhtGJZngHguHs1pZeyjD7LTCLeuOQaHJUeANnShScACS/cg4Chz5u/BjIu
	48jJS1EkLUQPWvGq/J4fMTKIuH3zF1++QEedv
X-Gm-Gg: AYBFou2tiw0ce56IdUxIu/5sDtCCyAMb8kXQcAn99NClJlT04RASVAR9QS09l2C3jQf
	YUlt3qIsRuw86dL6NLDZJxy2gcDFTwPOKuvfZAsS3h1reKP8U6cAMf2idGfe/SuJSmFJXdTsgBc
	vKTtRYklK630Snv2qa8gor8nfBBkFpaOKX/veE38cN36tle3GpLpiV6DhcekOcQ/T11XRdGDUAj
	CmR9/QCobGl4WaoVg14Y97nQNdbBlivL3v7p6rZ6CvTRxu/wYccb4J8JoYQWow6s4Ea66emw7BO
	Uwgd/yJgwnsGmFhNTKyOCo+HQXRfOOfCHOiEXX9d7keGRZfzl8VZr7fhokllVxiThEA8SL8zRem
	ltyY4rgDr/y95+sY66uVu9Zb1ZYOJcVL63atJKRWpaHlpK/NQ2RyIgygdI8AgxgbpRaL01g==
X-Received: by 2002:a05:690e:bca:b0:67c:1dca:7f9 with SMTP id
 956f58d0204a3-67c3d9bb63cmr1402384d50.48.1794174315509; Sun, 08 Nov 2026
 13:45:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H> <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H> <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com> <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com> <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
In-Reply-To: <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:45:04 +0100
X-Gm-Features: AclHuK-tzL5nxnrCwLMP_029tOJZYuTko3n3lDgTKGXJ3pWmAcdiBipcjDbfc6k
Message-ID: <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, christian.koever-draxl@student.uibk.ac.at, 
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_134516_792596_2D63FB76 
X-CRM114-Status: GOOD (  32.43  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 10:46=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> w=
rote:
>
> Hi Martin,
>      Thank you for joining this discussion. :)
>
> I have re-examined the capabilities provided by pm_opp and cpufreq-dt,
> and it seems that we may also be able to adapt A9 fairly well based on
> the amlogic-cpufreq.c here. So we have no objections to the driver
> implementation in amlogic-cpufreq.c here.
>
> I was most worried about before was that cpufreq-dt might not fully
> handle the complicated clock and supply adjustment logic between
> multiple clusters, which would have required adding a separate
> cpufreq_driver. But it now looks like this can be solved by adding the
> corresponding config_clks() and config_regulators() callbacks in
> dev_pm_opp_set_config().
That's great news, indeed!

[...]
> > - Meson8/8b/8m2 (32-bit ARM Cortex-A5/A9) where we need to reparent
> > the CPU clock to XTAL for stable operating during clock changes (which
> > should go into a cpufreq driver that implements target_intermediate).
> > There's no secure monitor or firmware involved for CPU clocks.
>
> BTW, could we put the CPU clock handling logic in the clock driver like
> G12A does (though, of course, handling it in the cpufreq driver might
> minimize the coupling between the clock and cpufreq drivers)? That way
> we could fully reuse the existing cpufreq-dt?
Common clock framework maintainers don't want muxes to be programmed
magically in clock notifiers (which is what G12A and Meson8* do).
So there's a chance that for new drivers they would just NACK that approach=
.
I don't recall the exact reason anymore - but from my perspective
using a cpufreq driver for this is the cleanest approach (although a
few lines of code extra).

Additionally: I believe the udelay(100) in the G12A and Meson8*
implementation is not even clock related but a delay to wait for the
regulator to become stable.

> > - GXBB/GXL/GXM use SCPI firmware CPU clock control so to my knowledge
> > we're good with what we have (meaning: no custom cpufreq driver
> > needed)
> > - G12A single cluster, no DSU: needs a cpufreq driver that implements
> > target_intermediate (currently it's managed on clock driver side in
> > kernel space, no firmware involved)
> > - G12B multi cluster, no DSU: needs a cpufreq driver that implements
> > target_intermediate (currently it's managed on clock driver side in
> > kernel space, no firmware involved)
>
> The cpufreq-related resources on the SoCs mentioned above are relatively
> clean: each cluster has only one independent clock and supply of its
> own, and these SoCs also do not support voltage selection based on chip
> binning.
That makes things simple, indeed: each cluster follows the same logic
using it's own resources.

> > - SM1 single cluster and DSU: needs a cpufreq driver that implements
> > target_intermediate (currently it's managed on clock driver side in
> > kernel space, no firmware involved)
>
> Compared with the SoCs above, the difference for SM1 is that it needs to
> additionally manage a DSU clock. In this case, the clock-related
> handling can be added in dev_pm_opp_set_config() in amlogic-cpufreq.c
> (by implementing clk_names and config_clks in struct dev_pm_opp_config).
I think so far mainline is not touching the DSU clock at all.

[...]
> All in all, it looks like we can currently support all Amlogic SoCs in a
> single amlogic-cpufreq.c? Then, for the specific characteristics of
> different SoCs, we can differentiate them through the "compatible"
> property and add the corresponding drvdata for each.
>
> I'll also try to support S7/A9 with representative differences based on
> this patch.
Great, let's look at some code rather than discussing theory on how to
write code :-)

There's one last detail that we have to manage in case we also want to
include the Meson8* code into the same file:
config MESON_SM depends on ARM64_4K_PAGES
32-bit kernel builds can't satisfy this (meaning: we end up with
linker errors). I think a simple way to get around this is to add stub
functions to include/linux/firmware/meson/meson_sm.h.
I'll take care of that once I can submit Meson8 support patches for
your upcoming amlogic-cpufreq.c!


Best regards,
Martin

