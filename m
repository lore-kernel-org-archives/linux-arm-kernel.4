Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119A2606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 21:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LC06BfuG;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=MDtalnBN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QT2jGMfaw/focNWo/8fwExSp7o25kLym+4VjzVhDwJ0=; b=LC06BfuGcqJ+B/
	ca9jLy7TEsxRGhQBpmTIYpU+aI5Jlb5fzEps+iht+/RdUaeIQQ8JxmN+jZ9CmsZ5AMNTmE4yTYByN
	Q3nS/HpMQabmwdqdj9WaVod6pL4EIygieE9VjsVP04pN+Hxhwtu1/3gECwS04SpcwDdJSmCVJIv4I
	qwHEhIxp3ZEwUmsZK9Aqsd3pAaTh6WaY1qx+iTXNbLRqwO1FozgsUuOABQ2G4jfIX6VY+YqXbtL7z
	wFoCS7cSkzfyFGCj76NOaLWJyEjGr65wfhyhiWpoNC5ubG7Jnv/01BLA/seuJTP8sKC8qRwkHL5wJ
	sEeSh4oy0S/PEK5YHBYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShjX-00000000Uz9-0h7G;
	Sun, 15 Nov 2026 21:25:55 +0000
Received: from out-89.mta0.migadu.com ([2001:41d0:1004:224b::59] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShjU-00000000UyH-1OD7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 21:25:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=SY/6TF4KJ4lM517A8gYPHZGtCk4uVWeIrC1DiMs7VTc=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794777947; v=1; x=1795382747;
 b=MDtalnBNkJeF9YNnpDPjIzZng2iYAg0nELG1FxCb1eoPtcR5XTEDkupqbKsBtTTm01GTMVI1
 8Ds8EefeUWlsfNlAULQ1Uz+QwGK1jHsa1cS5Th6nBx//UDy0YI9zktUGNQt5MVsdTj+Q/ZxapOD
 v6wAMCz4x/Om84FhIyQ/oKIQXTcKdnd9n+DQPTM9335A0Hfo5PHEw7fg1pWrgO3qB4pcD2aL205
 Yp7K8mTegBZjrs0/eWgyds4gvGKprwL+FYzpc7J1SYo3gISER2XdZL23nQCw2hELIUAczqak940
 cdJv2pnYPUD/yL0Myh00pj768aKlkauZTF6Q8SP1veu2A==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f31a7d92fd952097;
	Sun, 15 Nov 2026 21:25:47 +0000
X-Mizu-Trace-ID: f31a7d92fd952097
X-Migadu-Flow: FLOW_OUT
Message-ID: <ac3fcfcc-dbb3-4b30-8d15-56c12d456887@postmarketos.org>
Date: Sun, 15 Nov 2026 22:25:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] ARM: configs: u8500: Enable compressed firmware
 loading
To: Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
 <20261108-ux500-defconfig-update-v2-15-13b701e66cbd@kernel.org>
Content-Language: en-GB
From: Stefan Hansson <newbyte@postmarketos.org>
In-Reply-To: <20261108-ux500-defconfig-update-v2-15-13b701e66cbd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_132552_966869_CE439D22 
X-CRM114-Status: GOOD (  13.05  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hej Linus,

On 08/11/2026 16:51, Linus Walleij wrote:
> Allow firmware requests to load XZ- and Zstd-compressed files, as used
> by postmarketOS firmware packages. This lets the existing device drivers
> use compressed firmware without requiring uncompressed copies.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>   arch/arm/configs/u8500_defconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
> index c43b2e39d295..90309291c657 100644
> --- a/arch/arm/configs/u8500_defconfig
> +++ b/arch/arm/configs/u8500_defconfig
> @@ -92,6 +92,9 @@ CONFIG_NFC_SHDLC=y
>   CONFIG_NFC_PN544_I2C=m
>   CONFIG_DEVTMPFS=y
>   CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_FW_LOADER_COMPRESS=y
> +CONFIG_FW_LOADER_COMPRESS_XZ=y
> +CONFIG_FW_LOADER_COMPRESS_ZSTD=y

FWIW, Nura (formerly postmarketOS) only uses Zstd-compressed firmware, 
so enabling XZ compression isn't necessary per se.

More broadly, is there any reason to enable this upstream in Linux for 
all OS:es that use the u8500 defconfig given that we have our own means 
of generating configs that match our needs downstream in Nura? While 
it's not likely that our firmware compression format will change in the 
future, in general it is probably easier to have one source of truth 
downstream that we rely on rather than manually keeping the upstream 
defconfig in sync with our downstream kconfig generator.

>   CONFIG_GNSS=m
>   CONFIG_GNSS_SIRF_SERIAL=m
>   CONFIG_ZRAM=y
> 

Stefan

