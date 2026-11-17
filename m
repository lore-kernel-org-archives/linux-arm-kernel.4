Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LTq5Y0py;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=n/FLe2lg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+wrl1M/b0W1Lw5nefg+G5DrghWCaF5PMvxCyu48WSo8=; b=LTq5Y0py80KhbeCzECvhZa++4U
	YR1h+ViBIK5YdrjWnGpUvvDy5bv1aVUsNlrg5b4K2uoXKW+arfuvKPk/tvnELeH+aGpd2A4dqpCA6
	supKywwejz+PXcEaRN5MAqttyjFl8lXfiXRXtxxE1xE6esOI7oc3X3jb1n6ReSOEzZ6I+zo1clUAA
	PZJeYD+qI+5//R2Zz6zS8LwrIN62k87HZemyl4YyWQhnJnNfv2uON6GWT8pIic82Yp8R8tp1dVBhp
	cqPK6+efBr0H2yqLnRQoRpI2J7Wa/BlFkZJy0fpgM19/uHYW+1zkUf6JZ5ZywkUteVrFRHO2C67xG
	vpWw+23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPiQ-000000070BC-2v4c;
	Tue, 17 Nov 2026 20:23:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPiN-000000070Aa-3XBy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:23:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4190C339;
	Tue, 17 Nov 2026 12:23:33 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89E0C3F632;
	Tue, 17 Nov 2026 12:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794947016; bh=pvkFaWZYQ10//zppwuCukKaIMWK7ZxkW4IommctNevs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/FLe2lgmJ4q16F6SbvRRo1Yv3qp7wRG5pgoXT+A4Y7SqbZTUiLZuoZqXy9Q6af5l
	 S/QJ8e87IU8aun4elbhPRl5LSCbX5dW6Dioqhpj/JGWkII5n0cbjmhv4KO4i6etjXz
	 G24Hx3nv1HrAvDg2ySgCrMwU5Vbtuzu7inDMg70A=
Date: Tue, 17 Nov 2026 20:23:32 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>, apais@microsoft.com,
	rachelmenge@linux.microsoft.com, hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] tpm: Cache TPM2 start method
Message-ID: <avy3xBltfKeCs85x@e129823.arm.com>
References: <20261115013456.212141-1-sidchintamaneni@gmail.com>
 <20261115013456.212141-2-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115013456.212141-2-sidchintamaneni@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_122340_056816_894F7C18 
X-CRM114-Status: GOOD (  20.36  )
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

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Sun, Nov 15, 2026 at 01:34:53AM +0000, Siddharth Chintamaneni wrote:
> From: Jarkko Sakkinen <jarkko@kernel.org>
> 
> Both tpm_tis and tpm_crb retrieve the start method from the ACPI TPM2
> table during device probe, and tpm_crb_ffa also needs it before chip
> allocation.
> 
> Cache the start method in tpm2_acpi_start_method during tpm_init(), log
> it when a TPM2 ACPI table is present, and export it for the leaf
> drivers, defaulting to ACPI_TPM2_NOT_ALLOWED when the table is absent or
> invalid.
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
> index e0385b16616b..c18b060d7da2 100644
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
> +		status = acpi_get_table(ACPI_SIG_TPM2, 1, (typeof(tbl->header) **)&tbl);
> +		if (ACPI_SUCCESS(status)) {
> +			if (tbl->header.length >= sizeof(*tbl))
> +				tpm2_acpi_start_method = tbl->start_method;
> +			acpi_put_table((struct acpi_table_header *)tbl);
> +			pr_info("tpm: TPM2 ACPI start method: 0x%02x\n", tpm2_acpi_start_method);
> +		}
> +	}
> +#endif
> +
>  	return 0;
>  
>  out_unreg_chrdev:
> diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
> index fa554c5ad80b..212ca2410c93 100644
> --- a/drivers/char/tpm/tpm.h
> +++ b/drivers/char/tpm/tpm.h
> @@ -100,6 +100,7 @@ void tpm_sysfs_add_device(struct tpm_chip *chip);
>  
>  
>  #ifdef CONFIG_ACPI
> +extern u32 tpm2_acpi_start_method;
>  extern void tpm_add_ppi(struct tpm_chip *chip);
>  #else
>  static inline void tpm_add_ppi(struct tpm_chip *chip)
> 
> base-commit: 7e52fc165aa50e70e8df3c879d04fc0ff1673d4a
> -- 
> 2.45.4
> 

-- 
Sincerely,
Yeoreum Yun

