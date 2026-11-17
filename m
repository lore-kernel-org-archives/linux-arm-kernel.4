Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DD1606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TCnbE89V;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QSIOw+23
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XRrmtaJXQcHPgHjUtAr7Ja7rU75296IprzuTdzeTZgc=; b=TCnbE89VA1HR80JMX8gYVIz6pu
	le7rL4VvM/x6luXAoywhG8UB3KmgNJfpdXR1ouiObhIrlSrDgb8JC3rEVkt7WdRkd8GoRmq4RAI4z
	fqk/+bZIxMl5z/QfCzrvKYzMWTGf4DOAusPkA7zwhfhO+2ZUfYGzwTFEnsgHrxnqxoDQXGLf0DkhL
	8oxctlsdNV8oxmL7X7fDU9GjhMHzk8UmGIeKjzV4GXcHI+0Ie48IZ7z1oLYlxPpVkitxCMTsuST+k
	rmUgU4gAD4iDdSecDREOg58XnJLm2Tz5unId6xSxO6tUvdwwj2TXRG9nAzNE9jmFRXPnQoE+J2Xf6
	t8oacRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQCg-000000073du-3DsQ;
	Tue, 17 Nov 2026 20:54:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQCf-000000073dl-2ZYD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:54:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id AD88760F92;
	Tue, 17 Nov 2026 20:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D4F9D1F000C4;
	Tue, 17 Nov 2026 20:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794948896;
	bh=XRrmtaJXQcHPgHjUtAr7Ja7rU75296IprzuTdzeTZgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QSIOw+23KO7sT+peMfCgKOW21k98uNBwkMQsEzuUKBPCr045oc0uM3N1levgzR9ju
	 oXwBzKwvbsWv8uCelcqd68ngfi+lEhCasNh9kt5f1sYN55Yc9EI1vXdRGUKmLgL+2r
	 KM5DkBU4dp4qUsyyfudAMK7oONRsyzyzA4Z2b7dIuc8StNGoxjc1Mv106yu28apZie
	 ViDhUSKBgkvva38bYzIHb+2MbgaY5qbfQASGBlXy92nIhpF3a1eMWXhw2GMCQ7xZS5
	 eS0Qm9EVMdW8tbhAoN69qz5P+Dgp6da0wwcxeWUwdy83mS4dmt6+JS59npU6FkG5TR
	 9lXRs0lrCueTw==
Date: Tue, 17 Nov 2026 22:54:52 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Stuart Yoder <stuart.yoder@arm.com>, apais@microsoft.com,
	rachelmenge@linux.microsoft.com, hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] tpm: Cache TPM2 start method
Message-ID: <avy_HKn6whTYgCV4@kernel.org>
References: <20261115013456.212141-1-sidchintamaneni@gmail.com>
 <20261115013456.212141-2-sidchintamaneni@gmail.com>
 <avy3xBltfKeCs85x@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avy3xBltfKeCs85x@e129823.arm.com>
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

On Tue, Nov 17, 2026 at 08:23:32PM +0000, Yeoreum Yun wrote:
> LGTM.
> 
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> On Sun, Nov 15, 2026 at 01:34:53AM +0000, Siddharth Chintamaneni wrote:
> > From: Jarkko Sakkinen <jarkko@kernel.org>
> > 
> > Both tpm_tis and tpm_crb retrieve the start method from the ACPI TPM2
> > table during device probe, and tpm_crb_ffa also needs it before chip
> > allocation.
> > 
> > Cache the start method in tpm2_acpi_start_method during tpm_init(), log
> > it when a TPM2 ACPI table is present, and export it for the leaf
> > drivers, defaulting to ACPI_TPM2_NOT_ALLOWED when the table is absent or
> > invalid.
> > 
> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > Co-developed-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > ---
> >  drivers/char/tpm/tpm-interface.c | 21 +++++++++++++++++++++
> >  drivers/char/tpm/tpm.h           |  1 +
> >  2 files changed, 22 insertions(+)
> > 
> > diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
> > index e0385b16616b..c18b060d7da2 100644
> > --- a/drivers/char/tpm/tpm-interface.c
> > +++ b/drivers/char/tpm/tpm-interface.c
> > @@ -534,8 +534,17 @@ int tpm_get_random(struct tpm_chip *chip, u8 *out, size_t max)
> >  }
> >  EXPORT_SYMBOL_GPL(tpm_get_random);
> >  
> > +#ifdef CONFIG_ACPI
> > +u32 tpm2_acpi_start_method = ACPI_TPM2_NOT_ALLOWED;
> > +EXPORT_SYMBOL_GPL(tpm2_acpi_start_method);
> > +#endif
> > +
> >  static int __init tpm_init(void)
> >  {
> > +#ifdef CONFIG_ACPI
> > +	struct acpi_table_tpm2 *tbl;
> > +	acpi_status status;
> > +#endif
> >  	int rc;
> >  
> >  	rc = class_register(&tpm_class);
> > @@ -562,6 +571,18 @@ static int __init tpm_init(void)
> >  		goto out_unreg_chrdev;
> >  	}
> >  
> > +#ifdef CONFIG_ACPI
> > +	if (!acpi_disabled) {
> > +		status = acpi_get_table(ACPI_SIG_TPM2, 1, (typeof(tbl->header) **)&tbl);
> > +		if (ACPI_SUCCESS(status)) {
> > +			if (tbl->header.length >= sizeof(*tbl))
> > +				tpm2_acpi_start_method = tbl->start_method;
> > +			acpi_put_table((struct acpi_table_header *)tbl);
> > +			pr_info("tpm: TPM2 ACPI start method: 0x%02x\n", tpm2_acpi_start_method);
> > +		}
> > +	}
> > +#endif
> > +
> >  	return 0;
> >  
> >  out_unreg_chrdev:
> > diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
> > index fa554c5ad80b..212ca2410c93 100644
> > --- a/drivers/char/tpm/tpm.h
> > +++ b/drivers/char/tpm/tpm.h
> > @@ -100,6 +100,7 @@ void tpm_sysfs_add_device(struct tpm_chip *chip);
> >  
> >  
> >  #ifdef CONFIG_ACPI
> > +extern u32 tpm2_acpi_start_method;
> >  extern void tpm_add_ppi(struct tpm_chip *chip);
> >  #else
> >  static inline void tpm_add_ppi(struct tpm_chip *chip)
> > 
> > base-commit: 7e52fc165aa50e70e8df3c879d04fc0ff1673d4a
> > -- 
> > 2.45.4
> > 
> 
> -- 
> Sincerely,
> Yeoreum Yun

Thank you. OK, I'll just apply these.

Br, Jarkko

