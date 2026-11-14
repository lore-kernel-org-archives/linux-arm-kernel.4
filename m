Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6A6606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wc4gNLbE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TNLafLHh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TQ5kdfKoDSHHA0HH18rdLeWqyiK2C+E+94Dvl/EaRP4=; b=Wc4gNLbEb2RW6K7tauLdr4exJy
	NQRgRXPPjnbW8n2TnI8qxg1poz8i6MD2U3osq3HFJaOeXeP/HO0HGwyXKkU+yvrAmFF53/Nmr5GnJ
	qB9Je/NfIylLWza5Zp7udJoDD1rUcEqhv4/AraZ6Pf6Gmar9sTyun/B504qWOLqi7z2E9RsTMzIEK
	5uuuHwC8X+WXMy1qU2Rn6VXDX9vMh6zaRCYIGZwkKHWazxpWwc68PANE0mWryfier3nMjZlztGJS/
	9Pev5daA8lUVWGnVkOY4sWbiMFgeZlxgahcfoDo/Z/gxnnUqM/Rw3L+dYudQJGDzVoAv4dM/uzawc
	rMNocQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKlp-0000000Gl8H-0sqk;
	Sat, 14 Nov 2026 20:54:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKln-0000000Gl86-0wiO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 20:54:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 6810D6061D;
	Sat, 14 Nov 2026 20:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 889CE1F000C4;
	Sat, 14 Nov 2026 20:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794689682;
	bh=TQ5kdfKoDSHHA0HH18rdLeWqyiK2C+E+94Dvl/EaRP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TNLafLHhzihIlLmpX3PZK0OvfuUoTn8XvOH66sIKV/vACxM7YxgJmIA5XI8Ts83jW
	 HgrxQndKz1If7qPrDB4UyQmEuh+V8FIOKyBoSmlA79x0xdxQK4AQygoXnzzN7GpvmV
	 XMnReFMgq90uxInCSuF8opZHsm1O9hlb1hSFcTTi6U/1HDlK6GEW/LaFMYyK43rgKz
	 iOKwTZuwcxRm1yg5n5aBD5XZpd00YFqs6dvX2q4uPda0Nf56mqPXIxahKTWwopGi3s
	 DvMOj7NkQ/XCfunBcoMTvnlkLBDCe+BctOm02N16Bf6lqz2fWP8yCd6Apt62COZ56f
	 FJ2WXFJaV8BjQ==
Date: Sat, 14 Nov 2026 22:54:38 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>, apais@microsoft.com,
	rlmenge@gmail.com, hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] tpm: Cache TPM2 start method
Message-ID: <avjKjhmtPChVMaF2@kernel.org>
References: <20261114193434.117714-1-sidchintamaneni@gmail.com>
 <20261114193434.117714-2-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114193434.117714-2-sidchintamaneni@gmail.com>
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

On Sat, Nov 14, 2026 at 07:34:31PM +0000, Siddharth Chintamaneni wrote:
> From: Jarkko Sakkinen <jarkko@kernel.org>
> 
> Both tpm_tis and tpm_crb retrieve the start method from the ACPI TPM2
> table during device probe, and tpm_crb_ffa also needs it before chip
> allocation.
> 
> Cache the start method in tpm2_acpi_start_method during tpm_init() and
> export it for the leaf drivers, defaulting to ACPI_TPM2_NOT_ALLOWED when
> the table is absent or invalid.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> Co-developed-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> ---
>  drivers/char/tpm/tpm-interface.c | 21 +++++++++++++++++++++
>  drivers/char/tpm/tpm.h           |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
> index e0385b16616b..7b7da79bee7c 100644
> --- a/drivers/char/tpm/tpm-interface.c
> +++ b/drivers/char/tpm/tpm-interface.c
> @@ -534,8 +534,17 @@ int tpm_get_random(struct tpm_chip *chip, u8 *out, size_t max)
>  }
>  EXPORT_SYMBOL_GPL(tpm_get_random);
>  
> +#ifdef CONFIG_ACPI
> +u32 tpm2_acpi_start_method = ACPI_TPM2_NOT_ALLOWED;
> +EXPORT_SYMBOL_GPL(tpm2_acpi_start_method);
> +#endif
> +
>  static int __init tpm_init(void)
>  {
> +#ifdef CONFIG_ACPI
> +	struct acpi_table_tpm2 *tbl;
> +	acpi_status status;
> +#endif
>  	int rc;
>  
>  	rc = class_register(&tpm_class);
> @@ -562,6 +571,18 @@ static int __init tpm_init(void)
>  		goto out_unreg_chrdev;
>  	}
>  
> +#ifdef CONFIG_ACPI
> +	if (!acpi_disabled) {
> +		status = acpi_get_table(ACPI_SIG_TPM2, 1,
> +					(struct acpi_table_header **)&tbl);
> +		if (ACPI_SUCCESS(status)) {
> +			if (tbl->header.length >= sizeof(*tbl))
> +				tpm2_acpi_start_method = tbl->start_method;
> +			acpi_put_table((struct acpi_table_header *)tbl);

I would add right after acpi_put_table:

	pr_info("tpm: TPM2 ACPI start method: 0%02x\n", tpm2_acpi_start_method);

It covers all three possible conditions:

1. No TPM2: nothing gets printed.
2. Has TPM2 and start method: start method gets printed.
3. Has TPM2 but no start emthod: 0x00 gets printed.

I hate fostering klog messages as we have acquired great tracing
capabilities over the years but here I think having this is even
"sysadmin-useful".

Br, Jarkko

