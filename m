Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574A6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 21:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4hX390VZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Epo60wIk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ab/t9OlRcWN3zbc3eY5ad8JX/kABGcfzSiIaPltDaFA=; b=4hX390VZkHhGxB4XZUFNwwajy+
	ER0Dt2kefpDO4sy8MvbJNwryacJ7PlqM2nxZG11R2QAHAx7Y+Zy45iASkKj/mMFMhPeB2TjkOw8Q2
	bBrhO9auHtyJQfXYRdacfPLRM2bDuvVYJF4I+Hx4rHnbqSrtI2WMX0pqKe220xTavvkK4I3ePA9LM
	kiEavzFWTtWKLdu+cV6dEIC40F42TouJxd1iFPRzJYMjgdzD4PcAGMTUVHTvjIAPNqJpP5d+/5JAa
	1NLyYKHBXYBFrNCDAdOqS87JuUdZYDTUvm0NBnGE+cnTi5BnyO8CZ97Yhp8qEYAtmwmXegtq6PRWi
	DNJG3qIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSL27-0000000GlnN-1cqO;
	Sat, 14 Nov 2026 21:11:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSL25-0000000Gln4-3kxz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 21:11:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id CAAC2602CA;
	Sat, 14 Nov 2026 21:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id F3CC61F000C4;
	Sat, 14 Nov 2026 21:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794690692;
	bh=Ab/t9OlRcWN3zbc3eY5ad8JX/kABGcfzSiIaPltDaFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Epo60wIkMirZbSuxFm2i6OvGJPLDjpxK4I8tjwGqzpNdVC1VYb4sVpiEtJ9w3UsVD
	 /qopc2LRxxbPt2eT/+8B6gAbGKht0K1psVVsuskdwHK0yPK7/cpe22sO5W3ZOJGF1N
	 cGg4LyPSdN/9jlFAlpe2EJtSlkOYgWBLuoj51EJsJh04ZGjzHe5NC/gfGfSEaknhjT
	 30E885Bri4EQ1PkYXzxmlDf0zLt6h9uEuSdZSvDS4mTg5oSz9EuyKrX6+Opl6Bv+Jd
	 249hMrANIWsjTuVQ2hOtMFVXbrk+CyC8zvpxE0PPNlcqNpKkaFh3H5EK7EJxOPnGOM
	 WhjIBtQapX4GQ==
Date: Sat, 14 Nov 2026 23:11:28 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>, apais@microsoft.com,
	rlmenge@gmail.com, hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] tpm: tpm_crb: Use cached tpm2_acpi_start_method
Message-ID: <avjOgDySmUiklnN1@kernel.org>
References: <20261114193434.117714-1-sidchintamaneni@gmail.com>
 <20261114193434.117714-5-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114193434.117714-5-sidchintamaneni@gmail.com>
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

On Sat, Nov 14, 2026 at 07:34:34PM +0000, Siddharth Chintamaneni wrote:
> Check the cached tpm2_acpi_start_method value at the start of
> crb_acpi_probe() before mapping the ACPI TPM2 table for CRB-specific
> parameters. This avoids mapping the table when it is absent or when the
> device uses ACPI_TPM2_MEMORY_MAPPED and belongs to tpm_tis.
> 
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> ---
>  drivers/char/tpm/tpm_crb.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
> index 4749a9183726..c1c2b72459a2 100644
> --- a/drivers/char/tpm/tpm_crb.c
> +++ b/drivers/char/tpm/tpm_crb.c
> @@ -945,18 +945,23 @@ static int crb_acpi_probe(struct platform_device *pdev)
>  	if (!device)
>  		return -ENODEV;
>  
> -	status = acpi_get_table(ACPI_SIG_TPM2, 1,
> -				(struct acpi_table_header **) &buf);
> -	if (ACPI_FAILURE(status) || buf->header.length < sizeof(*buf)) {
> +	sm = tpm2_acpi_start_method;

sm and also priv->sm should be removed

The global should be accessed across the board when querying start
method. It should be the single source for it post-tpm_init.

> +	if (sm == ACPI_TPM2_NOT_ALLOWED) {
>  		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");

Drop this message.

>  		return -EINVAL;

-ENODEV


>  	}
>  
>  	/* Should the FIFO driver handle this? */
> -	sm = buf->start_method;
> -	if (sm == ACPI_TPM2_MEMORY_MAPPED) {
> -		rc = -ENODEV;
> -		goto out;
> +	if (sm == ACPI_TPM2_MEMORY_MAPPED)
> +		return -ENODEV;
> +
> +	status = acpi_get_table(ACPI_SIG_TPM2, 1,
> +				(struct acpi_table_header **)&buf);
> +	if (ACPI_FAILURE(status) || buf->header.length < sizeof(*buf)) {
> +		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");

Drop this message.

> +		if (ACPI_SUCCESS(status))
> +			acpi_put_table((struct acpi_table_header *)buf);
> +		return -EINVAL;

-ENODEV

>  	}
>  
>  	priv = devm_kzalloc_obj(dev, struct crb_priv);
> -- 
> 2.45.4
> 

Br, Jarkko

