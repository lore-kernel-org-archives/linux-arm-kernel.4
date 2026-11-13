Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99409606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 22:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jmy+/+IN;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=gEMoX7Rc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FcupKOGqfpw0UNQH/cvoTfEyJODmJfv3s32n2xsq6tc=; b=Jmy+/+INyzIRrB
	J6LUI199fjgFAossvS3ob4cJ9ZFa0R7bTnYdLWVvS1F38XMXuKJXnjY/iijj2vjrDRXvDyYOzckw5
	8Uult6mE2FOijWztWtk8cckqMYbB/uPpdp5opTcjchIndl6T38TbDVzCiuYS6HbFtbLC2lmX4OjPo
	ToosPKHShmSJOTm40JnSOgg1cY0RvWqatkIBmBiluLAcbpMpeSAzjTgJoS1IvKvmdrVLeZI+S27dV
	3TbBFa77QfqXF9ENiCps+tJUINhBsnFudBHYzs5jU1+xfyfD0BpIVrIIdZddg/UtzCO/g2XOugb51
	v4dm/In0TXjekdKRJwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzMq-0000000EePA-29Ts;
	Fri, 13 Nov 2026 22:03:32 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzMo-0000000EeOH-18aB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 22:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=FcupKOGqfpw0UNQH/cvoTfEyJODmJfv3s32n2xsq6tc=; t=1794607410; x=1795817010; 
	b=gEMoX7Rcl4WTyiksrB9m3my4mPGfMkVifh2UhUAwBmAGmaVVyiQvokcB87UeGd+9O2S2o3xIxxv
	ygKhschss/k5FzamXtVyK9AVwRM1w5MbeCzxoYC+IxtX7L+CcNX8b0KhDXrHCb9lKZ5kj57Q8a0cH
	nN/ZUTji8ss+fUPD/whgBb7Ai8Noc6tHZCgVQi0G9H3Mufe2aIUqkeUnSBbQY2OTE4Bm2jPqIvURF
	Fut1rSYHVf61Db6iRQcrJwXKcuBTUso/XHR7OLioVo9stwBgF32RDj1+03A7/Zz+kT0E4j2sbwSRT
	IdoHMLc2GS3abKVJFOWcdmkjFVtCpSyec0EQ==;
Date: Fri, 13 Nov 2026 23:02:08 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Rouven Czerwinski
 <rouven.czerwinski@linaro.org>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/4] ARM: OMAP2+: ti81xx: use non-scalable voltage
 domains
Message-ID: <20261113230208.68ec07dd@kemnade.info>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-4-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
	<20261113-patch-ektor5-dm8168-clk-v3-4-a42cd1edc5f3@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_140330_347108_37CD94DC 
X-CRM114-Status: GOOD (  19.13  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 22:30:50 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> TI81xx SoCs reuse omap3xxx_voltagedomains_init(), which registers the
> OMAP34xx/36xx voltage domains for every SoC except AM35xx. Those
> domains are marked scalable and reference OMAP3 Voltage Controller and
> Voltage Processor instances, which do not exist on DM814x/DM816x, and
> no PMIC data is registered for these SoCs either.
> 
> As a result, omap_voltage_late_init() tries to set them up on every
> boot and bails out early with:
> 
>   omap_voltage_late_init: Could not get sys clk.
> 
> Adding a "sys_ck" clock alias would only push the failure further into
> omap_vc_init_channel() and omap_vp_init(), which then complain about
> missing PMIC data.
> 
> TI81xx has no voltage scaling support in mainline, so, as done for
> AM35xx in commit ddf536d0d7e1 ("ARM: OMAP: AM3517/3505: fix crash on
> boot due to incorrect voltagedomain data"), register the non-scalable
> voltage domains instead. They still provide the "mpu_iva", "core" and
> "wkup" domains needed by the powerdomain data, and
> omap_voltage_late_init() now skips them.
> 
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/mach-omap2/voltagedomains3xxx_data.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/voltagedomains3xxx_data.c b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
> index e98a3f289c27..478f5eb2a17f 100644
> --- a/arch/arm/mach-omap2/voltagedomains3xxx_data.c
> +++ b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
> @@ -119,7 +119,7 @@ void __init omap3xxx_voltagedomains_init(void)
>  	omap3_voltdm_mpu.vc_param = &omap3_mpu_vc_data;
>  	omap3_voltdm_core.vc_param = &omap3_core_vc_data;
>  
> -	if (soc_is_am35xx())
> +	if (soc_is_am35xx() || soc_is_ti81xx())
>  		voltdms = voltagedomains_am35xx;
>  	else
>  		voltdms = voltagedomains_omap3;
> 


