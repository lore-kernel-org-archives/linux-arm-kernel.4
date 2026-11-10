Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3158606A74E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iIpmYuXP;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=J1ys8TFi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yc0ntGsJW3l/wa7SL+ST9sunBXcJXAyGwZLVfV1jEDI=; b=iIpmYuXPjTmDeVExgVPHojv0TD
	spQ7HdcXiU6p3XrH7MciQWxFNr0QPO4n8hv+GdaD7OwrjDgHI8VHGV3MBgrv2hRJX0r0Cnf4RHinY
	cGsNmm+DdLWQ7UjrtaRQTjAEv1BhMDQ1XV/dKoC5AyGZA0DwvIHuvWFRZSIeh7BJbRy3XnxKGLc4T
	oRxxxUkKYx6LhEGZhNEgsb9wu+Fox2xznE0vz9efeSiwX3s2rX5WXPvYjsAdQJ3i31/pjZT2Bb2sr
	iDRMW60s1ZOxQut9ZhAIxSoUlkgaCYV32290v2f8+pF9j36TalHvJOacKlZXuqakF7qmGsnX9ycKl
	7Vde1LDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQliH-000000040YK-3SPs;
	Tue, 10 Nov 2026 13:16:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQliF-000000040X8-0nlV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:16:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 508AD339;
	Tue, 10 Nov 2026 05:16:31 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEF0B3F632;
	Tue, 10 Nov 2026 05:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794316594; bh=ObvdDmeul27h3s8a+0chCn54N8OcJazTG19r8dFG4YU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1ys8TFiZ0yGLthPcS/gBaMoX7FBqP6u1j5KtrJNHeYdhHufu/34Wn9RAdX38hZnL
	 HEZz+nPDrfPHgk32ANp59Xnvn4pgul0TEbSBrfwOJR/PpFNUacDkmvHK8MPPGf+NWN
	 FgFJweLK1WegbMiSljI47OdihIkh1VrFc5YZi9eg=
Date: Tue, 10 Nov 2026 13:16:30 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] pinctrl: scmi: mark the GPIO functions
Message-ID: <avMZLo_fyaMu05cz@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051635_379498_DB02B33B 
X-CRM114-Status: GOOD (  11.58  )
X-Spam-Score: -4.4 (----)
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

On Fri, Oct 30, 2026 at 04:58:39PM +0100, Clément Le Goffic wrote:
> Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index 1a14e254f011..24e02de543ca 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -443,6 +443,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
>  {

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

