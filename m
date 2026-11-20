Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2595D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IQekrHNt;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MSGy7Ozo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=; b=IQekrHNtSVacJa9Tf03gYYzaix
	eYLXM1cgG0LkIsEOV1NGI6Ls6CKvfuc8dXqmA7dbBYwATLBIDEo/tKnthNPZ0BB8MKdu1R4+sM/vT
	FAKslVxrvU4PjmXK3EhM17T4ED1Z3Tsw8GeOu1pyjNtqbN+G1yM2CaLAfns2PwuYlj0TRVKHLkrMB
	C4yhFlAX+ku5R6DPucZyvGR4xPU2kKtEq3gLS7yN09GIx0+mNJX+DMp09x1dzf7u4H4AzMBjYPurM
	F6HNycQwknAxZ1ujl1S2BNlQqgdJowDT9eLBBooK2JoIHj6PWhzX2tBYZLIBkiBVptOhawfe48Cpg
	QJrnzHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR5l-0000000FVbG-040P;
	Fri, 20 Nov 2026 16:04:02 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR5h-0000000FVaj-2Qvg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:03:59 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1338750a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795190636; x=1795795436; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
        b=MSGy7OzoKMnMiEqbJcgeW8ZEH8IS7yMMMsAFknQbXSPa4ouRMuz6047pAwFHhvjMte
         NCZKHrbO0AQiPqXt/eImwndQZqADoF8Ix6F0lkn2/Zbbbre4JeDJrrGoS0vmCIi4yGmf
         Q0dg7ekdscV4HeDhb218L0bv8WBs4WHsRO4jU6bLC3zlDuR2n5BwH6nUvf4eYzGV9abz
         KMaibhLUuLrI8AmIqsM+FjEaZEW+ZI7RLVqmR9I3UHH3U6DMoJi14E10F0Q5+8qNAth9
         ZbUs18HMfjcv062UVJgAoXXUxRHdEIMXN4MsOXtKTNIFsQMd/5ojlNpqNOMGcoA1OnQj
         U9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190636; x=1795795436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
        b=zMtsxZcz3YCXn2uhYLmmo9EeXl+Lv3ffl61Xg+XLgBDXKkF/v3cTJJVFO1zTderMZo
         dny+B5AA5opE8Uf7FPMHART+gSDITRcLEJojyMNyGS80UgzeUntxQbd4oxYPK5uKYNW3
         qxRs1eL5UsAFEFIxDEcyVamR2Y8SejjbHY+iOYdym/Lq6o1Qy6eQZrts+eVk50CScgOK
         4pxyJyGZq3M3IkDNefIOZAdpLONz0zRtECjtRF4eW+uZACOxEKh/DXdqtZ3KCoLqyKgT
         iQJVHsUBDjg67L7djbuwCiB+reNgtZFoKiTc3y30rP0GNxofp1OUGo5C9JzFdZ9DDVou
         wnvQ==
X-Forwarded-Encrypted: i=1; AL+hErGYpy9h7ODK3o1nPVzJfegdhC2pyo+0bTySt7BEDW7rQw5KsfZTFabQVL2OuRoj+6iTDlmQhTX+r83T0SE9TcTx@lists.infradead.org
X-Gm-Message-State: APuU4Z8UzomHlZ+0msJXF1Jy47iwFVAzbueFM9G7CCo6J1O4gn8+f+vC
	V1AdPnpsHGAainoviXXPAvvRf6xnw3LiOt1hJJB7/uZVEmDw2PQy5C0W3FWDH1XCINI=
X-Gm-Gg: AZFdTZcu/M/la9FKpDE0nsuBTKJm3FrZspm6axqNI4e8mahLYNGveWgh85nV+9V47X8
	mjzsuMrpRDXoHaFPmSNzD2tWre/E3V5TndZojI1W0sqKvbr2UQFtdVMDbzXJbWhsgvlEfEhVCDe
	NTWqqeuVKMnGnEodXe15Fk+au+gJZUkADCvCyRs9iv/vQTQ+Vt1ldfoIzjl0Bl6OSpoghB9+DOW
	gBqkN1svBQyjPe7yMucIGTQM11gIJWRUgg6cLgUgNIf4wBuzGSfnnfKPNVTA33VwIAoQaci5q2o
	bypFgTtABGie1WdF6du8xnFw6Jk/kBnFqUxSrTS3rC3XIsA4wd3PZasGOtaxMDtBL+VYT3ysSgn
	YGZa7LewYIY1hTGOPYy7IaiQ9j8iVmxF8KoEN+SPiq3WdJu5mjo7kcmDvJXN9qUDPefvxK3A8SX
	MguoHiQpFziY2hqaAOILKKuI3m5zQO+XYOi06Ye6jO0BGaBkDomBsHdgrkBpFsbiusfzykdPi6F
	dnIYrW12ir4nM5L4lO98QQcspWHeSMmhm6gdnASMPPirOjlJaEC9rMjoZhPDmZXd61CB6NIy3qM
	n6VCbSy2Tkn+v2a5QpzKa7bHCjDw00Tl
X-Received: by 2002:a17:90b:2cce:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b41c95e0ecmr2249223a91.33.1795190636291;
        Fri, 20 Nov 2026 08:03:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7124:798f:1b98:bea5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm4809307a91.15.2026.11.20.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:03:55 -0800 (PST)
Date: Fri, 20 Nov 2026 10:03:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/5] Enable DSP device for i.MX8ULP
Message-ID: <awBvaca7Az__X5Te@p14s>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_080357_634288_132430AB 
X-CRM114-Status: GOOD (  22.24  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 11:18:03AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The debug reset control is one of the HIFI4 DSP’s reset mechanisms used
> by the debug interface; add documentation for the optional debug reset
> controls and update the driver to use both the soft reset and debug reset
> controller APIs (the soft reset is already documented).
> 
> Add a HiFi4 DSP node and enable the DSP on i.MX8ULP.
> 
> Changes in v3
> - Split the previous patch 1/4 into two patches
> - Update the commit message to explain why the reset properties are
>   required for i.MX8ULP
> - Update the commit message of patch 3/5 to clarify the switch from
>   direct register access to the reset controller API
> 
> Changes in v2:
> - Update commit messages for all patches
> - Require the reset properties for the i.MX8ULP HiFi4 DSP in patch 1/4,
>   as suggested by Sashiko
> - Use sim_lpav as the clock provider for the ipg, ocram, and core clocks in
>   patch 3/4, as suggested by Sashiko
> - Rename the reserved-memory node from dsp_reserved to memory in patch 4/4,
>   as suggested by Sashiko
> 
> Shengjiu Wang (5):
>   dt-bindings: dsp: fsl,dsp: document debug reset control
>   dt-bindings: dsp: fsl,dsp: require resets for i.MX8ULP
>   remoteproc: imx_dsp_rproc: use reset controller for i.MX8ULP
>   arm64: dts: imx8ulp: add HiFi4 DSP node
>   arm64: dts: imx8ulp-evk: Enable HiFi4 DSP
>

I have applied the first 3 patches of this set.  The remaining two will have to
be picked-up by Frank or Sascha.

Thanks,
Mathieu
 
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |  4 +
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 34 +++++++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 23 ++++++
>  drivers/remoteproc/imx_dsp_rproc.c            | 76 +++++--------------
>  4 files changed, 82 insertions(+), 55 deletions(-)
> 
> -- 
> 2.34.1
> 

